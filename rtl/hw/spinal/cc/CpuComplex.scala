
package cc

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb._
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.bus.simple._

import scala.collection.mutable.ArrayBuffer
import vexriscv.plugin.{NONE, _}
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}


case class CpuComplexConfig(
                       onChipRamSize      : BigInt,
                       onChipRamBinFile   : String,
                       pipelineDBus       : Boolean,
                       pipelineMainBus    : Boolean,
                       pipelineApbBridge  : Boolean,
                       periphApbConfig    : Apb3Config,
                       cpuPlugins         : ArrayBuffer[Plugin[VexRiscv]]){

  require(pipelineApbBridge || pipelineMainBus, "At least pipelineMainBus or pipelineApbBridge should be enable to avoid wipe transactions")
}

object CpuComplexConfig{

    def default =  CpuComplexConfig(
        onChipRamSize             = 16 kB,
        onChipRamBinFile          = null,
        pipelineDBus              = true,
        pipelineMainBus           = false,
        pipelineApbBridge         = true,
        cpuPlugins = ArrayBuffer(
            new IBusSimplePlugin(
                resetVector             = 0x00000000l,
                cmdForkOnSecondStage    = true,
                cmdForkPersistence      = false,
                prediction              = STATIC,
                catchAccessFault        = false,
                compressedGen           = true
            ),
            new DBusSimplePlugin(
                catchAddressMisaligned  = false,
                catchAccessFault        = false,
                earlyInjection          = false
            ),
            new CsrPlugin(
                    CsrPluginConfig(
                        catchIllegalAccess      = false,
                        mvendorid               = null,
                        marchid                 = null,
                        mimpid                  = null,
                        mhartid                 = null,
                        misaExtensionsInit      = 0,
                        misaAccess              = CsrAccess.NONE,
                        mtvecAccess             = CsrAccess.NONE,
                        mtvecInit               = 0x00000020l,
                        mepcAccess              = CsrAccess.NONE,
                        mscratchGen             = false,
                        mcauseAccess            = CsrAccess.NONE,
                        mbadaddrAccess          = CsrAccess.NONE,
                        mcycleAccess            = CsrAccess.READ_WRITE,
                        minstretAccess          = CsrAccess.NONE,
                        ecallGen                = false,
                        wfiGenAsWait            = false,
                        ucycleAccess            = CsrAccess.NONE
                    )
                ),
            new DecoderSimplePlugin(
                catchIllegalInstruction = false
            ),
            new RegFilePlugin(
                regFileReadyKind        = plugin.SYNC,
                zeroBoot                = false
            ),
            new IntAluPlugin,
            new SrcPlugin(
                separatedAddSub         = false,
                executeInsertion        = false
            ),
            new FullBarrelShifterPlugin(),
            new MulSimplePlugin,
            new DivPlugin,
            new HazardSimplePlugin(
                bypassExecute           = true,
                bypassMemory            = true,
                bypassWriteBack         = true,
                bypassWriteBackBuffer   = true,
                pessimisticUseSrc       = false,
                pessimisticWriteRegFile = false,
                pessimisticAddressMatch = false
            ),
            new BranchPlugin(
                earlyBranch             = false,
                catchAddressMisaligned  = false
            )
        ),
        periphApbConfig = Apb3Config(
            addressWidth  = 20,
            dataWidth     = 32
        )
  )

  def fast = {
    val config = default

    // Replace HazardSimplePlugin to get datapath bypass
    config.cpuPlugins(config.cpuPlugins.indexWhere(_.isInstanceOf[HazardSimplePlugin])) = new HazardSimplePlugin(
      bypassExecute           = true,
      bypassMemory            = true,
      bypassWriteBack         = true,
      bypassWriteBackBuffer   = true
    )
//    config.cpuPlugins(config.cpuPlugins.indexWhere(_.isInstanceOf[LightShifterPlugin])) = new FullBarrelShifterPlugin()

    config
  }
}


case class CpuComplex(config : CpuComplexConfig) extends Component
{
    import config._

    val io = new Bundle {
        val periphApb               = master(Apb3(config.periphApbConfig))
        val externalInterrupt       = in(Bool)
        val timerInterrupt          = in(Bool)
    }

    val pipelinedMemoryBusConfig = PipelinedMemoryBusConfig(
        addressWidth  = 32,
        dataWidth     = 32
    )

    // Arbiter of the CPU dBus/iBus and DMA bus to drive the mainBus
    val mainBusArbiter = new CCMasterArbiter(pipelinedMemoryBusConfig)

    val cpu = new VexRiscv(
        config = VexRiscvConfig(
            plugins = cpuPlugins
        )
    )

    // Checkout plugins used to instanciate the CPU to connect them to the SoC
    for(plugin <- cpu.plugins) plugin match{
        case plugin : IBusSimplePlugin => mainBusArbiter.io.iBus <> plugin.iBus
        case plugin : DBusSimplePlugin => {
            if(!pipelineDBus)
                mainBusArbiter.io.dBus <> plugin.dBus
            else {
                mainBusArbiter.io.dBus.cmd << plugin.dBus.cmd.halfPipe()
                mainBusArbiter.io.dBus.rsp <> plugin.dBus.rsp
            }
        }
        case plugin : CsrPlugin        => {
            plugin.externalInterrupt    := io.externalInterrupt
            plugin.timerInterrupt       := io.timerInterrupt
        }
        case _ =>
    }

    //****** MainBus slaves ********
    val mainBusMapping = ArrayBuffer[(PipelinedMemoryBus,SizeMapping)]()
    val ram = new CCPipelinedMemoryBusRam(
        onChipRamSize             = onChipRamSize,
        onChipRamBinFile          = onChipRamBinFile,
        pipelinedMemoryBusConfig  = pipelinedMemoryBusConfig
    )

    mainBusMapping += ram.io.bus -> (0x00000000l, onChipRamSize)

    val periphApbBridge = new PipelinedMemoryBusToApbBridge(
        apb3Config                = config.periphApbConfig,
        pipelineBridge            = pipelineApbBridge,
        pipelinedMemoryBusConfig  = pipelinedMemoryBusConfig
    )
    mainBusMapping += periphApbBridge.io.pipelinedMemoryBus -> (0x80000000l, 1 MB)

    io.periphApb <> periphApbBridge.io.apb

    val mainBusDecoder = new Area {
        val logic = new CCPipelinedMemoryBusDecoder(
            master = mainBusArbiter.io.masterBus,
            specification = mainBusMapping,
            pipelineMaster = pipelineMainBus
        )
    }
    
}

