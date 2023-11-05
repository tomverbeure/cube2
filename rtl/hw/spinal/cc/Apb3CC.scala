
package cc

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb._

//============================================================
//
// APB3 Clock Crossing block
//
//============================================================

object Apb3CC {
}

class Apb3CC(apb3Config: Apb3Config, srcDomain: ClockDomain, destDomain: ClockDomain) extends Component {

    val io = new Bundle {
        val src         = slave(Apb3(apb3Config))
        val dest        = master(Apb3(apb3Config))
    }

    val PRDATA_dest = Bits(apb3Config.dataWidth bits)

    val xfer_done_src = Bool
    val xfer_done_dest = Bool

    val u_sync_pulse_xfer_done = new PulseCCByToggle(destDomain, srcDomain)
    u_sync_pulse_xfer_done.io.pulseIn      <> xfer_done_dest
    u_sync_pulse_xfer_done.io.pulseOut     <> xfer_done_src


    val src = new ClockingArea(srcDomain) {

        val xfer_start  = Reg(Bool) init(False)
        val PADDR       = Reg(UInt(apb3Config.addressWidth bits)) init(0)
        val PSEL        = Reg(Bits(apb3Config.selWidth bits)) init(0)
        val PWRITE      = RegInit(False)
        val PWDATA      = Reg(Bits(apb3Config.dataWidth bits)) init(0)
        val PRDATA      = Reg(Bits(apb3Config.dataWidth bits)) init(0)
        val PREADY      = RegInit(False)
        val PSLVERROR   = if (apb3Config.useSlaveError) Reg(Bool) else null

        xfer_start  := False
        when((io.src.PENABLE && io.src.PSEL.orR).rise){
            xfer_start      := True
            PADDR           := io.src.PADDR
            PSEL            := io.src.PSEL
            PWRITE          := io.src.PWRITE
            PWDATA          := io.src.PWDATA
        }

        PREADY          := False
        when(xfer_done_src){
            PREADY          := True
            when (!io.src.PWRITE){
                PRDATA      := PRDATA_dest.addTag(crossClockDomain)
            }
        }

        io.src.PRDATA   := PRDATA
        io.src.PREADY   := PREADY
    }

    val xfer_start_dest = Bool
    val u_sync_pulse_xfer_start = new PulseCCByToggle(srcDomain, destDomain)
    u_sync_pulse_xfer_start.io.pulseIn      <> src.xfer_start
    u_sync_pulse_xfer_start.io.pulseOut     <> xfer_start_dest

    val dest = new ClockingArea(destDomain) {
        val xfer_start_dest_d1 = RegNext(xfer_start_dest) init(False)

        val PADDR       = Reg(UInt(apb3Config.addressWidth bits)) init(0)
        val PSEL        = Reg(Bits(apb3Config.selWidth bits)) init(0)
        val PWRITE      = RegInit(False)
        val PWDATA      = Reg(Bits(apb3Config.dataWidth bits)) init(0)
        val PRDATA      = Reg(Bits(apb3Config.dataWidth bits)) init(0)
        val PSLVERROR   = if (apb3Config.useSlaveError) Reg(Bool) else null

        when(xfer_start_dest){
            PADDR       := src.PADDR.addTag(crossClockDomain)
            PSEL        := src.PSEL.addTag(crossClockDomain)
            PWRITE      := src.PWRITE.addTag(crossClockDomain)
            PWDATA      := src.PWDATA.addTag(crossClockDomain)
        }

        val PENABLE     = RegInit(False) setWhen(xfer_start_dest_d1) clearWhen(io.dest.PREADY)
        val xfer_done   = RegInit(False)

        xfer_done := False
        when(PENABLE && io.dest.PREADY){
            PSEL        := 0
            when(!io.dest.PWRITE){
                PRDATA      := io.dest.PRDATA
            }
            xfer_done := True
        }


        io.dest.PENABLE := PENABLE
        io.dest.PADDR   := PADDR
        io.dest.PSEL    := PSEL
        io.dest.PWRITE  := PWRITE
        io.dest.PWDATA  := PWDATA

        PRDATA_dest     := PRDATA
        xfer_done_dest  := xfer_done
    }
}

