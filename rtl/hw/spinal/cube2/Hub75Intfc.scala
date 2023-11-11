
package cube2

//import scala.collection.immutable.Array

import spinal.core._
import spinal.lib._
import spinal.lib.io._
import spinal.lib.bus.misc._
import spinal.lib.bus.simple._

case class PanelInfoHW(conf: Hub75Config) extends Bundle {
    val topLeftXCoord           = SInt(2 bits)
    val topLeftYCoord           = SInt(2 bits)
    val topLeftZCoord           = SInt(2 bits)

    // Memory address of the first phyical pixel of the top half of the panel
    val memAddrStartPh0         = UInt(log2Up(2*conf.total_nr_pixels) bits)
    // Memory address of the first phyical pixel of the bottom half of the panel
    val memAddrStartPh1         = UInt(log2Up(2*conf.total_nr_pixels) bits)

    val memAddrColMul           = SInt(log2Up(conf.panel_cols)+2 bits)
    val memAddrRowMul           = SInt(log2Up(conf.panel_cols)+2 bits)

    val xIncr                   = SInt(2 bits)
    val yIncr                   = SInt(2 bits)
    val zIncr                   = SInt(2 bits)
}

case class PanelInfo(
    // Currently not used...
    topLeftXCoord           : Int,
    topLeftYCoord           : Int,
    topLeftZCoord           : Int,

    // Side number:
    // 0 -> left
    // 1 -> front
    // 2 -> right
    // 3 -> back
    // 4 -> bottom
    // 5 -> top
    side                    : Int,
    // Angle by which the physical panel (0x0) coordinate is
    // rotated compared to the desired left/top location
    sideRotation            : Int,

    xIncr                   : Int,
    yIncr                   : Int,
    zIncr                   : Int
    )
{

    def toPanelInfoHW(conf: Hub75Config) : PanelInfoHW = {

        val piHW = PanelInfoHW(conf)

        piHW.topLeftXCoord      := topLeftXCoord
        piHW.topLeftYCoord      := topLeftYCoord
        piHW.topLeftZCoord      := topLeftZCoord

        // Starting with Cube2, there's 1 RAM per side, that is double buffered.
        // memAddrStartPh0/1 is the location of the first physical pixel of the
        // first buffer.
        var memAddrStartPh0     = 2 * side * conf.pixels_per_panel
        var memAddrStartPh1     = 0

        var memAddrColMul       = 1
        var memAddrRowMul       = 1

        if (sideRotation == 0){
            memAddrStartPh1     = memAddrStartPh0 + conf.panel_rows/2 * conf.panel_cols

            memAddrColMul       = 1
            memAddrRowMul       = conf.panel_cols
        }
        else if (sideRotation == 90) {
            memAddrStartPh0     += conf.panel_cols -1
            memAddrStartPh1     = memAddrStartPh0 - conf.panel_rows/2

            memAddrColMul       = conf.panel_cols
            memAddrRowMul       = -1
        }
        else if (sideRotation==180){
            memAddrStartPh0     += conf.panel_rows * conf.panel_cols - 1
            memAddrStartPh1     = memAddrStartPh0 - (conf.panel_rows/2 * conf.panel_cols)

            memAddrColMul       = -1 
            memAddrRowMul       = -conf.panel_cols
        }
        else if (sideRotation==270){
            memAddrStartPh0     += (conf.panel_rows-1) * conf.panel_cols
            memAddrStartPh1     = memAddrStartPh0 - (conf.panel_rows/2 * conf.panel_cols)
        }
        else{
            assert(true)
        }

        println(s"========================================")
        println(s"Side:   $side")
        println(s"Rot:    $sideRotation")
        println(s"Ph0:    $memAddrStartPh0")
        println(s"Ph1:    $memAddrStartPh1")
        println(s"ColMul: $memAddrColMul")
        println(s"RowMul: $memAddrRowMul")

        piHW.memAddrStartPh0    := memAddrStartPh0
        piHW.memAddrStartPh1    := memAddrStartPh1
        piHW.memAddrColMul      := memAddrColMul
        piHW.memAddrRowMul      := memAddrRowMul

        piHW.xIncr              := xIncr
        piHW.yIncr              := yIncr
        piHW.zIncr              := zIncr

        piHW
    }
}

case class Hub75Config(
              nr_channels     : Int, 
              panel_rows      : Int, 
              panel_cols      : Int,
              bpc             : Int,
              panels          : Array[PanelInfo]
  ) 
{
    def pixels_per_clk    = 2
    def nr_row_bits       = log2Up(panel_rows / pixels_per_clk)
    def total_nr_pixels   = panels.size * panel_rows * panel_cols
    def pixels_per_panel  = panel_rows * panel_cols

    println(s"nr_row_bits     : $nr_row_bits")
    println(s"pixels_per_panel: $pixels_per_panel")
    println(s"total_nr_pixels : $total_nr_pixels")
}

case class Hub75Intfc(conf: Hub75Config) extends Bundle {
    val clk         = Bool
    val lat         = Bool
    val oe_         = Bool
    val row         = UInt(conf.nr_row_bits bits)

    val r0          = Bits(conf.nr_channels bit)
    val g0          = Bits(conf.nr_channels bit)
    val b0          = Bits(conf.nr_channels bit)

    val r1          = Bits(conf.nr_channels bit)
    val g1          = Bits(conf.nr_channels bit)
    val b1          = Bits(conf.nr_channels bit)
}

