package cube2

import scala.collection.mutable.ArrayBuffer

import spinal.core._
import ecp5._

class Cube2Top(isSim : Boolean = true) extends Component {

    val panels = ArrayBuffer[PanelInfo]()

//    if (!isSim){
//        panels += PanelInfo(-1, 1,-1,       5, true,    0,     0,-1, 1)
//        panels += PanelInfo(-1, 0,-1,       5, false,   0,     0,-1, 1)
//
//        // top face
//        panels += PanelInfo(-1, 1,-1,       4, true,    0,     1, 0, 1)
//        panels += PanelInfo(-1, 1, 0,       4, false,   0,     1, 0, 1)
//
//        // bottom face
//        panels += PanelInfo(-1,-1, 1,       3, true,    0,     1, 0,-1)
//        panels += PanelInfo(-1,-1, 0,       3, false,   0,     1, 0,-1)
//
//        panels += PanelInfo( 1, 1,-1,       2, true,    0,    -1,-1, 0)
//        panels += PanelInfo( 1, 0,-1,       2, false,   0,    -1,-1, 0)
//
//        panels += PanelInfo( 1, 1, 1,       1, true,    90,   0,-1,-1)
//        panels += PanelInfo( 1, 0, 1,       1, false,   90,   0,-1,-1)
//    }


    //                              Side   Top      Rot 
    panels += PanelInfo(-1, 1, 1,     0,   true,    180,    1,-1, 0)
    panels += PanelInfo(-1, 1, 1,     0,   true,    180,    1,-1, 0)

    val hub75Config = Hub75Config(
                        panel_rows    = 64,
                        panel_cols    = 64,
                        bpc           = if (isSim) 4 else 6,
                        panels        = panels.toArray
                      )

//    val ledMemConfig = LedMemConfig(memWords = 2 * 6 * 32 * 32, bpc = 6)

    val io = new Bundle {
        val osc_clk25   = in(Bool)

        val hub75       = out(Hub75Intfc(hub75Config.nr_row_bits))

        val led         = out(Bool)
    }

    noIoPrefix()

    val main_clk = Bool
    val main_clk_speed = if (isSim) 2 MHz else 50 MHz

    val osc_src = if (isSim) new Area {
        main_clk    := io.osc_clk25
    }
    else new Area {
        val u_main_clk = new main_pll()
        u_main_clk.io.clk_in     <> io.osc_clk25
        u_main_clk.io.clk_out    <> main_clk
    }

    val mainClkRawDomain = ClockDomain(
        clock = main_clk,
        frequency = FixedFrequency(main_clk_speed),
        config = ClockDomainConfig(
                    resetKind = BOOT
        )
    )

    //============================================================
    // Create main clock reset
    //============================================================
    val main_reset_ = Bool

    val main_reset_gen = new ClockingArea(mainClkRawDomain) {
        val reset_unbuffered_ = True

        val reset_cntr = Reg(UInt(20 bits)) init(0)
        when(reset_cntr =/= U(reset_cntr.range -> true)){
            reset_cntr := reset_cntr + 1
            reset_unbuffered_ := False
        }

        main_reset_ := RegNext(reset_unbuffered_)
    }

    val mainClkDomain = ClockDomain(
        clock = main_clk,
        reset = main_reset_,
        config = ClockDomainConfig(
            resetKind = SYNC,
            resetActiveLevel = LOW
        )
    )

    //============================================================
    // General Logic
    //============================================================

    val debug_leds = new ClockingArea(mainClkDomain) {

        val led_counter = Reg(UInt(24 bits))
        led_counter := led_counter + 1

        io.led  := led_counter.msb
    }

    val core = new ClockingArea(mainClkDomain) {

/*
        val u_cpu = new CpuTop()

        //============================================================
        // LED memory
        //============================================================

        val u_led_mem = new LedMem(ledMemConfig, isSim)
        u_led_mem.io.led_mem_b_wr       := False
        u_led_mem.io.led_mem_b_wr_data  := 0

        val led_mem_apb_regs = u_led_mem.driveFrom(Apb3SlaveFactory(u_cpu.io.led_mem_apb), 0x0)

        //============================================================
        // HUB75 Streamer
        //============================================================

        val u_hub75_streamer = new Hub75Streamer(hub75Config, ledMemConfig)
        u_hub75_streamer.io.led_mem_rd        <> u_led_mem.io.led_mem_b_req
        u_hub75_streamer.io.led_mem_rd_addr   <> u_led_mem.io.led_mem_b_addr
        u_hub75_streamer.io.led_mem_rd_data   <> u_led_mem.io.led_mem_b_rd_data

        val hub75_streamer_regs = u_hub75_streamer.driveFrom(Apb3SlaveFactory(u_cpu.io.hub75_streamer_apb), 0x0)
*/

        //============================================================
        // HUB75 Streamer Light
        //============================================================

        val u_hub75_streamer_light = new Hub75StreamerLight(hub75Config)

        //============================================================
        // HUB75 Phy
        //============================================================

        val u_hub75phy = new Hub75Phy(main_clk_speed, hub75Config)
        u_hub75phy.io.rgb   <> u_hub75_streamer_light.io.rgb
        u_hub75phy.io.hub75 <> io.hub75

    }


}

object Cube2TopVerilog extends App {
  Config.spinal.generateVerilog(new Cube2Top(isSim = false))
}

object Cube2TopSim extends App {
  Config.spinal.generateVerilog(new Cube2Top(isSim = true))
}

