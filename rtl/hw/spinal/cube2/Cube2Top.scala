package cube2

import scala.collection.mutable.ArrayBuffer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.bus.amba3.apb._

import ecp5._

class Cube2Top(isSim : Boolean = true) extends Component {

    val panels = ArrayBuffer[PanelInfo]()

    //                             Side             Rot     Incr
    panels += PanelInfo(-1, 1, 1,  0 /* left   */,  270,    1,-1, 0)   // Buffer 0 
    panels += PanelInfo(-1, 1, 1,  1 /* front  */,   90,    1,-1, 0)   // Buffer 1
    panels += PanelInfo(-1, 1, 1,  2 /* right  */,  270,    1,-1, 0)   // Buffer 2
    panels += PanelInfo(-1, 1, 1,  3 /* back   */,  270,    1,-1, 0)   // Buffer 3
    panels += PanelInfo(-1, 1, 1,  4 /* bottom */,  180,    1,-1, 0)   // Buffer 4

    val hub75Config = Hub75Config(
                        nr_channels   = 5,
                        panel_rows    = 64,
                        panel_cols    = 64,
                        bpc           = if (isSim) 3 else 5,
                        panels        = panels.toArray
                      )

    val ledMemConfig = LedMemConfig(hub75Config.nr_channels, memWords = 64 * 64, bpc = 6)

    val io = new Bundle {
        val osc_clk25       = in(Bool)
        val phy_reset_n     = out(Bool)

        val hub75_clk       = out(Bool)
        val hub75_lat       = out(Bool)
        val hub75_oe_       = out(Bool)

        val hub75_row       = out(UInt(hub75Config.nr_row_bits bits))

        val hub75_j1_r0     = out(Bool)
        val hub75_j1_g0     = out(Bool)
        val hub75_j1_b0     = out(Bool)
        val hub75_j1_r1     = out(Bool)
        val hub75_j1_g1     = out(Bool)
        val hub75_j1_b1     = out(Bool)

        val hub75_j2_r0     = out(Bool)
        val hub75_j2_g0     = out(Bool)
        val hub75_j2_b0     = out(Bool)
        val hub75_j2_r1     = out(Bool)
        val hub75_j2_g1     = out(Bool)
        val hub75_j2_b1     = out(Bool)

        val hub75_j3_r0     = out(Bool)
        val hub75_j3_g0     = out(Bool)
        val hub75_j3_b0     = out(Bool)
        val hub75_j3_r1     = out(Bool)
        val hub75_j3_g1     = out(Bool)
        val hub75_j3_b1     = out(Bool)

        val hub75_j4_r0     = out(Bool)
        val hub75_j4_g0     = out(Bool)
        val hub75_j4_b0     = out(Bool)
        val hub75_j4_r1     = out(Bool)
        val hub75_j4_g1     = out(Bool)
        val hub75_j4_b1     = out(Bool)

        val hub75_j5_r0     = out(Bool)
        val hub75_j5_g0     = out(Bool)
        val hub75_j5_b0     = out(Bool)
        val hub75_j5_r1     = out(Bool)
        val hub75_j5_g1     = out(Bool)
        val hub75_j5_b1     = out(Bool)

        val hub75_j6_r0     = out(Bool)
        val hub75_j6_g0     = out(Bool)
        val hub75_j6_b0     = out(Bool)
        val hub75_j6_r1     = out(Bool)
        val hub75_j6_g1     = out(Bool)
        val hub75_j6_b1     = out(Bool)

        val hub75_j7_r0     = out(Bool)
        val hub75_j7_g0     = out(Bool)
        val hub75_j7_b0     = out(Bool)
        val hub75_j7_r1     = out(Bool)
        val hub75_j7_g1     = out(Bool)
        val hub75_j7_b1     = out(Bool)

        val hub75_j8_r0     = out(Bool)
        val hub75_j8_g0     = out(Bool)
        val hub75_j8_b0     = out(Bool)
        val hub75_j8_r1     = out(Bool)
        val hub75_j8_g1     = out(Bool)
        val hub75_j8_b1     = out(Bool)

        val led             = out(Bool)
        val button          = in(Bool)
    }

    noIoPrefix()

    io.phy_reset_n  := True

    val main_clk = Bool
    val main_clk_speed = if (isSim) 50 MHz else 50 MHz

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

        val reset_cntr = Reg(UInt(if (isSim) 5 bits else 16 bits)) init(0)
        when(reset_cntr =/= U(reset_cntr.range -> true)){
            reset_cntr := reset_cntr + 1
            // Keep reset low when counter is still running
            reset_unbuffered_ := False
        }

