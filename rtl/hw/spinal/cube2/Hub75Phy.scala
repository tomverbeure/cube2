
package cube2

import spinal.core._
import spinal.lib._
import spinal.lib.io._
import spinal.lib.bus.misc._
import spinal.lib.bus.simple._

case class Hub75PhyFeed(conf: Hub75Config) extends Bundle {
    val sof         = Bool

    val r0          = Bits(conf.nr_channels bits)
    val g0          = Bits(conf.nr_channels bits)
    val b0          = Bits(conf.nr_channels bits)

    val r1          = Bits(conf.nr_channels bits)
    val g1          = Bits(conf.nr_channels bits)
    val b1          = Bits(conf.nr_channels bits)
}

// Input: 
//      rgb     : a valid/ready receiving interface that carries 4 24-bit colors.
//
// Output:
//      hub75   : RGB data after HUB75 timing has been inserted

class Hub75Phy(oscSpeed: HertzNumber, conf: Hub75Config) extends Component {

    def osc_clk_speed = oscSpeed
    def refresh_rate  = 180        // frame per second

    // All panels have their own interface, so you don't need to take into
    // account the number of panels.
    val sclk_desired  = (conf.panel_rows * conf.panel_cols / conf.pixels_per_clk)  * (1 << conf.bpc) * refresh_rate
    val sclk_ratio    = (osc_clk_speed.toLong / sclk_desired).toInt
    val sclk_actual   = (osc_clk_speed / sclk_ratio).toLong

    println(s"Desired sclk: $sclk_desired")
    println(s"Clock ratio:  $sclk_ratio")
    println(s"Actual sclk:  $sclk_actual")

    assert(sclk_ratio >= 2)

    val io = new Bundle {
        val rgb             = slave(Stream(Hub75PhyFeed(conf)))
        val hub75           = out(Hub75Intfc(conf))
    }

    val clk_div_cntr  = Counter(sclk_ratio, True)
    val col_cntr      = Counter(conf.panel_cols+3,   clk_div_cntr.willOverflow)
    val bin_dec_phase = Counter(1 << conf.bpc)
    val bit_cntr      = Counter(conf.bpc)
    val row_cntr      = Counter(conf.panel_rows/2, bit_cntr.willOverflow)

    val bin_dec_phase_max = UInt(conf.bpc bits)

    bin_dec_phase_max := ((U(1, 1 bits) << bit_cntr)-1).resize(conf.bpc)

    when(col_cntr.willOverflow){
        when(bin_dec_phase === bin_dec_phase_max){
            bit_cntr.increment()
            bin_dec_phase.clear()
        }
        .otherwise{
            bin_dec_phase.increment()
        }
    }

    val col_active_phase = col_cntr.value < conf.panel_cols

    val need_data = bin_dec_phase === 0 && col_active_phase && clk_div_cntr === 0
    val need_sof  = (col_cntr === 0 && row_cntr === 0 && bit_cntr === 0 && bin_dec_phase === 0)

    val force_clear_no_data = False
    val force_clear_desync = False

    io.rgb.ready   := False
    when(need_data){
        when(!io.rgb.valid){
            force_clear_no_data := True
        }
        .elsewhen(io.rgb.valid && ((io.rgb.payload.sof && !need_sof) || (!io.rgb.payload.sof && need_sof) )){
            force_clear_desync := True
        }
        .otherwise{
            io.rgb.ready   := True
        }
    }

    when(force_clear_no_data || force_clear_desync){
        clk_div_cntr.clear()
        col_cntr.clear()
        bin_dec_phase.clear()
        bit_cntr.clear()
        row_cntr.clear()
    }

    io.hub75.clk      := RegNext(bin_dec_phase === 0 &&  col_active_phase && (clk_div_cntr >= sclk_ratio/2)) init(False)
    io.hub75.oe_      := RegNext(bin_dec_phase === 0 && !col_active_phase) init(True)
    io.hub75.lat      := RegNext(bin_dec_phase === 0 && col_cntr === conf.panel_cols+1) init(False)

    for(i <- 0 until conf.nr_channels){
        io.hub75.r0(i)       := RegNextWhen(io.rgb.payload.r0(i), io.rgb.valid && io.rgb.ready)
        io.hub75.g0(i)       := RegNextWhen(io.rgb.payload.g0(i), io.rgb.valid && io.rgb.ready)
        io.hub75.b0(i)       := RegNextWhen(io.rgb.payload.b0(i), io.rgb.valid && io.rgb.ready)
        io.hub75.r1(i)       := RegNextWhen(io.rgb.payload.r1(i), io.rgb.valid && io.rgb.ready)
        io.hub75.g1(i)       := RegNextWhen(io.rgb.payload.g1(i), io.rgb.valid && io.rgb.ready)
        io.hub75.b1(i)       := RegNextWhen(io.rgb.payload.b1(i), io.rgb.valid && io.rgb.ready)
    }

    io.hub75.row      := RegNextWhen(row_cntr.value, col_cntr.willOverflow) init(0)

}




