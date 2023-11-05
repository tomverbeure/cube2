package cube2

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.bus.amba3.apb._

import ecp5._

object LedMem {
    def getApb3Config() = Apb3Config(addressWidth = 17, dataWidth = 32)
}

case class LedMemConfig(
      nrInstances   : Int, 
      memWords      : Int,
      bpc           : Int
  )
{
    def ramInstanceAddrBits     = log2Up(memWords)
    def ramInstanceDataBits     = 3 * bpc
}

// Contains one RAM per channel.
// Channel A behaves like a single regular RAM that is accessible by a CPU bus.
// Channel B receives 1 read address but returns the data for all RAMs in parallel.
//
// While the RAM stores the pixels at 3*bpc, the CPU interface always assumes
// 24bpp and just drops the lower bits.

class LedMem(conf: LedMemConfig, isSim: Boolean = true) extends Component {

    import conf._

    val io = new Bundle {
        val led_mem_a_req     = in(Bits(conf.nrInstances bits))
        val led_mem_a_addr    = in(UInt(conf.ramInstanceAddrBits bits))
        val led_mem_a_wr      = in(Bool)
        val led_mem_a_wr_data = in(Bits(conf.ramInstanceDataBits bits))
        val led_mem_a_rd_data = out(Bits(conf.ramInstanceDataBits bits))

        val led_mem_b_req     = in(Bool)
        val led_mem_b_addr    = in(UInt(conf.ramInstanceAddrBits bits))
        val led_mem_b_wr      = in(Bool)
        val led_mem_b_wr_data = in(Bits(conf.ramInstanceDataBits bits))
        val led_mem_b_rd_data = out(Vec(Bits(conf.ramInstanceDataBits bits), conf.nrInstances))
    }

    println(s"LedMem: memWords: ${conf.memWords}")

    val led_mem_a_rd_data_raw = Vec(Bits(conf.ramInstanceDataBits bits), conf.nrInstances) 
    val led_mem_b_rd_data_raw = Vec(Bits(conf.ramInstanceDataBits bits), conf.nrInstances) 

    /*
    led_mem_b_rd_data_raw(0)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    led_mem_b_rd_data_raw(1)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    led_mem_b_rd_data_raw(2)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    led_mem_b_rd_data_raw(3)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    led_mem_b_rd_data_raw(4)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    led_mem_b_rd_data_raw(5)    := B(( 0<<12) | (  15<<6) | 0, conf.ramInstanceDataBits bits)
    */

    io.led_mem_a_rd_data    := led_mem_a_rd_data_raw(0)

    for(i <- 0 until conf.nrInstances){
        //if (isSim){
        if (true){
            val u_led_ram = Mem(UInt(conf.ramInstanceDataBits bits), conf.memWords).addAttribute("ramstyle", "no_rw_check")
    
            led_mem_a_rd_data_raw(i) := u_led_ram.readWriteSync(
                enable    = io.led_mem_a_req(i),
                address   = io.led_mem_a_addr,
                write     = io.led_mem_a_wr, 
                data      = io.led_mem_a_wr_data.asUInt
                ).asBits

            led_mem_b_rd_data_raw(i) := u_led_ram.readWriteSync(
                enable    = io.led_mem_b_req,
                address   = io.led_mem_b_addr,
                write     = io.led_mem_b_wr, 
                data      = io.led_mem_b_wr_data.asUInt
                ).asBits

            io.led_mem_b_rd_data(i) := led_mem_b_rd_data_raw(i)
        }
        else {
            /*
            val u_led_ram = new led_ram()
    
            u_led_ram.io.clock_a          := ClockDomain.current.readClockWire
            u_led_ram.io.address_a        := io.led_mem_a_addr
            u_led_ram.io.wren_a           := io.led_mem_a_req && io.led_mem_a_wr
            u_led_ram.io.data_a           := io.led_mem_a_wr_data
            io.led_mem_a_rd_data          := u_led_ram.io.q_a
    
            u_led_ram.io.clock_b          := ClockDomain.current.readClockWire
            u_led_ram.io.address_b        := io.led_mem_b_addr
            u_led_ram.io.wren_b           := io.led_mem_b_req && io.led_mem_b_wr
            u_led_ram.io.data_b           := io.led_mem_b_wr_data
            io.led_mem_b_rd_data          := u_led_ram.io.q_b
            */
        }
    }

    def driveFrom(busCtrl: BusSlaveFactory, baseAddress: BigInt) = new Area {
        val mapping = SizeMapping(0x0, conf.memWords * conf.nrInstances * 4)

        val cpu_wr_addr = busCtrl.writeAddress(mapping) >> 2
        val cpu_rd_addr = busCtrl.readAddress(mapping)  >> 2

        val addrWidth = cpu_wr_addr.getWidth
        println(s"cpu_wr_addr: $addrWidth")

        val bus_a_wr_data = Bits(24 bits)
        busCtrl.nonStopWrite(bus_a_wr_data, 0)

        val mem_a_wr_data = bus_a_wr_data(23 downto 24-conf.bpc) ## 
                            bus_a_wr_data(15 downto 16-conf.bpc) ## 
                            bus_a_wr_data( 7 downto  8-conf.bpc)

        val ram_a_wr_inst_nr    = UInt(log2Up(conf.nrInstances) bits)
        val ram_a_rd_inst_nr    = UInt(log2Up(conf.nrInstances) bits)

        ram_a_wr_inst_nr        := cpu_wr_addr >> conf.ramInstanceAddrBits
        ram_a_rd_inst_nr        := cpu_rd_addr >> conf.ramInstanceAddrBits

        io.led_mem_a_req        := 0
        io.led_mem_a_wr         := False
        io.led_mem_a_addr       := cpu_wr_addr(conf.ramInstanceAddrBits-1 downto 0)
        io.led_mem_a_wr_data    := mem_a_wr_data

        busCtrl.onWritePrimitive(mapping, true, null){
            io.led_mem_a_req  := ((U(1) << ram_a_wr_inst_nr).asBits)(conf.nrInstances-1 downto 0)
            io.led_mem_a_wr   := True
            io.led_mem_a_addr := cpu_wr_addr(conf.ramInstanceAddrBits-1 downto 0)
        }

        busCtrl.multiCycleRead(mapping, 2)
        busCtrl.onReadPrimitive(mapping, false, null){
            io.led_mem_a_req  := ((U(1) << ram_a_rd_inst_nr).asBits)(conf.nrInstances-1 downto 0)
            io.led_mem_a_wr   := False
            io.led_mem_a_addr := cpu_rd_addr(conf.ramInstanceAddrBits-1 downto 0)
        }
        busCtrl.readPrimitive(io.led_mem_a_rd_data, mapping, 0, null)
    }

}
