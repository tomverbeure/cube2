
package cube2

import spinal.core._
import spinal.lib._
import spinal.lib.io._
import spinal.lib.bus.misc._
import spinal.lib.bus.simple._


// Input: 
//      rgb     : a valid/ready receiving interface that carries 4 24-bit colors.
//
// Output:
//      hub75   : RGB data after HUB75 timing has been inserted

class Hub75Phy(oscSpeed: HertzNumber, conf: Hub75Config) extends Component {

    def osc_clk_speed = oscSpeed
    def refresh_rate  = 120        // frame per second

    val sclk_desired  = (conf.panels.size/2 * conf.panel_rows * conf.panel_cols / conf.pixels_per_clk)  * (1 << conf.bpc) * refresh_rate
    val sclk_ratio    = (osc_clk_speed.toLong / sclk_desired).toInt
    val sclk_actual   = (osc_clk_speed / sclk_ratio).toLong

    println(s"Desired sclk: $sclk_desired")
    println(s"Clock ratio:  $sclk_ratio")
    println(s"Actual sclk:  $sclk_actual")

    val io = new Bundle {
        val rgb             = slave(Stream(Bits(13 bits)))
        val hub75           = out(Hub75Intfc(conf.nr_channels, conf.nr_row_bits))
    }

    val clk_div_cntr  = Counter(sclk_ratio, True)
    val col_cntr      = Counter((conf.panels.size/2 * conf.panel_cols)+3,   clk_div_cntr.willOverflow)
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

    val col_active_phase = col_cntr.value < (conf.panels.size/2 * conf.panel_cols)

    val need_data = bin_dec_phase === 0 && col_active_phase && clk_div_cntr === 0
    val need_sof  = (col_cntr === 0 && row_cntr === 0 && bit_cntr === 0 && bin_dec_phase === 0)

    val force_clear_no_data = False
    val force_clear_desync = False

    io.rgb.ready   := False
    when(need_data){
        when(!io.rgb.valid){
            force_clear_no_data := True
        }
        .elsewhen(io.rgb.valid && ((io.rgb.payload(12) && !need_sof) || (!io.rgb.payload(12) && need_sof) )){
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
    io.hub75.lat      := RegNext(bin_dec_phase === 0 && col_cntr === (conf.panels.size/2 * conf.panel_cols)+1) init(False)

    io.hub75.r0(0)       := RegNextWhen(io.rgb.payload( 0), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(0)       := RegNextWhen(io.rgb.payload( 1), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(0)       := RegNextWhen(io.rgb.payload( 2), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(0)       := RegNextWhen(io.rgb.payload( 3), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(0)       := RegNextWhen(io.rgb.payload( 4), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(0)       := RegNextWhen(io.rgb.payload( 5), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(1)       := RegNextWhen(io.rgb.payload( 6), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(1)       := RegNextWhen(io.rgb.payload( 7), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(1)       := RegNextWhen(io.rgb.payload( 8), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(1)       := RegNextWhen(io.rgb.payload( 9), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(1)       := RegNextWhen(io.rgb.payload(10), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(1)       := RegNextWhen(io.rgb.payload(11), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(2)       := RegNextWhen(io.rgb.payload( 0), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(2)       := RegNextWhen(io.rgb.payload( 1), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(2)       := RegNextWhen(io.rgb.payload( 2), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(2)       := RegNextWhen(io.rgb.payload( 3), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(2)       := RegNextWhen(io.rgb.payload( 4), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(2)       := RegNextWhen(io.rgb.payload( 5), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(3)       := RegNextWhen(io.rgb.payload( 6), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(3)       := RegNextWhen(io.rgb.payload( 7), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(3)       := RegNextWhen(io.rgb.payload( 8), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(3)       := RegNextWhen(io.rgb.payload( 9), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(3)       := RegNextWhen(io.rgb.payload(10), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(3)       := RegNextWhen(io.rgb.payload(11), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(4)       := RegNextWhen(io.rgb.payload( 0), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(4)       := RegNextWhen(io.rgb.payload( 1), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(4)       := RegNextWhen(io.rgb.payload( 2), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(4)       := RegNextWhen(io.rgb.payload( 3), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(4)       := RegNextWhen(io.rgb.payload( 4), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(4)       := RegNextWhen(io.rgb.payload( 5), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(5)       := RegNextWhen(io.rgb.payload( 6), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(5)       := RegNextWhen(io.rgb.payload( 7), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(5)       := RegNextWhen(io.rgb.payload( 8), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(5)       := RegNextWhen(io.rgb.payload( 9), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(5)       := RegNextWhen(io.rgb.payload(10), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(5)       := RegNextWhen(io.rgb.payload(11), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(6)       := RegNextWhen(io.rgb.payload( 0), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(6)       := RegNextWhen(io.rgb.payload( 1), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(6)       := RegNextWhen(io.rgb.payload( 2), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(6)       := RegNextWhen(io.rgb.payload( 3), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(6)       := RegNextWhen(io.rgb.payload( 4), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(6)       := RegNextWhen(io.rgb.payload( 5), io.rgb.valid && io.rgb.ready)

    io.hub75.r0(7)       := RegNextWhen(io.rgb.payload( 6), io.rgb.valid && io.rgb.ready)
    io.hub75.g0(7)       := RegNextWhen(io.rgb.payload( 7), io.rgb.valid && io.rgb.ready)
    io.hub75.b0(7)       := RegNextWhen(io.rgb.payload( 8), io.rgb.valid && io.rgb.ready)
    io.hub75.r1(7)       := RegNextWhen(io.rgb.payload( 9), io.rgb.valid && io.rgb.ready)
    io.hub75.g1(7)       := RegNextWhen(io.rgb.payload(10), io.rgb.valid && io.rgb.ready)
    io.hub75.b1(7)       := RegNextWhen(io.rgb.payload(11), io.rgb.valid && io.rgb.ready)

    io.hub75.row      := RegNextWhen(row_cntr.value, col_cntr.willOverflow) init(0)

}




