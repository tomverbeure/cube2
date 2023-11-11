package cube2

import scala.collection.mutable.ArrayBuffer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.bus.amba3.apb._

object Hub75Streamer {
    def getApb3Config() = Apb3Config(addressWidth = 12, dataWidth = 32)
}

class Hub75Streamer(conf: Hub75Config, ledMemConf: LedMemConfig) extends Component {

    val io = new Bundle {
        val rgb               = master(Stream(Hub75PhyFeed(conf)))

        val panel_infos       = in(Vec(PanelInfoHW(conf), conf.panels.size))

        val enable            = in(Bool)
        val start             = in(Bool)
        val eof               = out(Bool)

        val r_dim             = in(UInt(8 bits))
        val g_dim             = in(UInt(8 bits))
        val b_dim             = in(UInt(8 bits))

        val led_mem_rd        = out(Bool)
        val led_mem_rd_addr   = out(UInt(ledMemConf.ramInstanceAddrBits bits))
        val led_mem_rd_data   = in(Vec(Bits(ledMemConf.ramInstanceDataBits bits), ledMemConf.nrInstances))

        val cur_buffer_nr     = in(UInt(1 bits))
        val cur_row_nr        = out(UInt(log2Up(conf.panel_rows/2) bits))
        val cur_bit_nr        = out(UInt(log2Up(conf.bpc) bits))

        val frame_cntr        = out(UInt(24 bits))
    }

    //val output_fifo_depth = 1 * conf.panel_cols * conf.panels.size/2
    val output_fifo_depth = 10
    val output_fifo_wr    = Stream(io.rgb.payload)
    val output_fifo_rd    = Stream(io.rgb.payload)
    val output_fifo_availability = UInt(log2Up(output_fifo_depth+1) bits)
       
    val col_cntr        = Counter(conf.panel_cols)
    val bit_cntr        = Counter(conf.bpc, col_cntr.willOverflow)
    val row_cntr        = Counter(conf.panel_rows/2, bit_cntr.willOverflow)
    val frame_cntr      = Counter(io.frame_cntr.getWidth bits, row_cntr.willOverflow)

    io.cur_row_nr    := row_cntr.value
    io.cur_bit_nr    := bit_cntr.value
    io.eof           := row_cntr.willOverflow

    io.frame_cntr     := frame_cntr.value

    val cur_panel_info = io.panel_infos(0)

    object FsmState extends SpinalEnum {
        val FetchPhase0         = newElement()
        val FetchPhase1         = newElement()
    }

    val cur_state = Reg(FsmState()) init(FsmState.FetchPhase0)

    val led_mem_rd_p1        = RegInit(False)
    val led_mem_rd_addr_p1   = Reg(SInt(ledMemConf.ramInstanceAddrBits+1 bits)) init(0)

    val active            = RegInit(False).setWhen(io.start).clearWhen(io.eof || !io.enable)

    when(!active){
        col_cntr.clear()
        row_cntr.clear()
        bit_cntr.clear()
    }

    val ramAddrBits = ledMemConf.ramInstanceAddrBits

/*
    val cur_memAddrStart   =  (cur_state === FsmState.FetchPhase0) ? cur_panel_info.memAddrStartPh0 |
                                                                     cur_panel_info.memAddrStartPh1 

    val cur_memAddrRowMul  =  cur_panel_info.memAddrRowMul
    val cur_memAddrColMul  =  cur_panel_info.memAddrColMul

    val led_mem_rd_addr_p0 = ((False ## (io.cur_buffer_nr * conf.pixels_per_panel)).resize(ramAddrBits+1).asSInt
                                  + cur_memAddrStart.resize(ledMemConf.ramInstanceAddrBits+1).asSInt
                                  + ((False ## row_cntr.value).asSInt * cur_memAddrRowMul).resize(ramAddrBits+1)
                                  + ((False ## col_cntr.value).asSInt * cur_memAddrColMul).resize(ramAddrBits+1))
*/

    val led_mem_phase_p0    = UInt(1 bits)