        main_reset_ := RegNext(reset_unbuffered_)
    }

    val mainClkDomain = ClockDomain(
        clock = main_clk,
        reset = main_reset_,
        config = ClockDomainConfig(
            resetKind = ASYNC,
            resetActiveLevel = LOW
        )
    )

    //============================================================
    // General Logic
    //============================================================

    val debug_leds = new ClockingArea(mainClkDomain) {

        val led_counter = Reg(UInt(24 bits))
        led_counter := led_counter + 1

        //io.led  := led_counter.msb ^ io.button
        //io.led  := io.button
    }

    val core = new ClockingArea(mainClkDomain) {

        val u_cpu = new CpuTop()
        io.led  <> u_cpu.io.led_red
    
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

//        //============================================================
//        // HUB75 Streamer Light
//        //============================================================
//        val u_hub75_streamer_light = new Hub75StreamerLight(hub75Config)

        //============================================================
        // HUB75 Phy
        //============================================================

        val hub75 = Hub75Intfc(hub75Config)

        val u_hub75phy = new Hub75Phy(main_clk_speed, hub75Config)
        u_hub75phy.io.rgb   <> u_hub75_streamer.io.rgb
//        u_hub75phy.io.rgb   <> u_hub75_streamer_light.io.rgb

        u_hub75phy.io.hub75 <> hub75

        // Desired mapping:
        // red -> front

        io.hub75_clk       := RegNext(hub75.clk)
        io.hub75_lat       := RegNext(hub75.lat)
        io.hub75_oe_       := RegNext(hub75.oe_)

        io.hub75_row       := RegNext(hub75.row)

        if (false){
            io.hub75_j1_r0     := RegNext(hub75.r0(4))
            io.hub75_j1_g0     := RegNext(hub75.g0(4))
            io.hub75_j1_b0     := RegNext(hub75.b0(4))
            io.hub75_j1_r1     := RegNext(hub75.r1(4))
            io.hub75_j1_g1     := RegNext(hub75.g1(4))
            io.hub75_j1_b1     := RegNext(hub75.b1(4))
        } else {
            io.hub75_j1_r0     := False
            io.hub75_j1_g0     := False
            io.hub75_j1_b0     := False
            io.hub75_j1_r1     := False
            io.hub75_j1_g1     := False
            io.hub75_j1_b1     := False
        }

        // Bottom
        io.hub75_j2_r0     := RegNext(hub75.r0(4))
        io.hub75_j2_g0     := RegNext(hub75.g0(4))
        io.hub75_j2_b0     := RegNext(hub75.b0(4))
        io.hub75_j2_r1     := RegNext(hub75.r1(4))
        io.hub75_j2_g1     := RegNext(hub75.g1(4))
        io.hub75_j2_b1     := RegNext(hub75.b1(4))
    
        if (false){
            io.hub75_j3_r0     := RegNext(hub75.r0(4))
            io.hub75_j3_g0     := RegNext(hub75.g0(4))
            io.hub75_j3_b0     := RegNext(hub75.b0(4))
            io.hub75_j3_r1     := RegNext(hub75.r1(4))
            io.hub75_j3_g1     := RegNext(hub75.g1(4))
            io.hub75_j3_b1     := RegNext(hub75.b1(4))
        } else {
            io.hub75_j3_r0     := False
            io.hub75_j3_g0     := False
            io.hub75_j3_b0     := False
            io.hub75_j3_r1     := False
            io.hub75_j3_g1     := False
            io.hub75_j3_b1     := False
        }

        // Left
        io.hub75_j4_r0     := RegNext(hub75.r0(0))
        io.hub75_j4_g0     := RegNext(hub75.g0(0))
        io.hub75_j4_b0     := RegNext(hub75.b0(0))
        io.hub75_j4_r1     := RegNext(hub75.r1(0))
        io.hub75_j4_g1     := RegNext(hub75.g1(0))
        io.hub75_j4_b1     := RegNext(hub75.b1(0))

        // Right
        io.hub75_j5_r0     := RegNext(hub75.r0(2))
        io.hub75_j5_g0     := RegNext(hub75.g0(2))
        io.hub75_j5_b0     := RegNext(hub75.b0(2))
        io.hub75_j5_r1     := RegNext(hub75.r1(2))
        io.hub75_j5_g1     := RegNext(hub75.g1(2))
        io.hub75_j5_b1     := RegNext(hub75.b1(2))

        // Back
        io.hub75_j6_r0     := RegNext(hub75.r0(3))
        io.hub75_j6_g0     := RegNext(hub75.g0(3))
        io.hub75_j6_b0     := RegNext(hub75.b0(3))
        io.hub75_j6_r1     := RegNext(hub75.r1(3))
        io.hub75_j6_g1     := RegNext(hub75.g1(3))
        io.hub75_j6_b1     := RegNext(hub75.b1(3))

        // Front
        io.hub75_j7_r0     := RegNext(hub75.r0(1))
        io.hub75_j7_g0     := RegNext(hub75.g0(1))
        io.hub75_j7_b0     := RegNext(hub75.b0(1))
        io.hub75_j7_r1     := RegNext(hub75.r1(1))
        io.hub75_j7_g1     := RegNext(hub75.g1(1))
        io.hub75_j7_b1     := RegNext(hub75.b1(1))

        if (false){
            io.hub75_j8_r0     := RegNext(hub75.r0(4))
            io.hub75_j8_g0     := RegNext(hub75.g0(4))
            io.hub75_j8_b0     := RegNext(hub75.b0(4))
            io.hub75_j8_r1     := RegNext(hub75.r1(4))
            io.hub75_j8_g1     := RegNext(hub75.g1(4))
            io.hub75_j8_b1     := RegNext(hub75.b1(4))
        } else{
            io.hub75_j8_r0     := False
            io.hub75_j8_g0     := False
            io.hub75_j8_b0     := False
            io.hub75_j8_r1     := False
            io.hub75_j8_g1     := False
            io.hub75_j8_b1     := False
        }
    }


}

object Cube2TopVerilog extends App {
  Config.spinal.generateVerilog(new Cube2Top(isSim = false))
}

object Cube2TopSim extends App {
  Config.spinal.generateVerilog(new Cube2Top(isSim = true))
}

