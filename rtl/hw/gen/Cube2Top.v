// Generator : SpinalHDL v1.9.4    git head : 270018552577f3bb8e5339ee2583c9c22d324215
// Component : Cube2Top
// Git hash  : d8d4ccad26fd05a0e990e5a3061669869dd4c5ef

`timescale 1ns/1ps

module Cube2Top (
  input  wire          osc_clk25,
  output wire          phy_reset_n,
  output wire          hub75_clk,
  output wire          hub75_lat,
  output wire          hub75_oe_,
  output wire [4:0]    hub75_row,
  output wire          hub75_j1_r0,
  output wire          hub75_j1_g0,
  output wire          hub75_j1_b0,
  output wire          hub75_j1_r1,
  output wire          hub75_j1_g1,
  output wire          hub75_j1_b1,
  output wire          hub75_j2_r0,
  output wire          hub75_j2_g0,
  output wire          hub75_j2_b0,
  output wire          hub75_j2_r1,
  output wire          hub75_j2_g1,
  output wire          hub75_j2_b1,
  output wire          hub75_j3_r0,
  output wire          hub75_j3_g0,
  output wire          hub75_j3_b0,
  output wire          hub75_j3_r1,
  output wire          hub75_j3_g1,
  output wire          hub75_j3_b1,
  output wire          hub75_j4_r0,
  output wire          hub75_j4_g0,
  output wire          hub75_j4_b0,
  output wire          hub75_j4_r1,
  output wire          hub75_j4_g1,
  output wire          hub75_j4_b1,
  output wire          hub75_j5_r0,
  output wire          hub75_j5_g0,
  output wire          hub75_j5_b0,
  output wire          hub75_j5_r1,
  output wire          hub75_j5_g1,
  output wire          hub75_j5_b1,
  output wire          hub75_j6_r0,
  output wire          hub75_j6_g0,
  output wire          hub75_j6_b0,
  output wire          hub75_j6_r1,
  output wire          hub75_j6_g1,
  output wire          hub75_j6_b1,
  output wire          hub75_j7_r0,
  output wire          hub75_j7_g0,
  output wire          hub75_j7_b0,
  output wire          hub75_j7_r1,
  output wire          hub75_j7_g1,
  output wire          hub75_j7_b1,
  output wire          hub75_j8_r0,
  output wire          hub75_j8_g0,
  output wire          hub75_j8_b0,
  output wire          hub75_j8_r1,
  output wire          hub75_j8_g1,
  output wire          hub75_j8_b1,
  output wire          led,
  input  wire          button
);

  reg                 core_u_cpu_io_led_mem_apb_PREADY;
  reg        [31:0]   core_u_cpu_io_led_mem_apb_PRDATA;
  wire                core_u_cpu_io_led_mem_apb_PSLVERROR;
  wire                core_u_cpu_io_hub75_streamer_apb_PREADY;
  reg        [31:0]   core_u_cpu_io_hub75_streamer_apb_PRDATA;
  wire                core_u_cpu_io_hub75_streamer_apb_PSLVERROR;
  reg        [5:0]    core_u_led_mem_io_led_mem_a_req;
  reg        [12:0]   core_u_led_mem_io_led_mem_a_addr;
  reg                 core_u_led_mem_io_led_mem_a_wr;
  wire                core_u_led_mem_io_led_mem_b_wr;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_wr_data;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_0_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_0_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_0_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_0_memAddrRowMul;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_1_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_1_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_1_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_1_memAddrRowMul;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_2_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_2_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_2_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_2_memAddrRowMul;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_3_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_3_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_3_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_3_memAddrRowMul;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_4_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_4_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_4_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_4_memAddrRowMul;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_5_memAddrStartPh0;
  wire       [15:0]   core_u_hub75_streamer_io_panel_infos_5_memAddrStartPh1;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_5_memAddrColMul;
  wire       [7:0]    core_u_hub75_streamer_io_panel_infos_5_memAddrRowMul;
  wire                core_u_hub75_streamer_io_start;
  wire                osc_src_u_main_clk_clk_out;
  wire                osc_src_u_main_clk_locked;
  wire                core_u_cpu_io_led_red;
  wire                core_u_cpu_io_led_green;
  wire                core_u_cpu_io_led_blue;
  wire       [17:0]   core_u_cpu_io_led_mem_apb_PADDR;
  wire       [0:0]    core_u_cpu_io_led_mem_apb_PSEL;
  wire                core_u_cpu_io_led_mem_apb_PENABLE;
  wire                core_u_cpu_io_led_mem_apb_PWRITE;
  wire       [31:0]   core_u_cpu_io_led_mem_apb_PWDATA;
  wire       [11:0]   core_u_cpu_io_hub75_streamer_apb_PADDR;
  wire       [0:0]    core_u_cpu_io_hub75_streamer_apb_PSEL;
  wire                core_u_cpu_io_hub75_streamer_apb_PENABLE;
  wire                core_u_cpu_io_hub75_streamer_apb_PWRITE;
  wire       [31:0]   core_u_cpu_io_hub75_streamer_apb_PWDATA;
  wire       [11:0]   core_u_led_mem_io_led_mem_a_rd_data;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_0;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_1;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_2;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_3;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_4;
  wire       [11:0]   core_u_led_mem_io_led_mem_b_rd_data_5;
  wire                core_u_hub75_streamer_io_rgb_valid;
  wire                core_u_hub75_streamer_io_rgb_payload_sof;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_r0;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_g0;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_b0;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_r1;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_g1;
  wire       [5:0]    core_u_hub75_streamer_io_rgb_payload_b1;
  wire                core_u_hub75_streamer_io_eof;
  wire                core_u_hub75_streamer_io_led_mem_rd;
  wire       [12:0]   core_u_hub75_streamer_io_led_mem_rd_addr;
  wire       [4:0]    core_u_hub75_streamer_io_cur_row_nr;
  wire       [2:0]    core_u_hub75_streamer_io_cur_bit_nr;
  wire       [23:0]   core_u_hub75_streamer_io_frame_cntr;
  wire                core_u_hub75phy_io_rgb_ready;
  wire                core_u_hub75phy_io_hub75_clk;
  wire                core_u_hub75phy_io_hub75_lat;
  wire                core_u_hub75phy_io_hub75_oe_;
  wire       [4:0]    core_u_hub75phy_io_hub75_row;
  wire       [5:0]    core_u_hub75phy_io_hub75_r0;
  wire       [5:0]    core_u_hub75phy_io_hub75_g0;
  wire       [5:0]    core_u_hub75phy_io_hub75_b0;
  wire       [5:0]    core_u_hub75phy_io_hub75_r1;
  wire       [5:0]    core_u_hub75phy_io_hub75_g1;
  wire       [5:0]    core_u_hub75phy_io_hub75_b1;
  wire       [17:0]   _zz_core_led_mem_apb_regs_cpu_wr_addr;
  wire       [17:0]   _zz_core_led_mem_apb_regs_cpu_wr_addr_1;
  wire       [17:0]   _zz_core_led_mem_apb_regs_cpu_rd_addr;
  wire       [17:0]   _zz_core_led_mem_apb_regs_cpu_rd_addr_1;
  wire       [7:0]    _zz_io_led_mem_a_req;
  wire       [7:0]    _zz_io_led_mem_a_req_1;
  wire       [7:0]    _zz_io_led_mem_a_req_2;
  wire       [7:0]    _zz_io_led_mem_a_req_3;
  wire                main_clk;
  wire                main_reset_;
  reg                 main_reset_gen_reset_unbuffered_;
  reg        [15:0]   main_reset_gen_reset_cntr;
  wire       [15:0]   _zz_when_Cube2Top_l138;
  wire                when_Cube2Top_l138;
  reg                 main_reset_gen_reset_unbuffered__regNext;
  reg        [23:0]   debug_leds_led_counter;
  wire                _zz_io_led_mem_apb_PSLVERROR;
  wire                _zz_io_led_mem_apb_PSLVERROR_1;
  wire                _zz_1;
  wire                _zz_io_led_mem_apb_PSLVERROR_2;
  wire                _zz_io_led_mem_apb_PSLVERROR_3;
  wire       [15:0]   core_led_mem_apb_regs_cpu_wr_addr;
  wire       [15:0]   core_led_mem_apb_regs_cpu_rd_addr;
  wire       [23:0]   core_led_mem_apb_regs_bus_a_wr_data;
  wire       [11:0]   core_led_mem_apb_regs_mem_a_wr_data;
  wire       [2:0]    core_led_mem_apb_regs_ram_a_wr_inst_nr;
  wire       [2:0]    core_led_mem_apb_regs_ram_a_rd_inst_nr;
  reg                 _zz_when_BusSlaveFactory_l609;
  reg        [0:0]    _zz_when_BusSlaveFactory_l609_1;
  reg        [0:0]    _zz_when_BusSlaveFactory_l609_2;
  wire                _zz_when_BusSlaveFactory_l609_3;
  wire                _zz_io_hub75_streamer_apb_PSLVERROR;
  wire                _zz_io_hub75_streamer_apb_PSLVERROR_1;
  wire                _zz_io_hub75_streamer_apb_PSLVERROR_2;
  wire                _zz_io_hub75_streamer_apb_PSLVERROR_3;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_1;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_2;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_3;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_4;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_5;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_6;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_7;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_8;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_9;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_10;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_11;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_12;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_13;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_14;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_15;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_16;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_17;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_18;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_19;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_20;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_21;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_22;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_23;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_24;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_25;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_26;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_27;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_28;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_29;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_30;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_31;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_32;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_33;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_34;
  reg        [1:0]    _zz_io_hub75_streamer_apb_PRDATA_35;
  reg                 core_hub75_streamer_regs_enable;
  reg                 core_hub75_streamer_regs_start;
  reg                 core_hub75_streamer_regs_auto_restart;
  reg        [0:0]    core_hub75_streamer_regs_buffer_nr;
  reg        [4:0]    core_hub75_streamer_regs_cur_row_nr;
  reg        [2:0]    core_hub75_streamer_regs_cur_bit_nr;
  reg        [0:0]    core_hub75_streamer_regs_cur_buffer_nr_reg;
  reg        [23:0]   core_hub75_streamer_regs_frame_cntr;
  reg        [7:0]    core_hub75_streamer_regs_r_dim;
  reg        [7:0]    core_hub75_streamer_regs_g_dim;
  reg        [7:0]    core_hub75_streamer_regs_b_dim;
  reg        [0:0]    core_hub75_streamer_regs_cur_buffer_nr;
  reg                 toplevel_core_u_hub75_streamer_io_eof_regNext;
  wire                core_hub75_streamer_regs_restart;
  reg                 core_hub75_streamer_regs_start_regNext;
  wire                core_hub75_clk;
  wire                core_hub75_lat;
  wire                core_hub75_oe_;
  wire       [4:0]    core_hub75_row;
  wire       [5:0]    core_hub75_r0;
  wire       [5:0]    core_hub75_g0;
  wire       [5:0]    core_hub75_b0;
  wire       [5:0]    core_hub75_r1;
  wire       [5:0]    core_hub75_g1;
  wire       [5:0]    core_hub75_b1;
  reg                 core_hub75_clk_regNext;
  reg                 core_hub75_lat_regNext;
  reg                 core_hub75_oe__regNext;
  reg        [4:0]    core_hub75_row_regNext;
  reg                 _zz_hub75_j1_r0;
  reg                 _zz_hub75_j1_g0;
  reg                 _zz_hub75_j1_b0;
  reg                 _zz_hub75_j1_r1;
  reg                 _zz_hub75_j1_g1;
  reg                 _zz_hub75_j1_b1;
  reg                 _zz_hub75_j2_r0;
  reg                 _zz_hub75_j2_g0;
  reg                 _zz_hub75_j2_b0;
  reg                 _zz_hub75_j2_r1;
  reg                 _zz_hub75_j2_g1;
  reg                 _zz_hub75_j2_b1;
  reg                 _zz_hub75_j4_r0;
  reg                 _zz_hub75_j4_g0;
  reg                 _zz_hub75_j4_b0;
  reg                 _zz_hub75_j4_r1;
  reg                 _zz_hub75_j4_g1;
  reg                 _zz_hub75_j4_b1;
  reg                 _zz_hub75_j5_r0;
  reg                 _zz_hub75_j5_g0;
  reg                 _zz_hub75_j5_b0;
  reg                 _zz_hub75_j5_r1;
  reg                 _zz_hub75_j5_g1;
  reg                 _zz_hub75_j5_b1;
  reg                 _zz_hub75_j6_r0;
  reg                 _zz_hub75_j6_g0;
  reg                 _zz_hub75_j6_b0;
  reg                 _zz_hub75_j6_r1;
  reg                 _zz_hub75_j6_g1;
  reg                 _zz_hub75_j6_b1;
  reg                 _zz_hub75_j7_r0;
  reg                 _zz_hub75_j7_g0;
  reg                 _zz_hub75_j7_b0;
  reg                 _zz_hub75_j7_r1;
  reg                 _zz_hub75_j7_g1;
  reg                 _zz_hub75_j7_b1;
  wire                when_Apb3SlaveFactory_l81;
  wire                when_BusSlaveFactory_l609;

  assign _zz_core_led_mem_apb_regs_cpu_wr_addr_1 = (core_u_cpu_io_led_mem_apb_PADDR - 18'h00000);
  assign _zz_core_led_mem_apb_regs_cpu_wr_addr = _zz_core_led_mem_apb_regs_cpu_wr_addr_1;
  assign _zz_core_led_mem_apb_regs_cpu_rd_addr_1 = (core_u_cpu_io_led_mem_apb_PADDR - 18'h00000);
  assign _zz_core_led_mem_apb_regs_cpu_rd_addr = _zz_core_led_mem_apb_regs_cpu_rd_addr_1;
  assign _zz_io_led_mem_a_req = _zz_io_led_mem_a_req_1;
  assign _zz_io_led_mem_a_req_1 = ({7'd0,1'b1} <<< core_led_mem_apb_regs_ram_a_wr_inst_nr);
  assign _zz_io_led_mem_a_req_2 = _zz_io_led_mem_a_req_3;
  assign _zz_io_led_mem_a_req_3 = ({7'd0,1'b1} <<< core_led_mem_apb_regs_ram_a_rd_inst_nr);
  main_pll osc_src_u_main_clk (
    .clk_in  (osc_clk25                 ), //i
    .clk_out (osc_src_u_main_clk_clk_out), //o
    .locked  (osc_src_u_main_clk_locked )  //o
  );
  CpuTop core_u_cpu (
    .io_led_red                      (core_u_cpu_io_led_red                        ), //o
    .io_led_green                    (core_u_cpu_io_led_green                      ), //o
    .io_led_blue                     (core_u_cpu_io_led_blue                       ), //o
    .io_led_mem_apb_PADDR            (core_u_cpu_io_led_mem_apb_PADDR[17:0]        ), //o
    .io_led_mem_apb_PSEL             (core_u_cpu_io_led_mem_apb_PSEL               ), //o
    .io_led_mem_apb_PENABLE          (core_u_cpu_io_led_mem_apb_PENABLE            ), //o
    .io_led_mem_apb_PREADY           (core_u_cpu_io_led_mem_apb_PREADY             ), //i
    .io_led_mem_apb_PWRITE           (core_u_cpu_io_led_mem_apb_PWRITE             ), //o
    .io_led_mem_apb_PWDATA           (core_u_cpu_io_led_mem_apb_PWDATA[31:0]       ), //o
    .io_led_mem_apb_PRDATA           (core_u_cpu_io_led_mem_apb_PRDATA[31:0]       ), //i
    .io_led_mem_apb_PSLVERROR        (core_u_cpu_io_led_mem_apb_PSLVERROR          ), //i
    .io_hub75_streamer_apb_PADDR     (core_u_cpu_io_hub75_streamer_apb_PADDR[11:0] ), //o
    .io_hub75_streamer_apb_PSEL      (core_u_cpu_io_hub75_streamer_apb_PSEL        ), //o
    .io_hub75_streamer_apb_PENABLE   (core_u_cpu_io_hub75_streamer_apb_PENABLE     ), //o
    .io_hub75_streamer_apb_PREADY    (core_u_cpu_io_hub75_streamer_apb_PREADY      ), //i
    .io_hub75_streamer_apb_PWRITE    (core_u_cpu_io_hub75_streamer_apb_PWRITE      ), //o
    .io_hub75_streamer_apb_PWDATA    (core_u_cpu_io_hub75_streamer_apb_PWDATA[31:0]), //o
    .io_hub75_streamer_apb_PRDATA    (core_u_cpu_io_hub75_streamer_apb_PRDATA[31:0]), //i
    .io_hub75_streamer_apb_PSLVERROR (core_u_cpu_io_hub75_streamer_apb_PSLVERROR   ), //i
    .main_clk                        (main_clk                                     ), //i
    .main_reset_                     (main_reset_                                  )  //i
  );
  LedMem core_u_led_mem (
    .io_led_mem_a_req       (core_u_led_mem_io_led_mem_a_req[5:0]          ), //i
    .io_led_mem_a_addr      (core_u_led_mem_io_led_mem_a_addr[12:0]        ), //i
    .io_led_mem_a_wr        (core_u_led_mem_io_led_mem_a_wr                ), //i
    .io_led_mem_a_wr_data   (core_led_mem_apb_regs_mem_a_wr_data[11:0]     ), //i
    .io_led_mem_a_rd_data   (core_u_led_mem_io_led_mem_a_rd_data[11:0]     ), //o
    .io_led_mem_b_req       (core_u_hub75_streamer_io_led_mem_rd           ), //i
    .io_led_mem_b_addr      (core_u_hub75_streamer_io_led_mem_rd_addr[12:0]), //i
    .io_led_mem_b_wr        (core_u_led_mem_io_led_mem_b_wr                ), //i
    .io_led_mem_b_wr_data   (core_u_led_mem_io_led_mem_b_wr_data[11:0]     ), //i
    .io_led_mem_b_rd_data_0 (core_u_led_mem_io_led_mem_b_rd_data_0[11:0]   ), //o
    .io_led_mem_b_rd_data_1 (core_u_led_mem_io_led_mem_b_rd_data_1[11:0]   ), //o
    .io_led_mem_b_rd_data_2 (core_u_led_mem_io_led_mem_b_rd_data_2[11:0]   ), //o
    .io_led_mem_b_rd_data_3 (core_u_led_mem_io_led_mem_b_rd_data_3[11:0]   ), //o
    .io_led_mem_b_rd_data_4 (core_u_led_mem_io_led_mem_b_rd_data_4[11:0]   ), //o
    .io_led_mem_b_rd_data_5 (core_u_led_mem_io_led_mem_b_rd_data_5[11:0]   ), //o
    .main_clk               (main_clk                                      ), //i
    .main_reset_            (main_reset_                                   )  //i
  );
  Hub75Streamer core_u_hub75_streamer (
    .io_rgb_valid                     (core_u_hub75_streamer_io_rgb_valid                          ), //o
    .io_rgb_ready                     (core_u_hub75phy_io_rgb_ready                                ), //i
    .io_rgb_payload_sof               (core_u_hub75_streamer_io_rgb_payload_sof                    ), //o
    .io_rgb_payload_r0                (core_u_hub75_streamer_io_rgb_payload_r0[5:0]                ), //o
    .io_rgb_payload_g0                (core_u_hub75_streamer_io_rgb_payload_g0[5:0]                ), //o
    .io_rgb_payload_b0                (core_u_hub75_streamer_io_rgb_payload_b0[5:0]                ), //o
    .io_rgb_payload_r1                (core_u_hub75_streamer_io_rgb_payload_r1[5:0]                ), //o
    .io_rgb_payload_g1                (core_u_hub75_streamer_io_rgb_payload_g1[5:0]                ), //o
    .io_rgb_payload_b1                (core_u_hub75_streamer_io_rgb_payload_b1[5:0]                ), //o
    .io_panel_infos_0_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA[1:0]                       ), //i
    .io_panel_infos_0_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_1[1:0]                     ), //i
    .io_panel_infos_0_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_2[1:0]                     ), //i
    .io_panel_infos_0_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_0_memAddrStartPh0[15:0]), //i
    .io_panel_infos_0_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_0_memAddrStartPh1[15:0]), //i
    .io_panel_infos_0_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_0_memAddrColMul[7:0]   ), //i
    .io_panel_infos_0_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_0_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_0_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_3[1:0]                     ), //i
    .io_panel_infos_0_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_4[1:0]                     ), //i
    .io_panel_infos_0_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_5[1:0]                     ), //i
    .io_panel_infos_1_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA_6[1:0]                     ), //i
    .io_panel_infos_1_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_7[1:0]                     ), //i
    .io_panel_infos_1_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_8[1:0]                     ), //i
    .io_panel_infos_1_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_1_memAddrStartPh0[15:0]), //i
    .io_panel_infos_1_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_1_memAddrStartPh1[15:0]), //i
    .io_panel_infos_1_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_1_memAddrColMul[7:0]   ), //i
    .io_panel_infos_1_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_1_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_1_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_9[1:0]                     ), //i
    .io_panel_infos_1_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_10[1:0]                    ), //i
    .io_panel_infos_1_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_11[1:0]                    ), //i
    .io_panel_infos_2_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA_12[1:0]                    ), //i
    .io_panel_infos_2_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_13[1:0]                    ), //i
    .io_panel_infos_2_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_14[1:0]                    ), //i
    .io_panel_infos_2_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_2_memAddrStartPh0[15:0]), //i
    .io_panel_infos_2_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_2_memAddrStartPh1[15:0]), //i
    .io_panel_infos_2_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_2_memAddrColMul[7:0]   ), //i
    .io_panel_infos_2_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_2_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_2_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_15[1:0]                    ), //i
    .io_panel_infos_2_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_16[1:0]                    ), //i
    .io_panel_infos_2_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_17[1:0]                    ), //i
    .io_panel_infos_3_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA_18[1:0]                    ), //i
    .io_panel_infos_3_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_19[1:0]                    ), //i
    .io_panel_infos_3_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_20[1:0]                    ), //i
    .io_panel_infos_3_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_3_memAddrStartPh0[15:0]), //i
    .io_panel_infos_3_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_3_memAddrStartPh1[15:0]), //i
    .io_panel_infos_3_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_3_memAddrColMul[7:0]   ), //i
    .io_panel_infos_3_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_3_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_3_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_21[1:0]                    ), //i
    .io_panel_infos_3_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_22[1:0]                    ), //i
    .io_panel_infos_3_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_23[1:0]                    ), //i
    .io_panel_infos_4_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA_24[1:0]                    ), //i
    .io_panel_infos_4_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_25[1:0]                    ), //i
    .io_panel_infos_4_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_26[1:0]                    ), //i
    .io_panel_infos_4_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_4_memAddrStartPh0[15:0]), //i
    .io_panel_infos_4_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_4_memAddrStartPh1[15:0]), //i
    .io_panel_infos_4_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_4_memAddrColMul[7:0]   ), //i
    .io_panel_infos_4_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_4_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_4_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_27[1:0]                    ), //i
    .io_panel_infos_4_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_28[1:0]                    ), //i
    .io_panel_infos_4_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_29[1:0]                    ), //i
    .io_panel_infos_5_topLeftXCoord   (_zz_io_hub75_streamer_apb_PRDATA_30[1:0]                    ), //i
    .io_panel_infos_5_topLeftYCoord   (_zz_io_hub75_streamer_apb_PRDATA_31[1:0]                    ), //i
    .io_panel_infos_5_topLeftZCoord   (_zz_io_hub75_streamer_apb_PRDATA_32[1:0]                    ), //i
    .io_panel_infos_5_memAddrStartPh0 (core_u_hub75_streamer_io_panel_infos_5_memAddrStartPh0[15:0]), //i
    .io_panel_infos_5_memAddrStartPh1 (core_u_hub75_streamer_io_panel_infos_5_memAddrStartPh1[15:0]), //i
    .io_panel_infos_5_memAddrColMul   (core_u_hub75_streamer_io_panel_infos_5_memAddrColMul[7:0]   ), //i
    .io_panel_infos_5_memAddrRowMul   (core_u_hub75_streamer_io_panel_infos_5_memAddrRowMul[7:0]   ), //i
    .io_panel_infos_5_xIncr           (_zz_io_hub75_streamer_apb_PRDATA_33[1:0]                    ), //i
    .io_panel_infos_5_yIncr           (_zz_io_hub75_streamer_apb_PRDATA_34[1:0]                    ), //i
    .io_panel_infos_5_zIncr           (_zz_io_hub75_streamer_apb_PRDATA_35[1:0]                    ), //i
    .io_enable                        (core_hub75_streamer_regs_enable                             ), //i
    .io_start                         (core_u_hub75_streamer_io_start                              ), //i
    .io_eof                           (core_u_hub75_streamer_io_eof                                ), //o
    .io_r_dim                         (core_hub75_streamer_regs_r_dim[7:0]                         ), //i
    .io_g_dim                         (core_hub75_streamer_regs_g_dim[7:0]                         ), //i
    .io_b_dim                         (core_hub75_streamer_regs_b_dim[7:0]                         ), //i
    .io_led_mem_rd                    (core_u_hub75_streamer_io_led_mem_rd                         ), //o
    .io_led_mem_rd_addr               (core_u_hub75_streamer_io_led_mem_rd_addr[12:0]              ), //o
    .io_led_mem_rd_data_0             (core_u_led_mem_io_led_mem_b_rd_data_0[11:0]                 ), //i
    .io_led_mem_rd_data_1             (core_u_led_mem_io_led_mem_b_rd_data_1[11:0]                 ), //i
    .io_led_mem_rd_data_2             (core_u_led_mem_io_led_mem_b_rd_data_2[11:0]                 ), //i
    .io_led_mem_rd_data_3             (core_u_led_mem_io_led_mem_b_rd_data_3[11:0]                 ), //i
    .io_led_mem_rd_data_4             (core_u_led_mem_io_led_mem_b_rd_data_4[11:0]                 ), //i
    .io_led_mem_rd_data_5             (core_u_led_mem_io_led_mem_b_rd_data_5[11:0]                 ), //i
    .io_cur_buffer_nr                 (core_hub75_streamer_regs_cur_buffer_nr                      ), //i
    .io_cur_row_nr                    (core_u_hub75_streamer_io_cur_row_nr[4:0]                    ), //o
    .io_cur_bit_nr                    (core_u_hub75_streamer_io_cur_bit_nr[2:0]                    ), //o
    .io_frame_cntr                    (core_u_hub75_streamer_io_frame_cntr[23:0]                   ), //o
    .main_clk                         (main_clk                                                    ), //i
    .main_reset_                      (main_reset_                                                 )  //i
  );
  Hub75Phy core_u_hub75phy (
    .io_rgb_valid       (core_u_hub75_streamer_io_rgb_valid          ), //i
    .io_rgb_ready       (core_u_hub75phy_io_rgb_ready                ), //o
    .io_rgb_payload_sof (core_u_hub75_streamer_io_rgb_payload_sof    ), //i
    .io_rgb_payload_r0  (core_u_hub75_streamer_io_rgb_payload_r0[5:0]), //i
    .io_rgb_payload_g0  (core_u_hub75_streamer_io_rgb_payload_g0[5:0]), //i
    .io_rgb_payload_b0  (core_u_hub75_streamer_io_rgb_payload_b0[5:0]), //i
    .io_rgb_payload_r1  (core_u_hub75_streamer_io_rgb_payload_r1[5:0]), //i
    .io_rgb_payload_g1  (core_u_hub75_streamer_io_rgb_payload_g1[5:0]), //i
    .io_rgb_payload_b1  (core_u_hub75_streamer_io_rgb_payload_b1[5:0]), //i
    .io_hub75_clk       (core_u_hub75phy_io_hub75_clk                ), //o
    .io_hub75_lat       (core_u_hub75phy_io_hub75_lat                ), //o
    .io_hub75_oe_       (core_u_hub75phy_io_hub75_oe_                ), //o
    .io_hub75_row       (core_u_hub75phy_io_hub75_row[4:0]           ), //o
    .io_hub75_r0        (core_u_hub75phy_io_hub75_r0[5:0]            ), //o
    .io_hub75_g0        (core_u_hub75phy_io_hub75_g0[5:0]            ), //o
    .io_hub75_b0        (core_u_hub75phy_io_hub75_b0[5:0]            ), //o
    .io_hub75_r1        (core_u_hub75phy_io_hub75_r1[5:0]            ), //o
    .io_hub75_g1        (core_u_hub75phy_io_hub75_g1[5:0]            ), //o
    .io_hub75_b1        (core_u_hub75phy_io_hub75_b1[5:0]            ), //o
    .main_clk           (main_clk                                    ), //i
    .main_reset_        (main_reset_                                 )  //i
  );
  initial begin
    main_reset_gen_reset_cntr = 16'h0000;
  end

  assign phy_reset_n = 1'b1;
  assign main_clk = osc_src_u_main_clk_clk_out;
  always @(*) begin
    main_reset_gen_reset_unbuffered_ = 1'b1;
    if(when_Cube2Top_l138) begin
      main_reset_gen_reset_unbuffered_ = 1'b0;
    end
  end

  assign _zz_when_Cube2Top_l138[15 : 0] = 16'hffff;
  assign when_Cube2Top_l138 = (main_reset_gen_reset_cntr != _zz_when_Cube2Top_l138);
  assign main_reset_ = main_reset_gen_reset_unbuffered__regNext;
  assign led = core_u_cpu_io_led_red;
  assign core_u_led_mem_io_led_mem_b_wr = 1'b0;
  assign core_u_led_mem_io_led_mem_b_wr_data = 12'h000;
  assign _zz_io_led_mem_apb_PSLVERROR = 1'b0;
  assign _zz_io_led_mem_apb_PSLVERROR_1 = 1'b0;
  always @(*) begin
    core_u_cpu_io_led_mem_apb_PREADY = 1'b1;
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_1) begin
        if(when_BusSlaveFactory_l609) begin
          core_u_cpu_io_led_mem_apb_PREADY = 1'b0;
        end
      end
    end
  end

  always @(*) begin
    core_u_cpu_io_led_mem_apb_PRDATA = 32'h00000000;
    if(when_Apb3SlaveFactory_l81) begin
      core_u_cpu_io_led_mem_apb_PRDATA[11 : 0] = core_u_led_mem_io_led_mem_a_rd_data;
    end
  end

  assign _zz_1 = ((core_u_cpu_io_led_mem_apb_PSEL[0] && core_u_cpu_io_led_mem_apb_PENABLE) && (! core_u_cpu_io_led_mem_apb_PWRITE));
  assign _zz_io_led_mem_apb_PSLVERROR_2 = (((core_u_cpu_io_led_mem_apb_PSEL[0] && core_u_cpu_io_led_mem_apb_PENABLE) && core_u_cpu_io_led_mem_apb_PREADY) && core_u_cpu_io_led_mem_apb_PWRITE);
  assign _zz_io_led_mem_apb_PSLVERROR_3 = (((core_u_cpu_io_led_mem_apb_PSEL[0] && core_u_cpu_io_led_mem_apb_PENABLE) && core_u_cpu_io_led_mem_apb_PREADY) && (! core_u_cpu_io_led_mem_apb_PWRITE));
  assign core_u_cpu_io_led_mem_apb_PSLVERROR = ((_zz_io_led_mem_apb_PSLVERROR_2 && _zz_io_led_mem_apb_PSLVERROR_1) || (_zz_io_led_mem_apb_PSLVERROR_3 && _zz_io_led_mem_apb_PSLVERROR));
  assign core_led_mem_apb_regs_cpu_wr_addr = (_zz_core_led_mem_apb_regs_cpu_wr_addr >>> 2'd2);
  assign core_led_mem_apb_regs_cpu_rd_addr = (_zz_core_led_mem_apb_regs_cpu_rd_addr >>> 2'd2);
  assign core_led_mem_apb_regs_mem_a_wr_data = {{core_led_mem_apb_regs_bus_a_wr_data[23 : 20],core_led_mem_apb_regs_bus_a_wr_data[15 : 12]},core_led_mem_apb_regs_bus_a_wr_data[7 : 4]};
  assign core_led_mem_apb_regs_ram_a_wr_inst_nr = (core_led_mem_apb_regs_cpu_wr_addr >>> 4'd13);
  assign core_led_mem_apb_regs_ram_a_rd_inst_nr = (core_led_mem_apb_regs_cpu_rd_addr >>> 4'd13);
  always @(*) begin
    core_u_led_mem_io_led_mem_a_req = 6'h00;
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_io_led_mem_apb_PSLVERROR_2) begin
        core_u_led_mem_io_led_mem_a_req = _zz_io_led_mem_a_req[5 : 0];
      end
      if(_zz_1) begin
        core_u_led_mem_io_led_mem_a_req = _zz_io_led_mem_a_req_2[5 : 0];
      end
    end
  end

  always @(*) begin
    core_u_led_mem_io_led_mem_a_wr = 1'b0;
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_io_led_mem_apb_PSLVERROR_2) begin
        core_u_led_mem_io_led_mem_a_wr = 1'b1;
      end
      if(_zz_1) begin
        core_u_led_mem_io_led_mem_a_wr = 1'b0;
      end
    end
  end

  always @(*) begin
    core_u_led_mem_io_led_mem_a_addr = core_led_mem_apb_regs_cpu_wr_addr[12 : 0];
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_io_led_mem_apb_PSLVERROR_2) begin
        core_u_led_mem_io_led_mem_a_addr = core_led_mem_apb_regs_cpu_wr_addr[12 : 0];
      end
      if(_zz_1) begin
        core_u_led_mem_io_led_mem_a_addr = core_led_mem_apb_regs_cpu_rd_addr[12 : 0];
      end
    end
  end

  always @(*) begin
    _zz_when_BusSlaveFactory_l609 = 1'b0;
    if(when_Apb3SlaveFactory_l81) begin
      if(_zz_1) begin
        _zz_when_BusSlaveFactory_l609 = 1'b1;
      end
    end
  end

  assign _zz_when_BusSlaveFactory_l609_3 = (_zz_when_BusSlaveFactory_l609_2 == 1'b1);
  always @(*) begin
    _zz_when_BusSlaveFactory_l609_1 = (_zz_when_BusSlaveFactory_l609_2 + _zz_when_BusSlaveFactory_l609);
    if(1'b0) begin
      _zz_when_BusSlaveFactory_l609_1 = 1'b0;
    end
  end

  assign _zz_io_hub75_streamer_apb_PSLVERROR = 1'b0;
  assign _zz_io_hub75_streamer_apb_PSLVERROR_1 = 1'b0;
  assign core_u_cpu_io_hub75_streamer_apb_PREADY = 1'b1;
  always @(*) begin
    core_u_cpu_io_hub75_streamer_apb_PRDATA = 32'h00000000;
    case(core_u_cpu_io_hub75_streamer_apb_PADDR)
      12'h100 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_1;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_2;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_3;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_4;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_5;
      end
      12'h140 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA_6;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_7;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_8;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_9;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_10;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_11;
      end
      12'h180 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA_12;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_13;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_14;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_15;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_16;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_17;
      end
      12'h1c0 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA_18;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_19;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_20;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_21;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_22;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_23;
      end
      12'h200 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA_24;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_25;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_26;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_27;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_28;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_29;
      end
      12'h240 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 0] = _zz_io_hub75_streamer_apb_PRDATA_30;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[3 : 2] = _zz_io_hub75_streamer_apb_PRDATA_31;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[5 : 4] = _zz_io_hub75_streamer_apb_PRDATA_32;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[9 : 8] = _zz_io_hub75_streamer_apb_PRDATA_33;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[11 : 10] = _zz_io_hub75_streamer_apb_PRDATA_34;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[13 : 12] = _zz_io_hub75_streamer_apb_PRDATA_35;
      end
      12'h000 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[0 : 0] = core_hub75_streamer_regs_enable;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[1 : 1] = core_hub75_streamer_regs_start;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[2 : 2] = core_hub75_streamer_regs_auto_restart;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[4 : 4] = core_hub75_streamer_regs_buffer_nr;
      end
      12'h004 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[12 : 8] = core_hub75_streamer_regs_cur_row_nr;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[26 : 24] = core_hub75_streamer_regs_cur_bit_nr;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[31 : 31] = core_hub75_streamer_regs_cur_buffer_nr_reg;
      end
      12'h008 : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[23 : 0] = core_hub75_streamer_regs_frame_cntr;
      end
      12'h00c : begin
        core_u_cpu_io_hub75_streamer_apb_PRDATA[7 : 0] = core_hub75_streamer_regs_r_dim;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[15 : 8] = core_hub75_streamer_regs_g_dim;
        core_u_cpu_io_hub75_streamer_apb_PRDATA[23 : 16] = core_hub75_streamer_regs_b_dim;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_hub75_streamer_apb_PSLVERROR_2 = (((core_u_cpu_io_hub75_streamer_apb_PSEL[0] && core_u_cpu_io_hub75_streamer_apb_PENABLE) && core_u_cpu_io_hub75_streamer_apb_PREADY) && core_u_cpu_io_hub75_streamer_apb_PWRITE);
  assign _zz_io_hub75_streamer_apb_PSLVERROR_3 = (((core_u_cpu_io_hub75_streamer_apb_PSEL[0] && core_u_cpu_io_hub75_streamer_apb_PENABLE) && core_u_cpu_io_hub75_streamer_apb_PREADY) && (! core_u_cpu_io_hub75_streamer_apb_PWRITE));
  assign core_u_cpu_io_hub75_streamer_apb_PSLVERROR = ((_zz_io_hub75_streamer_apb_PSLVERROR_2 && _zz_io_hub75_streamer_apb_PSLVERROR_1) || (_zz_io_hub75_streamer_apb_PSLVERROR_3 && _zz_io_hub75_streamer_apb_PSLVERROR));
  assign core_hub75_streamer_regs_restart = (toplevel_core_u_hub75_streamer_io_eof_regNext && core_hub75_streamer_regs_auto_restart);
  assign core_u_hub75_streamer_io_start = ((core_hub75_streamer_regs_start && (! core_hub75_streamer_regs_start_regNext)) || core_hub75_streamer_regs_restart);
  assign core_hub75_clk = core_u_hub75phy_io_hub75_clk;
  assign core_hub75_lat = core_u_hub75phy_io_hub75_lat;
  assign core_hub75_oe_ = core_u_hub75phy_io_hub75_oe_;
  assign core_hub75_row = core_u_hub75phy_io_hub75_row;
  assign core_hub75_r0 = core_u_hub75phy_io_hub75_r0;
  assign core_hub75_g0 = core_u_hub75phy_io_hub75_g0;
  assign core_hub75_b0 = core_u_hub75phy_io_hub75_b0;
  assign core_hub75_r1 = core_u_hub75phy_io_hub75_r1;
  assign core_hub75_g1 = core_u_hub75phy_io_hub75_g1;
  assign core_hub75_b1 = core_u_hub75phy_io_hub75_b1;
  assign hub75_clk = core_hub75_clk_regNext;
  assign hub75_lat = core_hub75_lat_regNext;
  assign hub75_oe_ = core_hub75_oe__regNext;
  assign hub75_row = core_hub75_row_regNext;
  assign hub75_j1_r0 = _zz_hub75_j1_r0;
  assign hub75_j1_g0 = _zz_hub75_j1_g0;
  assign hub75_j1_b0 = _zz_hub75_j1_b0;
  assign hub75_j1_r1 = _zz_hub75_j1_r1;
  assign hub75_j1_g1 = _zz_hub75_j1_g1;
  assign hub75_j1_b1 = _zz_hub75_j1_b1;
  assign hub75_j2_r0 = _zz_hub75_j2_r0;
  assign hub75_j2_g0 = _zz_hub75_j2_g0;
  assign hub75_j2_b0 = _zz_hub75_j2_b0;
  assign hub75_j2_r1 = _zz_hub75_j2_r1;
  assign hub75_j2_g1 = _zz_hub75_j2_g1;
  assign hub75_j2_b1 = _zz_hub75_j2_b1;
  assign hub75_j3_r0 = 1'b0;
  assign hub75_j3_g0 = 1'b0;
  assign hub75_j3_b0 = 1'b0;
  assign hub75_j3_r1 = 1'b0;
  assign hub75_j3_g1 = 1'b0;
  assign hub75_j3_b1 = 1'b0;
  assign hub75_j4_r0 = _zz_hub75_j4_r0;
  assign hub75_j4_g0 = _zz_hub75_j4_g0;
  assign hub75_j4_b0 = _zz_hub75_j4_b0;
  assign hub75_j4_r1 = _zz_hub75_j4_r1;
  assign hub75_j4_g1 = _zz_hub75_j4_g1;
  assign hub75_j4_b1 = _zz_hub75_j4_b1;
  assign hub75_j5_r0 = _zz_hub75_j5_r0;
  assign hub75_j5_g0 = _zz_hub75_j5_g0;
  assign hub75_j5_b0 = _zz_hub75_j5_b0;
  assign hub75_j5_r1 = _zz_hub75_j5_r1;
  assign hub75_j5_g1 = _zz_hub75_j5_g1;
  assign hub75_j5_b1 = _zz_hub75_j5_b1;
  assign hub75_j6_r0 = _zz_hub75_j6_r0;
  assign hub75_j6_g0 = _zz_hub75_j6_g0;
  assign hub75_j6_b0 = _zz_hub75_j6_b0;
  assign hub75_j6_r1 = _zz_hub75_j6_r1;
  assign hub75_j6_g1 = _zz_hub75_j6_g1;
  assign hub75_j6_b1 = _zz_hub75_j6_b1;
  assign hub75_j7_r0 = _zz_hub75_j7_r0;
  assign hub75_j7_g0 = _zz_hub75_j7_g0;
  assign hub75_j7_b0 = _zz_hub75_j7_b0;
  assign hub75_j7_r1 = _zz_hub75_j7_r1;
  assign hub75_j7_g1 = _zz_hub75_j7_g1;
  assign hub75_j7_b1 = _zz_hub75_j7_b1;
  assign hub75_j8_r0 = 1'b0;
  assign hub75_j8_g0 = 1'b0;
  assign hub75_j8_b0 = 1'b0;
  assign hub75_j8_r1 = 1'b0;
  assign hub75_j8_g1 = 1'b0;
  assign hub75_j8_b1 = 1'b0;
  assign core_led_mem_apb_regs_bus_a_wr_data = core_u_cpu_io_led_mem_apb_PWDATA[23 : 0];
  assign when_Apb3SlaveFactory_l81 = (core_u_cpu_io_led_mem_apb_PADDR < 18'h30000);
  assign when_BusSlaveFactory_l609 = (! _zz_when_BusSlaveFactory_l609_3);
  always @(posedge main_clk) begin
    if(when_Cube2Top_l138) begin
      main_reset_gen_reset_cntr <= (main_reset_gen_reset_cntr + 16'h0001);
    end
  end

  always @(posedge main_clk) begin
    main_reset_gen_reset_unbuffered__regNext <= main_reset_gen_reset_unbuffered_;
  end

  always @(posedge main_clk) begin
    debug_leds_led_counter <= (debug_leds_led_counter + 24'h000001);
    toplevel_core_u_hub75_streamer_io_eof_regNext <= core_u_hub75_streamer_io_eof;
    core_hub75_streamer_regs_start_regNext <= core_hub75_streamer_regs_start;
    core_hub75_streamer_regs_cur_row_nr <= core_u_hub75_streamer_io_cur_row_nr;
    core_hub75_streamer_regs_cur_bit_nr <= core_u_hub75_streamer_io_cur_bit_nr;
    core_hub75_streamer_regs_cur_buffer_nr_reg <= core_hub75_streamer_regs_cur_buffer_nr;
    core_hub75_streamer_regs_frame_cntr <= core_u_hub75_streamer_io_frame_cntr;
    core_hub75_clk_regNext <= core_hub75_clk;
    core_hub75_lat_regNext <= core_hub75_lat;
    core_hub75_oe__regNext <= core_hub75_oe_;
    core_hub75_row_regNext <= core_hub75_row;
    _zz_hub75_j1_r0 <= core_hub75_r0[5];
    _zz_hub75_j1_g0 <= core_hub75_g0[5];
    _zz_hub75_j1_b0 <= core_hub75_b0[5];
    _zz_hub75_j1_r1 <= core_hub75_r1[5];
    _zz_hub75_j1_g1 <= core_hub75_g1[5];
    _zz_hub75_j1_b1 <= core_hub75_b1[5];
    _zz_hub75_j2_r0 <= core_hub75_r0[4];
    _zz_hub75_j2_g0 <= core_hub75_g0[4];
    _zz_hub75_j2_b0 <= core_hub75_b0[4];
    _zz_hub75_j2_r1 <= core_hub75_r1[4];
    _zz_hub75_j2_g1 <= core_hub75_g1[4];
    _zz_hub75_j2_b1 <= core_hub75_b1[4];
    _zz_hub75_j4_r0 <= core_hub75_r0[0];
    _zz_hub75_j4_g0 <= core_hub75_g0[0];
    _zz_hub75_j4_b0 <= core_hub75_b0[0];
    _zz_hub75_j4_r1 <= core_hub75_r1[0];
    _zz_hub75_j4_g1 <= core_hub75_g1[0];
    _zz_hub75_j4_b1 <= core_hub75_b1[0];
    _zz_hub75_j5_r0 <= core_hub75_r0[2];
    _zz_hub75_j5_g0 <= core_hub75_g0[2];
    _zz_hub75_j5_b0 <= core_hub75_b0[2];
    _zz_hub75_j5_r1 <= core_hub75_r1[2];
    _zz_hub75_j5_g1 <= core_hub75_g1[2];
    _zz_hub75_j5_b1 <= core_hub75_b1[2];
    _zz_hub75_j6_r0 <= core_hub75_r0[3];
    _zz_hub75_j6_g0 <= core_hub75_g0[3];
    _zz_hub75_j6_b0 <= core_hub75_b0[3];
    _zz_hub75_j6_r1 <= core_hub75_r1[3];
    _zz_hub75_j6_g1 <= core_hub75_g1[3];
    _zz_hub75_j6_b1 <= core_hub75_b1[3];
    _zz_hub75_j7_r0 <= core_hub75_r0[1];
    _zz_hub75_j7_g0 <= core_hub75_g0[1];
    _zz_hub75_j7_b0 <= core_hub75_b0[1];
    _zz_hub75_j7_r1 <= core_hub75_r1[1];
    _zz_hub75_j7_g1 <= core_hub75_g1[1];
    _zz_hub75_j7_b1 <= core_hub75_b1[1];
  end

  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      _zz_when_BusSlaveFactory_l609_2 <= 1'b0;
      _zz_io_hub75_streamer_apb_PRDATA <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_1 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_2 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_3 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_4 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_5 <= 2'b00;
      _zz_io_hub75_streamer_apb_PRDATA_6 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_7 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_8 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_9 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_10 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_11 <= 2'b00;
      _zz_io_hub75_streamer_apb_PRDATA_12 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_13 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_14 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_15 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_16 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_17 <= 2'b00;
      _zz_io_hub75_streamer_apb_PRDATA_18 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_19 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_20 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_21 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_22 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_23 <= 2'b00;
      _zz_io_hub75_streamer_apb_PRDATA_24 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_25 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_26 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_27 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_28 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_29 <= 2'b00;
      _zz_io_hub75_streamer_apb_PRDATA_30 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_31 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_32 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_33 <= 2'b01;
      _zz_io_hub75_streamer_apb_PRDATA_34 <= 2'b11;
      _zz_io_hub75_streamer_apb_PRDATA_35 <= 2'b00;
      core_hub75_streamer_regs_enable <= 1'b0;
      core_hub75_streamer_regs_start <= 1'b0;
      core_hub75_streamer_regs_auto_restart <= 1'b0;
      core_hub75_streamer_regs_buffer_nr <= 1'b0;
      core_hub75_streamer_regs_r_dim <= 8'hff;
      core_hub75_streamer_regs_g_dim <= 8'hff;
      core_hub75_streamer_regs_b_dim <= 8'hff;
      core_hub75_streamer_regs_cur_buffer_nr <= 1'b0;
    end else begin
      _zz_when_BusSlaveFactory_l609_2 <= _zz_when_BusSlaveFactory_l609_1;
      if(core_u_hub75_streamer_io_eof) begin
        core_hub75_streamer_regs_cur_buffer_nr <= core_hub75_streamer_regs_buffer_nr;
      end
      case(core_u_cpu_io_hub75_streamer_apb_PADDR)
        12'h100 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_1 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_2 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_3 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_4 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_5 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h140 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA_6 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_7 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_8 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_9 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_10 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_11 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h180 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA_12 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_13 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_14 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_15 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_16 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_17 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h1c0 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA_18 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_19 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_20 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_21 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_22 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_23 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h200 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA_24 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_25 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_26 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_27 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_28 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_29 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h240 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            _zz_io_hub75_streamer_apb_PRDATA_30 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1 : 0];
            _zz_io_hub75_streamer_apb_PRDATA_31 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[3 : 2];
            _zz_io_hub75_streamer_apb_PRDATA_32 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[5 : 4];
            _zz_io_hub75_streamer_apb_PRDATA_33 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[9 : 8];
            _zz_io_hub75_streamer_apb_PRDATA_34 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[11 : 10];
            _zz_io_hub75_streamer_apb_PRDATA_35 <= core_u_cpu_io_hub75_streamer_apb_PWDATA[13 : 12];
          end
        end
        12'h000 : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            core_hub75_streamer_regs_enable <= core_u_cpu_io_hub75_streamer_apb_PWDATA[0];
            core_hub75_streamer_regs_start <= core_u_cpu_io_hub75_streamer_apb_PWDATA[1];
            core_hub75_streamer_regs_auto_restart <= core_u_cpu_io_hub75_streamer_apb_PWDATA[2];
            core_hub75_streamer_regs_buffer_nr <= core_u_cpu_io_hub75_streamer_apb_PWDATA[4 : 4];
          end
        end
        12'h00c : begin
          if(_zz_io_hub75_streamer_apb_PSLVERROR_2) begin
            core_hub75_streamer_regs_r_dim <= core_u_cpu_io_hub75_streamer_apb_PWDATA[7 : 0];
            core_hub75_streamer_regs_g_dim <= core_u_cpu_io_hub75_streamer_apb_PWDATA[15 : 8];
            core_hub75_streamer_regs_b_dim <= core_u_cpu_io_hub75_streamer_apb_PWDATA[23 : 16];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Hub75Phy (
  input  wire          io_rgb_valid,
  output reg           io_rgb_ready,
  input  wire          io_rgb_payload_sof,
  input  wire [5:0]    io_rgb_payload_r0,
  input  wire [5:0]    io_rgb_payload_g0,
  input  wire [5:0]    io_rgb_payload_b0,
  input  wire [5:0]    io_rgb_payload_r1,
  input  wire [5:0]    io_rgb_payload_g1,
  input  wire [5:0]    io_rgb_payload_b1,
  output wire          io_hub75_clk,
  output wire          io_hub75_lat,
  output wire          io_hub75_oe_,
  output wire [4:0]    io_hub75_row,
  output reg  [5:0]    io_hub75_r0,
  output reg  [5:0]    io_hub75_g0,
  output reg  [5:0]    io_hub75_b0,
  output reg  [5:0]    io_hub75_r1,
  output reg  [5:0]    io_hub75_g1,
  output reg  [5:0]    io_hub75_b1,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire       [1:0]    _zz_clk_div_cntr_valueNext;
  wire       [0:0]    _zz_clk_div_cntr_valueNext_1;
  wire       [6:0]    _zz_col_cntr_valueNext;
  wire       [0:0]    _zz_col_cntr_valueNext_1;
  wire       [4:0]    _zz_bin_dec_phase_valueNext;
  wire       [0:0]    _zz_bin_dec_phase_valueNext_1;
  wire       [2:0]    _zz_bit_cntr_valueNext;
  wire       [0:0]    _zz_bit_cntr_valueNext_1;
  wire       [4:0]    _zz_row_cntr_valueNext;
  wire       [0:0]    _zz_row_cntr_valueNext_1;
  wire       [7:0]    _zz_bin_dec_phase_max;
  wire       [7:0]    _zz_bin_dec_phase_max_1;
  wire                when_Utils_l560;
  reg                 clk_div_cntr_willIncrement;
  reg                 clk_div_cntr_willClear;
  reg        [1:0]    clk_div_cntr_valueNext;
  reg        [1:0]    clk_div_cntr_value;
  wire                clk_div_cntr_willOverflowIfInc;
  wire                clk_div_cntr_willOverflow;
  reg                 col_cntr_willIncrement;
  reg                 col_cntr_willClear;
  reg        [6:0]    col_cntr_valueNext;
  reg        [6:0]    col_cntr_value;
  wire                col_cntr_willOverflowIfInc;
  wire                col_cntr_willOverflow;
  reg                 bin_dec_phase_willIncrement;
  reg                 bin_dec_phase_willClear;
  reg        [4:0]    bin_dec_phase_valueNext;
  reg        [4:0]    bin_dec_phase_value;
  wire                bin_dec_phase_willOverflowIfInc;
  wire                bin_dec_phase_willOverflow;
  reg                 bit_cntr_willIncrement;
  reg                 bit_cntr_willClear;
  reg        [2:0]    bit_cntr_valueNext;
  reg        [2:0]    bit_cntr_value;
  wire                bit_cntr_willOverflowIfInc;
  wire                bit_cntr_willOverflow;
  reg                 row_cntr_willIncrement;
  reg                 row_cntr_willClear;
  reg        [4:0]    row_cntr_valueNext;
  reg        [4:0]    row_cntr_value;
  wire                row_cntr_willOverflowIfInc;
  wire                row_cntr_willOverflow;
  wire       [4:0]    bin_dec_phase_max;
  wire                when_Hub75Phy_l61;
  wire                col_active_phase;
  wire                need_data;
  wire                need_sof;
  reg                 force_clear_no_data;
  reg                 force_clear_desync;
  wire                when_Hub75Phy_l80;
  wire                when_Hub75Phy_l83;
  wire                when_Hub75Phy_l91;
  reg                 _zz_io_hub75_clk;
  reg                 _zz_io_hub75_oe_;
  reg                 _zz_io_hub75_lat;
  wire                when_Hub75Phy_l104;
  reg                 _zz_io_hub75_r0;
  wire                when_Hub75Phy_l105;
  reg                 _zz_io_hub75_g0;
  wire                when_Hub75Phy_l106;
  reg                 _zz_io_hub75_b0;
  wire                when_Hub75Phy_l107;
  reg                 _zz_io_hub75_r1;
  wire                when_Hub75Phy_l108;
  reg                 _zz_io_hub75_g1;
  wire                when_Hub75Phy_l109;
  reg                 _zz_io_hub75_b1;
  wire                when_Hub75Phy_l104_1;
  reg                 _zz_io_hub75_r0_1;
  wire                when_Hub75Phy_l105_1;
  reg                 _zz_io_hub75_g0_1;
  wire                when_Hub75Phy_l106_1;
  reg                 _zz_io_hub75_b0_1;
  wire                when_Hub75Phy_l107_1;
  reg                 _zz_io_hub75_r1_1;
  wire                when_Hub75Phy_l108_1;
  reg                 _zz_io_hub75_g1_1;
  wire                when_Hub75Phy_l109_1;
  reg                 _zz_io_hub75_b1_1;
  wire                when_Hub75Phy_l104_2;
  reg                 _zz_io_hub75_r0_2;
  wire                when_Hub75Phy_l105_2;
  reg                 _zz_io_hub75_g0_2;
  wire                when_Hub75Phy_l106_2;
  reg                 _zz_io_hub75_b0_2;
  wire                when_Hub75Phy_l107_2;
  reg                 _zz_io_hub75_r1_2;
  wire                when_Hub75Phy_l108_2;
  reg                 _zz_io_hub75_g1_2;
  wire                when_Hub75Phy_l109_2;
  reg                 _zz_io_hub75_b1_2;
  wire                when_Hub75Phy_l104_3;
  reg                 _zz_io_hub75_r0_3;
  wire                when_Hub75Phy_l105_3;
  reg                 _zz_io_hub75_g0_3;
  wire                when_Hub75Phy_l106_3;
  reg                 _zz_io_hub75_b0_3;
  wire                when_Hub75Phy_l107_3;
  reg                 _zz_io_hub75_r1_3;
  wire                when_Hub75Phy_l108_3;
  reg                 _zz_io_hub75_g1_3;
  wire                when_Hub75Phy_l109_3;
  reg                 _zz_io_hub75_b1_3;
  wire                when_Hub75Phy_l104_4;
  reg                 _zz_io_hub75_r0_4;
  wire                when_Hub75Phy_l105_4;
  reg                 _zz_io_hub75_g0_4;
  wire                when_Hub75Phy_l106_4;
  reg                 _zz_io_hub75_b0_4;
  wire                when_Hub75Phy_l107_4;
  reg                 _zz_io_hub75_r1_4;
  wire                when_Hub75Phy_l108_4;
  reg                 _zz_io_hub75_g1_4;
  wire                when_Hub75Phy_l109_4;
  reg                 _zz_io_hub75_b1_4;
  wire                when_Hub75Phy_l104_5;
  reg                 _zz_io_hub75_r0_5;
  wire                when_Hub75Phy_l105_5;
  reg                 _zz_io_hub75_g0_5;
  wire                when_Hub75Phy_l106_5;
  reg                 _zz_io_hub75_b0_5;
  wire                when_Hub75Phy_l107_5;
  reg                 _zz_io_hub75_r1_5;
  wire                when_Hub75Phy_l108_5;
  reg                 _zz_io_hub75_g1_5;
  wire                when_Hub75Phy_l109_5;
  reg                 _zz_io_hub75_b1_5;
  reg        [4:0]    row_cntr_value_regNextWhen;

  assign _zz_clk_div_cntr_valueNext_1 = clk_div_cntr_willIncrement;
  assign _zz_clk_div_cntr_valueNext = {1'd0, _zz_clk_div_cntr_valueNext_1};
  assign _zz_col_cntr_valueNext_1 = col_cntr_willIncrement;
  assign _zz_col_cntr_valueNext = {6'd0, _zz_col_cntr_valueNext_1};
  assign _zz_bin_dec_phase_valueNext_1 = bin_dec_phase_willIncrement;
  assign _zz_bin_dec_phase_valueNext = {4'd0, _zz_bin_dec_phase_valueNext_1};
  assign _zz_bit_cntr_valueNext_1 = bit_cntr_willIncrement;
  assign _zz_bit_cntr_valueNext = {2'd0, _zz_bit_cntr_valueNext_1};
  assign _zz_row_cntr_valueNext_1 = row_cntr_willIncrement;
  assign _zz_row_cntr_valueNext = {4'd0, _zz_row_cntr_valueNext_1};
  assign _zz_bin_dec_phase_max = (_zz_bin_dec_phase_max_1 - 8'h01);
  assign _zz_bin_dec_phase_max_1 = ({7'd0,1'b1} <<< bit_cntr_value);
  assign when_Utils_l560 = 1'b1;
  always @(*) begin
    clk_div_cntr_willIncrement = 1'b0;
    if(when_Utils_l560) begin
      clk_div_cntr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    clk_div_cntr_willClear = 1'b0;
    if(when_Hub75Phy_l91) begin
      clk_div_cntr_willClear = 1'b1;
    end
  end

  assign clk_div_cntr_willOverflowIfInc = (clk_div_cntr_value == 2'b11);
  assign clk_div_cntr_willOverflow = (clk_div_cntr_willOverflowIfInc && clk_div_cntr_willIncrement);
  always @(*) begin
    clk_div_cntr_valueNext = (clk_div_cntr_value + _zz_clk_div_cntr_valueNext);
    if(clk_div_cntr_willClear) begin
      clk_div_cntr_valueNext = 2'b00;
    end
  end

  always @(*) begin
    col_cntr_willIncrement = 1'b0;
    if(clk_div_cntr_willOverflow) begin
      col_cntr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    col_cntr_willClear = 1'b0;
    if(when_Hub75Phy_l91) begin
      col_cntr_willClear = 1'b1;
    end
  end

  assign col_cntr_willOverflowIfInc = (col_cntr_value == 7'h42);
  assign col_cntr_willOverflow = (col_cntr_willOverflowIfInc && col_cntr_willIncrement);
  always @(*) begin
    if(col_cntr_willOverflow) begin
      col_cntr_valueNext = 7'h00;
    end else begin
      col_cntr_valueNext = (col_cntr_value + _zz_col_cntr_valueNext);
    end
    if(col_cntr_willClear) begin
      col_cntr_valueNext = 7'h00;
    end
  end

  always @(*) begin
    bin_dec_phase_willIncrement = 1'b0;
    if(col_cntr_willOverflow) begin
      if(!when_Hub75Phy_l61) begin
        bin_dec_phase_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    bin_dec_phase_willClear = 1'b0;
    if(col_cntr_willOverflow) begin
      if(when_Hub75Phy_l61) begin
        bin_dec_phase_willClear = 1'b1;
      end
    end
    if(when_Hub75Phy_l91) begin
      bin_dec_phase_willClear = 1'b1;
    end
  end

  assign bin_dec_phase_willOverflowIfInc = (bin_dec_phase_value == 5'h1f);
  assign bin_dec_phase_willOverflow = (bin_dec_phase_willOverflowIfInc && bin_dec_phase_willIncrement);
  always @(*) begin
    bin_dec_phase_valueNext = (bin_dec_phase_value + _zz_bin_dec_phase_valueNext);
    if(bin_dec_phase_willClear) begin
      bin_dec_phase_valueNext = 5'h00;
    end
  end

  always @(*) begin
    bit_cntr_willIncrement = 1'b0;
    if(col_cntr_willOverflow) begin
      if(when_Hub75Phy_l61) begin
        bit_cntr_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    bit_cntr_willClear = 1'b0;
    if(when_Hub75Phy_l91) begin
      bit_cntr_willClear = 1'b1;
    end
  end

  assign bit_cntr_willOverflowIfInc = (bit_cntr_value == 3'b100);
  assign bit_cntr_willOverflow = (bit_cntr_willOverflowIfInc && bit_cntr_willIncrement);
  always @(*) begin
    if(bit_cntr_willOverflow) begin
      bit_cntr_valueNext = 3'b000;
    end else begin
      bit_cntr_valueNext = (bit_cntr_value + _zz_bit_cntr_valueNext);
    end
    if(bit_cntr_willClear) begin
      bit_cntr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    row_cntr_willIncrement = 1'b0;
    if(bit_cntr_willOverflow) begin
      row_cntr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    row_cntr_willClear = 1'b0;
    if(when_Hub75Phy_l91) begin
      row_cntr_willClear = 1'b1;
    end
  end

  assign row_cntr_willOverflowIfInc = (row_cntr_value == 5'h1f);
  assign row_cntr_willOverflow = (row_cntr_willOverflowIfInc && row_cntr_willIncrement);
  always @(*) begin
    row_cntr_valueNext = (row_cntr_value + _zz_row_cntr_valueNext);
    if(row_cntr_willClear) begin
      row_cntr_valueNext = 5'h00;
    end
  end

  assign bin_dec_phase_max = _zz_bin_dec_phase_max[4:0];
  assign when_Hub75Phy_l61 = (bin_dec_phase_value == bin_dec_phase_max);
  assign col_active_phase = (col_cntr_value < 7'h40);
  assign need_data = (((bin_dec_phase_value == 5'h00) && col_active_phase) && (clk_div_cntr_value == 2'b00));
  assign need_sof = ((((col_cntr_value == 7'h00) && (row_cntr_value == 5'h00)) && (bit_cntr_value == 3'b000)) && (bin_dec_phase_value == 5'h00));
  always @(*) begin
    force_clear_no_data = 1'b0;
    if(need_data) begin
      if(when_Hub75Phy_l80) begin
        force_clear_no_data = 1'b1;
      end
    end
  end

  always @(*) begin
    force_clear_desync = 1'b0;
    if(need_data) begin
      if(!when_Hub75Phy_l80) begin
        if(when_Hub75Phy_l83) begin
          force_clear_desync = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    io_rgb_ready = 1'b0;
    if(need_data) begin
      if(!when_Hub75Phy_l80) begin
        if(!when_Hub75Phy_l83) begin
          io_rgb_ready = 1'b1;
        end
      end
    end
  end

  assign when_Hub75Phy_l80 = (! io_rgb_valid);
  assign when_Hub75Phy_l83 = (io_rgb_valid && ((io_rgb_payload_sof && (! need_sof)) || ((! io_rgb_payload_sof) && need_sof)));
  assign when_Hub75Phy_l91 = (force_clear_no_data || force_clear_desync);
  assign io_hub75_clk = _zz_io_hub75_clk;
  assign io_hub75_oe_ = _zz_io_hub75_oe_;
  assign io_hub75_lat = _zz_io_hub75_lat;
  assign when_Hub75Phy_l104 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_r0[0] = _zz_io_hub75_r0;
    io_hub75_r0[1] = _zz_io_hub75_r0_1;
    io_hub75_r0[2] = _zz_io_hub75_r0_2;
    io_hub75_r0[3] = _zz_io_hub75_r0_3;
    io_hub75_r0[4] = _zz_io_hub75_r0_4;
    io_hub75_r0[5] = _zz_io_hub75_r0_5;
  end

  assign when_Hub75Phy_l105 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_g0[0] = _zz_io_hub75_g0;
    io_hub75_g0[1] = _zz_io_hub75_g0_1;
    io_hub75_g0[2] = _zz_io_hub75_g0_2;
    io_hub75_g0[3] = _zz_io_hub75_g0_3;
    io_hub75_g0[4] = _zz_io_hub75_g0_4;
    io_hub75_g0[5] = _zz_io_hub75_g0_5;
  end

  assign when_Hub75Phy_l106 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_b0[0] = _zz_io_hub75_b0;
    io_hub75_b0[1] = _zz_io_hub75_b0_1;
    io_hub75_b0[2] = _zz_io_hub75_b0_2;
    io_hub75_b0[3] = _zz_io_hub75_b0_3;
    io_hub75_b0[4] = _zz_io_hub75_b0_4;
    io_hub75_b0[5] = _zz_io_hub75_b0_5;
  end

  assign when_Hub75Phy_l107 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_r1[0] = _zz_io_hub75_r1;
    io_hub75_r1[1] = _zz_io_hub75_r1_1;
    io_hub75_r1[2] = _zz_io_hub75_r1_2;
    io_hub75_r1[3] = _zz_io_hub75_r1_3;
    io_hub75_r1[4] = _zz_io_hub75_r1_4;
    io_hub75_r1[5] = _zz_io_hub75_r1_5;
  end

  assign when_Hub75Phy_l108 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_g1[0] = _zz_io_hub75_g1;
    io_hub75_g1[1] = _zz_io_hub75_g1_1;
    io_hub75_g1[2] = _zz_io_hub75_g1_2;
    io_hub75_g1[3] = _zz_io_hub75_g1_3;
    io_hub75_g1[4] = _zz_io_hub75_g1_4;
    io_hub75_g1[5] = _zz_io_hub75_g1_5;
  end

  assign when_Hub75Phy_l109 = (io_rgb_valid && io_rgb_ready);
  always @(*) begin
    io_hub75_b1[0] = _zz_io_hub75_b1;
    io_hub75_b1[1] = _zz_io_hub75_b1_1;
    io_hub75_b1[2] = _zz_io_hub75_b1_2;
    io_hub75_b1[3] = _zz_io_hub75_b1_3;
    io_hub75_b1[4] = _zz_io_hub75_b1_4;
    io_hub75_b1[5] = _zz_io_hub75_b1_5;
  end

  assign when_Hub75Phy_l104_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l105_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l106_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l107_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l108_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l109_1 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l104_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l105_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l106_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l107_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l108_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l109_2 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l104_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l105_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l106_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l107_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l108_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l109_3 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l104_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l105_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l106_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l107_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l108_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l109_4 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l104_5 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l105_5 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l106_5 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l107_5 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l108_5 = (io_rgb_valid && io_rgb_ready);
  assign when_Hub75Phy_l109_5 = (io_rgb_valid && io_rgb_ready);
  assign io_hub75_row = row_cntr_value_regNextWhen;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      clk_div_cntr_value <= 2'b00;
      col_cntr_value <= 7'h00;
      bin_dec_phase_value <= 5'h00;
      bit_cntr_value <= 3'b000;
      row_cntr_value <= 5'h00;
      _zz_io_hub75_clk <= 1'b0;
      _zz_io_hub75_oe_ <= 1'b1;
      _zz_io_hub75_lat <= 1'b0;
      row_cntr_value_regNextWhen <= 5'h00;
    end else begin
      clk_div_cntr_value <= clk_div_cntr_valueNext;
      col_cntr_value <= col_cntr_valueNext;
      bin_dec_phase_value <= bin_dec_phase_valueNext;
      bit_cntr_value <= bit_cntr_valueNext;
      row_cntr_value <= row_cntr_valueNext;
      _zz_io_hub75_clk <= (((bin_dec_phase_value == 5'h00) && col_active_phase) && (2'b10 <= clk_div_cntr_value));
      _zz_io_hub75_oe_ <= ((bin_dec_phase_value == 5'h00) && (! col_active_phase));
      _zz_io_hub75_lat <= ((bin_dec_phase_value == 5'h00) && (col_cntr_value == 7'h41));
      if(col_cntr_willOverflow) begin
        row_cntr_value_regNextWhen <= row_cntr_value;
      end
    end
  end

  always @(posedge main_clk) begin
    if(when_Hub75Phy_l104) begin
      _zz_io_hub75_r0 <= io_rgb_payload_r0[0];
    end
    if(when_Hub75Phy_l105) begin
      _zz_io_hub75_g0 <= io_rgb_payload_g0[0];
    end
    if(when_Hub75Phy_l106) begin
      _zz_io_hub75_b0 <= io_rgb_payload_b0[0];
    end
    if(when_Hub75Phy_l107) begin
      _zz_io_hub75_r1 <= io_rgb_payload_r1[0];
    end
    if(when_Hub75Phy_l108) begin
      _zz_io_hub75_g1 <= io_rgb_payload_g1[0];
    end
    if(when_Hub75Phy_l109) begin
      _zz_io_hub75_b1 <= io_rgb_payload_b1[0];
    end
    if(when_Hub75Phy_l104_1) begin
      _zz_io_hub75_r0_1 <= io_rgb_payload_r0[1];
    end
    if(when_Hub75Phy_l105_1) begin
      _zz_io_hub75_g0_1 <= io_rgb_payload_g0[1];
    end
    if(when_Hub75Phy_l106_1) begin
      _zz_io_hub75_b0_1 <= io_rgb_payload_b0[1];
    end
    if(when_Hub75Phy_l107_1) begin
      _zz_io_hub75_r1_1 <= io_rgb_payload_r1[1];
    end
    if(when_Hub75Phy_l108_1) begin
      _zz_io_hub75_g1_1 <= io_rgb_payload_g1[1];
    end
    if(when_Hub75Phy_l109_1) begin
      _zz_io_hub75_b1_1 <= io_rgb_payload_b1[1];
    end
    if(when_Hub75Phy_l104_2) begin
      _zz_io_hub75_r0_2 <= io_rgb_payload_r0[2];
    end
    if(when_Hub75Phy_l105_2) begin
      _zz_io_hub75_g0_2 <= io_rgb_payload_g0[2];
    end
    if(when_Hub75Phy_l106_2) begin
      _zz_io_hub75_b0_2 <= io_rgb_payload_b0[2];
    end
    if(when_Hub75Phy_l107_2) begin
      _zz_io_hub75_r1_2 <= io_rgb_payload_r1[2];
    end
    if(when_Hub75Phy_l108_2) begin
      _zz_io_hub75_g1_2 <= io_rgb_payload_g1[2];
    end
    if(when_Hub75Phy_l109_2) begin
      _zz_io_hub75_b1_2 <= io_rgb_payload_b1[2];
    end
    if(when_Hub75Phy_l104_3) begin
      _zz_io_hub75_r0_3 <= io_rgb_payload_r0[3];
    end
    if(when_Hub75Phy_l105_3) begin
      _zz_io_hub75_g0_3 <= io_rgb_payload_g0[3];
    end
    if(when_Hub75Phy_l106_3) begin
      _zz_io_hub75_b0_3 <= io_rgb_payload_b0[3];
    end
    if(when_Hub75Phy_l107_3) begin
      _zz_io_hub75_r1_3 <= io_rgb_payload_r1[3];
    end
    if(when_Hub75Phy_l108_3) begin
      _zz_io_hub75_g1_3 <= io_rgb_payload_g1[3];
    end
    if(when_Hub75Phy_l109_3) begin
      _zz_io_hub75_b1_3 <= io_rgb_payload_b1[3];
    end
    if(when_Hub75Phy_l104_4) begin
      _zz_io_hub75_r0_4 <= io_rgb_payload_r0[4];
    end
    if(when_Hub75Phy_l105_4) begin
      _zz_io_hub75_g0_4 <= io_rgb_payload_g0[4];
    end
    if(when_Hub75Phy_l106_4) begin
      _zz_io_hub75_b0_4 <= io_rgb_payload_b0[4];
    end
    if(when_Hub75Phy_l107_4) begin
      _zz_io_hub75_r1_4 <= io_rgb_payload_r1[4];
    end
    if(when_Hub75Phy_l108_4) begin
      _zz_io_hub75_g1_4 <= io_rgb_payload_g1[4];
    end
    if(when_Hub75Phy_l109_4) begin
      _zz_io_hub75_b1_4 <= io_rgb_payload_b1[4];
    end
    if(when_Hub75Phy_l104_5) begin
      _zz_io_hub75_r0_5 <= io_rgb_payload_r0[5];
    end
    if(when_Hub75Phy_l105_5) begin
      _zz_io_hub75_g0_5 <= io_rgb_payload_g0[5];
    end
    if(when_Hub75Phy_l106_5) begin
      _zz_io_hub75_b0_5 <= io_rgb_payload_b0[5];
    end
    if(when_Hub75Phy_l107_5) begin
      _zz_io_hub75_r1_5 <= io_rgb_payload_r1[5];
    end
    if(when_Hub75Phy_l108_5) begin
      _zz_io_hub75_g1_5 <= io_rgb_payload_g1[5];
    end
    if(when_Hub75Phy_l109_5) begin
      _zz_io_hub75_b1_5 <= io_rgb_payload_b1[5];
    end
  end


endmodule

module Hub75Streamer (
  output wire          io_rgb_valid,
  input  wire          io_rgb_ready,
  output wire          io_rgb_payload_sof,
  output wire [5:0]    io_rgb_payload_r0,
  output wire [5:0]    io_rgb_payload_g0,
  output wire [5:0]    io_rgb_payload_b0,
  output wire [5:0]    io_rgb_payload_r1,
  output wire [5:0]    io_rgb_payload_g1,
  output wire [5:0]    io_rgb_payload_b1,
  input  wire [1:0]    io_panel_infos_0_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_0_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_0_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_0_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_0_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_0_memAddrColMul,
  input  wire [7:0]    io_panel_infos_0_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_0_xIncr,
  input  wire [1:0]    io_panel_infos_0_yIncr,
  input  wire [1:0]    io_panel_infos_0_zIncr,
  input  wire [1:0]    io_panel_infos_1_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_1_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_1_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_1_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_1_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_1_memAddrColMul,
  input  wire [7:0]    io_panel_infos_1_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_1_xIncr,
  input  wire [1:0]    io_panel_infos_1_yIncr,
  input  wire [1:0]    io_panel_infos_1_zIncr,
  input  wire [1:0]    io_panel_infos_2_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_2_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_2_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_2_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_2_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_2_memAddrColMul,
  input  wire [7:0]    io_panel_infos_2_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_2_xIncr,
  input  wire [1:0]    io_panel_infos_2_yIncr,
  input  wire [1:0]    io_panel_infos_2_zIncr,
  input  wire [1:0]    io_panel_infos_3_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_3_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_3_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_3_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_3_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_3_memAddrColMul,
  input  wire [7:0]    io_panel_infos_3_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_3_xIncr,
  input  wire [1:0]    io_panel_infos_3_yIncr,
  input  wire [1:0]    io_panel_infos_3_zIncr,
  input  wire [1:0]    io_panel_infos_4_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_4_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_4_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_4_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_4_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_4_memAddrColMul,
  input  wire [7:0]    io_panel_infos_4_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_4_xIncr,
  input  wire [1:0]    io_panel_infos_4_yIncr,
  input  wire [1:0]    io_panel_infos_4_zIncr,
  input  wire [1:0]    io_panel_infos_5_topLeftXCoord,
  input  wire [1:0]    io_panel_infos_5_topLeftYCoord,
  input  wire [1:0]    io_panel_infos_5_topLeftZCoord,
  input  wire [15:0]   io_panel_infos_5_memAddrStartPh0,
  input  wire [15:0]   io_panel_infos_5_memAddrStartPh1,
  input  wire [7:0]    io_panel_infos_5_memAddrColMul,
  input  wire [7:0]    io_panel_infos_5_memAddrRowMul,
  input  wire [1:0]    io_panel_infos_5_xIncr,
  input  wire [1:0]    io_panel_infos_5_yIncr,
  input  wire [1:0]    io_panel_infos_5_zIncr,
  input  wire          io_enable,
  input  wire          io_start,
  output wire          io_eof,
  input  wire [7:0]    io_r_dim,
  input  wire [7:0]    io_g_dim,
  input  wire [7:0]    io_b_dim,
  output wire          io_led_mem_rd,
  output wire [12:0]   io_led_mem_rd_addr,
  input  wire [11:0]   io_led_mem_rd_data_0,
  input  wire [11:0]   io_led_mem_rd_data_1,
  input  wire [11:0]   io_led_mem_rd_data_2,
  input  wire [11:0]   io_led_mem_rd_data_3,
  input  wire [11:0]   io_led_mem_rd_data_4,
  input  wire [11:0]   io_led_mem_rd_data_5,
  input  wire [0:0]    io_cur_buffer_nr,
  output wire [4:0]    io_cur_row_nr,
  output wire [2:0]    io_cur_bit_nr,
  output wire [23:0]   io_frame_cntr,
  input  wire          main_clk,
  input  wire          main_reset_
);
  localparam FsmState_FetchPhase0 = 1'd0;
  localparam FsmState_FetchPhase1 = 1'd1;

  wire                u_output_fifo_io_flush;
  wire                u_output_fifo_io_push_ready;
  wire                u_output_fifo_io_pop_valid;
  wire                u_output_fifo_io_pop_payload_sof;
  wire       [5:0]    u_output_fifo_io_pop_payload_r0;
  wire       [5:0]    u_output_fifo_io_pop_payload_g0;
  wire       [5:0]    u_output_fifo_io_pop_payload_b0;
  wire       [5:0]    u_output_fifo_io_pop_payload_r1;
  wire       [5:0]    u_output_fifo_io_pop_payload_g1;
  wire       [5:0]    u_output_fifo_io_pop_payload_b1;
  wire       [3:0]    u_output_fifo_io_occupancy;
  wire       [3:0]    u_output_fifo_io_availability;
  wire       [5:0]    _zz_col_cntr_valueNext;
  wire       [0:0]    _zz_col_cntr_valueNext_1;
  wire       [2:0]    _zz_bit_cntr_valueNext;
  wire       [0:0]    _zz_bit_cntr_valueNext_1;
  wire       [4:0]    _zz_row_cntr_valueNext;
  wire       [0:0]    _zz_row_cntr_valueNext_1;
  wire       [23:0]   _zz_frame_cntr_valueNext;
  wire       [0:0]    _zz_frame_cntr_valueNext_1;
  wire       [13:0]   _zz_led_mem_rd_addr_p0;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_1;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_2;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_3;
  wire       [14:0]   _zz_led_mem_rd_addr_p0_4;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_5;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_6;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_7;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_8;
  wire       [6:0]    _zz_led_mem_rd_addr_p0_9;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_10;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_11;
  wire       [11:0]   _zz_led_mem_rd_addr_p0_12;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_13;
  wire       [13:0]   _zz_led_mem_rd_addr_p0_14;
  wire       [12:0]   _zz_io_led_mem_rd_addr;
  wire       [4:0]    _zz__zz_r_vec;
  wire       [4:0]    _zz__zz_g_vec;
  wire       [4:0]    _zz__zz_b_vec;
  wire       [4:0]    _zz__zz_r_vec_1;
  wire       [4:0]    _zz__zz_g_vec_1;
  wire       [4:0]    _zz__zz_b_vec_1;
  wire       [4:0]    _zz__zz_r_vec_2;
  wire       [4:0]    _zz__zz_g_vec_2;
  wire       [4:0]    _zz__zz_b_vec_2;
  wire       [4:0]    _zz__zz_r_vec_3;
  wire       [4:0]    _zz__zz_g_vec_3;
  wire       [4:0]    _zz__zz_b_vec_3;
  wire       [4:0]    _zz__zz_r_vec_4;
  wire       [4:0]    _zz__zz_g_vec_4;
  wire       [4:0]    _zz__zz_b_vec_4;
  wire       [4:0]    _zz__zz_r_vec_5;
  wire       [4:0]    _zz__zz_g_vec_5;
  wire       [4:0]    _zz__zz_b_vec_5;
  wire                output_fifo_wr_valid;
  wire                output_fifo_wr_ready;
  wire                output_fifo_wr_payload_sof;
  reg        [5:0]    output_fifo_wr_payload_r0;
  reg        [5:0]    output_fifo_wr_payload_g0;
  reg        [5:0]    output_fifo_wr_payload_b0;
  reg        [5:0]    output_fifo_wr_payload_r1;
  reg        [5:0]    output_fifo_wr_payload_g1;
  reg        [5:0]    output_fifo_wr_payload_b1;
  wire                output_fifo_rd_valid;
  wire                output_fifo_rd_ready;
  wire                output_fifo_rd_payload_sof;
  wire       [5:0]    output_fifo_rd_payload_r0;
  wire       [5:0]    output_fifo_rd_payload_g0;
  wire       [5:0]    output_fifo_rd_payload_b0;
  wire       [5:0]    output_fifo_rd_payload_r1;
  wire       [5:0]    output_fifo_rd_payload_g1;
  wire       [5:0]    output_fifo_rd_payload_b1;
  wire       [3:0]    output_fifo_availability;
  reg                 col_cntr_willIncrement;
  reg                 col_cntr_willClear;
  reg        [5:0]    col_cntr_valueNext;
  reg        [5:0]    col_cntr_value;
  wire                col_cntr_willOverflowIfInc;
  wire                col_cntr_willOverflow;
  reg                 bit_cntr_willIncrement;
  reg                 bit_cntr_willClear;
  reg        [2:0]    bit_cntr_valueNext;
  reg        [2:0]    bit_cntr_value;
  wire                bit_cntr_willOverflowIfInc;
  wire                bit_cntr_willOverflow;
  reg                 row_cntr_willIncrement;
  reg                 row_cntr_willClear;
  reg        [4:0]    row_cntr_valueNext;
  reg        [4:0]    row_cntr_value;
  wire                row_cntr_willOverflowIfInc;
  wire                row_cntr_willOverflow;
  reg                 frame_cntr_willIncrement;
  wire                frame_cntr_willClear;
  reg        [23:0]   frame_cntr_valueNext;
  reg        [23:0]   frame_cntr_value;
  wire                frame_cntr_willOverflowIfInc;
  wire                frame_cntr_willOverflow;
  reg        [0:0]    cur_state;
  reg                 led_mem_rd_p1;
  reg        [13:0]   led_mem_rd_addr_p1;
  reg                 active;
  wire                when_Hub75Streamer_l69;
  wire                when_Hub75Streamer_l71;
  reg        [0:0]    led_mem_phase_p0;
  wire       [13:0]   led_mem_rd_addr_p0;
  wire                when_Hub75Streamer_l103;
  reg                 led_mem_rd_p2;
  reg        [0:0]    led_mem_phase_p0_delay_1;
  reg        [0:0]    led_mem_phase_p2;
  reg        [2:0]    bit_cntr_value_delay_1;
  reg        [2:0]    bit_cntr_p2;
  reg                 _zz_sof_p2;
  reg                 sof_p2;
  wire       [4:0]    gammaTable_0;
  wire       [4:0]    gammaTable_1;
  wire       [4:0]    gammaTable_2;
  wire       [4:0]    gammaTable_3;
  wire       [4:0]    gammaTable_4;
  wire       [4:0]    gammaTable_5;
  wire       [4:0]    gammaTable_6;
  wire       [4:0]    gammaTable_7;
  wire       [4:0]    gammaTable_8;
  wire       [4:0]    gammaTable_9;
  wire       [4:0]    gammaTable_10;
  wire       [4:0]    gammaTable_11;
  wire       [4:0]    gammaTable_12;
  wire       [4:0]    gammaTable_13;
  wire       [4:0]    gammaTable_14;
  wire       [4:0]    gammaTable_15;
  wire       [4:0]    gammaTable_16;
  wire       [4:0]    gammaTable_17;
  wire       [4:0]    gammaTable_18;
  wire       [4:0]    gammaTable_19;
  wire       [4:0]    gammaTable_20;
  wire       [4:0]    gammaTable_21;
  wire       [4:0]    gammaTable_22;
  wire       [4:0]    gammaTable_23;
  wire       [4:0]    gammaTable_24;
  wire       [4:0]    gammaTable_25;
  wire       [4:0]    gammaTable_26;
  wire       [4:0]    gammaTable_27;
  wire       [4:0]    gammaTable_28;
  wire       [4:0]    gammaTable_29;
  wire       [4:0]    gammaTable_30;
  wire       [4:0]    gammaTable_31;
  reg        [11:0]   r_vec;
  reg        [11:0]   g_vec;
  reg        [11:0]   b_vec;
  wire       [4:0]    led_r_debug_0;
  wire       [4:0]    led_r_debug_1;
  wire       [4:0]    led_r_debug_2;
  wire       [4:0]    led_r_debug_3;
  wire       [4:0]    led_r_debug_4;
  wire       [4:0]    led_r_debug_5;
  wire       [4:0]    led_g_debug_0;
  wire       [4:0]    led_g_debug_1;
  wire       [4:0]    led_g_debug_2;
  wire       [4:0]    led_g_debug_3;
  wire       [4:0]    led_g_debug_4;
  wire       [4:0]    led_g_debug_5;
  wire       [4:0]    led_b_debug_0;
  wire       [4:0]    led_b_debug_1;
  wire       [4:0]    led_b_debug_2;
  wire       [4:0]    led_b_debug_3;
  wire       [4:0]    led_b_debug_4;
  wire       [4:0]    led_b_debug_5;
  wire       [4:0]    _zz_led_r_debug_0;
  wire       [4:0]    _zz_led_g_debug_0;
  wire       [4:0]    _zz_led_b_debug_0;
  wire                _zz_r_vec;
  wire                _zz_g_vec;
  wire                _zz_b_vec;
  wire                when_Hub75Streamer_l196;
  wire       [4:0]    _zz_led_r_debug_1;
  wire       [4:0]    _zz_led_g_debug_1;
  wire       [4:0]    _zz_led_b_debug_1;
  wire                _zz_r_vec_1;
  wire                _zz_g_vec_1;
  wire                _zz_b_vec_1;
  wire                when_Hub75Streamer_l207;
  wire       [4:0]    _zz_led_r_debug_2;
  wire       [4:0]    _zz_led_g_debug_2;
  wire       [4:0]    _zz_led_b_debug_2;
  wire                _zz_r_vec_2;
  wire                _zz_g_vec_2;
  wire                _zz_b_vec_2;
  wire                when_Hub75Streamer_l218;
  wire       [4:0]    _zz_led_r_debug_3;
  wire       [4:0]    _zz_led_g_debug_3;
  wire       [4:0]    _zz_led_b_debug_3;
  wire                _zz_r_vec_3;
  wire                _zz_g_vec_3;
  wire                _zz_b_vec_3;
  wire                when_Hub75Streamer_l229;
  wire       [4:0]    _zz_led_r_debug_4;
  wire       [4:0]    _zz_led_g_debug_4;
  wire       [4:0]    _zz_led_b_debug_4;
  wire                _zz_r_vec_4;
  wire                _zz_g_vec_4;
  wire                _zz_b_vec_4;
  wire                when_Hub75Streamer_l240;
  wire       [4:0]    _zz_led_r_debug_5;
  wire       [4:0]    _zz_led_g_debug_5;
  wire       [4:0]    _zz_led_b_debug_5;
  wire                _zz_r_vec_5;
  wire                _zz_g_vec_5;
  wire                _zz_b_vec_5;
  wire                when_Hub75Streamer_l251;
  reg                 fifo_wr_p3;
  reg                 sof_p3;
  `ifndef SYNTHESIS
  reg [87:0] cur_state_string;
  `endif


  assign _zz_col_cntr_valueNext_1 = col_cntr_willIncrement;
  assign _zz_col_cntr_valueNext = {5'd0, _zz_col_cntr_valueNext_1};
  assign _zz_bit_cntr_valueNext_1 = bit_cntr_willIncrement;
  assign _zz_bit_cntr_valueNext = {2'd0, _zz_bit_cntr_valueNext_1};
  assign _zz_row_cntr_valueNext_1 = row_cntr_willIncrement;
  assign _zz_row_cntr_valueNext = {4'd0, _zz_row_cntr_valueNext_1};
  assign _zz_frame_cntr_valueNext_1 = frame_cntr_willIncrement;
  assign _zz_frame_cntr_valueNext = {23'd0, _zz_frame_cntr_valueNext_1};
  assign _zz_led_mem_rd_addr_p0 = ($signed(_zz_led_mem_rd_addr_p0_1) + $signed(_zz_led_mem_rd_addr_p0_10));
  assign _zz_led_mem_rd_addr_p0_1 = ($signed(_zz_led_mem_rd_addr_p0_2) + $signed(_zz_led_mem_rd_addr_p0_6));
  assign _zz_led_mem_rd_addr_p0_2 = _zz_led_mem_rd_addr_p0_3;
  assign _zz_led_mem_rd_addr_p0_4 = {1'b0,_zz_led_mem_rd_addr_p0_5};
  assign _zz_led_mem_rd_addr_p0_3 = _zz_led_mem_rd_addr_p0_4[13:0];
  assign _zz_led_mem_rd_addr_p0_5 = (io_cur_buffer_nr * 13'h1000);
  assign _zz_led_mem_rd_addr_p0_6 = _zz_led_mem_rd_addr_p0_7;
  assign _zz_led_mem_rd_addr_p0_8 = (_zz_led_mem_rd_addr_p0_9 * 7'h40);
  assign _zz_led_mem_rd_addr_p0_7 = _zz_led_mem_rd_addr_p0_8;
  assign _zz_led_mem_rd_addr_p0_9 = (led_mem_phase_p0 * 6'h20);
  assign _zz_led_mem_rd_addr_p0_10 = _zz_led_mem_rd_addr_p0_11;
  assign _zz_led_mem_rd_addr_p0_12 = (row_cntr_value * 7'h40);
  assign _zz_led_mem_rd_addr_p0_11 = {2'd0, _zz_led_mem_rd_addr_p0_12};
  assign _zz_led_mem_rd_addr_p0_13 = _zz_led_mem_rd_addr_p0_14;
  assign _zz_led_mem_rd_addr_p0_14 = {8'd0, col_cntr_value};
  assign _zz_io_led_mem_rd_addr = led_mem_rd_addr_p1[12:0];
  assign _zz__zz_r_vec = (_zz_led_r_debug_0 >>> bit_cntr_p2);
  assign _zz__zz_g_vec = (_zz_led_g_debug_0 >>> bit_cntr_p2);
  assign _zz__zz_b_vec = (_zz_led_b_debug_0 >>> bit_cntr_p2);
  assign _zz__zz_r_vec_1 = (_zz_led_r_debug_1 >>> bit_cntr_p2);
  assign _zz__zz_g_vec_1 = (_zz_led_g_debug_1 >>> bit_cntr_p2);
  assign _zz__zz_b_vec_1 = (_zz_led_b_debug_1 >>> bit_cntr_p2);
  assign _zz__zz_r_vec_2 = (_zz_led_r_debug_2 >>> bit_cntr_p2);
  assign _zz__zz_g_vec_2 = (_zz_led_g_debug_2 >>> bit_cntr_p2);
  assign _zz__zz_b_vec_2 = (_zz_led_b_debug_2 >>> bit_cntr_p2);
  assign _zz__zz_r_vec_3 = (_zz_led_r_debug_3 >>> bit_cntr_p2);
  assign _zz__zz_g_vec_3 = (_zz_led_g_debug_3 >>> bit_cntr_p2);
  assign _zz__zz_b_vec_3 = (_zz_led_b_debug_3 >>> bit_cntr_p2);
  assign _zz__zz_r_vec_4 = (_zz_led_r_debug_4 >>> bit_cntr_p2);
  assign _zz__zz_g_vec_4 = (_zz_led_g_debug_4 >>> bit_cntr_p2);
  assign _zz__zz_b_vec_4 = (_zz_led_b_debug_4 >>> bit_cntr_p2);
  assign _zz__zz_r_vec_5 = (_zz_led_r_debug_5 >>> bit_cntr_p2);
  assign _zz__zz_g_vec_5 = (_zz_led_g_debug_5 >>> bit_cntr_p2);
  assign _zz__zz_b_vec_5 = (_zz_led_b_debug_5 >>> bit_cntr_p2);
  StreamFifo u_output_fifo (
    .io_push_valid       (output_fifo_wr_valid                ), //i
    .io_push_ready       (u_output_fifo_io_push_ready         ), //o
    .io_push_payload_sof (output_fifo_wr_payload_sof          ), //i
    .io_push_payload_r0  (output_fifo_wr_payload_r0[5:0]      ), //i
    .io_push_payload_g0  (output_fifo_wr_payload_g0[5:0]      ), //i
    .io_push_payload_b0  (output_fifo_wr_payload_b0[5:0]      ), //i
    .io_push_payload_r1  (output_fifo_wr_payload_r1[5:0]      ), //i
    .io_push_payload_g1  (output_fifo_wr_payload_g1[5:0]      ), //i
    .io_push_payload_b1  (output_fifo_wr_payload_b1[5:0]      ), //i
    .io_pop_valid        (u_output_fifo_io_pop_valid          ), //o
    .io_pop_ready        (output_fifo_rd_ready                ), //i
    .io_pop_payload_sof  (u_output_fifo_io_pop_payload_sof    ), //o
    .io_pop_payload_r0   (u_output_fifo_io_pop_payload_r0[5:0]), //o
    .io_pop_payload_g0   (u_output_fifo_io_pop_payload_g0[5:0]), //o
    .io_pop_payload_b0   (u_output_fifo_io_pop_payload_b0[5:0]), //o
    .io_pop_payload_r1   (u_output_fifo_io_pop_payload_r1[5:0]), //o
    .io_pop_payload_g1   (u_output_fifo_io_pop_payload_g1[5:0]), //o
    .io_pop_payload_b1   (u_output_fifo_io_pop_payload_b1[5:0]), //o
    .io_flush            (u_output_fifo_io_flush              ), //i
    .io_occupancy        (u_output_fifo_io_occupancy[3:0]     ), //o
    .io_availability     (u_output_fifo_io_availability[3:0]  ), //o
    .main_clk            (main_clk                            ), //i
    .main_reset_         (main_reset_                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(cur_state)
      FsmState_FetchPhase0 : cur_state_string = "FetchPhase0";
      FsmState_FetchPhase1 : cur_state_string = "FetchPhase1";
      default : cur_state_string = "???????????";
    endcase
  end
  `endif

  always @(*) begin
    col_cntr_willIncrement = 1'b0;
    case(cur_state)
      FsmState_FetchPhase0 : begin
      end
      default : begin
        col_cntr_willIncrement = 1'b1;
      end
    endcase
  end

  always @(*) begin
    col_cntr_willClear = 1'b0;
    if(when_Hub75Streamer_l71) begin
      col_cntr_willClear = 1'b1;
    end
  end

  assign col_cntr_willOverflowIfInc = (col_cntr_value == 6'h3f);
  assign col_cntr_willOverflow = (col_cntr_willOverflowIfInc && col_cntr_willIncrement);
  always @(*) begin
    col_cntr_valueNext = (col_cntr_value + _zz_col_cntr_valueNext);
    if(col_cntr_willClear) begin
      col_cntr_valueNext = 6'h00;
    end
  end

  always @(*) begin
    bit_cntr_willIncrement = 1'b0;
    if(col_cntr_willOverflow) begin
      bit_cntr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    bit_cntr_willClear = 1'b0;
    if(when_Hub75Streamer_l71) begin
      bit_cntr_willClear = 1'b1;
    end
  end

  assign bit_cntr_willOverflowIfInc = (bit_cntr_value == 3'b100);
  assign bit_cntr_willOverflow = (bit_cntr_willOverflowIfInc && bit_cntr_willIncrement);
  always @(*) begin
    if(bit_cntr_willOverflow) begin
      bit_cntr_valueNext = 3'b000;
    end else begin
      bit_cntr_valueNext = (bit_cntr_value + _zz_bit_cntr_valueNext);
    end
    if(bit_cntr_willClear) begin
      bit_cntr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    row_cntr_willIncrement = 1'b0;
    if(bit_cntr_willOverflow) begin
      row_cntr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    row_cntr_willClear = 1'b0;
    if(when_Hub75Streamer_l71) begin
      row_cntr_willClear = 1'b1;
    end
  end

  assign row_cntr_willOverflowIfInc = (row_cntr_value == 5'h1f);
  assign row_cntr_willOverflow = (row_cntr_willOverflowIfInc && row_cntr_willIncrement);
  always @(*) begin
    row_cntr_valueNext = (row_cntr_value + _zz_row_cntr_valueNext);
    if(row_cntr_willClear) begin
      row_cntr_valueNext = 5'h00;
    end
  end

  always @(*) begin
    frame_cntr_willIncrement = 1'b0;
    if(row_cntr_willOverflow) begin
      frame_cntr_willIncrement = 1'b1;
    end
  end

  assign frame_cntr_willClear = 1'b0;
  assign frame_cntr_willOverflowIfInc = (frame_cntr_value == 24'hffffff);
  assign frame_cntr_willOverflow = (frame_cntr_willOverflowIfInc && frame_cntr_willIncrement);
  always @(*) begin
    frame_cntr_valueNext = (frame_cntr_value + _zz_frame_cntr_valueNext);
    if(frame_cntr_willClear) begin
      frame_cntr_valueNext = 24'h000000;
    end
  end

  assign io_cur_row_nr = row_cntr_value;
  assign io_cur_bit_nr = bit_cntr_value;
  assign io_eof = row_cntr_willOverflow;
  assign io_frame_cntr = frame_cntr_value;
  assign when_Hub75Streamer_l69 = (io_eof || (! io_enable));
  assign when_Hub75Streamer_l71 = (! active);
  assign led_mem_rd_addr_p0 = ($signed(_zz_led_mem_rd_addr_p0) + $signed(_zz_led_mem_rd_addr_p0_13));
  always @(*) begin
    led_mem_phase_p0 = 1'b0;
    case(cur_state)
      FsmState_FetchPhase0 : begin
        if(when_Hub75Streamer_l103) begin
          led_mem_phase_p0 = 1'b0;
        end
      end
      default : begin
        led_mem_phase_p0 = 1'b1;
      end
    endcase
  end

  assign when_Hub75Streamer_l103 = (active && (4'b0010 < output_fifo_availability));
  assign io_led_mem_rd = led_mem_rd_p1;
  assign io_led_mem_rd_addr = _zz_io_led_mem_rd_addr;
  assign gammaTable_0 = 5'h00;
  assign gammaTable_1 = 5'h00;
  assign gammaTable_2 = 5'h00;
  assign gammaTable_3 = 5'h00;
  assign gammaTable_4 = 5'h00;
  assign gammaTable_5 = 5'h00;
  assign gammaTable_6 = 5'h00;
  assign gammaTable_7 = 5'h01;
  assign gammaTable_8 = 5'h01;
  assign gammaTable_9 = 5'h02;
  assign gammaTable_10 = 5'h02;
  assign gammaTable_11 = 5'h03;
  assign gammaTable_12 = 5'h03;
  assign gammaTable_13 = 5'h04;
  assign gammaTable_14 = 5'h05;
  assign gammaTable_15 = 5'h06;
  assign gammaTable_16 = 5'h07;
  assign gammaTable_17 = 5'h08;
  assign gammaTable_18 = 5'h09;
  assign gammaTable_19 = 5'h0a;
  assign gammaTable_20 = 5'h0b;
  assign gammaTable_21 = 5'h0d;
  assign gammaTable_22 = 5'h0e;
  assign gammaTable_23 = 5'h10;
  assign gammaTable_24 = 5'h11;
  assign gammaTable_25 = 5'h13;
  assign gammaTable_26 = 5'h15;
  assign gammaTable_27 = 5'h16;
  assign gammaTable_28 = 5'h18;
  assign gammaTable_29 = 5'h1a;
  assign gammaTable_30 = 5'h1c;
  assign gammaTable_31 = 5'h1f;
  assign _zz_led_r_debug_0 = ({io_led_mem_rd_data_0[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_0 = ({io_led_mem_rd_data_0[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_0 = ({io_led_mem_rd_data_0[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_0 = _zz_led_r_debug_0;
  assign led_g_debug_0 = _zz_led_g_debug_0;
  assign led_b_debug_0 = _zz_led_b_debug_0;
  assign _zz_r_vec = _zz__zz_r_vec[0];
  assign _zz_g_vec = _zz__zz_g_vec[0];
  assign _zz_b_vec = _zz__zz_b_vec[0];
  assign when_Hub75Streamer_l196 = (led_mem_phase_p2 == 1'b0);
  assign _zz_led_r_debug_1 = ({io_led_mem_rd_data_1[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_1 = ({io_led_mem_rd_data_1[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_1 = ({io_led_mem_rd_data_1[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_1 = _zz_led_r_debug_1;
  assign led_g_debug_1 = _zz_led_g_debug_1;
  assign led_b_debug_1 = _zz_led_b_debug_1;
  assign _zz_r_vec_1 = _zz__zz_r_vec_1[0];
  assign _zz_g_vec_1 = _zz__zz_g_vec_1[0];
  assign _zz_b_vec_1 = _zz__zz_b_vec_1[0];
  assign when_Hub75Streamer_l207 = (led_mem_phase_p2 == 1'b0);
  assign _zz_led_r_debug_2 = ({io_led_mem_rd_data_2[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_2 = ({io_led_mem_rd_data_2[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_2 = ({io_led_mem_rd_data_2[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_2 = _zz_led_r_debug_2;
  assign led_g_debug_2 = _zz_led_g_debug_2;
  assign led_b_debug_2 = _zz_led_b_debug_2;
  assign _zz_r_vec_2 = _zz__zz_r_vec_2[0];
  assign _zz_g_vec_2 = _zz__zz_g_vec_2[0];
  assign _zz_b_vec_2 = _zz__zz_b_vec_2[0];
  assign when_Hub75Streamer_l218 = (led_mem_phase_p2 == 1'b0);
  assign _zz_led_r_debug_3 = ({io_led_mem_rd_data_3[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_3 = ({io_led_mem_rd_data_3[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_3 = ({io_led_mem_rd_data_3[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_3 = _zz_led_r_debug_3;
  assign led_g_debug_3 = _zz_led_g_debug_3;
  assign led_b_debug_3 = _zz_led_b_debug_3;
  assign _zz_r_vec_3 = _zz__zz_r_vec_3[0];
  assign _zz_g_vec_3 = _zz__zz_g_vec_3[0];
  assign _zz_b_vec_3 = _zz__zz_b_vec_3[0];
  assign when_Hub75Streamer_l229 = (led_mem_phase_p2 == 1'b0);
  assign _zz_led_r_debug_4 = ({io_led_mem_rd_data_4[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_4 = ({io_led_mem_rd_data_4[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_4 = ({io_led_mem_rd_data_4[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_4 = _zz_led_r_debug_4;
  assign led_g_debug_4 = _zz_led_g_debug_4;
  assign led_b_debug_4 = _zz_led_b_debug_4;
  assign _zz_r_vec_4 = _zz__zz_r_vec_4[0];
  assign _zz_g_vec_4 = _zz__zz_g_vec_4[0];
  assign _zz_b_vec_4 = _zz__zz_b_vec_4[0];
  assign when_Hub75Streamer_l240 = (led_mem_phase_p2 == 1'b0);
  assign _zz_led_r_debug_5 = ({io_led_mem_rd_data_5[3 : 0],4'b0000} >>> 2'd3);
  assign _zz_led_g_debug_5 = ({io_led_mem_rd_data_5[7 : 4],4'b0000} >>> 2'd3);
  assign _zz_led_b_debug_5 = ({io_led_mem_rd_data_5[11 : 8],4'b0000} >>> 2'd3);
  assign led_r_debug_5 = _zz_led_r_debug_5;
  assign led_g_debug_5 = _zz_led_g_debug_5;
  assign led_b_debug_5 = _zz_led_b_debug_5;
  assign _zz_r_vec_5 = _zz__zz_r_vec_5[0];
  assign _zz_g_vec_5 = _zz__zz_g_vec_5[0];
  assign _zz_b_vec_5 = _zz__zz_b_vec_5[0];
  assign when_Hub75Streamer_l251 = (led_mem_phase_p2 == 1'b0);
  assign output_fifo_wr_valid = fifo_wr_p3;
  assign output_fifo_wr_payload_sof = sof_p3;
  always @(*) begin
    output_fifo_wr_payload_r0[0] = r_vec[0];
    output_fifo_wr_payload_r0[1] = r_vec[2];
    output_fifo_wr_payload_r0[2] = r_vec[4];
    output_fifo_wr_payload_r0[3] = r_vec[6];
    output_fifo_wr_payload_r0[4] = r_vec[8];
    output_fifo_wr_payload_r0[5] = r_vec[10];
  end

  always @(*) begin
    output_fifo_wr_payload_g0[0] = g_vec[0];
    output_fifo_wr_payload_g0[1] = g_vec[2];
    output_fifo_wr_payload_g0[2] = g_vec[4];
    output_fifo_wr_payload_g0[3] = g_vec[6];
    output_fifo_wr_payload_g0[4] = g_vec[8];
    output_fifo_wr_payload_g0[5] = g_vec[10];
  end

  always @(*) begin
    output_fifo_wr_payload_b0[0] = b_vec[0];
    output_fifo_wr_payload_b0[1] = b_vec[2];
    output_fifo_wr_payload_b0[2] = b_vec[4];
    output_fifo_wr_payload_b0[3] = b_vec[6];
    output_fifo_wr_payload_b0[4] = b_vec[8];
    output_fifo_wr_payload_b0[5] = b_vec[10];
  end

  always @(*) begin
    output_fifo_wr_payload_r1[0] = r_vec[1];
    output_fifo_wr_payload_r1[1] = r_vec[3];
    output_fifo_wr_payload_r1[2] = r_vec[5];
    output_fifo_wr_payload_r1[3] = r_vec[7];
    output_fifo_wr_payload_r1[4] = r_vec[9];
    output_fifo_wr_payload_r1[5] = r_vec[11];
  end

  always @(*) begin
    output_fifo_wr_payload_g1[0] = g_vec[1];
    output_fifo_wr_payload_g1[1] = g_vec[3];
    output_fifo_wr_payload_g1[2] = g_vec[5];
    output_fifo_wr_payload_g1[3] = g_vec[7];
    output_fifo_wr_payload_g1[4] = g_vec[9];
    output_fifo_wr_payload_g1[5] = g_vec[11];
  end

  always @(*) begin
    output_fifo_wr_payload_b1[0] = b_vec[1];
    output_fifo_wr_payload_b1[1] = b_vec[3];
    output_fifo_wr_payload_b1[2] = b_vec[5];
    output_fifo_wr_payload_b1[3] = b_vec[7];
    output_fifo_wr_payload_b1[4] = b_vec[9];
    output_fifo_wr_payload_b1[5] = b_vec[11];
  end

  assign output_fifo_wr_ready = u_output_fifo_io_push_ready;
  assign output_fifo_rd_valid = u_output_fifo_io_pop_valid;
  assign output_fifo_rd_payload_sof = u_output_fifo_io_pop_payload_sof;
  assign output_fifo_rd_payload_r0 = u_output_fifo_io_pop_payload_r0;
  assign output_fifo_rd_payload_g0 = u_output_fifo_io_pop_payload_g0;
  assign output_fifo_rd_payload_b0 = u_output_fifo_io_pop_payload_b0;
  assign output_fifo_rd_payload_r1 = u_output_fifo_io_pop_payload_r1;
  assign output_fifo_rd_payload_g1 = u_output_fifo_io_pop_payload_g1;
  assign output_fifo_rd_payload_b1 = u_output_fifo_io_pop_payload_b1;
  assign output_fifo_availability = u_output_fifo_io_availability;
  assign io_rgb_valid = (output_fifo_rd_valid && ((! output_fifo_rd_payload_sof) || (output_fifo_availability <= 4'b0010)));
  assign io_rgb_payload_sof = output_fifo_rd_payload_sof;
  assign io_rgb_payload_r0 = output_fifo_rd_payload_r0;
  assign io_rgb_payload_g0 = output_fifo_rd_payload_g0;
  assign io_rgb_payload_b0 = output_fifo_rd_payload_b0;
  assign io_rgb_payload_r1 = output_fifo_rd_payload_r1;
  assign io_rgb_payload_g1 = output_fifo_rd_payload_g1;
  assign io_rgb_payload_b1 = output_fifo_rd_payload_b1;
  assign output_fifo_rd_ready = io_rgb_ready;
  assign u_output_fifo_io_flush = 1'b0;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      col_cntr_value <= 6'h00;
      bit_cntr_value <= 3'b000;
      row_cntr_value <= 5'h00;
      frame_cntr_value <= 24'h000000;
      cur_state <= FsmState_FetchPhase0;
      led_mem_rd_p1 <= 1'b0;
      led_mem_rd_addr_p1 <= 14'h0000;
      active <= 1'b0;
      led_mem_rd_p2 <= 1'b0;
      led_mem_phase_p2 <= 1'b0;
      r_vec <= 12'h000;
      g_vec <= 12'h000;
      b_vec <= 12'h000;
      fifo_wr_p3 <= 1'b0;
      sof_p3 <= 1'b0;
    end else begin
      col_cntr_value <= col_cntr_valueNext;
      bit_cntr_value <= bit_cntr_valueNext;
      row_cntr_value <= row_cntr_valueNext;
      frame_cntr_value <= frame_cntr_valueNext;
      if(io_start) begin
        active <= 1'b1;
      end
      if(when_Hub75Streamer_l69) begin
        active <= 1'b0;
      end
      case(cur_state)
        FsmState_FetchPhase0 : begin
          if(when_Hub75Streamer_l103) begin
            led_mem_rd_p1 <= 1'b1;
            led_mem_rd_addr_p1 <= led_mem_rd_addr_p0;
            cur_state <= FsmState_FetchPhase1;
          end else begin
            led_mem_rd_p1 <= 1'b0;
          end
        end
        default : begin
          led_mem_rd_p1 <= 1'b1;
          led_mem_rd_addr_p1 <= led_mem_rd_addr_p0;
          cur_state <= FsmState_FetchPhase0;
        end
      endcase
      led_mem_rd_p2 <= led_mem_rd_p1;
      led_mem_phase_p2 <= led_mem_phase_p0_delay_1;
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l196) begin
          r_vec[0] <= _zz_r_vec;
          g_vec[0] <= _zz_g_vec;
          b_vec[0] <= _zz_b_vec;
        end else begin
          r_vec[1] <= _zz_r_vec;
          g_vec[1] <= _zz_g_vec;
          b_vec[1] <= _zz_b_vec;
        end
      end
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l207) begin
          r_vec[2] <= _zz_r_vec_1;
          g_vec[2] <= _zz_g_vec_1;
          b_vec[2] <= _zz_b_vec_1;
        end else begin
          r_vec[3] <= _zz_r_vec_1;
          g_vec[3] <= _zz_g_vec_1;
          b_vec[3] <= _zz_b_vec_1;
        end
      end
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l218) begin
          r_vec[4] <= _zz_r_vec_2;
          g_vec[4] <= _zz_g_vec_2;
          b_vec[4] <= _zz_b_vec_2;
        end else begin
          r_vec[5] <= _zz_r_vec_2;
          g_vec[5] <= _zz_g_vec_2;
          b_vec[5] <= _zz_b_vec_2;
        end
      end
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l229) begin
          r_vec[6] <= _zz_r_vec_3;
          g_vec[6] <= _zz_g_vec_3;
          b_vec[6] <= _zz_b_vec_3;
        end else begin
          r_vec[7] <= _zz_r_vec_3;
          g_vec[7] <= _zz_g_vec_3;
          b_vec[7] <= _zz_b_vec_3;
        end
      end
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l240) begin
          r_vec[8] <= _zz_r_vec_4;
          g_vec[8] <= _zz_g_vec_4;
          b_vec[8] <= _zz_b_vec_4;
        end else begin
          r_vec[9] <= _zz_r_vec_4;
          g_vec[9] <= _zz_g_vec_4;
          b_vec[9] <= _zz_b_vec_4;
        end
      end
      if(led_mem_rd_p2) begin
        if(when_Hub75Streamer_l251) begin
          r_vec[10] <= _zz_r_vec_5;
          g_vec[10] <= _zz_g_vec_5;
          b_vec[10] <= _zz_b_vec_5;
        end else begin
          r_vec[11] <= _zz_r_vec_5;
          g_vec[11] <= _zz_g_vec_5;
          b_vec[11] <= _zz_b_vec_5;
        end
      end
      fifo_wr_p3 <= (led_mem_rd_p2 && (led_mem_phase_p2 == 1'b1));
      sof_p3 <= sof_p2;
    end
  end

  always @(posedge main_clk) begin
    led_mem_phase_p0_delay_1 <= led_mem_phase_p0;
    bit_cntr_value_delay_1 <= bit_cntr_value;
    bit_cntr_p2 <= bit_cntr_value_delay_1;
    _zz_sof_p2 <= (((col_cntr_value == 6'h00) && (row_cntr_value == 5'h00)) && (bit_cntr_value == 3'b000));
    sof_p2 <= _zz_sof_p2;
  end


endmodule

module LedMem (
  input  wire [5:0]    io_led_mem_a_req,
  input  wire [12:0]   io_led_mem_a_addr,
  input  wire          io_led_mem_a_wr,
  input  wire [11:0]   io_led_mem_a_wr_data,
  output wire [11:0]   io_led_mem_a_rd_data,
  input  wire          io_led_mem_b_req,
  input  wire [12:0]   io_led_mem_b_addr,
  input  wire          io_led_mem_b_wr,
  input  wire [11:0]   io_led_mem_b_wr_data,
  output wire [11:0]   io_led_mem_b_rd_data_0,
  output wire [11:0]   io_led_mem_b_rd_data_1,
  output wire [11:0]   io_led_mem_b_rd_data_2,
  output wire [11:0]   io_led_mem_b_rd_data_3,
  output wire [11:0]   io_led_mem_b_rd_data_4,
  output wire [11:0]   io_led_mem_b_rd_data_5,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [11:0]   _zz__zz_1_port0;
  reg        [11:0]   _zz__zz_1_port1;
  reg        [11:0]   _zz__zz_4_port0;
  reg        [11:0]   _zz__zz_4_port1;
  reg        [11:0]   _zz__zz_7_port0;
  reg        [11:0]   _zz__zz_7_port1;
  reg        [11:0]   _zz__zz_10_port0;
  reg        [11:0]   _zz__zz_10_port1;
  reg        [11:0]   _zz__zz_13_port0;
  reg        [11:0]   _zz__zz_13_port1;
  reg        [11:0]   _zz__zz_16_port0;
  reg        [11:0]   _zz__zz_16_port1;
  wire       [11:0]   led_mem_a_rd_data_raw_0;
  wire       [11:0]   led_mem_a_rd_data_raw_1;
  wire       [11:0]   led_mem_a_rd_data_raw_2;
  wire       [11:0]   led_mem_a_rd_data_raw_3;
  wire       [11:0]   led_mem_a_rd_data_raw_4;
  wire       [11:0]   led_mem_a_rd_data_raw_5;
  wire       [11:0]   led_mem_b_rd_data_raw_0;
  wire       [11:0]   led_mem_b_rd_data_raw_1;
  wire       [11:0]   led_mem_b_rd_data_raw_2;
  wire       [11:0]   led_mem_b_rd_data_raw_3;
  wire       [11:0]   led_mem_b_rd_data_raw_4;
  wire       [11:0]   led_mem_b_rd_data_raw_5;
  wire                _zz_led_mem_a_rd_data_raw_0;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_0_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_0;
  wire                _zz_led_mem_a_rd_data_raw_1;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_1_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_1;
  wire                _zz_led_mem_a_rd_data_raw_2;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_2_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_2;
  wire                _zz_led_mem_a_rd_data_raw_3;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_3_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_3;
  wire                _zz_led_mem_a_rd_data_raw_4;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_4_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_4;
  wire                _zz_led_mem_a_rd_data_raw_5;
  wire       [11:0]   _zz_led_mem_a_rd_data_raw_5_1;
  wire       [11:0]   _zz_led_mem_b_rd_data_raw_5;
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_1 [0:8191];
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_4 [0:8191];
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_7 [0:8191];
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_10 [0:8191];
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_13 [0:8191];
  (* ramstyle = "no_rw_check" *) reg [11:0] _zz_16 [0:8191];

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_0) begin
      _zz__zz_1_port0 <= _zz_1[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_0 && io_led_mem_a_wr ) begin
      _zz_1[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_0_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_1_port1 <= _zz_1[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_1[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_0;
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_1) begin
      _zz__zz_4_port0 <= _zz_4[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_1 && io_led_mem_a_wr ) begin
      _zz_4[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_1_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_4_port1 <= _zz_4[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_4[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_1;
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_2) begin
      _zz__zz_7_port0 <= _zz_7[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_2 && io_led_mem_a_wr ) begin
      _zz_7[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_2_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_7_port1 <= _zz_7[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_7[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_2;
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_3) begin
      _zz__zz_10_port0 <= _zz_10[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_3 && io_led_mem_a_wr ) begin
      _zz_10[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_3_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_10_port1 <= _zz_10[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_10[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_3;
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_4) begin
      _zz__zz_13_port0 <= _zz_13[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_4 && io_led_mem_a_wr ) begin
      _zz_13[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_4_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_13_port1 <= _zz_13[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_13[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_4;
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_5) begin
      _zz__zz_16_port0 <= _zz_16[io_led_mem_a_addr];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_led_mem_a_rd_data_raw_5 && io_led_mem_a_wr ) begin
      _zz_16[io_led_mem_a_addr] <= _zz_led_mem_a_rd_data_raw_5_1;
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req) begin
      _zz__zz_16_port1 <= _zz_16[io_led_mem_b_addr];
    end
  end

  always @(posedge main_clk) begin
    if(io_led_mem_b_req && io_led_mem_b_wr ) begin
      _zz_16[io_led_mem_b_addr] <= _zz_led_mem_b_rd_data_raw_5;
    end
  end

  assign io_led_mem_a_rd_data = led_mem_a_rd_data_raw_0;
  assign _zz_led_mem_a_rd_data_raw_0 = io_led_mem_a_req[0];
  assign _zz_led_mem_a_rd_data_raw_0_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_0 = _zz__zz_1_port0;
  assign _zz_led_mem_b_rd_data_raw_0 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_0 = _zz__zz_1_port1;
  assign io_led_mem_b_rd_data_0 = led_mem_b_rd_data_raw_0;
  assign _zz_led_mem_a_rd_data_raw_1 = io_led_mem_a_req[1];
  assign _zz_led_mem_a_rd_data_raw_1_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_1 = _zz__zz_4_port0;
  assign _zz_led_mem_b_rd_data_raw_1 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_1 = _zz__zz_4_port1;
  assign io_led_mem_b_rd_data_1 = led_mem_b_rd_data_raw_1;
  assign _zz_led_mem_a_rd_data_raw_2 = io_led_mem_a_req[2];
  assign _zz_led_mem_a_rd_data_raw_2_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_2 = _zz__zz_7_port0;
  assign _zz_led_mem_b_rd_data_raw_2 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_2 = _zz__zz_7_port1;
  assign io_led_mem_b_rd_data_2 = led_mem_b_rd_data_raw_2;
  assign _zz_led_mem_a_rd_data_raw_3 = io_led_mem_a_req[3];
  assign _zz_led_mem_a_rd_data_raw_3_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_3 = _zz__zz_10_port0;
  assign _zz_led_mem_b_rd_data_raw_3 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_3 = _zz__zz_10_port1;
  assign io_led_mem_b_rd_data_3 = led_mem_b_rd_data_raw_3;
  assign _zz_led_mem_a_rd_data_raw_4 = io_led_mem_a_req[4];
  assign _zz_led_mem_a_rd_data_raw_4_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_4 = _zz__zz_13_port0;
  assign _zz_led_mem_b_rd_data_raw_4 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_4 = _zz__zz_13_port1;
  assign io_led_mem_b_rd_data_4 = led_mem_b_rd_data_raw_4;
  assign _zz_led_mem_a_rd_data_raw_5 = io_led_mem_a_req[5];
  assign _zz_led_mem_a_rd_data_raw_5_1 = io_led_mem_a_wr_data;
  assign led_mem_a_rd_data_raw_5 = _zz__zz_16_port0;
  assign _zz_led_mem_b_rd_data_raw_5 = io_led_mem_b_wr_data;
  assign led_mem_b_rd_data_raw_5 = _zz__zz_16_port1;
  assign io_led_mem_b_rd_data_5 = led_mem_b_rd_data_raw_5;

endmodule

module CpuTop (
  output wire          io_led_red,
  output wire          io_led_green,
  output wire          io_led_blue,
  output wire [17:0]   io_led_mem_apb_PADDR,
  output wire [0:0]    io_led_mem_apb_PSEL,
  output wire          io_led_mem_apb_PENABLE,
  input  wire          io_led_mem_apb_PREADY,
  output wire          io_led_mem_apb_PWRITE,
  output wire [31:0]   io_led_mem_apb_PWDATA,
  input  wire [31:0]   io_led_mem_apb_PRDATA,
  input  wire          io_led_mem_apb_PSLVERROR,
  output wire [11:0]   io_hub75_streamer_apb_PADDR,
  output wire [0:0]    io_hub75_streamer_apb_PSEL,
  output wire          io_hub75_streamer_apb_PENABLE,
  input  wire          io_hub75_streamer_apb_PREADY,
  output wire          io_hub75_streamer_apb_PWRITE,
  output wire [31:0]   io_hub75_streamer_apb_PWDATA,
  input  wire [31:0]   io_hub75_streamer_apb_PRDATA,
  input  wire          io_hub75_streamer_apb_PSLVERROR,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire                u_cpu_io_externalInterrupt;
  wire       [7:0]    u_timer_io_apb_PADDR;
  wire       [3:0]    u_led_ctrl_io_apb_PADDR;
  reg        [2:0]    u_led_ctrl_io_gpio_read;
  wire       [19:0]   u_cpu_io_periphApb_PADDR;
  wire       [0:0]    u_cpu_io_periphApb_PSEL;
  wire                u_cpu_io_periphApb_PENABLE;
  wire                u_cpu_io_periphApb_PWRITE;
  wire       [31:0]   u_cpu_io_periphApb_PWDATA;
  wire                u_timer_io_apb_PREADY;
  wire       [31:0]   u_timer_io_apb_PRDATA;
  wire                u_timer_io_apb_PSLVERROR;
  wire                u_timer_io_interrupt;
  wire                u_led_ctrl_io_apb_PREADY;
  wire       [31:0]   u_led_ctrl_io_apb_PRDATA;
  wire                u_led_ctrl_io_apb_PSLVERROR;
  wire       [2:0]    u_led_ctrl_io_gpio_write;
  wire       [2:0]    u_led_ctrl_io_gpio_writeEnable;
  wire       [2:0]    u_led_ctrl_io_value;
  wire                io_periphApb_decoder_io_input_PREADY;
  wire       [31:0]   io_periphApb_decoder_io_input_PRDATA;
  wire                io_periphApb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_periphApb_decoder_io_output_PADDR;
  wire       [3:0]    io_periphApb_decoder_io_output_PSEL;
  wire                io_periphApb_decoder_io_output_PENABLE;
  wire                io_periphApb_decoder_io_output_PWRITE;
  wire       [31:0]   io_periphApb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;

  CpuComplex u_cpu (
    .io_periphApb_PADDR     (u_cpu_io_periphApb_PADDR[19:0]            ), //o
    .io_periphApb_PSEL      (u_cpu_io_periphApb_PSEL                   ), //o
    .io_periphApb_PENABLE   (u_cpu_io_periphApb_PENABLE                ), //o
    .io_periphApb_PREADY    (io_periphApb_decoder_io_input_PREADY      ), //i
    .io_periphApb_PWRITE    (u_cpu_io_periphApb_PWRITE                 ), //o
    .io_periphApb_PWDATA    (u_cpu_io_periphApb_PWDATA[31:0]           ), //o
    .io_periphApb_PRDATA    (io_periphApb_decoder_io_input_PRDATA[31:0]), //i
    .io_periphApb_PSLVERROR (io_periphApb_decoder_io_input_PSLVERROR   ), //i
    .io_externalInterrupt   (u_cpu_io_externalInterrupt                ), //i
    .io_timerInterrupt      (u_timer_io_interrupt                      ), //i
    .main_clk               (main_clk                                  ), //i
    .main_reset_            (main_reset_                               )  //i
  );
  CCApb3Timer u_timer (
    .io_apb_PADDR     (u_timer_io_apb_PADDR[7:0]             ), //i
    .io_apb_PSEL      (apb3Router_1_io_outputs_0_PSEL        ), //i
    .io_apb_PENABLE   (apb3Router_1_io_outputs_0_PENABLE     ), //i
    .io_apb_PREADY    (u_timer_io_apb_PREADY                 ), //o
    .io_apb_PWRITE    (apb3Router_1_io_outputs_0_PWRITE      ), //i
    .io_apb_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]), //i
    .io_apb_PRDATA    (u_timer_io_apb_PRDATA[31:0]           ), //o
    .io_apb_PSLVERROR (u_timer_io_apb_PSLVERROR              ), //o
    .io_interrupt     (u_timer_io_interrupt                  ), //o
    .main_clk         (main_clk                              ), //i
    .main_reset_      (main_reset_                           )  //i
  );
  Apb3Gpio u_led_ctrl (
    .io_apb_PADDR        (u_led_ctrl_io_apb_PADDR[3:0]          ), //i
    .io_apb_PSEL         (apb3Router_1_io_outputs_1_PSEL        ), //i
    .io_apb_PENABLE      (apb3Router_1_io_outputs_1_PENABLE     ), //i
    .io_apb_PREADY       (u_led_ctrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE       (apb3Router_1_io_outputs_1_PWRITE      ), //i
    .io_apb_PWDATA       (apb3Router_1_io_outputs_1_PWDATA[31:0]), //i
    .io_apb_PRDATA       (u_led_ctrl_io_apb_PRDATA[31:0]        ), //o
    .io_apb_PSLVERROR    (u_led_ctrl_io_apb_PSLVERROR           ), //o
    .io_gpio_read        (u_led_ctrl_io_gpio_read[2:0]          ), //i
    .io_gpio_write       (u_led_ctrl_io_gpio_write[2:0]         ), //o
    .io_gpio_writeEnable (u_led_ctrl_io_gpio_writeEnable[2:0]   ), //o
    .io_value            (u_led_ctrl_io_value[2:0]              ), //o
    .main_clk            (main_clk                              ), //i
    .main_reset_         (main_reset_                           )  //i
  );
  Apb3Decoder io_periphApb_decoder (
    .io_input_PADDR      (u_cpu_io_periphApb_PADDR[19:0]             ), //i
    .io_input_PSEL       (u_cpu_io_periphApb_PSEL                    ), //i
    .io_input_PENABLE    (u_cpu_io_periphApb_PENABLE                 ), //i
    .io_input_PREADY     (io_periphApb_decoder_io_input_PREADY       ), //o
    .io_input_PWRITE     (u_cpu_io_periphApb_PWRITE                  ), //i
    .io_input_PWDATA     (u_cpu_io_periphApb_PWDATA[31:0]            ), //i
    .io_input_PRDATA     (io_periphApb_decoder_io_input_PRDATA[31:0] ), //o
    .io_input_PSLVERROR  (io_periphApb_decoder_io_input_PSLVERROR    ), //o
    .io_output_PADDR     (io_periphApb_decoder_io_output_PADDR[19:0] ), //o
    .io_output_PSEL      (io_periphApb_decoder_io_output_PSEL[3:0]   ), //o
    .io_output_PENABLE   (io_periphApb_decoder_io_output_PENABLE     ), //o
    .io_output_PREADY    (apb3Router_1_io_input_PREADY               ), //i
    .io_output_PWRITE    (io_periphApb_decoder_io_output_PWRITE      ), //o
    .io_output_PWDATA    (io_periphApb_decoder_io_output_PWDATA[31:0]), //o
    .io_output_PRDATA    (apb3Router_1_io_input_PRDATA[31:0]         ), //i
    .io_output_PSLVERROR (apb3Router_1_io_input_PSLVERROR            )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR         (io_periphApb_decoder_io_output_PADDR[19:0] ), //i
    .io_input_PSEL          (io_periphApb_decoder_io_output_PSEL[3:0]   ), //i
    .io_input_PENABLE       (io_periphApb_decoder_io_output_PENABLE     ), //i
    .io_input_PREADY        (apb3Router_1_io_input_PREADY               ), //o
    .io_input_PWRITE        (io_periphApb_decoder_io_output_PWRITE      ), //i
    .io_input_PWDATA        (io_periphApb_decoder_io_output_PWDATA[31:0]), //i
    .io_input_PRDATA        (apb3Router_1_io_input_PRDATA[31:0]         ), //o
    .io_input_PSLVERROR     (apb3Router_1_io_input_PSLVERROR            ), //o
    .io_outputs_0_PADDR     (apb3Router_1_io_outputs_0_PADDR[19:0]      ), //o
    .io_outputs_0_PSEL      (apb3Router_1_io_outputs_0_PSEL             ), //o
    .io_outputs_0_PENABLE   (apb3Router_1_io_outputs_0_PENABLE          ), //o
    .io_outputs_0_PREADY    (u_timer_io_apb_PREADY                      ), //i
    .io_outputs_0_PWRITE    (apb3Router_1_io_outputs_0_PWRITE           ), //o
    .io_outputs_0_PWDATA    (apb3Router_1_io_outputs_0_PWDATA[31:0]     ), //o
    .io_outputs_0_PRDATA    (u_timer_io_apb_PRDATA[31:0]                ), //i
    .io_outputs_0_PSLVERROR (u_timer_io_apb_PSLVERROR                   ), //i
    .io_outputs_1_PADDR     (apb3Router_1_io_outputs_1_PADDR[19:0]      ), //o
    .io_outputs_1_PSEL      (apb3Router_1_io_outputs_1_PSEL             ), //o
    .io_outputs_1_PENABLE   (apb3Router_1_io_outputs_1_PENABLE          ), //o
    .io_outputs_1_PREADY    (u_led_ctrl_io_apb_PREADY                   ), //i
    .io_outputs_1_PWRITE    (apb3Router_1_io_outputs_1_PWRITE           ), //o
    .io_outputs_1_PWDATA    (apb3Router_1_io_outputs_1_PWDATA[31:0]     ), //o
    .io_outputs_1_PRDATA    (u_led_ctrl_io_apb_PRDATA[31:0]             ), //i
    .io_outputs_1_PSLVERROR (u_led_ctrl_io_apb_PSLVERROR                ), //i
    .io_outputs_2_PADDR     (apb3Router_1_io_outputs_2_PADDR[19:0]      ), //o
    .io_outputs_2_PSEL      (apb3Router_1_io_outputs_2_PSEL             ), //o
    .io_outputs_2_PENABLE   (apb3Router_1_io_outputs_2_PENABLE          ), //o
    .io_outputs_2_PREADY    (io_led_mem_apb_PREADY                      ), //i
    .io_outputs_2_PWRITE    (apb3Router_1_io_outputs_2_PWRITE           ), //o
    .io_outputs_2_PWDATA    (apb3Router_1_io_outputs_2_PWDATA[31:0]     ), //o
    .io_outputs_2_PRDATA    (io_led_mem_apb_PRDATA[31:0]                ), //i
    .io_outputs_2_PSLVERROR (io_led_mem_apb_PSLVERROR                   ), //i
    .io_outputs_3_PADDR     (apb3Router_1_io_outputs_3_PADDR[19:0]      ), //o
    .io_outputs_3_PSEL      (apb3Router_1_io_outputs_3_PSEL             ), //o
    .io_outputs_3_PENABLE   (apb3Router_1_io_outputs_3_PENABLE          ), //o
    .io_outputs_3_PREADY    (io_hub75_streamer_apb_PREADY               ), //i
    .io_outputs_3_PWRITE    (apb3Router_1_io_outputs_3_PWRITE           ), //o
    .io_outputs_3_PWDATA    (apb3Router_1_io_outputs_3_PWDATA[31:0]     ), //o
    .io_outputs_3_PRDATA    (io_hub75_streamer_apb_PRDATA[31:0]         ), //i
    .io_outputs_3_PSLVERROR (io_hub75_streamer_apb_PSLVERROR            ), //i
    .main_clk               (main_clk                                   ), //i
    .main_reset_            (main_reset_                                )  //i
  );
  assign u_cpu_io_externalInterrupt = 1'b0;
  assign io_led_red = u_led_ctrl_io_gpio_write[0];
  assign io_led_green = u_led_ctrl_io_gpio_write[1];
  assign io_led_blue = u_led_ctrl_io_gpio_write[2];
  always @(*) begin
    u_led_ctrl_io_gpio_read[0] = io_led_red;
    u_led_ctrl_io_gpio_read[1] = io_led_green;
    u_led_ctrl_io_gpio_read[2] = io_led_blue;
  end

  assign u_timer_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[7:0];
  assign u_led_ctrl_io_apb_PADDR = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign io_led_mem_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[17:0];
  assign io_led_mem_apb_PSEL = apb3Router_1_io_outputs_2_PSEL;
  assign io_led_mem_apb_PENABLE = apb3Router_1_io_outputs_2_PENABLE;
  assign io_led_mem_apb_PWRITE = apb3Router_1_io_outputs_2_PWRITE;
  assign io_led_mem_apb_PWDATA = apb3Router_1_io_outputs_2_PWDATA;
  assign io_hub75_streamer_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[11:0];
  assign io_hub75_streamer_apb_PSEL = apb3Router_1_io_outputs_3_PSEL;
  assign io_hub75_streamer_apb_PENABLE = apb3Router_1_io_outputs_3_PENABLE;
  assign io_hub75_streamer_apb_PWRITE = apb3Router_1_io_outputs_3_PWRITE;
  assign io_hub75_streamer_apb_PWDATA = apb3Router_1_io_outputs_3_PWDATA;

endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_sof,
  input  wire [5:0]    io_push_payload_r0,
  input  wire [5:0]    io_push_payload_g0,
  input  wire [5:0]    io_push_payload_b0,
  input  wire [5:0]    io_push_payload_r1,
  input  wire [5:0]    io_push_payload_g1,
  input  wire [5:0]    io_push_payload_b1,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_sof,
  output wire [5:0]    io_pop_payload_r0,
  output wire [5:0]    io_pop_payload_g0,
  output wire [5:0]    io_pop_payload_b0,
  output wire [5:0]    io_pop_payload_r1,
  output wire [5:0]    io_pop_payload_g1,
  output wire [5:0]    io_pop_payload_b1,
  input  wire          io_flush,
  output wire [3:0]    io_occupancy,
  output wire [3:0]    io_availability,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [36:0]   _zz_logic_ram_port1;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_1;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_2;
  wire       [3:0]    _zz_logic_ptr_notPow2_counter_3;
  wire       [0:0]    _zz_logic_ptr_notPow2_counter_4;
  wire       [36:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [3:0]    logic_ptr_push;
  reg        [3:0]    logic_ptr_pop;
  wire       [3:0]    logic_ptr_occupancy;
  wire       [3:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                when_Stream_l1240;
  wire                when_Stream_l1244;
  reg        [3:0]    logic_ptr_notPow2_counter;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data_sof;
  wire       [5:0]    logic_push_onRam_write_payload_data_r0;
  wire       [5:0]    logic_push_onRam_write_payload_data_g0;
  wire       [5:0]    logic_push_onRam_write_payload_data_b0;
  wire       [5:0]    logic_push_onRam_write_payload_data_r1;
  wire       [5:0]    logic_push_onRam_write_payload_data_g1;
  wire       [5:0]    logic_push_onRam_write_payload_data_b1;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [3:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l369;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire                logic_pop_sync_readPort_rsp_sof;
  wire       [5:0]    logic_pop_sync_readPort_rsp_r0;
  wire       [5:0]    logic_pop_sync_readPort_rsp_g0;
  wire       [5:0]    logic_pop_sync_readPort_rsp_b0;
  wire       [5:0]    logic_pop_sync_readPort_rsp_r1;
  wire       [5:0]    logic_pop_sync_readPort_rsp_g1;
  wire       [5:0]    logic_pop_sync_readPort_rsp_b1;
  wire       [36:0]   _zz_logic_pop_sync_readPort_rsp_sof;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire                logic_pop_sync_readArbitation_translated_payload_sof;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_r0;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_g0;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_b0;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_r1;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_g1;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_b1;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [3:0]    logic_pop_sync_popReg;
  reg [36:0] logic_ram [0:9];

  assign _zz_logic_ptr_notPow2_counter = (logic_ptr_notPow2_counter + _zz_logic_ptr_notPow2_counter_1);
  assign _zz_logic_ptr_notPow2_counter_2 = io_push_fire;
  assign _zz_logic_ptr_notPow2_counter_1 = {3'd0, _zz_logic_ptr_notPow2_counter_2};
  assign _zz_logic_ptr_notPow2_counter_4 = io_pop_fire;
  assign _zz_logic_ptr_notPow2_counter_3 = {3'd0, _zz_logic_ptr_notPow2_counter_4};
  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_b1,{logic_push_onRam_write_payload_data_g1,{logic_push_onRam_write_payload_data_r1,{logic_push_onRam_write_payload_data_b0,{logic_push_onRam_write_payload_data_g0,{logic_push_onRam_write_payload_data_r0,logic_push_onRam_write_payload_data_sof}}}}}};
  always @(posedge main_clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge main_clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      _zz_logic_ram_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = ((logic_ptr_push == logic_ptr_popOnIo) && logic_ptr_wentUp);
  assign logic_ptr_empty = ((logic_ptr_push == logic_ptr_pop) && (! logic_ptr_wentUp));
  assign when_Stream_l1240 = (logic_ptr_push == 4'b1001);
  assign when_Stream_l1244 = (logic_ptr_pop == 4'b1001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_occupancy = logic_ptr_notPow2_counter;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push;
  assign logic_push_onRam_write_payload_data_sof = io_push_payload_sof;
  assign logic_push_onRam_write_payload_data_r0 = io_push_payload_r0;
  assign logic_push_onRam_write_payload_data_g0 = io_push_payload_g0;
  assign logic_push_onRam_write_payload_data_b0 = io_push_payload_b0;
  assign logic_push_onRam_write_payload_data_r1 = io_push_payload_r1;
  assign logic_push_onRam_write_payload_data_g1 = io_push_payload_g1;
  assign logic_push_onRam_write_payload_data_b1 = io_push_payload_b1;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop;
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if(when_Stream_l369) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! logic_pop_sync_readArbitation_valid);
  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_sof = _zz_logic_ram_port1;
  assign logic_pop_sync_readPort_rsp_sof = _zz_logic_pop_sync_readPort_rsp_sof[0];
  assign logic_pop_sync_readPort_rsp_r0 = _zz_logic_pop_sync_readPort_rsp_sof[6 : 1];
  assign logic_pop_sync_readPort_rsp_g0 = _zz_logic_pop_sync_readPort_rsp_sof[12 : 7];
  assign logic_pop_sync_readPort_rsp_b0 = _zz_logic_pop_sync_readPort_rsp_sof[18 : 13];
  assign logic_pop_sync_readPort_rsp_r1 = _zz_logic_pop_sync_readPort_rsp_sof[24 : 19];
  assign logic_pop_sync_readPort_rsp_g1 = _zz_logic_pop_sync_readPort_rsp_sof[30 : 25];
  assign logic_pop_sync_readPort_rsp_b1 = _zz_logic_pop_sync_readPort_rsp_sof[36 : 31];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_sof = logic_pop_sync_readPort_rsp_sof;
  assign logic_pop_sync_readArbitation_translated_payload_r0 = logic_pop_sync_readPort_rsp_r0;
  assign logic_pop_sync_readArbitation_translated_payload_g0 = logic_pop_sync_readPort_rsp_g0;
  assign logic_pop_sync_readArbitation_translated_payload_b0 = logic_pop_sync_readPort_rsp_b0;
  assign logic_pop_sync_readArbitation_translated_payload_r1 = logic_pop_sync_readPort_rsp_r1;
  assign logic_pop_sync_readArbitation_translated_payload_g1 = logic_pop_sync_readPort_rsp_g1;
  assign logic_pop_sync_readArbitation_translated_payload_b1 = logic_pop_sync_readPort_rsp_b1;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_sof = logic_pop_sync_readArbitation_translated_payload_sof;
  assign io_pop_payload_r0 = logic_pop_sync_readArbitation_translated_payload_r0;
  assign io_pop_payload_g0 = logic_pop_sync_readArbitation_translated_payload_g0;
  assign io_pop_payload_b0 = logic_pop_sync_readArbitation_translated_payload_b0;
  assign io_pop_payload_r1 = logic_pop_sync_readArbitation_translated_payload_r1;
  assign io_pop_payload_g1 = logic_pop_sync_readArbitation_translated_payload_g1;
  assign io_pop_payload_b1 = logic_pop_sync_readArbitation_translated_payload_b1;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (4'b1010 - logic_ptr_occupancy);
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      logic_ptr_push <= 4'b0000;
      logic_ptr_pop <= 4'b0000;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_notPow2_counter <= 4'b0000;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 4'b0000;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 4'b0001);
        if(when_Stream_l1240) begin
          logic_ptr_push <= 4'b0000;
        end
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 4'b0001);
        if(when_Stream_l1244) begin
          logic_ptr_pop <= 4'b0000;
        end
      end
      if(io_flush) begin
        logic_ptr_push <= 4'b0000;
        logic_ptr_pop <= 4'b0000;
      end
      logic_ptr_notPow2_counter <= (_zz_logic_ptr_notPow2_counter - _zz_logic_ptr_notPow2_counter_3);
      if(io_flush) begin
        logic_ptr_notPow2_counter <= 4'b0000;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 4'b0000;
      end
    end
  end

  always @(posedge main_clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module Apb3Router (
  input  wire [19:0]   io_input_PADDR,
  input  wire [3:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output wire          io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output wire          io_input_PSLVERROR,
  output wire [19:0]   io_outputs_0_PADDR,
  output wire [0:0]    io_outputs_0_PSEL,
  output wire          io_outputs_0_PENABLE,
  input  wire          io_outputs_0_PREADY,
  output wire          io_outputs_0_PWRITE,
  output wire [31:0]   io_outputs_0_PWDATA,
  input  wire [31:0]   io_outputs_0_PRDATA,
  input  wire          io_outputs_0_PSLVERROR,
  output wire [19:0]   io_outputs_1_PADDR,
  output wire [0:0]    io_outputs_1_PSEL,
  output wire          io_outputs_1_PENABLE,
  input  wire          io_outputs_1_PREADY,
  output wire          io_outputs_1_PWRITE,
  output wire [31:0]   io_outputs_1_PWDATA,
  input  wire [31:0]   io_outputs_1_PRDATA,
  input  wire          io_outputs_1_PSLVERROR,
  output wire [19:0]   io_outputs_2_PADDR,
  output wire [0:0]    io_outputs_2_PSEL,
  output wire          io_outputs_2_PENABLE,
  input  wire          io_outputs_2_PREADY,
  output wire          io_outputs_2_PWRITE,
  output wire [31:0]   io_outputs_2_PWDATA,
  input  wire [31:0]   io_outputs_2_PRDATA,
  input  wire          io_outputs_2_PSLVERROR,
  output wire [19:0]   io_outputs_3_PADDR,
  output wire [0:0]    io_outputs_3_PSEL,
  output wire          io_outputs_3_PENABLE,
  input  wire          io_outputs_3_PREADY,
  output wire          io_outputs_3_PWRITE,
  output wire [31:0]   io_outputs_3_PWDATA,
  input  wire [31:0]   io_outputs_3_PRDATA,
  input  wire          io_outputs_3_PSLVERROR,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = (io_input_PSEL[1] || _zz_selIndex);
  assign _zz_selIndex_2 = (io_input_PSEL[2] || _zz_selIndex);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge main_clk) begin
    selIndex <= {_zz_selIndex_2,_zz_selIndex_1};
  end


endmodule

module Apb3Decoder (
  input  wire [19:0]   io_input_PADDR,
  input  wire [0:0]    io_input_PSEL,
  input  wire          io_input_PENABLE,
  output reg           io_input_PREADY,
  input  wire          io_input_PWRITE,
  input  wire [31:0]   io_input_PWDATA,
  output wire [31:0]   io_input_PRDATA,
  output reg           io_input_PSLVERROR,
  output wire [19:0]   io_output_PADDR,
  output reg  [3:0]    io_output_PSEL,
  output wire          io_output_PENABLE,
  input  wire          io_output_PREADY,
  output wire          io_output_PWRITE,
  output wire [31:0]   io_output_PWDATA,
  input  wire [31:0]   io_output_PRDATA,
  input  wire          io_output_PSLVERROR
);

  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h00000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h10000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h3ffff)) == 20'h40000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h20000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 4'b0000));

endmodule

module Apb3Gpio (
  input  wire [3:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR,
  input  wire [2:0]    io_gpio_read,
  output wire [2:0]    io_gpio_write,
  output wire [2:0]    io_gpio_writeEnable,
  output wire [2:0]    io_value,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire       [2:0]    io_gpio_read_buffercc_io_dataOut;
  wire                ctrl_readErrorFlag;
  wire                ctrl_writeErrorFlag;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [2:0]    io_gpio_write_driver;
  reg        [2:0]    io_gpio_writeEnable_driver;

  BufferCC io_gpio_read_buffercc (
    .io_dataIn   (io_gpio_read[2:0]                    ), //i
    .io_dataOut  (io_gpio_read_buffercc_io_dataOut[2:0]), //o
    .main_clk    (main_clk                             ), //i
    .main_reset_ (main_reset_                          )  //i
  );
  assign io_value = io_gpio_read_buffercc_io_dataOut;
  assign ctrl_readErrorFlag = 1'b0;
  assign ctrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h00000000;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[2 : 0] = io_value;
      end
      4'b0100 : begin
        io_apb_PRDATA[2 : 0] = io_gpio_write_driver;
      end
      4'b1000 : begin
        io_apb_PRDATA[2 : 0] = io_gpio_writeEnable_driver;
      end
      default : begin
      end
    endcase
  end

  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((ctrl_doWrite && ctrl_writeErrorFlag) || (ctrl_doRead && ctrl_readErrorFlag));
  assign io_gpio_write = io_gpio_write_driver;
  assign io_gpio_writeEnable = io_gpio_writeEnable_driver;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      io_gpio_writeEnable_driver <= 3'b000;
    end else begin
      case(io_apb_PADDR)
        4'b1000 : begin
          if(ctrl_doWrite) begin
            io_gpio_writeEnable_driver <= io_apb_PWDATA[2 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge main_clk) begin
    case(io_apb_PADDR)
      4'b0100 : begin
        if(ctrl_doWrite) begin
          io_gpio_write_driver <= io_apb_PWDATA[2 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module CCApb3Timer (
  input  wire [7:0]    io_apb_PADDR,
  input  wire [0:0]    io_apb_PSEL,
  input  wire          io_apb_PENABLE,
  output wire          io_apb_PREADY,
  input  wire          io_apb_PWRITE,
  input  wire [31:0]   io_apb_PWDATA,
  output reg  [31:0]   io_apb_PRDATA,
  output wire          io_apb_PSLVERROR,
  output wire          io_interrupt,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire                timerA_io_tick;
  wire                timerA_io_clear;
  wire                timerB_io_tick;
  wire                timerB_io_clear;
  reg        [1:0]    interruptCtrl_1_io_inputs;
  reg        [1:0]    interruptCtrl_1_io_clears;
  wire                prescaler_1_io_overflow;
  wire                timerA_io_full;
  wire       [15:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [15:0]   timerB_io_value;
  wire       [1:0]    interruptCtrl_1_io_pendings;
  wire                busCtrl_readErrorFlag;
  wire                busCtrl_writeErrorFlag;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [15:0]   _zz_io_limit;
  reg                 _zz_io_clear;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [15:0]   u_timer_timerA_io_limit_driver;
  reg                 when_Timer_l40;
  reg                 when_Timer_l44;
  reg        [1:0]    timerBBridge_ticksEnable;
  reg        [0:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [15:0]   u_timer_timerB_io_limit_driver;
  reg                 when_Timer_l40_1;
  reg                 when_Timer_l44_1;
  reg        [1:0]    u_timer_interruptCtrl_1_io_masks_driver;

  Prescaler prescaler_1 (
    .io_clear    (_zz_io_clear           ), //i
    .io_limit    (_zz_io_limit[15:0]     ), //i
    .io_overflow (prescaler_1_io_overflow), //o
    .main_clk    (main_clk               ), //i
    .main_reset_ (main_reset_            )  //i
  );
  Timer timerA (
    .io_tick     (timerA_io_tick                      ), //i
    .io_clear    (timerA_io_clear                     ), //i
    .io_limit    (u_timer_timerA_io_limit_driver[15:0]), //i
    .io_full     (timerA_io_full                      ), //o
    .io_value    (timerA_io_value[15:0]               ), //o
    .main_clk    (main_clk                            ), //i
    .main_reset_ (main_reset_                         )  //i
  );
  Timer timerB (
    .io_tick     (timerB_io_tick                      ), //i
    .io_clear    (timerB_io_clear                     ), //i
    .io_limit    (u_timer_timerB_io_limit_driver[15:0]), //i
    .io_full     (timerB_io_full                      ), //o
    .io_value    (timerB_io_value[15:0]               ), //o
    .main_clk    (main_clk                            ), //i
    .main_reset_ (main_reset_                         )  //i
  );
  InterruptCtrl interruptCtrl_1 (
    .io_inputs   (interruptCtrl_1_io_inputs[1:0]              ), //i
    .io_clears   (interruptCtrl_1_io_clears[1:0]              ), //i
    .io_masks    (u_timer_interruptCtrl_1_io_masks_driver[1:0]), //i
    .io_pendings (interruptCtrl_1_io_pendings[1:0]            ), //o
    .main_clk    (main_clk                                    ), //i
    .main_reset_ (main_reset_                                 )  //i
  );
  assign busCtrl_readErrorFlag = 1'b0;
  assign busCtrl_writeErrorFlag = 1'b0;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h00000000;
    case(io_apb_PADDR)
      8'h00 : begin
        io_apb_PRDATA[15 : 0] = _zz_io_limit;
      end
      8'h40 : begin
        io_apb_PRDATA[1 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'h44 : begin
        io_apb_PRDATA[15 : 0] = u_timer_timerA_io_limit_driver;
      end
      8'h48 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_value;
      end
      8'h50 : begin
        io_apb_PRDATA[1 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerBBridge_clearsEnable;
      end
      8'h54 : begin
        io_apb_PRDATA[15 : 0] = u_timer_timerB_io_limit_driver;
      end
      8'h58 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      8'h10 : begin
        io_apb_PRDATA[1 : 0] = interruptCtrl_1_io_pendings;
      end
      8'h14 : begin
        io_apb_PRDATA[1 : 0] = u_timer_interruptCtrl_1_io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_apb_PSLVERROR = ((busCtrl_doWrite && busCtrl_writeErrorFlag) || (busCtrl_doRead && busCtrl_readErrorFlag));
  always @(*) begin
    _zz_io_clear = 1'b0;
    case(io_apb_PADDR)
      8'h00 : begin
        if(busCtrl_doWrite) begin
          _zz_io_clear = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    timerABridge_busClearing = 1'b0;
    if(when_Timer_l40) begin
      timerABridge_busClearing = 1'b1;
    end
    if(when_Timer_l44) begin
      timerABridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40 = 1'b0;
    case(io_apb_PADDR)
      8'h44 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44 = 1'b0;
    case(io_apb_PADDR)
      8'h48 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerA_io_clear = ((|(timerABridge_clearsEnable & timerA_io_full)) || timerABridge_busClearing);
  assign timerA_io_tick = (|(timerABridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    timerBBridge_busClearing = 1'b0;
    if(when_Timer_l40_1) begin
      timerBBridge_busClearing = 1'b1;
    end
    if(when_Timer_l44_1) begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  always @(*) begin
    when_Timer_l40_1 = 1'b0;
    case(io_apb_PADDR)
      8'h54 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l40_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l44_1 = 1'b0;
    case(io_apb_PADDR)
      8'h58 : begin
        if(busCtrl_doWrite) begin
          when_Timer_l44_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign timerB_io_clear = ((|(timerBBridge_clearsEnable & timerB_io_full)) || timerBBridge_busClearing);
  assign timerB_io_tick = (|(timerBBridge_ticksEnable & {prescaler_1_io_overflow,1'b1}));
  always @(*) begin
    interruptCtrl_1_io_clears = 2'b00;
    case(io_apb_PADDR)
      8'h10 : begin
        if(busCtrl_doWrite) begin
          interruptCtrl_1_io_clears = io_apb_PWDATA[1 : 0];
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    interruptCtrl_1_io_inputs[0] = timerA_io_full;
    interruptCtrl_1_io_inputs[1] = timerB_io_full;
  end

  assign io_interrupt = (|interruptCtrl_1_io_pendings);
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      timerABridge_ticksEnable <= 2'b00;
      timerABridge_clearsEnable <= 1'b0;
      timerBBridge_ticksEnable <= 2'b00;
      timerBBridge_clearsEnable <= 1'b0;
      u_timer_interruptCtrl_1_io_masks_driver <= 2'b00;
    end else begin
      case(io_apb_PADDR)
        8'h40 : begin
          if(busCtrl_doWrite) begin
            timerABridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h50 : begin
          if(busCtrl_doWrite) begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'h14 : begin
          if(busCtrl_doWrite) begin
            u_timer_interruptCtrl_1_io_masks_driver <= io_apb_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge main_clk) begin
    case(io_apb_PADDR)
      8'h00 : begin
        if(busCtrl_doWrite) begin
          _zz_io_limit <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h44 : begin
        if(busCtrl_doWrite) begin
          u_timer_timerA_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h54 : begin
        if(busCtrl_doWrite) begin
          u_timer_timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module CpuComplex (
  output wire [19:0]   io_periphApb_PADDR,
  output wire [0:0]    io_periphApb_PSEL,
  output wire          io_periphApb_PENABLE,
  input  wire          io_periphApb_PREADY,
  output wire          io_periphApb_PWRITE,
  output wire [31:0]   io_periphApb_PWDATA,
  input  wire [31:0]   io_periphApb_PRDATA,
  input  wire          io_periphApb_PSLVERROR,
  input  wire          io_externalInterrupt,
  input  wire          io_timerInterrupt,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire                cpu_softwareInterrupt;
  wire                cpu_dBus_cmd_ready;
  reg                 ram_io_bus_cmd_valid;
  reg                 periphApbBridge_io_pipelinedMemoryBus_cmd_valid;
  wire                mainBusArbiter_io_iBus_cmd_ready;
  wire                mainBusArbiter_io_iBus_rsp_valid;
  wire                mainBusArbiter_io_iBus_rsp_payload_error;
  wire       [31:0]   mainBusArbiter_io_iBus_rsp_payload_inst;
  wire                mainBusArbiter_io_dBus_cmd_ready;
  wire                mainBusArbiter_io_dBus_rsp_ready;
  wire                mainBusArbiter_io_dBus_rsp_error;
  wire       [31:0]   mainBusArbiter_io_dBus_rsp_data;
  wire                mainBusArbiter_io_masterBus_cmd_valid;
  wire                mainBusArbiter_io_masterBus_cmd_payload_write;
  wire       [31:0]   mainBusArbiter_io_masterBus_cmd_payload_address;
  wire       [31:0]   mainBusArbiter_io_masterBus_cmd_payload_data;
  wire       [3:0]    mainBusArbiter_io_masterBus_cmd_payload_mask;
  wire                cpu_iBus_cmd_valid;
  wire       [31:0]   cpu_iBus_cmd_payload_pc;
  wire                cpu_dBus_cmd_valid;
  wire                cpu_dBus_cmd_payload_wr;
  wire       [31:0]   cpu_dBus_cmd_payload_address;
  wire       [31:0]   cpu_dBus_cmd_payload_data;
  wire       [1:0]    cpu_dBus_cmd_payload_size;
  wire                ram_io_bus_cmd_ready;
  wire                ram_io_bus_rsp_valid;
  wire       [31:0]   ram_io_bus_rsp_payload_data;
  wire                periphApbBridge_io_pipelinedMemoryBus_cmd_ready;
  wire                periphApbBridge_io_pipelinedMemoryBus_rsp_valid;
  wire       [31:0]   periphApbBridge_io_pipelinedMemoryBus_rsp_payload_data;
  wire       [19:0]   periphApbBridge_io_apb_PADDR;
  wire       [0:0]    periphApbBridge_io_apb_PSEL;
  wire                periphApbBridge_io_apb_PENABLE;
  wire                periphApbBridge_io_apb_PWRITE;
  wire       [31:0]   periphApbBridge_io_apb_PWDATA;
  reg        [31:0]   _zz_mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  wire                u_cpu_cpu_dBus_cmd_halfPipe_valid;
  wire                u_cpu_cpu_dBus_cmd_halfPipe_ready;
  wire                u_cpu_cpu_dBus_cmd_halfPipe_payload_wr;
  wire       [31:0]   u_cpu_cpu_dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   u_cpu_cpu_dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    u_cpu_cpu_dBus_cmd_halfPipe_payload_size;
  reg                 u_cpu_cpu_dBus_cmd_rValid;
  wire                u_cpu_cpu_dBus_cmd_halfPipe_fire;
  reg                 u_cpu_cpu_dBus_cmd_rData_wr;
  reg        [31:0]   u_cpu_cpu_dBus_cmd_rData_address;
  reg        [31:0]   u_cpu_cpu_dBus_cmd_rData_data;
  reg        [1:0]    u_cpu_cpu_dBus_cmd_rData_size;
  wire                mainBusDecoder_logic_masterPipelined_cmd_valid;
  reg                 mainBusDecoder_logic_masterPipelined_cmd_ready;
  wire                mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_cmd_payload_address;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_cmd_payload_data;
  wire       [3:0]    mainBusDecoder_logic_masterPipelined_cmd_payload_mask;
  wire                mainBusDecoder_logic_masterPipelined_rsp_valid;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  wire                mainBusDecoder_logic_hits_0;
  wire                _zz_io_bus_cmd_payload_write;
  wire                mainBusDecoder_logic_hits_1;
  wire                _zz_io_pipelinedMemoryBus_cmd_payload_write;
  wire                mainBusDecoder_logic_noHit;
  reg                 mainBusDecoder_logic_rspPending;
  wire                mainBusDecoder_logic_masterPipelined_cmd_fire;
  wire                when_CCBlocks_l131;
  reg                 mainBusDecoder_logic_rspNoHit;
  reg        [0:0]    mainBusDecoder_logic_rspSourceId;
  wire                when_CCBlocks_l137;

  CCMasterArbiter mainBusArbiter (
    .io_iBus_cmd_valid                (cpu_iBus_cmd_valid                                         ), //i
    .io_iBus_cmd_ready                (mainBusArbiter_io_iBus_cmd_ready                           ), //o
    .io_iBus_cmd_payload_pc           (cpu_iBus_cmd_payload_pc[31:0]                              ), //i
    .io_iBus_rsp_valid                (mainBusArbiter_io_iBus_rsp_valid                           ), //o
    .io_iBus_rsp_payload_error        (mainBusArbiter_io_iBus_rsp_payload_error                   ), //o
    .io_iBus_rsp_payload_inst         (mainBusArbiter_io_iBus_rsp_payload_inst[31:0]              ), //o
    .io_dBus_cmd_valid                (u_cpu_cpu_dBus_cmd_halfPipe_valid                          ), //i
    .io_dBus_cmd_ready                (mainBusArbiter_io_dBus_cmd_ready                           ), //o
    .io_dBus_cmd_payload_wr           (u_cpu_cpu_dBus_cmd_halfPipe_payload_wr                     ), //i
    .io_dBus_cmd_payload_address      (u_cpu_cpu_dBus_cmd_halfPipe_payload_address[31:0]          ), //i
    .io_dBus_cmd_payload_data         (u_cpu_cpu_dBus_cmd_halfPipe_payload_data[31:0]             ), //i
    .io_dBus_cmd_payload_size         (u_cpu_cpu_dBus_cmd_halfPipe_payload_size[1:0]              ), //i
    .io_dBus_rsp_ready                (mainBusArbiter_io_dBus_rsp_ready                           ), //o
    .io_dBus_rsp_error                (mainBusArbiter_io_dBus_rsp_error                           ), //o
    .io_dBus_rsp_data                 (mainBusArbiter_io_dBus_rsp_data[31:0]                      ), //o
    .io_masterBus_cmd_valid           (mainBusArbiter_io_masterBus_cmd_valid                      ), //o
    .io_masterBus_cmd_ready           (mainBusDecoder_logic_masterPipelined_cmd_ready             ), //i
    .io_masterBus_cmd_payload_write   (mainBusArbiter_io_masterBus_cmd_payload_write              ), //o
    .io_masterBus_cmd_payload_address (mainBusArbiter_io_masterBus_cmd_payload_address[31:0]      ), //o
    .io_masterBus_cmd_payload_data    (mainBusArbiter_io_masterBus_cmd_payload_data[31:0]         ), //o
    .io_masterBus_cmd_payload_mask    (mainBusArbiter_io_masterBus_cmd_payload_mask[3:0]          ), //o
    .io_masterBus_rsp_valid           (mainBusDecoder_logic_masterPipelined_rsp_valid             ), //i
    .io_masterBus_rsp_payload_data    (mainBusDecoder_logic_masterPipelined_rsp_payload_data[31:0]), //i
    .main_clk                         (main_clk                                                   ), //i
    .main_reset_                      (main_reset_                                                )  //i
  );
  VexRiscv cpu (
    .iBus_cmd_valid           (cpu_iBus_cmd_valid                           ), //o
    .iBus_cmd_ready           (mainBusArbiter_io_iBus_cmd_ready             ), //i
    .iBus_cmd_payload_pc      (cpu_iBus_cmd_payload_pc[31:0]                ), //o
    .iBus_rsp_valid           (mainBusArbiter_io_iBus_rsp_valid             ), //i
    .iBus_rsp_payload_error   (mainBusArbiter_io_iBus_rsp_payload_error     ), //i
    .iBus_rsp_payload_inst    (mainBusArbiter_io_iBus_rsp_payload_inst[31:0]), //i
    .timerInterrupt           (io_timerInterrupt                            ), //i
    .externalInterrupt        (io_externalInterrupt                         ), //i
    .softwareInterrupt        (cpu_softwareInterrupt                        ), //i
    .dBus_cmd_valid           (cpu_dBus_cmd_valid                           ), //o
    .dBus_cmd_ready           (cpu_dBus_cmd_ready                           ), //i
    .dBus_cmd_payload_wr      (cpu_dBus_cmd_payload_wr                      ), //o
    .dBus_cmd_payload_address (cpu_dBus_cmd_payload_address[31:0]           ), //o
    .dBus_cmd_payload_data    (cpu_dBus_cmd_payload_data[31:0]              ), //o
    .dBus_cmd_payload_size    (cpu_dBus_cmd_payload_size[1:0]               ), //o
    .dBus_rsp_ready           (mainBusArbiter_io_dBus_rsp_ready             ), //i
    .dBus_rsp_error           (mainBusArbiter_io_dBus_rsp_error             ), //i
    .dBus_rsp_data            (mainBusArbiter_io_dBus_rsp_data[31:0]        ), //i
    .main_clk                 (main_clk                                     ), //i
    .main_reset_              (main_reset_                                  )  //i
  );
  CCPipelinedMemoryBusRam ram (
    .io_bus_cmd_valid           (ram_io_bus_cmd_valid                                          ), //i
    .io_bus_cmd_ready           (ram_io_bus_cmd_ready                                          ), //o
    .io_bus_cmd_payload_write   (_zz_io_bus_cmd_payload_write                                  ), //i
    .io_bus_cmd_payload_address (mainBusDecoder_logic_masterPipelined_cmd_payload_address[31:0]), //i
    .io_bus_cmd_payload_data    (mainBusDecoder_logic_masterPipelined_cmd_payload_data[31:0]   ), //i
    .io_bus_cmd_payload_mask    (mainBusDecoder_logic_masterPipelined_cmd_payload_mask[3:0]    ), //i
    .io_bus_rsp_valid           (ram_io_bus_rsp_valid                                          ), //o
    .io_bus_rsp_payload_data    (ram_io_bus_rsp_payload_data[31:0]                             ), //o
    .main_clk                   (main_clk                                                      ), //i
    .main_reset_                (main_reset_                                                   )  //i
  );
  PipelinedMemoryBusToApbBridge periphApbBridge (
    .io_pipelinedMemoryBus_cmd_valid           (periphApbBridge_io_pipelinedMemoryBus_cmd_valid               ), //i
    .io_pipelinedMemoryBus_cmd_ready           (periphApbBridge_io_pipelinedMemoryBus_cmd_ready               ), //o
    .io_pipelinedMemoryBus_cmd_payload_write   (_zz_io_pipelinedMemoryBus_cmd_payload_write                   ), //i
    .io_pipelinedMemoryBus_cmd_payload_address (mainBusDecoder_logic_masterPipelined_cmd_payload_address[31:0]), //i
    .io_pipelinedMemoryBus_cmd_payload_data    (mainBusDecoder_logic_masterPipelined_cmd_payload_data[31:0]   ), //i
    .io_pipelinedMemoryBus_cmd_payload_mask    (mainBusDecoder_logic_masterPipelined_cmd_payload_mask[3:0]    ), //i
    .io_pipelinedMemoryBus_rsp_valid           (periphApbBridge_io_pipelinedMemoryBus_rsp_valid               ), //o
    .io_pipelinedMemoryBus_rsp_payload_data    (periphApbBridge_io_pipelinedMemoryBus_rsp_payload_data[31:0]  ), //o
    .io_apb_PADDR                              (periphApbBridge_io_apb_PADDR[19:0]                            ), //o
    .io_apb_PSEL                               (periphApbBridge_io_apb_PSEL                                   ), //o
    .io_apb_PENABLE                            (periphApbBridge_io_apb_PENABLE                                ), //o
    .io_apb_PREADY                             (io_periphApb_PREADY                                           ), //i
    .io_apb_PWRITE                             (periphApbBridge_io_apb_PWRITE                                 ), //o
    .io_apb_PWDATA                             (periphApbBridge_io_apb_PWDATA[31:0]                           ), //o
    .io_apb_PRDATA                             (io_periphApb_PRDATA[31:0]                                     ), //i
    .io_apb_PSLVERROR                          (io_periphApb_PSLVERROR                                        ), //i
    .main_clk                                  (main_clk                                                      ), //i
    .main_reset_                               (main_reset_                                                   )  //i
  );
  always @(*) begin
    case(mainBusDecoder_logic_rspSourceId)
      1'b0 : _zz_mainBusDecoder_logic_masterPipelined_rsp_payload_data = ram_io_bus_rsp_payload_data;
      default : _zz_mainBusDecoder_logic_masterPipelined_rsp_payload_data = periphApbBridge_io_pipelinedMemoryBus_rsp_payload_data;
    endcase
  end

  assign u_cpu_cpu_dBus_cmd_halfPipe_fire = (u_cpu_cpu_dBus_cmd_halfPipe_valid && u_cpu_cpu_dBus_cmd_halfPipe_ready);
  assign cpu_dBus_cmd_ready = (! u_cpu_cpu_dBus_cmd_rValid);
  assign u_cpu_cpu_dBus_cmd_halfPipe_valid = u_cpu_cpu_dBus_cmd_rValid;
  assign u_cpu_cpu_dBus_cmd_halfPipe_payload_wr = u_cpu_cpu_dBus_cmd_rData_wr;
  assign u_cpu_cpu_dBus_cmd_halfPipe_payload_address = u_cpu_cpu_dBus_cmd_rData_address;
  assign u_cpu_cpu_dBus_cmd_halfPipe_payload_data = u_cpu_cpu_dBus_cmd_rData_data;
  assign u_cpu_cpu_dBus_cmd_halfPipe_payload_size = u_cpu_cpu_dBus_cmd_rData_size;
  assign u_cpu_cpu_dBus_cmd_halfPipe_ready = mainBusArbiter_io_dBus_cmd_ready;
  assign io_periphApb_PADDR = periphApbBridge_io_apb_PADDR;
  assign io_periphApb_PSEL = periphApbBridge_io_apb_PSEL;
  assign io_periphApb_PENABLE = periphApbBridge_io_apb_PENABLE;
  assign io_periphApb_PWRITE = periphApbBridge_io_apb_PWRITE;
  assign io_periphApb_PWDATA = periphApbBridge_io_apb_PWDATA;
  assign mainBusDecoder_logic_masterPipelined_cmd_valid = mainBusArbiter_io_masterBus_cmd_valid;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_write = mainBusArbiter_io_masterBus_cmd_payload_write;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_address = mainBusArbiter_io_masterBus_cmd_payload_address;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_data = mainBusArbiter_io_masterBus_cmd_payload_data;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_mask = mainBusArbiter_io_masterBus_cmd_payload_mask;
  assign mainBusDecoder_logic_hits_0 = (mainBusDecoder_logic_masterPipelined_cmd_payload_address < 32'h00005000);
  always @(*) begin
    ram_io_bus_cmd_valid = (mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_hits_0);
    if(when_CCBlocks_l137) begin
      ram_io_bus_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_bus_cmd_payload_write = mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign mainBusDecoder_logic_hits_1 = ((mainBusDecoder_logic_masterPipelined_cmd_payload_address & (~ 32'h000fffff)) == 32'h80000000);
  always @(*) begin
    periphApbBridge_io_pipelinedMemoryBus_cmd_valid = (mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_hits_1);
    if(when_CCBlocks_l137) begin
      periphApbBridge_io_pipelinedMemoryBus_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_pipelinedMemoryBus_cmd_payload_write = mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign mainBusDecoder_logic_noHit = (! ({mainBusDecoder_logic_hits_1,mainBusDecoder_logic_hits_0} != 2'b00));
  always @(*) begin
    mainBusDecoder_logic_masterPipelined_cmd_ready = (({(mainBusDecoder_logic_hits_1 && periphApbBridge_io_pipelinedMemoryBus_cmd_ready),(mainBusDecoder_logic_hits_0 && ram_io_bus_cmd_ready)} != 2'b00) || mainBusDecoder_logic_noHit);
    if(when_CCBlocks_l137) begin
      mainBusDecoder_logic_masterPipelined_cmd_ready = 1'b0;
    end
  end

  assign mainBusDecoder_logic_masterPipelined_cmd_fire = (mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_masterPipelined_cmd_ready);
  assign when_CCBlocks_l131 = (mainBusDecoder_logic_masterPipelined_cmd_fire && (! mainBusDecoder_logic_masterPipelined_cmd_payload_write));
  assign mainBusDecoder_logic_masterPipelined_rsp_valid = (({periphApbBridge_io_pipelinedMemoryBus_rsp_valid,ram_io_bus_rsp_valid} != 2'b00) || (mainBusDecoder_logic_rspPending && mainBusDecoder_logic_rspNoHit));
  assign mainBusDecoder_logic_masterPipelined_rsp_payload_data = _zz_mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  assign when_CCBlocks_l137 = (mainBusDecoder_logic_rspPending && (! mainBusDecoder_logic_masterPipelined_rsp_valid));
  assign cpu_softwareInterrupt = 1'b0;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      u_cpu_cpu_dBus_cmd_rValid <= 1'b0;
      mainBusDecoder_logic_rspPending <= 1'b0;
      mainBusDecoder_logic_rspNoHit <= 1'b0;
    end else begin
      if(cpu_dBus_cmd_valid) begin
        u_cpu_cpu_dBus_cmd_rValid <= 1'b1;
      end
      if(u_cpu_cpu_dBus_cmd_halfPipe_fire) begin
        u_cpu_cpu_dBus_cmd_rValid <= 1'b0;
      end
      if(mainBusDecoder_logic_masterPipelined_rsp_valid) begin
        mainBusDecoder_logic_rspPending <= 1'b0;
      end
      if(when_CCBlocks_l131) begin
        mainBusDecoder_logic_rspPending <= 1'b1;
      end
      mainBusDecoder_logic_rspNoHit <= 1'b0;
      if(mainBusDecoder_logic_noHit) begin
        mainBusDecoder_logic_rspNoHit <= 1'b1;
      end
    end
  end

  always @(posedge main_clk) begin
    if(cpu_dBus_cmd_ready) begin
      u_cpu_cpu_dBus_cmd_rData_wr <= cpu_dBus_cmd_payload_wr;
      u_cpu_cpu_dBus_cmd_rData_address <= cpu_dBus_cmd_payload_address;
      u_cpu_cpu_dBus_cmd_rData_data <= cpu_dBus_cmd_payload_data;
      u_cpu_cpu_dBus_cmd_rData_size <= cpu_dBus_cmd_payload_size;
    end
    if(mainBusDecoder_logic_masterPipelined_cmd_fire) begin
      mainBusDecoder_logic_rspSourceId <= mainBusDecoder_logic_hits_1;
    end
  end


endmodule

module BufferCC (
  input  wire [2:0]    io_dataIn,
  output wire [2:0]    io_dataOut,
  input  wire          main_clk,
  input  wire          main_reset_
);

  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge main_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module InterruptCtrl (
  input  wire [1:0]    io_inputs,
  input  wire [1:0]    io_clears,
  input  wire [1:0]    io_masks,
  output wire [1:0]    io_pendings,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [1:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      pendings <= 2'b00;
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

//Timer_1 replaced by Timer

module Timer (
  input  wire          io_tick,
  input  wire          io_clear,
  input  wire [15:0]   io_limit,
  output wire          io_full,
  output wire [15:0]   io_value,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire       [15:0]   _zz_counter;
  wire       [0:0]    _zz_counter_1;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_counter_1 = (! limitHit);
  assign _zz_counter = {15'd0, _zz_counter_1};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick) begin
        inhibitFull <= limitHit;
      end
      if(io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge main_clk) begin
    if(io_tick) begin
      counter <= (counter + _zz_counter);
    end
    if(io_clear) begin
      counter <= 16'h0000;
    end
  end


endmodule

module Prescaler (
  input  wire          io_clear,
  input  wire [15:0]   io_limit,
  output wire          io_overflow,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [15:0]   counter;
  wire                when_Prescaler_l17;

  assign when_Prescaler_l17 = (io_clear || io_overflow);
  assign io_overflow = (counter == io_limit);
  always @(posedge main_clk) begin
    counter <= (counter + 16'h0001);
    if(when_Prescaler_l17) begin
      counter <= 16'h0000;
    end
  end


endmodule

module PipelinedMemoryBusToApbBridge (
  input  wire          io_pipelinedMemoryBus_cmd_valid,
  output wire          io_pipelinedMemoryBus_cmd_ready,
  input  wire          io_pipelinedMemoryBus_cmd_payload_write,
  input  wire [31:0]   io_pipelinedMemoryBus_cmd_payload_address,
  input  wire [31:0]   io_pipelinedMemoryBus_cmd_payload_data,
  input  wire [3:0]    io_pipelinedMemoryBus_cmd_payload_mask,
  output wire          io_pipelinedMemoryBus_rsp_valid,
  output wire [31:0]   io_pipelinedMemoryBus_rsp_payload_data,
  output wire [19:0]   io_apb_PADDR,
  output wire [0:0]    io_apb_PSEL,
  output wire          io_apb_PENABLE,
  input  wire          io_apb_PREADY,
  output wire          io_apb_PWRITE,
  output wire [31:0]   io_apb_PWDATA,
  input  wire [31:0]   io_apb_PRDATA,
  input  wire          io_apb_PSLVERROR,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire                pipelinedMemoryBusStage_cmd_valid;
  reg                 pipelinedMemoryBusStage_cmd_ready;
  wire                pipelinedMemoryBusStage_cmd_payload_write;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusStage_cmd_payload_mask;
  reg                 pipelinedMemoryBusStage_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusStage_rsp_payload_data;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_valid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_ready;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  wire       [3:0]    io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  reg                 io_pipelinedMemoryBus_cmd_rValid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_fire;
  reg                 io_pipelinedMemoryBus_cmd_rData_write;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_address;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_data;
  reg        [3:0]    io_pipelinedMemoryBus_cmd_rData_mask;
  reg                 pipelinedMemoryBusStage_rsp_regNext_valid;
  reg        [31:0]   pipelinedMemoryBusStage_rsp_regNext_payload_data;
  reg                 state;
  wire                when_PipelinedMemoryBus_l369;

  assign io_pipelinedMemoryBus_cmd_halfPipe_fire = (io_pipelinedMemoryBus_cmd_halfPipe_valid && io_pipelinedMemoryBus_cmd_halfPipe_ready);
  assign io_pipelinedMemoryBus_cmd_ready = (! io_pipelinedMemoryBus_cmd_rValid);
  assign io_pipelinedMemoryBus_cmd_halfPipe_valid = io_pipelinedMemoryBus_cmd_rValid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_write = io_pipelinedMemoryBus_cmd_rData_write;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_address = io_pipelinedMemoryBus_cmd_rData_address;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_data = io_pipelinedMemoryBus_cmd_rData_data;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_mask = io_pipelinedMemoryBus_cmd_rData_mask;
  assign pipelinedMemoryBusStage_cmd_valid = io_pipelinedMemoryBus_cmd_halfPipe_valid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_ready = pipelinedMemoryBusStage_cmd_ready;
  assign pipelinedMemoryBusStage_cmd_payload_write = io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  assign pipelinedMemoryBusStage_cmd_payload_address = io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  assign pipelinedMemoryBusStage_cmd_payload_data = io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  assign pipelinedMemoryBusStage_cmd_payload_mask = io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  assign io_pipelinedMemoryBus_rsp_valid = pipelinedMemoryBusStage_rsp_regNext_valid;
  assign io_pipelinedMemoryBus_rsp_payload_data = pipelinedMemoryBusStage_rsp_regNext_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_cmd_ready = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_cmd_ready = 1'b1;
      end
    end
  end

  assign io_apb_PSEL[0] = pipelinedMemoryBusStage_cmd_valid;
  assign io_apb_PENABLE = state;
  assign io_apb_PWRITE = pipelinedMemoryBusStage_cmd_payload_write;
  assign io_apb_PADDR = pipelinedMemoryBusStage_cmd_payload_address[19:0];
  assign io_apb_PWDATA = pipelinedMemoryBusStage_cmd_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_rsp_valid = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_rsp_valid = (! pipelinedMemoryBusStage_cmd_payload_write);
      end
    end
  end

  assign pipelinedMemoryBusStage_rsp_payload_data = io_apb_PRDATA;
  assign when_PipelinedMemoryBus_l369 = (! state);
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      pipelinedMemoryBusStage_rsp_regNext_valid <= 1'b0;
      state <= 1'b0;
    end else begin
      if(io_pipelinedMemoryBus_cmd_valid) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b1;
      end
      if(io_pipelinedMemoryBus_cmd_halfPipe_fire) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      end
      pipelinedMemoryBusStage_rsp_regNext_valid <= pipelinedMemoryBusStage_rsp_valid;
      if(when_PipelinedMemoryBus_l369) begin
        state <= pipelinedMemoryBusStage_cmd_valid;
      end else begin
        if(io_apb_PREADY) begin
          state <= 1'b0;
        end
      end
    end
  end

  always @(posedge main_clk) begin
    if(io_pipelinedMemoryBus_cmd_ready) begin
      io_pipelinedMemoryBus_cmd_rData_write <= io_pipelinedMemoryBus_cmd_payload_write;
      io_pipelinedMemoryBus_cmd_rData_address <= io_pipelinedMemoryBus_cmd_payload_address;
      io_pipelinedMemoryBus_cmd_rData_data <= io_pipelinedMemoryBus_cmd_payload_data;
      io_pipelinedMemoryBus_cmd_rData_mask <= io_pipelinedMemoryBus_cmd_payload_mask;
    end
    pipelinedMemoryBusStage_rsp_regNext_payload_data <= pipelinedMemoryBusStage_rsp_payload_data;
  end


endmodule

module CCPipelinedMemoryBusRam (
  input  wire          io_bus_cmd_valid,
  output wire          io_bus_cmd_ready,
  input  wire          io_bus_cmd_payload_write,
  input  wire [31:0]   io_bus_cmd_payload_address,
  input  wire [31:0]   io_bus_cmd_payload_data,
  input  wire [3:0]    io_bus_cmd_payload_mask,
  output wire          io_bus_rsp_valid,
  output wire [31:0]   io_bus_rsp_payload_data,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [31:0]   _zz_ram_port0;
  wire       [12:0]   _zz_ram_port;
  wire       [12:0]   _zz_io_bus_rsp_payload_data_2;
  wire                io_bus_cmd_fire;
  reg                 _zz_io_bus_rsp_valid;
  wire       [29:0]   _zz_io_bus_rsp_payload_data;
  wire       [31:0]   _zz_io_bus_rsp_payload_data_1;
  reg [7:0] ram_symbol0 [0:5119];
  reg [7:0] ram_symbol1 [0:5119];
  reg [7:0] ram_symbol2 [0:5119];
  reg [7:0] ram_symbol3 [0:5119];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;

  assign _zz_io_bus_rsp_payload_data_2 = _zz_io_bus_rsp_payload_data[12:0];
  initial begin
    $readmemb("Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("Cube2Top.v_toplevel_core_u_cpu_u_cpu_ram_ram_symbol3.bin",ram_symbol3);
  end
  always @(*) begin
    _zz_ram_port0 = {_zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge main_clk) begin
    if(io_bus_cmd_valid) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_bus_rsp_payload_data_2];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_bus_rsp_payload_data_2];
    end
  end

  always @(posedge main_clk) begin
    if(io_bus_cmd_payload_mask[0] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol0[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[7 : 0];
    end
    if(io_bus_cmd_payload_mask[1] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol1[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[15 : 8];
    end
    if(io_bus_cmd_payload_mask[2] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol2[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[23 : 16];
    end
    if(io_bus_cmd_payload_mask[3] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol3[_zz_io_bus_rsp_payload_data_2] <= _zz_io_bus_rsp_payload_data_1[31 : 24];
    end
  end

  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid;
  assign _zz_io_bus_rsp_payload_data = (io_bus_cmd_payload_address >>> 2'd2);
  assign _zz_io_bus_rsp_payload_data_1 = io_bus_cmd_payload_data;
  assign io_bus_rsp_payload_data = _zz_ram_port0;
  assign io_bus_cmd_ready = 1'b1;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      _zz_io_bus_rsp_valid <= 1'b0;
    end else begin
      _zz_io_bus_rsp_valid <= (io_bus_cmd_fire && (! io_bus_cmd_payload_write));
    end
  end


endmodule

module VexRiscv (
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output wire [31:0]   iBus_cmd_payload_pc,
  input  wire          iBus_rsp_valid,
  input  wire          iBus_rsp_payload_error,
  input  wire [31:0]   iBus_rsp_payload_inst,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [1:0]    dBus_cmd_payload_size,
  input  wire          dBus_rsp_ready,
  input  wire          dBus_rsp_error,
  input  wire [31:0]   dBus_rsp_data,
  input  wire          main_clk,
  input  wire          main_reset_
);
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam EnvCtrlEnum_NONE = 1'd0;
  localparam EnvCtrlEnum_XRET = 1'd1;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability;
  wire       [63:0]   _zz_memory_MUL;
  wire       [65:0]   _zz_memory_MUL_1;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_FORMAL_PC_NEXT;
  wire       [2:0]    _zz_decode_FORMAL_PC_NEXT_1;
  wire       [2:0]    _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusSimplePlugin_jump_pcLoad_payload_4;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_5;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [31:0]   _zz_IBusSimplePlugin_decodePc_pcPlus;
  wire       [2:0]    _zz_IBusSimplePlugin_decodePc_pcPlus_1;
  wire       [31:0]   _zz_IBusSimplePlugin_decompressor_decompressed_27;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_28;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_29;
  wire       [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_30;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_31;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_32;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_33;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_34;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_35;
  wire       [11:0]   _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  wire       [0:0]    _zz_IBusSimplePlugin_predictionJumpInterface_payload_4;
  wire       [7:0]    _zz_IBusSimplePlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_6;
  wire       [0:0]    _zz_IBusSimplePlugin_predictionJumpInterface_payload_7;
  wire       [0:0]    _zz_IBusSimplePlugin_predictionJumpInterface_payload_8;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_1;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_2;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_3;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_4;
  wire                _zz__zz_decode_IS_RS2_SIGNED_5;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_6;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_7;
  wire       [22:0]   _zz__zz_decode_IS_RS2_SIGNED_8;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_9;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_10;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_11;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_12;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_13;
  wire                _zz__zz_decode_IS_RS2_SIGNED_14;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_15;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_16;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_17;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_18;
  wire       [17:0]   _zz__zz_decode_IS_RS2_SIGNED_19;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_20;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_21;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_22;
  wire                _zz__zz_decode_IS_RS2_SIGNED_23;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_24;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_25;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_26;
  wire       [13:0]   _zz__zz_decode_IS_RS2_SIGNED_27;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_28;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_29;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_30;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_31;
  wire       [1:0]    _zz__zz_decode_IS_RS2_SIGNED_32;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_33;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_34;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_35;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_36;
  wire                _zz__zz_decode_IS_RS2_SIGNED_37;
  wire                _zz__zz_decode_IS_RS2_SIGNED_38;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_39;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_40;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_41;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_42;
  wire                _zz__zz_decode_IS_RS2_SIGNED_43;
  wire       [9:0]    _zz__zz_decode_IS_RS2_SIGNED_44;
  wire       [4:0]    _zz__zz_decode_IS_RS2_SIGNED_45;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_46;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_47;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_48;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_49;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_50;
  wire       [1:0]    _zz__zz_decode_IS_RS2_SIGNED_51;
  wire                _zz__zz_decode_IS_RS2_SIGNED_52;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_53;
  wire                _zz__zz_decode_IS_RS2_SIGNED_54;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_55;
  wire                _zz__zz_decode_IS_RS2_SIGNED_56;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_57;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_58;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_59;
  wire       [2:0]    _zz__zz_decode_IS_RS2_SIGNED_60;
  wire                _zz__zz_decode_IS_RS2_SIGNED_61;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_62;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_63;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_64;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_65;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_66;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_67;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_68;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_69;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_70;
  wire       [4:0]    _zz__zz_decode_IS_RS2_SIGNED_71;
  wire                _zz__zz_decode_IS_RS2_SIGNED_72;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_73;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_74;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_75;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_76;
  wire       [2:0]    _zz__zz_decode_IS_RS2_SIGNED_77;
  wire                _zz__zz_decode_IS_RS2_SIGNED_78;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_79;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_80;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_81;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_82;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_83;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_84;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_85;
  wire       [6:0]    _zz__zz_decode_IS_RS2_SIGNED_86;
  wire       [1:0]    _zz__zz_decode_IS_RS2_SIGNED_87;
  wire                _zz__zz_decode_IS_RS2_SIGNED_88;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_89;
  wire                _zz__zz_decode_IS_RS2_SIGNED_90;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_91;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_92;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_93;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_94;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_95;
  wire       [3:0]    _zz__zz_decode_IS_RS2_SIGNED_96;
  wire                _zz__zz_decode_IS_RS2_SIGNED_97;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_98;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_99;
  wire       [1:0]    _zz__zz_decode_IS_RS2_SIGNED_100;
  wire                _zz__zz_decode_IS_RS2_SIGNED_101;
  wire       [3:0]    _zz__zz_decode_IS_RS2_SIGNED_102;
  wire                _zz__zz_decode_IS_RS2_SIGNED_103;
  wire                _zz__zz_decode_IS_RS2_SIGNED_104;
  wire       [31:0]   _zz__zz_decode_IS_RS2_SIGNED_105;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_106;
  wire       [2:0]    _zz__zz_decode_IS_RS2_SIGNED_107;
  wire                _zz__zz_decode_IS_RS2_SIGNED_108;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_109;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_110;
  wire       [1:0]    _zz__zz_decode_IS_RS2_SIGNED_111;
  wire                _zz__zz_decode_IS_RS2_SIGNED_112;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_113;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_114;
  wire                _zz__zz_decode_IS_RS2_SIGNED_115;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_116;
  wire       [0:0]    _zz__zz_decode_IS_RS2_SIGNED_117;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_decode_SRC1;
  wire       [4:0]    _zz__zz_decode_SRC1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [5:0]    _zz_memory_DivPlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_DivPlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_2;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_3;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_4;
  wire       [0:0]    _zz_memory_DivPlugin_div_result_5;
  wire       [32:0]   _zz_memory_DivPlugin_rs1_2;
  wire       [0:0]    _zz_memory_DivPlugin_rs1_3;
  wire       [31:0]   _zz_memory_DivPlugin_rs2_1;
  wire       [0:0]    _zz_memory_DivPlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire                _zz_execute_BranchPlugin_branch_src2_6;
  wire                _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [63:0]   memory_MUL;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [32:0]   execute_MUL_OPB;
  wire       [32:0]   execute_MUL_OPA;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_PREDICTION_HAD_BRANCHED1;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [0:0]    decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_IS_RVC;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED1;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire       [31:0]   execute_RS1;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire       [63:0]   writeBack_MUL;
  wire                writeBack_IS_MUL;
  wire       [32:0]   memory_MUL_OPB;
  wire       [32:0]   memory_MUL_OPA;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2;
  wire       [1:0]    memory_SHIFT_CTRL;
  wire       [1:0]    _zz_memory_SHIFT_CTRL;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_decode_to_execute_PC;
  wire       [31:0]   _zz_decode_to_execute_RS2;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_to_execute_RS1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [0:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [0:0]    memory_ENV_CTRL;
  wire       [0:0]    _zz_memory_ENV_CTRL;
  wire       [0:0]    execute_ENV_CTRL;
  wire       [0:0]    _zz_execute_ENV_CTRL;
  wire       [0:0]    writeBack_ENV_CTRL;
  wire       [0:0]    _zz_writeBack_ENV_CTRL;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  wire                IBusSimplePlugin_forceNoDecodeCond;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire                IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_csrMapping_doForceFailCsr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                CsrPlugin_allowEbreakException;
  wire                CsrPlugin_xretAwayFromMachine;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_inDebugNoFetchFlag;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusSimplePlugin_jump_pcLoad_payload_3;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  wire                IBusSimplePlugin_decodePc_injectedDecode;
  wire                when_Fetcher_l182;
  wire                when_Fetcher_l194;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  reg                 IBusSimplePlugin_decompressor_bufferValidLatch;
  reg                 IBusSimplePlugin_decompressor_throw2BytesLatch;
  wire                IBusSimplePlugin_decompressor_bufferValidPatched;
  wire                IBusSimplePlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_IBusSimplePlugin_decompressor_decompressed;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_1;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_2;
  wire       [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_3;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_4;
  reg        [11:0]   _zz_IBusSimplePlugin_decompressor_decompressed_5;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_6;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_7;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_8;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_9;
  reg        [14:0]   _zz_IBusSimplePlugin_decompressor_decompressed_10;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_11;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_12;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_13;
  reg        [9:0]    _zz_IBusSimplePlugin_decompressor_decompressed_14;
  wire       [20:0]   _zz_IBusSimplePlugin_decompressor_decompressed_15;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_16;
  reg        [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_17;
  wire       [12:0]   _zz_IBusSimplePlugin_decompressor_decompressed_18;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_19;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_20;
  wire       [4:0]    _zz_IBusSimplePlugin_decompressor_decompressed_21;
  wire       [4:0]    switch_Misc_l44;
  wire                when_Misc_l47;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_22;
  wire       [1:0]    switch_Misc_l232;
  wire       [1:0]    switch_Misc_l232_1;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_23;
  reg        [2:0]    _zz_IBusSimplePlugin_decompressor_decompressed_24;
  wire                _zz_IBusSimplePlugin_decompressor_decompressed_25;
  reg        [6:0]    _zz_IBusSimplePlugin_decompressor_decompressed_26;
  wire                IBusSimplePlugin_decompressor_output_fire;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                when_Fetcher_l285;
  wire                when_Fetcher_l288;
  wire                when_Fetcher_l293;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusSimplePlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusSimplePlugin_predictionJumpInterface_payload_3;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                when_IBusSimplePlugin_l305;
  wire                IBusSimplePlugin_cmd_fire;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                iBus_rsp_toStream_valid;
  wire                iBus_rsp_toStream_ready;
  wire                iBus_rsp_toStream_payload_error;
  wire       [31:0]   iBus_rsp_toStream_payload_inst;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l376;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l435;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l489;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l232_2;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l565;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle;
  reg        [63:0]   CsrPlugin_minstret;
  wire                _zz_when_CsrPlugin_l1302;
  wire                _zz_when_CsrPlugin_l1302_1;
  wire                _zz_when_CsrPlugin_l1302_2;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1296;
  wire                when_CsrPlugin_l1302;
  wire                when_CsrPlugin_l1302_1;
  wire                when_CsrPlugin_l1302_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1335;
  wire                when_CsrPlugin_l1335_1;
  wire                when_CsrPlugin_l1335_2;
  wire                when_CsrPlugin_l1340;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1390;
  wire                when_CsrPlugin_l1398;
  wire                when_CsrPlugin_l1456;
  wire       [1:0]    switch_CsrPlugin_l1460;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1527;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1547;
  wire                when_CsrPlugin_l1548;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l232_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1587;
  wire                when_CsrPlugin_l1591;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [28:0]   _zz_decode_IS_RS2_SIGNED;
  wire                _zz_decode_IS_RS2_SIGNED_1;
  wire                _zz_decode_IS_RS2_SIGNED_2;
  wire                _zz_decode_IS_RS2_SIGNED_3;
  wire                _zz_decode_IS_RS2_SIGNED_4;
  wire                _zz_decode_IS_RS2_SIGNED_5;
  wire                _zz_decode_IS_RS2_SIGNED_6;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [0:0]    _zz_decode_ENV_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_5;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_decode_SRC1;
  wire                _zz_decode_SRC2;
  reg        [19:0]   _zz_decode_SRC2_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  reg        [31:0]   _zz_decode_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 execute_MulSimplePlugin_aSigned;
  reg                 execute_MulSimplePlugin_bSigned;
  wire       [31:0]   execute_MulSimplePlugin_a;
  wire       [31:0]   execute_MulSimplePlugin_b;
  wire       [1:0]    switch_MulSimplePlugin_l50;
  wire                when_MulSimplePlugin_l80;
  wire       [1:0]    switch_MulSimplePlugin_l81;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_DivPlugin_rs2;
  wire                _zz_memory_DivPlugin_rs1;
  reg        [32:0]   _zz_memory_DivPlugin_rs1_1;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l232_4;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg                 decode_to_execute_IS_RVC;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_13;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_16;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_23;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_24;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_25;
  reg        [0:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_26;
  reg        [0:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_27;
  reg        [0:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_28;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_29;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_30;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_31;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_32;
  reg        [1:0]    execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_33;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_37;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_38;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_39;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_40;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_41;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_42;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_43;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_45;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED1;
  wire                when_Pipeline_l124_47;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_48;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_49;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_52;
  reg        [32:0]   execute_to_memory_MUL_OPA;
  wire                when_Pipeline_l124_53;
  reg        [32:0]   execute_to_memory_MUL_OPB;
  wire                when_Pipeline_l124_54;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l124_57;
  reg        [63:0]   memory_to_writeBack_MUL;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  wire                when_CsrPlugin_l1669;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1669_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1669_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1669_3;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1669_4;
  reg                 execute_CsrPlugin_csr_2944;
  wire       [1:0]    switch_CsrPlugin_l1031;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  wire                when_CsrPlugin_l1702;
  wire       [11:0]   _zz_when_CsrPlugin_l1709;
  wire                when_CsrPlugin_l1709;
  reg                 when_CsrPlugin_l1719;
  wire                when_CsrPlugin_l1717;
  wire                when_CsrPlugin_l1725;
  `ifndef SYNTHESIS
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_memory_MUL_1 = ($signed(memory_MUL_OPA) * $signed(memory_MUL_OPB));
  assign _zz_memory_MUL = _zz_memory_MUL_1[63 : 0];
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_decode_FORMAL_PC_NEXT_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_decode_FORMAL_PC_NEXT = {29'd0, _zz_decode_FORMAL_PC_NEXT_1};
  assign _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 3'b001);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz_IBusSimplePlugin_decodePc_pcPlus_1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_IBusSimplePlugin_decodePc_pcPlus = {29'd0, _zz_IBusSimplePlugin_decodePc_pcPlus_1};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_27 = {{_zz_IBusSimplePlugin_decompressor_decompressed_10,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},12'h000};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_34 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_35 = {{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[8 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 9]},2'b00};
  assign _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_decode_SRC1 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz__zz_decode_SRC1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h00000000);
  assign _zz_memory_DivPlugin_div_counter_valueNext_1 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_memory_DivPlugin_div_counter_valueNext = {5'd0, _zz_memory_DivPlugin_div_counter_valueNext_1};
  assign _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_DivPlugin_rs2};
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder_1 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outNumerator = {_zz_memory_DivPlugin_div_stage_0_remainderShifted,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_DivPlugin_div_result_1 = _zz_memory_DivPlugin_div_result_2;
  assign _zz_memory_DivPlugin_div_result_2 = _zz_memory_DivPlugin_div_result_3;
  assign _zz_memory_DivPlugin_div_result_3 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_memory_DivPlugin_div_result) : _zz_memory_DivPlugin_div_result)} + _zz_memory_DivPlugin_div_result_4);
  assign _zz_memory_DivPlugin_div_result_5 = memory_DivPlugin_div_needRevert;
  assign _zz_memory_DivPlugin_div_result_4 = {32'd0, _zz_memory_DivPlugin_div_result_5};
  assign _zz_memory_DivPlugin_rs1_3 = _zz_memory_DivPlugin_rs1;
  assign _zz_memory_DivPlugin_rs1_2 = {32'd0, _zz_memory_DivPlugin_rs1_3};
  assign _zz_memory_DivPlugin_rs2_2 = _zz_memory_DivPlugin_rs2;
  assign _zz_memory_DivPlugin_rs2_1 = {31'd0, _zz_memory_DivPlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_9 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_5 = {_zz_IBusSimplePlugin_jump_pcLoad_payload_3,_zz_IBusSimplePlugin_jump_pcLoad_payload_2};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_28 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b01);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_29 = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b11) && (_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5] == 2'b00));
  assign _zz_IBusSimplePlugin_decompressor_decompressed_30 = 7'h00;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_31 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_32 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  assign _zz_IBusSimplePlugin_decompressor_decompressed_33 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 7];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[19 : 12];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[20];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_7 = decode_INSTRUCTION[31];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_8 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_RS2_SIGNED = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_RS2_SIGNED_1 = 32'h00000004;
  assign _zz__zz_decode_IS_RS2_SIGNED_2 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_RS2_SIGNED_3 = 32'h00000040;
  assign _zz__zz_decode_IS_RS2_SIGNED_4 = _zz_decode_IS_RS2_SIGNED_6;
  assign _zz__zz_decode_IS_RS2_SIGNED_5 = (|((decode_INSTRUCTION & 32'h02004064) == 32'h02004020));
  assign _zz__zz_decode_IS_RS2_SIGNED_6 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_7) == 32'h02000030));
  assign _zz__zz_decode_IS_RS2_SIGNED_8 = {(|(_zz__zz_decode_IS_RS2_SIGNED_9 == _zz__zz_decode_IS_RS2_SIGNED_10)),{(|{_zz__zz_decode_IS_RS2_SIGNED_11,_zz__zz_decode_IS_RS2_SIGNED_12}),{(|_zz__zz_decode_IS_RS2_SIGNED_13),{_zz__zz_decode_IS_RS2_SIGNED_14,{_zz__zz_decode_IS_RS2_SIGNED_16,_zz__zz_decode_IS_RS2_SIGNED_19}}}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_7 = 32'h02004074;
  assign _zz__zz_decode_IS_RS2_SIGNED_9 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_RS2_SIGNED_10 = 32'h00005010;
  assign _zz__zz_decode_IS_RS2_SIGNED_11 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_IS_RS2_SIGNED_12 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_RS2_SIGNED_13 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_IS_RS2_SIGNED_14 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_15) == 32'h00001000));
  assign _zz__zz_decode_IS_RS2_SIGNED_16 = (|(_zz__zz_decode_IS_RS2_SIGNED_17 == _zz__zz_decode_IS_RS2_SIGNED_18));
  assign _zz__zz_decode_IS_RS2_SIGNED_19 = {(|{_zz__zz_decode_IS_RS2_SIGNED_20,_zz__zz_decode_IS_RS2_SIGNED_21}),{(|_zz__zz_decode_IS_RS2_SIGNED_22),{_zz__zz_decode_IS_RS2_SIGNED_23,{_zz__zz_decode_IS_RS2_SIGNED_24,_zz__zz_decode_IS_RS2_SIGNED_27}}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_15 = 32'h00001000;
  assign _zz__zz_decode_IS_RS2_SIGNED_17 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_IS_RS2_SIGNED_18 = 32'h00002000;
  assign _zz__zz_decode_IS_RS2_SIGNED_20 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_IS_RS2_SIGNED_21 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_IS_RS2_SIGNED_22 = ((decode_INSTRUCTION & 32'h00004004) == 32'h00004000);
  assign _zz__zz_decode_IS_RS2_SIGNED_23 = (|_zz_decode_IS_RS2_SIGNED_2);
  assign _zz__zz_decode_IS_RS2_SIGNED_24 = (|(_zz__zz_decode_IS_RS2_SIGNED_25 == _zz__zz_decode_IS_RS2_SIGNED_26));
  assign _zz__zz_decode_IS_RS2_SIGNED_27 = {(|{_zz__zz_decode_IS_RS2_SIGNED_28,_zz__zz_decode_IS_RS2_SIGNED_30}),{(|_zz__zz_decode_IS_RS2_SIGNED_32),{_zz__zz_decode_IS_RS2_SIGNED_37,{_zz__zz_decode_IS_RS2_SIGNED_42,_zz__zz_decode_IS_RS2_SIGNED_44}}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_25 = (decode_INSTRUCTION & 32'h00003050);
  assign _zz__zz_decode_IS_RS2_SIGNED_26 = 32'h00000050;
  assign _zz__zz_decode_IS_RS2_SIGNED_28 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_29) == 32'h00001050);
  assign _zz__zz_decode_IS_RS2_SIGNED_30 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_31) == 32'h00002050);
  assign _zz__zz_decode_IS_RS2_SIGNED_32 = {(_zz__zz_decode_IS_RS2_SIGNED_33 == _zz__zz_decode_IS_RS2_SIGNED_34),(_zz__zz_decode_IS_RS2_SIGNED_35 == _zz__zz_decode_IS_RS2_SIGNED_36)};
  assign _zz__zz_decode_IS_RS2_SIGNED_37 = (|{_zz__zz_decode_IS_RS2_SIGNED_38,{_zz__zz_decode_IS_RS2_SIGNED_39,_zz__zz_decode_IS_RS2_SIGNED_40}});
  assign _zz__zz_decode_IS_RS2_SIGNED_42 = (|_zz__zz_decode_IS_RS2_SIGNED_43);
  assign _zz__zz_decode_IS_RS2_SIGNED_44 = {(|_zz__zz_decode_IS_RS2_SIGNED_45),{_zz__zz_decode_IS_RS2_SIGNED_56,{_zz__zz_decode_IS_RS2_SIGNED_69,_zz__zz_decode_IS_RS2_SIGNED_86}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_29 = 32'h00001050;
  assign _zz__zz_decode_IS_RS2_SIGNED_31 = 32'h00002050;
  assign _zz__zz_decode_IS_RS2_SIGNED_33 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_IS_RS2_SIGNED_34 = 32'h00000020;
  assign _zz__zz_decode_IS_RS2_SIGNED_35 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_RS2_SIGNED_36 = 32'h00000020;
  assign _zz__zz_decode_IS_RS2_SIGNED_38 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_IS_RS2_SIGNED_39 = _zz_decode_IS_RS2_SIGNED_3;
  assign _zz__zz_decode_IS_RS2_SIGNED_40 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_41) == 32'h00000040);
  assign _zz__zz_decode_IS_RS2_SIGNED_43 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_IS_RS2_SIGNED_45 = {(_zz__zz_decode_IS_RS2_SIGNED_46 == _zz__zz_decode_IS_RS2_SIGNED_47),{_zz_decode_IS_RS2_SIGNED_4,{_zz__zz_decode_IS_RS2_SIGNED_48,_zz__zz_decode_IS_RS2_SIGNED_51}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_56 = (|{_zz_decode_IS_RS2_SIGNED_4,{_zz__zz_decode_IS_RS2_SIGNED_57,_zz__zz_decode_IS_RS2_SIGNED_60}});
  assign _zz__zz_decode_IS_RS2_SIGNED_69 = (|{_zz__zz_decode_IS_RS2_SIGNED_70,_zz__zz_decode_IS_RS2_SIGNED_71});
  assign _zz__zz_decode_IS_RS2_SIGNED_86 = {(|_zz__zz_decode_IS_RS2_SIGNED_87),{_zz__zz_decode_IS_RS2_SIGNED_90,{_zz__zz_decode_IS_RS2_SIGNED_95,_zz__zz_decode_IS_RS2_SIGNED_102}}};
  assign _zz__zz_decode_IS_RS2_SIGNED_41 = 32'h00003040;
  assign _zz__zz_decode_IS_RS2_SIGNED_46 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_IS_RS2_SIGNED_47 = 32'h00000040;
  assign _zz__zz_decode_IS_RS2_SIGNED_48 = (_zz__zz_decode_IS_RS2_SIGNED_49 == _zz__zz_decode_IS_RS2_SIGNED_50);
  assign _zz__zz_decode_IS_RS2_SIGNED_51 = {_zz__zz_decode_IS_RS2_SIGNED_52,_zz__zz_decode_IS_RS2_SIGNED_54};
  assign _zz__zz_decode_IS_RS2_SIGNED_57 = (_zz__zz_decode_IS_RS2_SIGNED_58 == _zz__zz_decode_IS_RS2_SIGNED_59);
  assign _zz__zz_decode_IS_RS2_SIGNED_60 = {_zz__zz_decode_IS_RS2_SIGNED_61,{_zz__zz_decode_IS_RS2_SIGNED_63,_zz__zz_decode_IS_RS2_SIGNED_66}};
  assign _zz__zz_decode_IS_RS2_SIGNED_70 = _zz_decode_IS_RS2_SIGNED_5;
  assign _zz__zz_decode_IS_RS2_SIGNED_71 = {_zz__zz_decode_IS_RS2_SIGNED_72,{_zz__zz_decode_IS_RS2_SIGNED_74,_zz__zz_decode_IS_RS2_SIGNED_77}};
  assign _zz__zz_decode_IS_RS2_SIGNED_87 = {_zz_decode_IS_RS2_SIGNED_4,_zz__zz_decode_IS_RS2_SIGNED_88};
  assign _zz__zz_decode_IS_RS2_SIGNED_90 = (|{_zz__zz_decode_IS_RS2_SIGNED_91,_zz__zz_decode_IS_RS2_SIGNED_92});
  assign _zz__zz_decode_IS_RS2_SIGNED_95 = (|_zz__zz_decode_IS_RS2_SIGNED_96);
  assign _zz__zz_decode_IS_RS2_SIGNED_102 = {_zz__zz_decode_IS_RS2_SIGNED_103,{_zz__zz_decode_IS_RS2_SIGNED_106,_zz__zz_decode_IS_RS2_SIGNED_111}};
  assign _zz__zz_decode_IS_RS2_SIGNED_49 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz__zz_decode_IS_RS2_SIGNED_50 = 32'h00004020;
  assign _zz__zz_decode_IS_RS2_SIGNED_52 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_53) == 32'h00000010);
  assign _zz__zz_decode_IS_RS2_SIGNED_54 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_55) == 32'h00000020);
  assign _zz__zz_decode_IS_RS2_SIGNED_58 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_IS_RS2_SIGNED_59 = 32'h00002010;
  assign _zz__zz_decode_IS_RS2_SIGNED_61 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_62) == 32'h00000010);
  assign _zz__zz_decode_IS_RS2_SIGNED_63 = (_zz__zz_decode_IS_RS2_SIGNED_64 == _zz__zz_decode_IS_RS2_SIGNED_65);
  assign _zz__zz_decode_IS_RS2_SIGNED_66 = (_zz__zz_decode_IS_RS2_SIGNED_67 == _zz__zz_decode_IS_RS2_SIGNED_68);
  assign _zz__zz_decode_IS_RS2_SIGNED_72 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_73) == 32'h00001010);
  assign _zz__zz_decode_IS_RS2_SIGNED_74 = (_zz__zz_decode_IS_RS2_SIGNED_75 == _zz__zz_decode_IS_RS2_SIGNED_76);
  assign _zz__zz_decode_IS_RS2_SIGNED_77 = {_zz__zz_decode_IS_RS2_SIGNED_78,{_zz__zz_decode_IS_RS2_SIGNED_80,_zz__zz_decode_IS_RS2_SIGNED_83}};
  assign _zz__zz_decode_IS_RS2_SIGNED_88 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_89) == 32'h00000020);
  assign _zz__zz_decode_IS_RS2_SIGNED_91 = _zz_decode_IS_RS2_SIGNED_4;
  assign _zz__zz_decode_IS_RS2_SIGNED_92 = (_zz__zz_decode_IS_RS2_SIGNED_93 == _zz__zz_decode_IS_RS2_SIGNED_94);
  assign _zz__zz_decode_IS_RS2_SIGNED_96 = {_zz__zz_decode_IS_RS2_SIGNED_97,{_zz__zz_decode_IS_RS2_SIGNED_99,_zz__zz_decode_IS_RS2_SIGNED_100}};
  assign _zz__zz_decode_IS_RS2_SIGNED_103 = (|_zz__zz_decode_IS_RS2_SIGNED_104);
  assign _zz__zz_decode_IS_RS2_SIGNED_106 = (|_zz__zz_decode_IS_RS2_SIGNED_107);
  assign _zz__zz_decode_IS_RS2_SIGNED_111 = {_zz__zz_decode_IS_RS2_SIGNED_112,_zz__zz_decode_IS_RS2_SIGNED_115};
  assign _zz__zz_decode_IS_RS2_SIGNED_53 = 32'h00000030;
  assign _zz__zz_decode_IS_RS2_SIGNED_55 = 32'h02000020;
  assign _zz__zz_decode_IS_RS2_SIGNED_62 = 32'h00001030;
  assign _zz__zz_decode_IS_RS2_SIGNED_64 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_IS_RS2_SIGNED_65 = 32'h00002020;
  assign _zz__zz_decode_IS_RS2_SIGNED_67 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_IS_RS2_SIGNED_68 = 32'h00000020;
  assign _zz__zz_decode_IS_RS2_SIGNED_73 = 32'h00001010;
  assign _zz__zz_decode_IS_RS2_SIGNED_75 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_RS2_SIGNED_76 = 32'h00002010;
  assign _zz__zz_decode_IS_RS2_SIGNED_78 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_79) == 32'h00000010);
  assign _zz__zz_decode_IS_RS2_SIGNED_80 = (_zz__zz_decode_IS_RS2_SIGNED_81 == _zz__zz_decode_IS_RS2_SIGNED_82);
  assign _zz__zz_decode_IS_RS2_SIGNED_83 = (_zz__zz_decode_IS_RS2_SIGNED_84 == _zz__zz_decode_IS_RS2_SIGNED_85);
  assign _zz__zz_decode_IS_RS2_SIGNED_89 = 32'h00000070;
  assign _zz__zz_decode_IS_RS2_SIGNED_93 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_RS2_SIGNED_94 = 32'h00000000;
  assign _zz__zz_decode_IS_RS2_SIGNED_97 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_98) == 32'h00000000);
  assign _zz__zz_decode_IS_RS2_SIGNED_99 = _zz_decode_IS_RS2_SIGNED_3;
  assign _zz__zz_decode_IS_RS2_SIGNED_100 = {_zz_decode_IS_RS2_SIGNED_2,_zz__zz_decode_IS_RS2_SIGNED_101};
  assign _zz__zz_decode_IS_RS2_SIGNED_104 = ((decode_INSTRUCTION & _zz__zz_decode_IS_RS2_SIGNED_105) == 32'h00000000);
  assign _zz__zz_decode_IS_RS2_SIGNED_107 = {_zz__zz_decode_IS_RS2_SIGNED_108,{_zz__zz_decode_IS_RS2_SIGNED_109,_zz__zz_decode_IS_RS2_SIGNED_110}};
  assign _zz__zz_decode_IS_RS2_SIGNED_112 = (|{_zz__zz_decode_IS_RS2_SIGNED_113,_zz__zz_decode_IS_RS2_SIGNED_114});
  assign _zz__zz_decode_IS_RS2_SIGNED_115 = (|{_zz__zz_decode_IS_RS2_SIGNED_116,_zz__zz_decode_IS_RS2_SIGNED_117});
  assign _zz__zz_decode_IS_RS2_SIGNED_79 = 32'h00000050;
  assign _zz__zz_decode_IS_RS2_SIGNED_81 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz__zz_decode_IS_RS2_SIGNED_82 = 32'h00000004;
  assign _zz__zz_decode_IS_RS2_SIGNED_84 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz__zz_decode_IS_RS2_SIGNED_85 = 32'h00000000;
  assign _zz__zz_decode_IS_RS2_SIGNED_98 = 32'h00000044;
  assign _zz__zz_decode_IS_RS2_SIGNED_101 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz__zz_decode_IS_RS2_SIGNED_105 = 32'h00000058;
  assign _zz__zz_decode_IS_RS2_SIGNED_108 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz__zz_decode_IS_RS2_SIGNED_109 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz__zz_decode_IS_RS2_SIGNED_110 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz__zz_decode_IS_RS2_SIGNED_113 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz__zz_decode_IS_RS2_SIGNED_114 = _zz_decode_IS_RS2_SIGNED_1;
  assign _zz__zz_decode_IS_RS2_SIGNED_116 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_IS_RS2_SIGNED_117 = _zz_decode_IS_RS2_SIGNED_1;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[7];
  always @(posedge main_clk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge main_clk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid         (iBus_rsp_toStream_valid                                       ), //i
    .io_push_ready         (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready            ), //o
    .io_push_payload_error (iBus_rsp_toStream_payload_error                               ), //i
    .io_push_payload_inst  (iBus_rsp_toStream_payload_inst[31:0]                          ), //i
    .io_pop_valid          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid             ), //o
    .io_pop_ready          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready             ), //i
    .io_pop_payload_error  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error     ), //o
    .io_pop_payload_inst   (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]), //o
    .io_flush              (IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush                 ), //i
    .io_occupancy          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy             ), //o
    .io_availability       (IBusSimplePlugin_rspJoin_rspBuffer_c_io_availability          ), //o
    .main_clk              (main_clk                                                      ), //i
    .main_reset_           (main_reset_                                                   )  //i
  );
  always @(*) begin
    case(_zz_IBusSimplePlugin_jump_pcLoad_payload_5)
      2'b00 : _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = CsrPlugin_jumpInterface_payload;
      2'b01 : _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = BranchPlugin_jumpInterface_payload;
      default : _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = IBusSimplePlugin_predictionJumpInterface_payload;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET";
      default : _zz_decode_ENV_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL = _zz_memory_MUL;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED1 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign execute_MUL_OPB = {(execute_MulSimplePlugin_bSigned ? execute_MulSimplePlugin_b[31] : 1'b0),execute_MulSimplePlugin_b};
  assign execute_MUL_OPA = {(execute_MulSimplePlugin_aSigned ? execute_MulSimplePlugin_a[31] : 1'b0),execute_MulSimplePlugin_a};
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED1 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2 = _zz_decode_SRC2_4;
  assign decode_SRC1 = _zz_decode_SRC1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_RS2_SIGNED[26];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_RS2_SIGNED[25];
  assign decode_IS_DIV = _zz_decode_IS_RS2_SIGNED[24];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_RS2_SIGNED[23];
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_RS2_SIGNED[17];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_RS2_SIGNED[13];
  assign decode_MEMORY_STORE = _zz_decode_IS_RS2_SIGNED[10];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_RS2_SIGNED[9];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_RS2_SIGNED[8];
  assign decode_MEMORY_ENABLE = _zz_decode_IS_RS2_SIGNED[3];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h00)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h00))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_decode_FORMAL_PC_NEXT);
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_PREDICTION_HAD_BRANCHED1 = decode_to_execute_PREDICTION_HAD_BRANCHED1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_RS2_SIGNED[12];
  assign decode_RS1_USE = _zz_decode_IS_RS2_SIGNED[4];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_MUL = memory_to_writeBack_MUL;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign memory_MUL_OPB = execute_to_memory_MUL_OPB;
  assign memory_MUL_OPA = execute_to_memory_MUL_OPA;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_decode_to_execute_PC = decode_PC;
  assign _zz_decode_to_execute_RS2 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_RS1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_RS2_SIGNED[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_RS2_SIGNED[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_RS2_SIGNED[7];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1587) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l565) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if(when_MulSimplePlugin_l80) begin
      case(switch_MulSimplePlugin_l81)
        2'b00 : begin
          _zz_decode_RS2_2 = writeBack_MUL[31 : 0];
        end
        default : begin
          _zz_decode_RS2_2 = writeBack_MUL[63 : 32];
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1527) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l435) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1591) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l489) begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1390) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1390) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusSimplePlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1702) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign CsrPlugin_allowEbreakException = 1'b1;
  assign CsrPlugin_xretAwayFromMachine = 1'b0;
  assign BranchPlugin_inDebugNoFetchFlag = 1'b0;
  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != 3'b000);
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = _zz_IBusSimplePlugin_jump_pcLoad_payload_1[1];
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_3 = _zz_IBusSimplePlugin_jump_pcLoad_payload_1[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_IBusSimplePlugin_jump_pcLoad_payload_4;
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_fetchPc_inc) begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @(*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(when_Fetcher_l194) begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_IBusSimplePlugin_decodePc_pcPlus);
  assign IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
  assign when_Fetcher_l182 = (decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode));
  assign when_Fetcher_l194 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if(when_IBusSimplePlugin_l305) begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid);
  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_bufferValidPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_bufferValid : IBusSimplePlugin_decompressor_bufferValidLatch);
  assign IBusSimplePlugin_decompressor_throw2BytesPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_throw2Bytes : IBusSimplePlugin_decompressor_throw2BytesLatch);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValidPatched ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2BytesPatched ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_IBusSimplePlugin_decompressor_decompressed = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @(*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h00000000;
    case(switch_Misc_l44)
      5'h00 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_IBusSimplePlugin_decompressor_decompressed[10 : 7]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 11]},_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00},5'h02},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h13};
        if(when_Misc_l47) begin
          IBusSimplePlugin_decompressor_decompressed = 32'h00000000;
        end
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_3,_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_2},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_3[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed_2},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_3[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_8[20],_zz_IBusSimplePlugin_decompressor_decompressed_8[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_8[11]},_zz_IBusSimplePlugin_decompressor_decompressed_8[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_20},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_IBusSimplePlugin_decompressor_decompressed_5,5'h00},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7] == 5'h02) ? {{{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_12,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]},_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},4'b0000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13} : {{_zz_IBusSimplePlugin_decompressor_decompressed_27[31 : 12],_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] == 2'b10) ? _zz_IBusSimplePlugin_decompressor_decompressed_26 : {{1'b0,(_zz_IBusSimplePlugin_decompressor_decompressed_28 || _zz_IBusSimplePlugin_decompressor_decompressed_29)},5'h00}),(((! _zz_IBusSimplePlugin_decompressor_decompressed[11]) || _zz_IBusSimplePlugin_decompressor_decompressed_22) ? _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] : _zz_IBusSimplePlugin_decompressor_decompressed_2)},_zz_IBusSimplePlugin_decompressor_decompressed_1},_zz_IBusSimplePlugin_decompressor_decompressed_24},_zz_IBusSimplePlugin_decompressor_decompressed_1},(_zz_IBusSimplePlugin_decompressor_decompressed_22 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_15[20],_zz_IBusSimplePlugin_decompressor_decompressed_15[10 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_15[11]},_zz_IBusSimplePlugin_decompressor_decompressed_15[19 : 12]},_zz_IBusSimplePlugin_decompressor_decompressed_19},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_18[12],_zz_IBusSimplePlugin_decompressor_decompressed_18[10 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed_19},_zz_IBusSimplePlugin_decompressor_decompressed_1},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed_18[4 : 1]},_zz_IBusSimplePlugin_decompressor_decompressed_18[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h00,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b001},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_IBusSimplePlugin_decompressor_decompressed[3 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed[12]},_zz_IBusSimplePlugin_decompressor_decompressed[6 : 4]},2'b00},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_IBusSimplePlugin_decompressor_decompressed[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2] == 5'h00) ? {{{{12'h000,_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},3'b000},(_zz_IBusSimplePlugin_decompressor_decompressed[12] ? _zz_IBusSimplePlugin_decompressor_decompressed_20 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},7'h67} : {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_30,_zz_IBusSimplePlugin_decompressor_decompressed_31},(_zz_IBusSimplePlugin_decompressor_decompressed_32 ? _zz_IBusSimplePlugin_decompressor_decompressed_33 : _zz_IBusSimplePlugin_decompressor_decompressed_19)},3'b000},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_34[11 : 5],_zz_IBusSimplePlugin_decompressor_decompressed[6 : 2]},_zz_IBusSimplePlugin_decompressor_decompressed_21},3'b010},_zz_IBusSimplePlugin_decompressor_decompressed_35[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_1 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[9 : 7]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_2 = {2'b01,_zz_IBusSimplePlugin_decompressor_decompressed[4 : 2]};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_3 = {{{{5'h00,_zz_IBusSimplePlugin_decompressor_decompressed[5]},_zz_IBusSimplePlugin_decompressor_decompressed[12 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},2'b00};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_4 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_5[11] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[10] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[9] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[8] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[7] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[6] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[5] = _zz_IBusSimplePlugin_decompressor_decompressed_4;
    _zz_IBusSimplePlugin_decompressor_decompressed_5[4 : 0] = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 2];
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_6 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_7[9] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[8] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[7] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[6] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[5] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[4] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[3] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[2] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[1] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
    _zz_IBusSimplePlugin_decompressor_decompressed_7[0] = _zz_IBusSimplePlugin_decompressor_decompressed_6;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_8 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_7,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_9 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_10[14] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[13] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[12] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[11] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[10] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[9] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[8] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[7] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[6] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[5] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[4] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[3] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[2] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[1] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
    _zz_IBusSimplePlugin_decompressor_decompressed_10[0] = _zz_IBusSimplePlugin_decompressor_decompressed_9;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_11 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_12[2] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[1] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
    _zz_IBusSimplePlugin_decompressor_decompressed_12[0] = _zz_IBusSimplePlugin_decompressor_decompressed_11;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_13 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_14[9] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[8] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[7] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[6] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[5] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[4] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[3] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[2] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[1] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
    _zz_IBusSimplePlugin_decompressor_decompressed_14[0] = _zz_IBusSimplePlugin_decompressor_decompressed_13;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_15 = {{{{{{{{_zz_IBusSimplePlugin_decompressor_decompressed_14,_zz_IBusSimplePlugin_decompressor_decompressed[8]},_zz_IBusSimplePlugin_decompressor_decompressed[10 : 9]},_zz_IBusSimplePlugin_decompressor_decompressed[6]},_zz_IBusSimplePlugin_decompressor_decompressed[7]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11]},_zz_IBusSimplePlugin_decompressor_decompressed[5 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_16 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_17[4] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[3] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[2] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[1] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
    _zz_IBusSimplePlugin_decompressor_decompressed_17[0] = _zz_IBusSimplePlugin_decompressor_decompressed_16;
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_18 = {{{{{_zz_IBusSimplePlugin_decompressor_decompressed_17,_zz_IBusSimplePlugin_decompressor_decompressed[6 : 5]},_zz_IBusSimplePlugin_decompressor_decompressed[2]},_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10]},_zz_IBusSimplePlugin_decompressor_decompressed[4 : 3]},1'b0};
  assign _zz_IBusSimplePlugin_decompressor_decompressed_19 = 5'h00;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_20 = 5'h01;
  assign _zz_IBusSimplePlugin_decompressor_decompressed_21 = 5'h02;
  assign switch_Misc_l44 = {_zz_IBusSimplePlugin_decompressor_decompressed[1 : 0],_zz_IBusSimplePlugin_decompressor_decompressed[15 : 13]};
  assign when_Misc_l47 = (_zz_IBusSimplePlugin_decompressor_decompressed[12 : 2] == 11'h000);
  assign _zz_IBusSimplePlugin_decompressor_decompressed_22 = (_zz_IBusSimplePlugin_decompressor_decompressed[11 : 10] != 2'b11);
  assign switch_Misc_l232 = _zz_IBusSimplePlugin_decompressor_decompressed[11 : 10];
  assign switch_Misc_l232_1 = _zz_IBusSimplePlugin_decompressor_decompressed[6 : 5];
  always @(*) begin
    case(switch_Misc_l232_1)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b000;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b100;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b110;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_23 = 3'b111;
      end
    endcase
  end

  always @(*) begin
    case(switch_Misc_l232)
      2'b00 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b101;
      end
      2'b10 : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = 3'b111;
      end
      default : begin
        _zz_IBusSimplePlugin_decompressor_decompressed_24 = _zz_IBusSimplePlugin_decompressor_decompressed_23;
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decompressor_decompressed_25 = _zz_IBusSimplePlugin_decompressor_decompressed[12];
  always @(*) begin
    _zz_IBusSimplePlugin_decompressor_decompressed_26[6] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[5] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[4] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[3] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[2] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[1] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
    _zz_IBusSimplePlugin_decompressor_decompressed_26[0] = _zz_IBusSimplePlugin_decompressor_decompressed_25;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_2_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_output_fire = (IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready);
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign when_Fetcher_l285 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l288 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign when_Fetcher_l293 = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent);
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l331 = (! 1'b0);
  assign when_Fetcher_l331_1 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_2 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_3 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    if(IBusSimplePlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload = _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[10] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[9] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[8] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[7] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[6] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[5] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[4] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[3] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[2] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[1] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[0] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[18] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[17] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[16] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[15] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[14] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[13] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[12] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[11] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[10] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[9] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[8] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[7] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[6] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[5] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[4] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[3] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[2] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[1] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[0] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusSimplePlugin_predictionJumpInterface_payload_1,{{{_zz_IBusSimplePlugin_predictionJumpInterface_payload_4,_zz_IBusSimplePlugin_predictionJumpInterface_payload_5},_zz_IBusSimplePlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusSimplePlugin_predictionJumpInterface_payload_3,{{{_zz_IBusSimplePlugin_predictionJumpInterface_payload_7,_zz_IBusSimplePlugin_predictionJumpInterface_payload_8},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign when_IBusSimplePlugin_l305 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmd_fire;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],2'b00};
  assign iBus_rsp_toStream_valid = iBus_rsp_valid;
  assign iBus_rsp_toStream_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_toStream_payload_inst = iBus_rsp_payload_inst;
  assign iBus_rsp_toStream_ready = IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = cpu_IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l376) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l376 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l435 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l489 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l232_2 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l232_2)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l565 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000000;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h00000008;
  assign _zz_when_CsrPlugin_l1302 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1302_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1302_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign when_CsrPlugin_l1296 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1302 = ((_zz_when_CsrPlugin_l1302 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_1 = ((_zz_when_CsrPlugin_l1302_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_2 = ((_zz_when_CsrPlugin_l1302_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1335 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1335_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1335_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1340 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1390 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1398 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1456 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1460 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1527 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2816) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2944) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1725) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1547) begin
      if(when_CsrPlugin_l1548) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1547 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1548 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l232_3 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l232_3)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1587 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1591 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_decode_IS_RS2_SIGNED_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_RS2_SIGNED_2 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_decode_IS_RS2_SIGNED_3 = ((decode_INSTRUCTION & 32'h00000018) == 32'h00000000);
  assign _zz_decode_IS_RS2_SIGNED_4 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_RS2_SIGNED_5 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_RS2_SIGNED_6 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00000000);
  assign _zz_decode_IS_RS2_SIGNED = {(|{_zz_decode_IS_RS2_SIGNED_5,(_zz__zz_decode_IS_RS2_SIGNED == _zz__zz_decode_IS_RS2_SIGNED_1)}),{(|(_zz__zz_decode_IS_RS2_SIGNED_2 == _zz__zz_decode_IS_RS2_SIGNED_3)),{(|_zz_decode_IS_RS2_SIGNED_6),{(|_zz__zz_decode_IS_RS2_SIGNED_4),{_zz__zz_decode_IS_RS2_SIGNED_5,{_zz__zz_decode_IS_RS2_SIGNED_6,_zz__zz_decode_IS_RS2_SIGNED_8}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_RS2_SIGNED[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_RS2_SIGNED[6 : 5];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_RS2_SIGNED[14 : 14];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_RS2_SIGNED[16 : 15];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_RS2_SIGNED[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_RS2_SIGNED[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_RS2_SIGNED[28 : 27];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h00);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_5) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_5) begin
      lastStageRegFileWrite_payload_address = 5'h00;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_5) begin
      lastStageRegFileWrite_payload_data = 32'h00000000;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_decode_SRC1 = _zz_decode_to_execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_decode_SRC1 = {29'd0, _zz__zz_decode_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_decode_SRC1 = {decode_INSTRUCTION[31 : 12],12'h000};
      end
      default : begin
        _zz_decode_SRC1 = {27'd0, _zz__zz_decode_SRC1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_1[19] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[18] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[17] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[16] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[15] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[14] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[13] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[12] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[11] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[10] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[9] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[8] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[7] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[6] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[5] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[4] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[3] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[2] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[1] = _zz_decode_SRC2;
    _zz_decode_SRC2_1[0] = _zz_decode_SRC2;
  end

  assign _zz_decode_SRC2_2 = _zz__zz_decode_SRC2_2[11];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_1,decode_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_decode_SRC2_4 = {_zz_decode_SRC2_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_4 = _zz_decode_to_execute_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulSimplePlugin_a = execute_SRC1;
  assign execute_MulSimplePlugin_b = execute_SRC2;
  assign switch_MulSimplePlugin_l50 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulSimplePlugin_l50)
      2'b01 : begin
        execute_MulSimplePlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulSimplePlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulSimplePlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulSimplePlugin_l50)
      2'b01 : begin
        execute_MulSimplePlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulSimplePlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulSimplePlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign when_MulSimplePlugin_l80 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulSimplePlugin_l81 = writeBack_INSTRUCTION[13 : 12];
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_DivPlugin_div_counter_willOverflow) begin
      memory_DivPlugin_div_counter_valueNext = 6'h00;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_memory_DivPlugin_div_counter_valueNext);
    end
    if(memory_DivPlugin_div_counter_willClear) begin
      memory_DivPlugin_div_counter_valueNext = 6'h00;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_memory_DivPlugin_div_stage_0_remainderShifted = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_memory_DivPlugin_div_stage_0_remainderShifted[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_DivPlugin_div_stage_0_outRemainder : _zz_memory_DivPlugin_div_stage_0_outRemainder_1);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_memory_DivPlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign _zz_memory_DivPlugin_div_result = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_DivPlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_DivPlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_DivPlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_DivPlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l232_4 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l232_4)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_7,_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED1) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_9};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_15 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_25 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_26 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_27 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign when_Pipeline_l124_33 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign when_CsrPlugin_l1669 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_4 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1031 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h00000000;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h00000000;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h00000000;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h00000000;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h00000000;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3)) | _zz_CsrPlugin_csrMapping_readDataInit_4);
  assign when_CsrPlugin_l1702 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1709 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1709 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1709 == 12'hb00) || (((_zz_when_CsrPlugin_l1709 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1719 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1717) begin
      when_CsrPlugin_l1719 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1717 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1725 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_flush = 1'b0;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h00000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'h00000000;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_mcycle <= 64'h0000000000000000;
      CsrPlugin_minstret <= 64'h0000000000000000;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_5 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h00;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(when_Fetcher_l182) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(when_Fetcher_l194) begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= 1'b0;
      end
      if(_zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_input_valid_1 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if(IBusSimplePlugin_decompressor_output_fire) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if(when_Fetcher_l285) begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(when_Fetcher_l288) begin
        if(IBusSimplePlugin_decompressor_bufferFill) begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if(when_Fetcher_l293) begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(when_Fetcher_l331) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= IBusSimplePlugin_pending_next;
      end
      CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1296) begin
        if(when_CsrPlugin_l1302) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1335) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1335_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1335_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1340) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1390) begin
        if(when_CsrPlugin_l1398) begin
          case(CsrPlugin_targetPrivilege)
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1456) begin
        case(switch_CsrPlugin_l1460)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_when_CsrPlugin_l1302_2,{_zz_when_CsrPlugin_l1302_1,_zz_when_CsrPlugin_l1302}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_5 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1031)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            default : begin
            end
          endcase
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_2816) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[31 : 0] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2944) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mcycle[63 : 32] <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
    end
  end

  always @(posedge main_clk) begin
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_bufferValidLatch <= IBusSimplePlugin_decompressor_bufferValid;
    end
    if(IBusSimplePlugin_decompressor_input_valid) begin
      IBusSimplePlugin_decompressor_throw2BytesLatch <= IBusSimplePlugin_decompressor_throw2Bytes;
    end
    if(when_Fetcher_l288) begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    if(when_CsrPlugin_l1296) begin
      if(when_CsrPlugin_l1302) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1390) begin
      if(when_CsrPlugin_l1398) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= decode_PC;
          end
          default : begin
          end
        endcase
      end
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_DivPlugin_div_result <= _zz_memory_DivPlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_accumulator <= 65'h00000000000000000;
      memory_DivPlugin_rs1 <= ((_zz_memory_DivPlugin_rs1 ? (~ _zz_memory_DivPlugin_rs1_1) : _zz_memory_DivPlugin_rs1_1) + _zz_memory_DivPlugin_rs1_2);
      memory_DivPlugin_rs2 <= ((_zz_memory_DivPlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_DivPlugin_rs2_1);
      memory_DivPlugin_div_needRevert <= ((_zz_memory_DivPlugin_rs1 ^ (_zz_memory_DivPlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h00000000) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_to_execute_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if(when_Pipeline_l124_7) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_13) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_23) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_25) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_26) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_33) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_37) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_RS1 <= _zz_decode_to_execute_RS1;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_RS2 <= _zz_decode_to_execute_RS2;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED1 <= decode_PREDICTION_HAD_BRANCHED1;
    end
    if(when_Pipeline_l124_47) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_48) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_49) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_50) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_51) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_MUL_OPA <= execute_MUL_OPA;
    end
    if(when_Pipeline_l124_53) begin
      execute_to_memory_MUL_OPB <= execute_MUL_OPB;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_55) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_56) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_Pipeline_l124_57) begin
      memory_to_writeBack_MUL <= memory_MUL;
    end
    if(when_CsrPlugin_l1669) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1669_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1669_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1669_3) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1669_4) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
  end


endmodule

module CCMasterArbiter (
  input  wire          io_iBus_cmd_valid,
  output reg           io_iBus_cmd_ready,
  input  wire [31:0]   io_iBus_cmd_payload_pc,
  output wire          io_iBus_rsp_valid,
  output wire          io_iBus_rsp_payload_error,
  output wire [31:0]   io_iBus_rsp_payload_inst,
  input  wire          io_dBus_cmd_valid,
  output reg           io_dBus_cmd_ready,
  input  wire          io_dBus_cmd_payload_wr,
  input  wire [31:0]   io_dBus_cmd_payload_address,
  input  wire [31:0]   io_dBus_cmd_payload_data,
  input  wire [1:0]    io_dBus_cmd_payload_size,
  output wire          io_dBus_rsp_ready,
  output wire          io_dBus_rsp_error,
  output wire [31:0]   io_dBus_rsp_data,
  output reg           io_masterBus_cmd_valid,
  input  wire          io_masterBus_cmd_ready,
  output wire          io_masterBus_cmd_payload_write,
  output wire [31:0]   io_masterBus_cmd_payload_address,
  output wire [31:0]   io_masterBus_cmd_payload_data,
  output wire [3:0]    io_masterBus_cmd_payload_mask,
  input  wire          io_masterBus_rsp_valid,
  input  wire [31:0]   io_masterBus_rsp_payload_data,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg        [3:0]    _zz_io_masterBus_cmd_payload_mask;
  reg                 rspPending;
  reg                 rspTarget;
  wire                io_masterBus_cmd_fire;
  wire                when_CCBlocks_l38;
  wire                when_CCBlocks_l43;

  always @(*) begin
    io_masterBus_cmd_valid = (io_iBus_cmd_valid || io_dBus_cmd_valid);
    if(when_CCBlocks_l43) begin
      io_masterBus_cmd_valid = 1'b0;
    end
  end

  assign io_masterBus_cmd_payload_write = (io_dBus_cmd_valid && io_dBus_cmd_payload_wr);
  assign io_masterBus_cmd_payload_address = (io_dBus_cmd_valid ? io_dBus_cmd_payload_address : io_iBus_cmd_payload_pc);
  assign io_masterBus_cmd_payload_data = io_dBus_cmd_payload_data;
  always @(*) begin
    case(io_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b0011;
      end
      default : begin
        _zz_io_masterBus_cmd_payload_mask = 4'b1111;
      end
    endcase
  end

  assign io_masterBus_cmd_payload_mask = (_zz_io_masterBus_cmd_payload_mask <<< io_dBus_cmd_payload_address[1 : 0]);
  always @(*) begin
    io_iBus_cmd_ready = (io_masterBus_cmd_ready && (! io_dBus_cmd_valid));
    if(when_CCBlocks_l43) begin
      io_iBus_cmd_ready = 1'b0;
    end
  end

  always @(*) begin
    io_dBus_cmd_ready = io_masterBus_cmd_ready;
    if(when_CCBlocks_l43) begin
      io_dBus_cmd_ready = 1'b0;
    end
  end

  assign io_masterBus_cmd_fire = (io_masterBus_cmd_valid && io_masterBus_cmd_ready);
  assign when_CCBlocks_l38 = (io_masterBus_cmd_fire && (! io_masterBus_cmd_payload_write));
  assign when_CCBlocks_l43 = (rspPending && (! io_masterBus_rsp_valid));
  assign io_iBus_rsp_valid = (io_masterBus_rsp_valid && (! rspTarget));
  assign io_iBus_rsp_payload_inst = io_masterBus_rsp_payload_data;
  assign io_iBus_rsp_payload_error = 1'b0;
  assign io_dBus_rsp_ready = (io_masterBus_rsp_valid && rspTarget);
  assign io_dBus_rsp_data = io_masterBus_rsp_payload_data;
  assign io_dBus_rsp_error = 1'b0;
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      rspPending <= 1'b0;
      rspTarget <= 1'b0;
    end else begin
      if(io_masterBus_rsp_valid) begin
        rspPending <= 1'b0;
      end
      if(when_CCBlocks_l38) begin
        rspTarget <= io_dBus_cmd_valid;
        rspPending <= 1'b1;
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_error,
  output wire [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [0:0]    io_occupancy,
  output wire [0:0]    io_availability,
  input  wire          main_clk,
  input  wire          main_reset_
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire                fifo_io_pop_payload_error;
  wire       [31:0]   fifo_io_pop_payload_inst;
  wire       [0:0]    fifo_io_occupancy;
  wire       [0:0]    fifo_io_availability;

  StreamFifo_1 fifo (
    .io_push_valid         (io_push_valid                 ), //i
    .io_push_ready         (fifo_io_push_ready            ), //o
    .io_push_payload_error (io_push_payload_error         ), //i
    .io_push_payload_inst  (io_push_payload_inst[31:0]    ), //i
    .io_pop_valid          (fifo_io_pop_valid             ), //o
    .io_pop_ready          (io_pop_ready                  ), //i
    .io_pop_payload_error  (fifo_io_pop_payload_error     ), //o
    .io_pop_payload_inst   (fifo_io_pop_payload_inst[31:0]), //o
    .io_flush              (io_flush                      ), //i
    .io_occupancy          (fifo_io_occupancy             ), //o
    .io_availability       (fifo_io_availability          ), //o
    .main_clk              (main_clk                      ), //i
    .main_reset_           (main_reset_                   )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload_error = fifo_io_pop_payload_error;
  assign io_pop_payload_inst = fifo_io_pop_payload_inst;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamFifo_1 (
  input  wire          io_push_valid,
  output reg           io_push_ready,
  input  wire          io_push_payload_error,
  input  wire [31:0]   io_push_payload_inst,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg           io_pop_payload_error,
  output reg  [31:0]   io_pop_payload_inst,
  input  wire          io_flush,
  output wire [0:0]    io_occupancy,
  output wire [0:0]    io_availability,
  input  wire          main_clk,
  input  wire          main_reset_
);

  reg                 oneStage_doFlush;
  wire                oneStage_buffer_valid;
  wire                oneStage_buffer_ready;
  wire                oneStage_buffer_payload_error;
  wire       [31:0]   oneStage_buffer_payload_inst;
  reg                 io_push_rValid;
  reg                 io_push_rData_error;
  reg        [31:0]   io_push_rData_inst;
  wire                when_Stream_l369;
  wire                when_Stream_l1187;

  always @(*) begin
    oneStage_doFlush = io_flush;
    if(when_Stream_l1187) begin
      if(io_pop_ready) begin
        oneStage_doFlush = 1'b1;
      end
    end
  end

  always @(*) begin
    io_push_ready = oneStage_buffer_ready;
    if(when_Stream_l369) begin
      io_push_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! oneStage_buffer_valid);
  assign oneStage_buffer_valid = io_push_rValid;
  assign oneStage_buffer_payload_error = io_push_rData_error;
  assign oneStage_buffer_payload_inst = io_push_rData_inst;
  always @(*) begin
    io_pop_valid = oneStage_buffer_valid;
    if(when_Stream_l1187) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign oneStage_buffer_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload_error = oneStage_buffer_payload_error;
    if(when_Stream_l1187) begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    io_pop_payload_inst = oneStage_buffer_payload_inst;
    if(when_Stream_l1187) begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = oneStage_buffer_valid;
  assign io_availability = (! oneStage_buffer_valid);
  assign when_Stream_l1187 = (! oneStage_buffer_valid);
  always @(posedge main_clk or negedge main_reset_) begin
    if(!main_reset_) begin
      io_push_rValid <= 1'b0;
    end else begin
      if(io_push_ready) begin
        io_push_rValid <= io_push_valid;
      end
      if(oneStage_doFlush) begin
        io_push_rValid <= 1'b0;
      end
    end
  end

  always @(posedge main_clk) begin
    if(io_push_ready) begin
      io_push_rData_error <= io_push_payload_error;
      io_push_rData_inst <= io_push_payload_inst;
    end
  end


endmodule