    val led_mem_rd_addr_p0  = ((False ## (io.cur_buffer_nr * conf.pixels_per_panel)).resize(ramAddrBits+1).asSInt
                                  + (led_mem_phase_p0 * 32 * 64).resize(ramAddrBits+1).asSInt
                                  + (row_cntr.value * 64).resize(ramAddrBits+1).asSInt
                                  + col_cntr.value.resize(ramAddrBits+1).asSInt)


    led_mem_phase_p0   := 0
    switch(cur_state){
        is(FsmState.FetchPhase0){
          when(active && output_fifo_availability > 2){
                // Fetch subchannel 0
                led_mem_phase_p0    := 0

                led_mem_rd_p1       := True
                led_mem_rd_addr_p1  := led_mem_rd_addr_p0

                cur_state   := FsmState.FetchPhase1
            }
            .otherwise{
                led_mem_rd_p1       := False
            }
        }
        is(FsmState.FetchPhase1){
            // Fetch subchannel 1
            led_mem_phase_p0    := 1

            led_mem_rd_p1       := True
            led_mem_rd_addr_p1  := led_mem_rd_addr_p0

            col_cntr.increment()

            cur_state       := FsmState.FetchPhase0
        }
    }

    io.led_mem_rd       := led_mem_rd_p1
    io.led_mem_rd_addr  := led_mem_rd_addr_p1.resize(ramAddrBits).asUInt

    val led_mem_rd_p2     = RegNext(led_mem_rd_p1) init(False)
    val led_mem_phase_p2  = Delay(led_mem_phase_p0, 2) init(0)
    val bit_cntr_p2       = Delay(bit_cntr.value, 2)
    val sof_p2            = Delay((col_cntr === 0 && row_cntr === 0 && bit_cntr === 0), 2)

    val gammaTable = for(index <-  0 to (1<<conf.bpc)-1) yield {
        val ratio = index.toFloat / ((1<<conf.bpc)-1).toFloat
        val gammaValue = Math.pow(ratio, 2.2) * ((1<<conf.bpc)-1)
        U(gammaValue.toInt, conf.bpc bits)
    }

    val r_vec = Reg(Bits(conf.nr_channels * 2 bits)) init(0)
    val g_vec = Reg(Bits(conf.nr_channels * 2 bits)) init(0)
    val b_vec = Reg(Bits(conf.nr_channels * 2 bits)) init(0)

    val led_r_debug = Vec(Bits(conf.bpc bits), conf.nr_channels)
    val led_g_debug = Vec(Bits(conf.bpc bits), conf.nr_channels)
    val led_b_debug = Vec(Bits(conf.bpc bits), conf.nr_channels)

    for(chanNr <- 0 until conf.nr_channels){
        // Convert from ledMemConf.bpc to conf.bpc
        val led_mem_r = (io.led_mem_rd_data(chanNr)((ledMemConf.bpc * 1 -1) downto ledMemConf.bpc * 0) ## U(0, 8-ledMemConf.bpc bits) >> (8-conf.bpc))
        val led_mem_g = (io.led_mem_rd_data(chanNr)((ledMemConf.bpc * 2 -1) downto ledMemConf.bpc * 1) ## U(0, 8-ledMemConf.bpc bits) >> (8-conf.bpc))
        val led_mem_b = (io.led_mem_rd_data(chanNr)((ledMemConf.bpc * 3 -1) downto ledMemConf.bpc * 2) ## U(0, 8-ledMemConf.bpc bits) >> (8-conf.bpc))

        led_r_debug(chanNr)     := led_mem_r
        led_g_debug(chanNr)     := led_mem_g
        led_b_debug(chanNr)     := led_mem_b

        val r = Bool
        val g = Bool
        val b = Bool

        if (false){
            val gamma_rom_r = Mem(UInt(conf.bpc bits), initialContent = gammaTable)
            val gamma_rom_g = Mem(UInt(conf.bpc bits), initialContent = gammaTable)
            val gamma_rom_b = Mem(UInt(conf.bpc bits), initialContent = gammaTable)
    
            val r_gamma = gamma_rom_r.readAsync(U(led_mem_r))
            val g_gamma = gamma_rom_g.readAsync(U(led_mem_g))
            val b_gamma = gamma_rom_b.readAsync(U(led_mem_b))
    
            val r_dimmed = (r_gamma * io.r_dim)
            val g_dimmed = (g_gamma * io.g_dim)
            val b_dimmed = (b_gamma * io.b_dim)

            r := (r_dimmed.asBits.resizeLeft(led_mem_r.getWidth) >> bit_cntr_p2)(0)
            g := (g_dimmed.asBits.resizeLeft(led_mem_g.getWidth) >> bit_cntr_p2)(0)
            b := (b_dimmed.asBits.resizeLeft(led_mem_b.getWidth) >> bit_cntr_p2)(0)

        }
        else{
            //val led_mem_r   = U(14, ledMemConf.bpc bits).asBits
            //val led_mem_g   = U(14, ledMemConf.bpc bits).asBits
            //val led_mem_b   = U(14, ledMemConf.bpc bits).asBits

            r := (led_mem_r.asBits.resizeLeft(led_mem_r.getWidth) >> bit_cntr_p2)(0)
            g := (led_mem_g.asBits.resizeLeft(led_mem_g.getWidth) >> bit_cntr_p2)(0)
            b := (led_mem_b.asBits.resizeLeft(led_mem_b.getWidth) >> bit_cntr_p2)(0)

        }

        when(led_mem_rd_p2){
            if (chanNr == 0){
                when(led_mem_phase_p2===0){
                    r_vec(0)    := r
                    g_vec(0)    := g
                    b_vec(0)    := b
                }.otherwise{
                    r_vec(1)    := r
                    g_vec(1)    := g
                    b_vec(1)    := b
                }
            }
            if (chanNr == 1){
                when(led_mem_phase_p2===0){
                    r_vec(2)    := r
                    g_vec(2)    := g
                    b_vec(2)    := b
                }.otherwise{
                    r_vec(3)    := r
                    g_vec(3)    := g
                    b_vec(3)    := b
                }
            }
            if (chanNr == 2){
                when(led_mem_phase_p2===0){
                    r_vec(4)    := r
                    g_vec(4)    := g
                    b_vec(4)    := b
                }.otherwise{
                    r_vec(5)    := r
                    g_vec(5)    := g
                    b_vec(5)    := b
                }
            }
            if (chanNr == 3){
                when(led_mem_phase_p2===0){
                    r_vec(6)    := r
                    g_vec(6)    := g
                    b_vec(6)    := b
                }.otherwise{
                    r_vec(7)    := r
                    g_vec(7)    := g
                    b_vec(7)    := b
                }
            }
            if (chanNr == 4){
                when(led_mem_phase_p2===0){
                    r_vec(8)    := r
                    g_vec(8)    := g
                    b_vec(8)    := b
                }.otherwise{
                    r_vec(9)    := r
                    g_vec(9)    := g
                    b_vec(9)    := b
                }
            }
            if (chanNr == 5){
                when(led_mem_phase_p2===0){
                    r_vec(10)    := r
                    g_vec(10)    := g
                    b_vec(10)    := b
                }.otherwise{
                    r_vec(11)    := r
                    g_vec(11)    := g
                    b_vec(11)    := b
                }
            }
            //r_vec(2*chanNr + led_mem_phase_p2) := r
            //g_vec(2*chanNr + led_mem_phase_p2) := g
            //b_vec(2*chanNr + led_mem_phase_p2) := b

            //r_vec   := B(r, 12 bits)
            //g_vec   := B(g, 12 bits)
            //b_vec   := B(b, 12 bits)

            //r_vec       := (r_vec & ~((B(1, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12))) | (B(r, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12)
            //g_vec       := (g_vec & ~((B(1, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12))) | (B(g, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12)
            //b_vec       := (b_vec & ~((B(1, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12))) | (B(b, 12 bits)<<(2*chanNr + led_mem_phase_p2)).resize(12)
        }
    }

    val fifo_wr_p3      = RegNext(led_mem_rd_p2 && led_mem_phase_p2 === 1) init(False)
    val sof_p3          = RegNext(sof_p2) init(False)

    output_fifo_wr.valid  := fifo_wr_p3
    output_fifo_wr.payload.sof  := sof_p3

    for(chanNr <- 0 until conf.nr_channels){
        output_fifo_wr.payload.r0(chanNr) := r_vec(2*chanNr + 0)
        output_fifo_wr.payload.g0(chanNr) := g_vec(2*chanNr + 0)
        output_fifo_wr.payload.b0(chanNr) := b_vec(2*chanNr + 0)

        output_fifo_wr.payload.r1(chanNr) := r_vec(2*chanNr + 1)
        output_fifo_wr.payload.g1(chanNr) := g_vec(2*chanNr + 1)
        output_fifo_wr.payload.b1(chanNr) := b_vec(2*chanNr + 1)
    }

    val u_output_fifo = StreamFifo(
                            dataType  = Hub75PhyFeed(conf),
                            depth     = output_fifo_depth
                        )
    u_output_fifo.io.push         << output_fifo_wr
    u_output_fifo.io.pop          >> output_fifo_rd
    u_output_fifo.io.availability <> output_fifo_availability

    io.rgb.valid    := output_fifo_rd.valid && (!output_fifo_rd.payload.sof || output_fifo_availability <= 2)
    io.rgb.payload  := output_fifo_rd.payload
    output_fifo_rd.ready  := io.rgb.ready

    def driveFrom(busCtrl: BusSlaveFactory, baseAddress: BigInt) = new Area {

          // All panel info parameters are programmable for fast iteration
          for(i <- 0 until conf.panels.length){
              val addr = 0x100 + i * 0x40  

              val info_hw = conf.panels(i).toPanelInfoHW(conf)

              io.panel_infos(i).topLeftXCoord := busCtrl.createReadAndWrite(PanelInfoHW(conf).topLeftXCoord, addr + 0x00, 0) init(info_hw.topLeftXCoord)
              io.panel_infos(i).topLeftYCoord := busCtrl.createReadAndWrite(PanelInfoHW(conf).topLeftXCoord, addr + 0x00, 2) init(info_hw.topLeftYCoord)
              io.panel_infos(i).topLeftZCoord := busCtrl.createReadAndWrite(PanelInfoHW(conf).topLeftXCoord, addr + 0x00, 4) init(info_hw.topLeftZCoord)

              io.panel_infos(i).xIncr := busCtrl.createReadAndWrite(PanelInfoHW(conf).xIncr, addr + 0x00, 8) init(info_hw.xIncr)
              io.panel_infos(i).yIncr := busCtrl.createReadAndWrite(PanelInfoHW(conf).yIncr, addr + 0x00, 10) init(info_hw.yIncr)
              io.panel_infos(i).zIncr := busCtrl.createReadAndWrite(PanelInfoHW(conf).zIncr, addr + 0x00, 12) init(info_hw.zIncr)

/*
              io.panel_infos(i).memAddrStartPh0 := busCtrl.createReadAndWrite(PanelInfoHW(conf).memAddrStartPh0, addr + 0x04, 0) init(info_hw.memAddrStartPh0)
              io.panel_infos(i).memAddrStartPh1 := busCtrl.createReadAndWrite(PanelInfoHW(conf).memAddrStartPh1, addr + 0x08, 0) init(info_hw.memAddrStartPh1)

              io.panel_infos(i).memAddrColMul := busCtrl.createReadAndWrite(PanelInfoHW(conf).memAddrColMul, addr + 0x0c, 0) init(info_hw.memAddrColMul)
              io.panel_infos(i).memAddrRowMul := busCtrl.createReadAndWrite(PanelInfoHW(conf).memAddrRowMul, addr + 0x10, 0) init(info_hw.memAddrRowMul)
*/
          }


          // Config 
          val enable              = busCtrl.createReadAndWrite(Bool,              0x0, 0) init(False)
          val start               = busCtrl.createReadAndWrite(Bool,              0x0, 1) init(False)
          val auto_restart        = busCtrl.createReadAndWrite(Bool,              0x0, 2) init(False)
          val buffer_nr           = busCtrl.createReadAndWrite(io.cur_buffer_nr,  0x0, 4) init(0)

          // Status
          val cur_row_nr          = busCtrl.createReadOnly(row_cntr.value,        0x04, 8)
          val cur_bit_nr          = busCtrl.createReadOnly(bit_cntr.value,        0x04, 24)
          val cur_buffer_nr_reg   = busCtrl.createReadOnly(io.cur_buffer_nr,      0x04, 31)

          // Total number of frame transmitted
          val frame_cntr          = busCtrl.createReadOnly(io.frame_cntr,         0x08, 0)

          // Global dimming factor to control power
          val r_dim               = busCtrl.createReadAndWrite(io.r_dim,          0xc,  0)  init(U(255))
          val g_dim               = busCtrl.createReadAndWrite(io.g_dim,          0xc,  8)  init(U(255))
          val b_dim               = busCtrl.createReadAndWrite(io.b_dim,          0xc,  16) init(U(255))

          val cur_buffer_nr = RegInit(U(0, 1 bits))
          when(io.eof){
              cur_buffer_nr := buffer_nr
          }

          val restart = RegNext(io.eof) && auto_restart

          io.enable         := enable
          io.start          := (start && !RegNext(start)) || restart
          io.cur_buffer_nr  := cur_buffer_nr

          io.r_dim          := r_dim
          io.g_dim          := g_dim
          io.b_dim          := b_dim

          cur_row_nr        := io.cur_row_nr
          cur_bit_nr        := io.cur_bit_nr
          cur_buffer_nr_reg := cur_buffer_nr

          frame_cntr        := io.frame_cntr
    }

}


