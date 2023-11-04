
package ecp5

import spinal.core._

class main_pll() extends BlackBox {

    val io = new Bundle {
        val clk_in          = in(Bool)
        val clk_out         = out(Bool)
        val locked          = out(Bool)
    }

    noIoPrefix()
}


