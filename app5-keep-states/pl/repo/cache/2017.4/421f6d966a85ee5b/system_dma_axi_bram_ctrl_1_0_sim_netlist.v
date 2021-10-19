// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Thu Jul 22 14:18:04 2021
// Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_dma_axi_bram_ctrl_1_0_sim_netlist.v
// Design      : system_dma_axi_bram_ctrl_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl
   (s_axi_rlast,
    Q,
    bram_rst_a,
    s_axi_rvalid,
    bram_addr_a,
    s_axi_bvalid,
    bram_wrdata_a,
    s_axi_rdata,
    s_axi_awready,
    s_axi_arready,
    bram_we_a,
    bram_en_a,
    s_axi_wready,
    s_axi_wvalid,
    s_axi_wlast,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_arvalid,
    s_axi_arburst,
    s_axi_aclk,
    s_axi_awlen,
    s_axi_bready,
    s_axi_wstrb,
    s_axi_wdata,
    bram_rddata_a,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_awaddr,
    s_axi_awburst);
  output s_axi_rlast;
  output [9:0]Q;
  output bram_rst_a;
  output s_axi_rvalid;
  output [2:0]bram_addr_a;
  output s_axi_bvalid;
  output [31:0]bram_wrdata_a;
  output [31:0]s_axi_rdata;
  output s_axi_awready;
  output s_axi_arready;
  output [3:0]bram_we_a;
  output bram_en_a;
  output s_axi_wready;
  input s_axi_wvalid;
  input s_axi_wlast;
  input s_axi_rready;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [1:0]s_axi_arburst;
  input s_axi_aclk;
  input [3:0]s_axi_awlen;
  input s_axi_bready;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input [31:0]bram_rddata_a;
  input [12:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [12:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;

  wire [9:0]Q;
  wire [2:0]bram_addr_a;
  wire bram_en_a;
  wire [31:0]bram_rddata_a;
  wire bram_rst_a;
  wire [3:0]bram_we_a;
  wire [31:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top \gext_inst.abcv4_0_ext_inst 
       (.BRAM_Addr_A(Q),
        .SR(bram_rst_a),
        .bram_addr_a(bram_addr_a),
        .bram_en_a(bram_en_a),
        .bram_rddata_a(bram_rddata_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl_top
   (s_axi_rlast,
    BRAM_Addr_A,
    SR,
    s_axi_rvalid,
    bram_addr_a,
    s_axi_bvalid,
    bram_wrdata_a,
    s_axi_rdata,
    s_axi_awready,
    s_axi_arready,
    bram_we_a,
    bram_en_a,
    s_axi_wready,
    s_axi_wvalid,
    s_axi_wlast,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_arvalid,
    s_axi_arburst,
    s_axi_aclk,
    s_axi_awlen,
    s_axi_bready,
    s_axi_wstrb,
    s_axi_wdata,
    bram_rddata_a,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_awaddr,
    s_axi_awburst);
  output s_axi_rlast;
  output [9:0]BRAM_Addr_A;
  output [0:0]SR;
  output s_axi_rvalid;
  output [2:0]bram_addr_a;
  output s_axi_bvalid;
  output [31:0]bram_wrdata_a;
  output [31:0]s_axi_rdata;
  output s_axi_awready;
  output s_axi_arready;
  output [3:0]bram_we_a;
  output bram_en_a;
  output s_axi_wready;
  input s_axi_wvalid;
  input s_axi_wlast;
  input s_axi_rready;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [1:0]s_axi_arburst;
  input s_axi_aclk;
  input [3:0]s_axi_awlen;
  input s_axi_bready;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input [31:0]bram_rddata_a;
  input [12:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [12:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;

  wire [9:0]BRAM_Addr_A;
  wire [0:0]SR;
  wire [2:0]bram_addr_a;
  wire bram_en_a;
  wire [31:0]bram_rddata_a;
  wire [3:0]bram_we_a;
  wire [31:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi \GEN_AXI4.I_FULL_AXI 
       (.Q(BRAM_Addr_A),
        .bram_addr_a(bram_addr_a),
        .bram_en_a(bram_en_a),
        .bram_rddata_a(bram_rddata_a),
        .bram_rst_a(SR),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_full_axi
   (s_axi_rlast,
    Q,
    bram_rst_a,
    s_axi_rvalid,
    bram_addr_a,
    s_axi_bvalid,
    bram_wrdata_a,
    s_axi_rdata,
    s_axi_awready,
    s_axi_arready,
    bram_we_a,
    bram_en_a,
    s_axi_wready,
    s_axi_wvalid,
    s_axi_wlast,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_arvalid,
    s_axi_arburst,
    s_axi_aclk,
    s_axi_awlen,
    s_axi_bready,
    s_axi_wstrb,
    s_axi_wdata,
    bram_rddata_a,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_awaddr,
    s_axi_awburst);
  output s_axi_rlast;
  output [9:0]Q;
  output bram_rst_a;
  output s_axi_rvalid;
  output [2:0]bram_addr_a;
  output s_axi_bvalid;
  output [31:0]bram_wrdata_a;
  output [31:0]s_axi_rdata;
  output s_axi_awready;
  output s_axi_arready;
  output [3:0]bram_we_a;
  output bram_en_a;
  output s_axi_wready;
  input s_axi_wvalid;
  input s_axi_wlast;
  input s_axi_rready;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [1:0]s_axi_arburst;
  input s_axi_aclk;
  input [3:0]s_axi_awlen;
  input s_axi_bready;
  input [3:0]s_axi_wstrb;
  input [31:0]s_axi_wdata;
  input [31:0]bram_rddata_a;
  input [12:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [12:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;

  wire \ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[13]_i_1_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[14]_i_1_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[4]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[7]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ;
  wire \GEN_ARB.I_SNG_PORT_n_6 ;
  wire \GEN_ARB.I_SNG_PORT_n_8 ;
  wire I_RD_CHNL_n_37;
  wire I_RD_CHNL_n_38;
  wire I_RD_CHNL_n_39;
  wire I_RD_CHNL_n_40;
  wire I_RD_CHNL_n_41;
  wire I_RD_CHNL_n_42;
  wire I_RD_CHNL_n_43;
  wire I_RD_CHNL_n_44;
  wire I_RD_CHNL_n_45;
  wire I_RD_CHNL_n_46;
  wire I_RD_CHNL_n_51;
  wire I_RD_CHNL_n_52;
  wire I_RD_CHNL_n_53;
  wire I_RD_CHNL_n_54;
  wire I_WR_CHNL_n_36;
  wire I_WR_CHNL_n_37;
  wire I_WR_CHNL_n_38;
  wire I_WR_CHNL_n_39;
  wire I_WR_CHNL_n_40;
  wire I_WR_CHNL_n_41;
  wire I_WR_CHNL_n_54;
  wire I_WR_CHNL_n_55;
  wire I_WR_CHNL_n_56;
  wire [9:0]Q;
  wire [12:10]RdChnl_BRAM_Addr_Ld;
  wire ar_active_d1;
  wire ar_active_re;
  wire [1:0]arb_sm_cs;
  wire aw_active_d1;
  wire aw_active_re;
  wire [2:0]bram_addr_a;
  wire bram_en_a;
  wire [31:0]bram_rddata_a;
  wire bram_rst_a;
  wire [3:0]bram_we_a;
  wire [31:0]bram_wrdata_a;
  wire curr_fixed_burst_reg;
  wire p_0_out;
  wire [11:0]p_1_in;
  wire p_1_out;
  wire [3:0]p_6_in;
  wire p_7_in;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire sng_bram_addr_ld_en;

  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \ADDR_SNG_PORT.bram_addr_int[10]_i_2 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(I_RD_CHNL_n_51),
        .I4(Q[6]),
        .O(\ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_6 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(I_RD_CHNL_n_51),
        .I3(Q[4]),
        .I4(Q[5]),
        .I5(Q[7]),
        .O(\ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \ADDR_SNG_PORT.bram_addr_int[12]_i_1 
       (.I0(bram_addr_a[0]),
        .I1(sng_bram_addr_ld_en),
        .I2(p_1_in[9]),
        .I3(p_0_out),
        .I4(RdChnl_BRAM_Addr_Ld[10]),
        .I5(I_WR_CHNL_n_39),
        .O(\ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \ADDR_SNG_PORT.bram_addr_int[13]_i_1 
       (.I0(bram_addr_a[1]),
        .I1(sng_bram_addr_ld_en),
        .I2(p_1_in[10]),
        .I3(p_0_out),
        .I4(RdChnl_BRAM_Addr_Ld[11]),
        .I5(I_WR_CHNL_n_39),
        .O(\ADDR_SNG_PORT.bram_addr_int[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    \ADDR_SNG_PORT.bram_addr_int[14]_i_1 
       (.I0(bram_addr_a[2]),
        .I1(sng_bram_addr_ld_en),
        .I2(p_1_in[11]),
        .I3(p_0_out),
        .I4(RdChnl_BRAM_Addr_Ld[12]),
        .I5(I_WR_CHNL_n_39),
        .O(\ADDR_SNG_PORT.bram_addr_int[14]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ADDR_SNG_PORT.bram_addr_int[4]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\ADDR_SNG_PORT.bram_addr_int[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \ADDR_SNG_PORT.bram_addr_int[5]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \ADDR_SNG_PORT.bram_addr_int[7]_i_2 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[4]),
        .O(\ADDR_SNG_PORT.bram_addr_int[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \ADDR_SNG_PORT.bram_addr_int[8]_i_2 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \ADDR_SNG_PORT.bram_addr_int[9]_i_2 
       (.I0(Q[6]),
        .I1(I_RD_CHNL_n_51),
        .I2(Q[4]),
        .I3(Q[5]),
        .O(\ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_38),
        .Q(Q[8]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_37),
        .Q(Q[9]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ADDR_SNG_PORT.bram_addr_int[12]_i_1_n_0 ),
        .Q(bram_addr_a[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ADDR_SNG_PORT.bram_addr_int[13]_i_1_n_0 ),
        .Q(bram_addr_a[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ADDR_SNG_PORT.bram_addr_int[14]_i_1_n_0 ),
        .Q(bram_addr_a[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_46),
        .Q(Q[0]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_45),
        .Q(Q[1]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_44),
        .Q(Q[2]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_43),
        .Q(Q[3]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_42),
        .Q(Q[4]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_41),
        .Q(Q[5]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_40),
        .Q(Q[6]),
        .R(I_WR_CHNL_n_39));
  FDRE #(
    .INIT(1'b0)) 
    \ADDR_SNG_PORT.bram_addr_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(I_RD_CHNL_n_52),
        .D(I_RD_CHNL_n_39),
        .Q(Q[7]),
        .R(I_WR_CHNL_n_39));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sng_port_arb \GEN_ARB.I_SNG_PORT 
       (.E(aw_active_re),
        .\GEN_AR_SNG.ar_active_d1_reg (\GEN_ARB.I_SNG_PORT_n_8 ),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] (I_WR_CHNL_n_54),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] (I_WR_CHNL_n_37),
        .Q(p_6_in),
        .SR(bram_rst_a),
        .ar_active_d1(ar_active_d1),
        .ar_active_re(ar_active_re),
        .arb_sm_cs(arb_sm_cs),
        .\arb_sm_cs_reg[1]_0 (I_WR_CHNL_n_38),
        .aw_active_d1(aw_active_d1),
        .axi_rlast_int_reg(s_axi_rlast),
        .axi_rlast_int_reg_0(I_RD_CHNL_n_54),
        .bram_we_a(bram_we_a),
        .brst_zero_reg(\GEN_ARB.I_SNG_PORT_n_6 ),
        .\bvalid_cnt_reg[0] (I_WR_CHNL_n_55),
        .\bvalid_cnt_reg[0]_0 (I_WR_CHNL_n_56),
        .p_0_out(p_0_out),
        .p_1_out(p_1_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .\s_axi_arlen[6] (I_RD_CHNL_n_53),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_rready(s_axi_rready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl I_RD_CHNL
       (.\ADDR_SNG_PORT.bram_addr_int_reg[10] (\ADDR_SNG_PORT.bram_addr_int[11]_i_6_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2] (\ADDR_SNG_PORT.bram_addr_int[4]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[4] (\ADDR_SNG_PORT.bram_addr_int[5]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[5] (\ADDR_SNG_PORT.bram_addr_int[7]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (I_RD_CHNL_n_51),
        .\ADDR_SNG_PORT.bram_addr_int_reg[7] (\ADDR_SNG_PORT.bram_addr_int[8]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[8] (\ADDR_SNG_PORT.bram_addr_int[9]_i_2_n_0 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[9] (\ADDR_SNG_PORT.bram_addr_int[10]_i_2_n_0 ),
        .D({I_RD_CHNL_n_37,I_RD_CHNL_n_38,I_RD_CHNL_n_39,I_RD_CHNL_n_40,I_RD_CHNL_n_41,I_RD_CHNL_n_42,I_RD_CHNL_n_43,I_RD_CHNL_n_44,I_RD_CHNL_n_45,I_RD_CHNL_n_46}),
        .E(I_RD_CHNL_n_52),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] (I_WR_CHNL_n_36),
        .Q(Q),
        .SR(bram_rst_a),
        .ar_active_d1(ar_active_d1),
        .ar_active_re(ar_active_re),
        .ar_active_reg(\GEN_ARB.I_SNG_PORT_n_8 ),
        .ar_active_reg_0(\GEN_ARB.I_SNG_PORT_n_6 ),
        .\arb_sm_cs_reg[1] (I_RD_CHNL_n_54),
        .axi_rd_burst_reg_0(I_RD_CHNL_n_53),
        .bram_rddata_a(bram_rddata_a),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_wrap_burst_reg_reg_0(I_WR_CHNL_n_41),
        .curr_wrap_burst_reg_reg_1(I_WR_CHNL_n_40),
        .p_0_out(p_0_out),
        .p_7_in(p_7_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .\save_init_bram_addr_ld_reg[11] (p_1_in[8:0]),
        .\save_init_bram_addr_ld_reg[14] (RdChnl_BRAM_Addr_Ld),
        .sng_bram_addr_ld_en(sng_bram_addr_ld_en));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl I_WR_CHNL
       (.\ADDR_SNG_PORT.bram_addr_int_reg[11] (I_WR_CHNL_n_36),
        .\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 (I_WR_CHNL_n_39),
        .\ADDR_SNG_PORT.bram_addr_int_reg[11]_1 (I_WR_CHNL_n_40),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2] (I_WR_CHNL_n_41),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2]_0 (I_RD_CHNL_n_51),
        .D(p_1_in),
        .E(aw_active_re),
        .Q(Q[2:0]),
        .SR(bram_rst_a),
        .arb_sm_cs(arb_sm_cs),
        .\arb_sm_cs_reg[1] (I_WR_CHNL_n_54),
        .\arb_sm_cs_reg[1]_0 (I_WR_CHNL_n_56),
        .aw_active_d1(aw_active_d1),
        .aw_active_reg(I_WR_CHNL_n_37),
        .aw_active_reg_0(I_WR_CHNL_n_38),
        .bram_en_a(bram_en_a),
        .\bram_we_a[3] (p_6_in),
        .bram_wrdata_a(bram_wrdata_a),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .last_arb_won_reg(I_WR_CHNL_n_55),
        .p_1_out(p_1_out),
        .p_7_in(p_7_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rd_chnl
   (SR,
    s_axi_rdata,
    ar_active_d1,
    s_axi_rvalid,
    s_axi_rlast,
    p_7_in,
    D,
    \save_init_bram_addr_ld_reg[14] ,
    sng_bram_addr_ld_en,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    E,
    axi_rd_burst_reg_0,
    \arb_sm_cs_reg[1] ,
    s_axi_aclk,
    ar_active_re,
    ar_active_reg,
    s_axi_rready,
    s_axi_aresetn,
    s_axi_arburst,
    ar_active_reg_0,
    p_0_out,
    \save_init_bram_addr_ld_reg[11] ,
    Q,
    s_axi_araddr,
    \ADDR_SNG_PORT.bram_addr_int_reg[2] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[4] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[5] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[7] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[8] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[9] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[10] ,
    curr_wrap_burst_reg_reg_0,
    curr_fixed_burst_reg,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ,
    curr_wrap_burst_reg_reg_1,
    s_axi_arlen,
    bram_rddata_a);
  output [0:0]SR;
  output [31:0]s_axi_rdata;
  output ar_active_d1;
  output s_axi_rvalid;
  output s_axi_rlast;
  output p_7_in;
  output [9:0]D;
  output [2:0]\save_init_bram_addr_ld_reg[14] ;
  output sng_bram_addr_ld_en;
  output \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  output [0:0]E;
  output axi_rd_burst_reg_0;
  output \arb_sm_cs_reg[1] ;
  input s_axi_aclk;
  input ar_active_re;
  input ar_active_reg;
  input s_axi_rready;
  input s_axi_aresetn;
  input [1:0]s_axi_arburst;
  input ar_active_reg_0;
  input p_0_out;
  input [8:0]\save_init_bram_addr_ld_reg[11] ;
  input [9:0]Q;
  input [12:0]s_axi_araddr;
  input \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[4] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[5] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  input curr_wrap_burst_reg_reg_0;
  input curr_fixed_burst_reg;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  input curr_wrap_burst_reg_reg_1;
  input [7:0]s_axi_arlen;
  input [31:0]bram_rddata_a;

  wire \/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ;
  wire \/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ;
  wire \/i__n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[4] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[5] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  wire [9:0]D;
  wire [0:0]E;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ;
  wire \FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ;
  wire \FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ;
  wire \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_3_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ;
  wire \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  wire I_WRAP_BRST_n_11;
  wire [9:0]Q;
  wire [0:0]SR;
  wire act_rd_burst;
  wire act_rd_burst0;
  wire act_rd_burst_i_1_n_0;
  wire act_rd_burst_set;
  wire act_rd_burst_two;
  wire act_rd_burst_two_i_1_n_0;
  wire act_rd_burst_two_i_4_n_0;
  wire ar_active_d1;
  wire ar_active_re;
  wire ar_active_reg;
  wire ar_active_reg_0;
  wire \arb_sm_cs_reg[1] ;
  wire axi_rd_burst;
  wire axi_rd_burst_i_1_n_0;
  wire axi_rd_burst_i_2_n_0;
  wire axi_rd_burst_i_4_n_0;
  wire axi_rd_burst_reg_0;
  wire axi_rd_burst_two;
  wire axi_rd_burst_two_i_1_n_0;
  wire axi_rd_burst_two_reg_n_0;
  wire axi_rdata_en;
  wire axi_rlast_int_i_1_n_0;
  wire axi_rlast_set;
  wire axi_rvalid_clr_ok;
  wire axi_rvalid_clr_ok_i_1_n_0;
  wire axi_rvalid_clr_ok_i_2_n_0;
  wire axi_rvalid_int_i_1_n_0;
  wire axi_rvalid_set;
  wire axi_rvalid_set_cmb;
  wire bram_addr_inc;
  wire bram_en_int_i_1_n_0;
  wire bram_en_int_i_2_n_0;
  wire bram_en_int_i_3_n_0;
  wire bram_en_int_i_4_n_0;
  wire bram_en_int_i_5_n_0;
  wire bram_en_int_i_6_n_0;
  wire bram_en_int_i_7_n_0;
  wire [31:0]bram_rddata_a;
  wire [7:0]brst_cnt;
  wire \brst_cnt[0]_i_1_n_0 ;
  wire \brst_cnt[1]_i_1_n_0 ;
  wire \brst_cnt[2]_i_1_n_0 ;
  wire \brst_cnt[3]_i_1_n_0 ;
  wire \brst_cnt[4]_i_1_n_0 ;
  wire \brst_cnt[5]_i_1_n_0 ;
  wire \brst_cnt[5]_i_2_n_0 ;
  wire \brst_cnt[6]_i_1_n_0 ;
  wire \brst_cnt[7]_i_1_n_0 ;
  wire \brst_cnt[7]_i_2_n_0 ;
  wire \brst_cnt[7]_i_3_n_0 ;
  wire brst_cnt_max;
  wire brst_cnt_max_d1;
  wire brst_one;
  wire brst_one_i_1_n_0;
  wire brst_one_i_2_n_0;
  wire brst_one_i_3_n_0;
  wire brst_zero;
  wire brst_zero_i_1_n_0;
  wire brst_zero_i_2_n_0;
  wire curr_fixed_burst;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_0;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_1__0_n_0;
  wire curr_wrap_burst_reg_reg_0;
  wire curr_wrap_burst_reg_reg_1;
  wire disable_b2b_brst;
  wire disable_b2b_brst_cmb;
  wire disable_b2b_brst_i_2_n_0;
  wire disable_b2b_brst_i_3_n_0;
  wire end_brst_rd;
  wire end_brst_rd_clr;
  wire end_brst_rd_clr_i_1_n_0;
  wire end_brst_rd_i_1_n_0;
  wire last_bram_addr;
  wire last_bram_addr0;
  wire last_bram_addr_i_2_n_0;
  wire last_bram_addr_i_3_n_0;
  wire last_bram_addr_i_4_n_0;
  wire last_bram_addr_i_5_n_0;
  wire last_bram_addr_i_6_n_0;
  wire last_bram_addr_i_7_n_0;
  wire last_bram_addr_i_8_n_0;
  wire p_0_in4_in;
  wire p_0_out;
  wire p_7_in;
  wire pend_rd_op;
  wire pend_rd_op_i_1_n_0;
  wire pend_rd_op_i_2_n_0;
  wire pend_rd_op_i_3_n_0;
  wire pend_rd_op_i_4_n_0;
  wire rd_adv_buf24_out;
  (* RTL_KEEP = "yes" *) wire [3:0]rd_data_sm_cs;
  wire rd_data_sm_ns1;
  wire [31:0]rd_skid_buf;
  wire rd_skid_buf_ld;
  wire rd_skid_buf_ld_cmb;
  wire rd_skid_buf_ld_reg;
  wire rddata_mux_sel;
  wire rddata_mux_sel_i_1_n_0;
  wire rddata_mux_sel_i_2_n_0;
  wire rddata_mux_sel_i_3_n_0;
  (* RTL_KEEP = "yes" *) wire [2:0]rlast_sm_cs;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [8:0]\save_init_bram_addr_ld_reg[11] ;
  wire [2:0]\save_init_bram_addr_ld_reg[14] ;
  wire sng_bram_addr_ld_en;

  LUT6 #(
    .INIT(64'h0011001300130013)) 
    \/FSM_sequential_rlast_sm_cs[0]_i_2 
       (.I0(axi_rd_burst),
        .I1(rlast_sm_cs[1]),
        .I2(act_rd_burst_two),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(s_axi_rready),
        .I5(s_axi_rvalid),
        .O(\/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h003F007F003F0055)) 
    \/FSM_sequential_rlast_sm_cs[1]_i_2 
       (.I0(axi_rd_burst),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .I3(rlast_sm_cs[1]),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(act_rd_burst_two),
        .O(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF000F111F000E000)) 
    \/i_ 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[1]),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .I4(rlast_sm_cs[0]),
        .I5(last_bram_addr),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h00008080000F8080)) 
    \/i___0 
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(rlast_sm_cs[0]),
        .I3(rlast_sm_cs[1]),
        .I4(rlast_sm_cs[2]),
        .I5(s_axi_rlast),
        .O(axi_rlast_set));
  LUT2 #(
    .INIT(4'h2)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_5 
       (.I0(I_WRAP_BRST_n_11),
        .I1(rd_data_sm_cs[3]),
        .O(bram_addr_inc));
  LUT6 #(
    .INIT(64'h3033337730330044)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_1 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[3]),
        .I2(\FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[2]),
        .I5(\FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0E0E0303030FF)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_2 
       (.I0(pend_rd_op),
        .I1(ar_active_re),
        .I2(rd_adv_buf24_out),
        .I3(act_rd_burst),
        .I4(act_rd_burst_two),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8080808FFFFFFFFF)) 
    \FSM_sequential_rd_data_sm_cs[0]_i_3 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(rd_data_sm_cs[1]),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(axi_rd_burst),
        .I5(rd_data_sm_cs[0]),
        .O(\FSM_sequential_rd_data_sm_cs[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_1 
       (.I0(\FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ),
        .I1(rd_data_sm_cs[2]),
        .I2(\FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C38)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_2 
       (.I0(axi_rd_burst),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(axi_rd_burst_two_reg_n_0),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00FFDFFFDF00)) 
    \FSM_sequential_rd_data_sm_cs[1]_i_3 
       (.I0(ar_active_re),
        .I1(rd_data_sm_ns1),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_1 
       (.I0(\FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ),
        .I1(rd_data_sm_cs[2]),
        .I2(\FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ),
        .I3(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFC04)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_2 
       (.I0(axi_rd_burst),
        .I1(rd_data_sm_cs[0]),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FFDF0000FFDFFF)) 
    \FSM_sequential_rd_data_sm_cs[2]_i_3 
       (.I0(ar_active_re),
        .I1(rd_data_sm_ns1),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_1 
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_adv_buf24_out),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000028080000)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_2 
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_adv_buf24_out),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ),
        .I4(rd_data_sm_cs[0]),
        .I5(rd_data_sm_cs[3]),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFF5B5F5FFF5FFA0)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_3 
       (.I0(rd_data_sm_cs[2]),
        .I1(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[0]),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_4 
       (.I0(ar_active_d1),
        .I1(p_0_out),
        .I2(act_rd_burst),
        .I3(act_rd_burst_two),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_rd_data_sm_cs[3]_i_5 
       (.I0(end_brst_rd),
        .I1(brst_zero),
        .O(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[0]_i_1_n_0 ),
        .Q(rd_data_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[1]_i_1_n_0 ),
        .Q(rd_data_sm_cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[2]_i_1_n_0 ),
        .Q(rd_data_sm_cs[2]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:0000,sng_addr:0001,sec_addr:0010,full_pipe:0011,full_throttle:0100,last_addr:0101,last_throttle:0110,last_data:0111,last_data_ar_pend:1000" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rd_data_sm_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(\FSM_sequential_rd_data_sm_cs[3]_i_1_n_0 ),
        .D(\FSM_sequential_rd_data_sm_cs[3]_i_2_n_0 ),
        .Q(rd_data_sm_cs[3]),
        .R(SR));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \FSM_sequential_rlast_sm_cs[0]_i_1 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[0]),
        .I2(\/FSM_sequential_rlast_sm_cs[0]_i_2_n_0 ),
        .I3(\/i__n_0 ),
        .I4(rlast_sm_cs[0]),
        .O(\FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \FSM_sequential_rlast_sm_cs[1]_i_1 
       (.I0(rlast_sm_cs[2]),
        .I1(rlast_sm_cs[0]),
        .I2(\/FSM_sequential_rlast_sm_cs[1]_i_2_n_0 ),
        .I3(\/i__n_0 ),
        .I4(rlast_sm_cs[1]),
        .O(\FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00A4FFFF00A40000)) 
    \FSM_sequential_rlast_sm_cs[2]_i_1 
       (.I0(rlast_sm_cs[1]),
        .I1(p_0_in4_in),
        .I2(rlast_sm_cs[0]),
        .I3(rlast_sm_cs[2]),
        .I4(\/i__n_0 ),
        .I5(rlast_sm_cs[2]),
        .O(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_rlast_sm_cs[2]_i_2 
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_two_reg_n_0),
        .O(p_0_in4_in));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[0]_i_1_n_0 ),
        .Q(rlast_sm_cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[1]_i_1_n_0 ),
        .Q(rlast_sm_cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "idle:000,w8_throttle:010,w8_2nd_last_data:011,w8_last_data:100,w8_throttle_b2:001" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_rlast_sm_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_rlast_sm_cs[2]_i_1_n_0 ),
        .Q(rlast_sm_cs[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_AR_SNG.ar_active_d1_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ar_active_reg),
        .Q(ar_active_d1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF2000000F000F000)) 
    \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1 
       (.I0(brst_zero),
        .I1(pend_rd_op),
        .I2(brst_cnt_max),
        .I3(s_axi_aresetn),
        .I4(ar_active_d1),
        .I5(p_0_out),
        .O(\GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_BRST_MAX_WO_NARROW.brst_cnt_max_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BRST_MAX_WO_NARROW.brst_cnt_max_i_1_n_0 ),
        .Q(brst_cnt_max),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1 
       (.I0(rd_skid_buf[0]),
        .I1(bram_rddata_a[0]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[0].axi_rdata_int[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1 
       (.I0(rd_skid_buf[10]),
        .I1(bram_rddata_a[10]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[10].axi_rdata_int[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1 
       (.I0(rd_skid_buf[11]),
        .I1(bram_rddata_a[11]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[11].axi_rdata_int[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1 
       (.I0(rd_skid_buf[12]),
        .I1(bram_rddata_a[12]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[12].axi_rdata_int[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1 
       (.I0(rd_skid_buf[13]),
        .I1(bram_rddata_a[13]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[13].axi_rdata_int[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1 
       (.I0(rd_skid_buf[14]),
        .I1(bram_rddata_a[14]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[14].axi_rdata_int[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1 
       (.I0(rd_skid_buf[15]),
        .I1(bram_rddata_a[15]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[15].axi_rdata_int[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1 
       (.I0(rd_skid_buf[16]),
        .I1(bram_rddata_a[16]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[16].axi_rdata_int[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1 
       (.I0(rd_skid_buf[17]),
        .I1(bram_rddata_a[17]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[17].axi_rdata_int[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1 
       (.I0(rd_skid_buf[18]),
        .I1(bram_rddata_a[18]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[18].axi_rdata_int[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1 
       (.I0(rd_skid_buf[19]),
        .I1(bram_rddata_a[19]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[19].axi_rdata_int[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1 
       (.I0(rd_skid_buf[1]),
        .I1(bram_rddata_a[1]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[1].axi_rdata_int[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1 
       (.I0(rd_skid_buf[20]),
        .I1(bram_rddata_a[20]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[20].axi_rdata_int[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1 
       (.I0(rd_skid_buf[21]),
        .I1(bram_rddata_a[21]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[21].axi_rdata_int[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1 
       (.I0(rd_skid_buf[22]),
        .I1(bram_rddata_a[22]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[22].axi_rdata_int[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1 
       (.I0(rd_skid_buf[23]),
        .I1(bram_rddata_a[23]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[23].axi_rdata_int[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1 
       (.I0(rd_skid_buf[24]),
        .I1(bram_rddata_a[24]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[24].axi_rdata_int[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1 
       (.I0(rd_skid_buf[25]),
        .I1(bram_rddata_a[25]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[25].axi_rdata_int[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1 
       (.I0(rd_skid_buf[26]),
        .I1(bram_rddata_a[26]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[26].axi_rdata_int[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1 
       (.I0(rd_skid_buf[27]),
        .I1(bram_rddata_a[27]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[27].axi_rdata_int[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1 
       (.I0(rd_skid_buf[28]),
        .I1(bram_rddata_a[28]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[28].axi_rdata_int[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1 
       (.I0(rd_skid_buf[29]),
        .I1(bram_rddata_a[29]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[29].axi_rdata_int[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1 
       (.I0(rd_skid_buf[2]),
        .I1(bram_rddata_a[2]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[2].axi_rdata_int[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1 
       (.I0(rd_skid_buf[30]),
        .I1(bram_rddata_a[30]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[30].axi_rdata_int[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1 
       (.I0(s_axi_rlast),
        .I1(s_axi_rready),
        .I2(s_axi_aresetn),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000074A270A2)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_2 
       (.I0(rd_data_sm_cs[1]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_adv_buf24_out),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_ns1),
        .I5(rd_data_sm_cs[3]),
        .O(axi_rdata_en));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_3 
       (.I0(rd_skid_buf[31]),
        .I1(bram_rddata_a[31]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_4 
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .O(rd_adv_buf24_out));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_5 
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .O(rd_data_sm_ns1));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_3_n_0 ),
        .Q(s_axi_rdata[31]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1 
       (.I0(rd_skid_buf[3]),
        .I1(bram_rddata_a[3]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[3].axi_rdata_int[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1 
       (.I0(rd_skid_buf[4]),
        .I1(bram_rddata_a[4]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[4].axi_rdata_int[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1 
       (.I0(rd_skid_buf[5]),
        .I1(bram_rddata_a[5]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[5].axi_rdata_int[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1 
       (.I0(rd_skid_buf[6]),
        .I1(bram_rddata_a[6]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[6].axi_rdata_int[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1 
       (.I0(rd_skid_buf[7]),
        .I1(bram_rddata_a[7]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[7].axi_rdata_int[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1 
       (.I0(rd_skid_buf[8]),
        .I1(bram_rddata_a[8]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[8].axi_rdata_int[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1 
       (.I0(rd_skid_buf[9]),
        .I1(bram_rddata_a[9]),
        .I2(rddata_mux_sel),
        .O(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(axi_rdata_en),
        .D(\GEN_RDATA_NO_ECC.GEN_RDATA[9].axi_rdata_int[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]),
        .R(\GEN_RDATA_NO_ECC.GEN_RDATA[31].axi_rdata_int[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAABAAAAAAAAAA)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf[31]_i_1 
       (.I0(rd_skid_buf_ld_reg),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_adv_buf24_out),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[2]),
        .O(rd_skid_buf_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[0] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[0]),
        .Q(rd_skid_buf[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[10] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[10]),
        .Q(rd_skid_buf[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[11] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[11]),
        .Q(rd_skid_buf[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[12] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[12]),
        .Q(rd_skid_buf[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[13] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[13]),
        .Q(rd_skid_buf[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[14] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[14]),
        .Q(rd_skid_buf[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[15] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[15]),
        .Q(rd_skid_buf[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[16] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[16]),
        .Q(rd_skid_buf[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[17] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[17]),
        .Q(rd_skid_buf[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[18] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[18]),
        .Q(rd_skid_buf[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[19] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[19]),
        .Q(rd_skid_buf[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[1] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[1]),
        .Q(rd_skid_buf[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[20] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[20]),
        .Q(rd_skid_buf[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[21] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[21]),
        .Q(rd_skid_buf[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[22] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[22]),
        .Q(rd_skid_buf[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[23] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[23]),
        .Q(rd_skid_buf[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[24] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[24]),
        .Q(rd_skid_buf[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[25] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[25]),
        .Q(rd_skid_buf[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[26] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[26]),
        .Q(rd_skid_buf[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[27] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[27]),
        .Q(rd_skid_buf[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[28] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[28]),
        .Q(rd_skid_buf[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[29] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[29]),
        .Q(rd_skid_buf[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[2] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[2]),
        .Q(rd_skid_buf[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[30] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[30]),
        .Q(rd_skid_buf[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[31] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[31]),
        .Q(rd_skid_buf[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[3] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[3]),
        .Q(rd_skid_buf[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[4] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[4]),
        .Q(rd_skid_buf[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[5] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[5]),
        .Q(rd_skid_buf[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[6] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[6]),
        .Q(rd_skid_buf[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[7] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[7]),
        .Q(rd_skid_buf[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[8] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[8]),
        .Q(rd_skid_buf[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RDATA_NO_ECC.rd_skid_buf_reg[9] 
       (.C(s_axi_aclk),
        .CE(rd_skid_buf_ld),
        .D(bram_rddata_a[9]),
        .Q(rd_skid_buf[9]),
        .R(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_0 I_WRAP_BRST
       (.\ADDR_SNG_PORT.bram_addr_int_reg[10] (\ADDR_SNG_PORT.bram_addr_int_reg[10] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[11] (sng_bram_addr_ld_en),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2] (\ADDR_SNG_PORT.bram_addr_int_reg[2] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[4] (\ADDR_SNG_PORT.bram_addr_int_reg[4] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[5] (\ADDR_SNG_PORT.bram_addr_int_reg[5] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[6] (\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[7] (\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[8] (\ADDR_SNG_PORT.bram_addr_int_reg[8] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[9] (\ADDR_SNG_PORT.bram_addr_int_reg[9] ),
        .D(D),
        .E(E),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] (\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .Q(Q),
        .ar_active_re(ar_active_re),
        .axi_rd_burst(axi_rd_burst),
        .axi_rd_burst_two_reg(axi_rd_burst_two_reg_n_0),
        .axi_rvalid_int_reg(s_axi_rvalid),
        .bram_addr_inc(bram_addr_inc),
        .bram_rst_a(SR),
        .brst_zero(brst_zero),
        .curr_fixed_burst_reg(curr_fixed_burst_reg),
        .curr_fixed_burst_reg_0(curr_fixed_burst_reg_0),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .curr_wrap_burst_reg_reg(curr_wrap_burst_reg_reg_0),
        .curr_wrap_burst_reg_reg_0(curr_wrap_burst_reg_reg_1),
        .end_brst_rd(end_brst_rd),
        .out(rd_data_sm_cs),
        .p_0_out(p_0_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen[3:0]),
        .s_axi_rready(s_axi_rready),
        .\save_init_bram_addr_ld_reg[11]_0 (\save_init_bram_addr_ld_reg[11] ),
        .\save_init_bram_addr_ld_reg[14]_0 (\save_init_bram_addr_ld_reg[14] ),
        .\save_init_bram_addr_ld_reg[3]_0 (I_WRAP_BRST_n_11));
  LUT6 #(
    .INIT(64'h0000000022E2EEE2)) 
    act_rd_burst_i_1
       (.I0(act_rd_burst),
        .I1(act_rd_burst_set),
        .I2(axi_rd_burst),
        .I3(ar_active_re),
        .I4(axi_rd_burst_two),
        .I5(act_rd_burst0),
        .O(act_rd_burst_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(act_rd_burst_i_1_n_0),
        .Q(act_rd_burst),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    act_rd_burst_two_i_1
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst_set),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(ar_active_re),
        .I4(axi_rd_burst_two),
        .I5(act_rd_burst0),
        .O(act_rd_burst_two_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000001510)) 
    act_rd_burst_two_i_2
       (.I0(rd_data_sm_cs[2]),
        .I1(p_0_in4_in),
        .I2(rd_data_sm_cs[0]),
        .I3(ar_active_reg_0),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(act_rd_burst_set));
  LUT6 #(
    .INIT(64'h20000008FFFFFFFF)) 
    act_rd_burst_two_i_3
       (.I0(act_rd_burst_two_i_4_n_0),
        .I1(rd_data_sm_cs[3]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(rd_data_sm_cs[2]),
        .I5(s_axi_aresetn),
        .O(act_rd_burst0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    act_rd_burst_two_i_4
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(act_rd_burst),
        .I3(act_rd_burst_two),
        .O(act_rd_burst_two_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    act_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(act_rd_burst_two_i_1_n_0),
        .Q(act_rd_burst_two),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    axi_arready_int_i_3
       (.I0(s_axi_rready),
        .I1(s_axi_rlast),
        .O(\arb_sm_cs_reg[1] ));
  LUT6 #(
    .INIT(64'h030003000000AA00)) 
    axi_rd_burst_i_1
       (.I0(axi_rd_burst),
        .I1(axi_rd_burst_i_2_n_0),
        .I2(axi_rd_burst_two),
        .I3(s_axi_aresetn),
        .I4(brst_zero),
        .I5(ar_active_re),
        .O(axi_rd_burst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    axi_rd_burst_i_2
       (.I0(axi_rd_burst_reg_0),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[3]),
        .I4(s_axi_arlen[2]),
        .O(axi_rd_burst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    axi_rd_burst_i_3
       (.I0(s_axi_arlen[6]),
        .I1(s_axi_arlen[7]),
        .I2(s_axi_arlen[5]),
        .I3(s_axi_arlen[4]),
        .I4(axi_rd_burst_i_4_n_0),
        .O(axi_rd_burst_two));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    axi_rd_burst_i_4
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .O(axi_rd_burst_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rd_burst_i_1_n_0),
        .Q(axi_rd_burst),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00A0C0C000A000A0)) 
    axi_rd_burst_two_i_1
       (.I0(axi_rd_burst_two_reg_n_0),
        .I1(axi_rd_burst_two),
        .I2(s_axi_aresetn),
        .I3(brst_zero),
        .I4(ar_active_d1),
        .I5(p_0_out),
        .O(axi_rd_burst_two_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rd_burst_two_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rd_burst_two_i_1_n_0),
        .Q(axi_rd_burst_two_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hDC00)) 
    axi_rlast_int_i_1
       (.I0(s_axi_rready),
        .I1(axi_rlast_set),
        .I2(s_axi_rlast),
        .I3(s_axi_aresetn),
        .O(axi_rlast_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rlast_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rlast_int_i_1_n_0),
        .Q(s_axi_rlast),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFFEAA)) 
    axi_rvalid_clr_ok_i_1
       (.I0(axi_rvalid_clr_ok_i_2_n_0),
        .I1(disable_b2b_brst),
        .I2(disable_b2b_brst_cmb),
        .I3(last_bram_addr),
        .I4(axi_rvalid_clr_ok),
        .O(axi_rvalid_clr_ok_i_1_n_0));
  LUT6 #(
    .INIT(64'h1000FFFF10001000)) 
    axi_rvalid_clr_ok_i_2
       (.I0(rd_data_sm_cs[3]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(ar_active_d1),
        .I5(p_0_out),
        .O(axi_rvalid_clr_ok_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_clr_ok_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_clr_ok_i_1_n_0),
        .Q(axi_rvalid_clr_ok),
        .R(SR));
  LUT6 #(
    .INIT(64'h7F7F7F0000000000)) 
    axi_rvalid_int_i_1
       (.I0(s_axi_rready),
        .I1(s_axi_rlast),
        .I2(axi_rvalid_clr_ok),
        .I3(axi_rvalid_set),
        .I4(s_axi_rvalid),
        .I5(s_axi_aresetn),
        .O(axi_rvalid_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_int_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0004)) 
    axi_rvalid_set_i_1
       (.I0(rd_data_sm_cs[2]),
        .I1(rd_data_sm_cs[0]),
        .I2(rd_data_sm_cs[1]),
        .I3(rd_data_sm_cs[3]),
        .O(axi_rvalid_set_cmb));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_set_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_set_cmb),
        .Q(axi_rvalid_set),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFE2FF0000E200)) 
    bram_en_int_i_1
       (.I0(bram_en_int_i_2_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(bram_en_int_i_3_n_0),
        .I3(bram_en_int_i_4_n_0),
        .I4(rd_data_sm_cs[3]),
        .I5(p_7_in),
        .O(bram_en_int_i_1_n_0));
  LUT6 #(
    .INIT(64'hA0AFA0AFFFCFF0C0)) 
    bram_en_int_i_2
       (.I0(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I1(axi_rd_burst),
        .I2(rd_data_sm_cs[0]),
        .I3(axi_rd_burst_two_reg_n_0),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFEED500EEEEC000)) 
    bram_en_int_i_3
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(pend_rd_op),
        .I3(rd_adv_buf24_out),
        .I4(ar_active_re),
        .I5(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .O(bram_en_int_i_3_n_0));
  LUT6 #(
    .INIT(64'hBF80FFFFBF800000)) 
    bram_en_int_i_4
       (.I0(bram_en_int_i_5_n_0),
        .I1(act_rd_burst_two_i_4_n_0),
        .I2(ar_active_re),
        .I3(bram_en_int_i_6_n_0),
        .I4(rd_data_sm_cs[2]),
        .I5(bram_en_int_i_7_n_0),
        .O(bram_en_int_i_4_n_0));
  LUT6 #(
    .INIT(64'hE0E0A0A0FFFFF0FF)) 
    bram_en_int_i_5
       (.I0(ar_active_re),
        .I1(pend_rd_op),
        .I2(rd_data_sm_cs[0]),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I4(rd_adv_buf24_out),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_5_n_0));
  LUT6 #(
    .INIT(64'hE0E0A0A00F0F000F)) 
    bram_en_int_i_6
       (.I0(ar_active_re),
        .I1(pend_rd_op),
        .I2(rd_data_sm_cs[0]),
        .I3(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I4(rd_adv_buf24_out),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_6_n_0));
  LUT6 #(
    .INIT(64'hDFFFDFFFFFFFFF00)) 
    bram_en_int_i_7
       (.I0(brst_one),
        .I1(rd_adv_buf24_out),
        .I2(\FSM_sequential_rd_data_sm_cs[3]_i_5_n_0 ),
        .I3(rd_data_sm_cs[0]),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(bram_en_int_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bram_en_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_int_i_1_n_0),
        .Q(p_7_in),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h08FB)) 
    \brst_cnt[0]_i_1 
       (.I0(s_axi_arlen[0]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[0]),
        .O(\brst_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFB0808FB)) 
    \brst_cnt[1]_i_1 
       (.I0(s_axi_arlen[1]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[0]),
        .I4(brst_cnt[1]),
        .O(\brst_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFBFB08080808FB)) 
    \brst_cnt[2]_i_1 
       (.I0(s_axi_arlen[2]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[0]),
        .I4(brst_cnt[1]),
        .I5(brst_cnt[2]),
        .O(\brst_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBB88888888B)) 
    \brst_cnt[3]_i_1 
       (.I0(s_axi_arlen[3]),
        .I1(ar_active_re),
        .I2(brst_cnt[2]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[0]),
        .I5(brst_cnt[3]),
        .O(\brst_cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFB0808FB)) 
    \brst_cnt[4]_i_1 
       (.I0(s_axi_arlen[4]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[4]),
        .I4(\brst_cnt[5]_i_2_n_0 ),
        .O(\brst_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFBFB08080808FB)) 
    \brst_cnt[5]_i_1 
       (.I0(s_axi_arlen[5]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[4]),
        .I4(\brst_cnt[5]_i_2_n_0 ),
        .I5(brst_cnt[5]),
        .O(\brst_cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \brst_cnt[5]_i_2 
       (.I0(brst_cnt[3]),
        .I1(brst_cnt[0]),
        .I2(brst_cnt[1]),
        .I3(brst_cnt[2]),
        .O(\brst_cnt[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08FBFB08)) 
    \brst_cnt[6]_i_1 
       (.I0(s_axi_arlen[6]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[6]),
        .I4(\brst_cnt[7]_i_3_n_0 ),
        .O(\brst_cnt[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \brst_cnt[7]_i_1 
       (.I0(bram_addr_inc),
        .I1(ar_active_d1),
        .I2(p_0_out),
        .O(\brst_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB0808FBFB08FB08)) 
    \brst_cnt[7]_i_2 
       (.I0(s_axi_arlen[7]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(brst_cnt[7]),
        .I4(brst_cnt[6]),
        .I5(\brst_cnt[7]_i_3_n_0 ),
        .O(\brst_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \brst_cnt[7]_i_3 
       (.I0(brst_cnt[5]),
        .I1(brst_cnt[3]),
        .I2(brst_cnt[0]),
        .I3(brst_cnt[1]),
        .I4(brst_cnt[2]),
        .I5(brst_cnt[4]),
        .O(\brst_cnt[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    brst_cnt_max_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_cnt_max),
        .Q(brst_cnt_max_d1),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[0]_i_1_n_0 ),
        .Q(brst_cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[1]_i_1_n_0 ),
        .Q(brst_cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[2]_i_1_n_0 ),
        .Q(brst_cnt[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[3] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[3]_i_1_n_0 ),
        .Q(brst_cnt[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[4] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[4]_i_1_n_0 ),
        .Q(brst_cnt[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[5] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[5]_i_1_n_0 ),
        .Q(brst_cnt[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[6] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[6]_i_1_n_0 ),
        .Q(brst_cnt[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \brst_cnt_reg[7] 
       (.C(s_axi_aclk),
        .CE(\brst_cnt[7]_i_1_n_0 ),
        .D(\brst_cnt[7]_i_2_n_0 ),
        .Q(brst_cnt[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00AA000000A800A8)) 
    brst_one_i_1
       (.I0(s_axi_aresetn),
        .I1(brst_one),
        .I2(brst_one_i_2_n_0),
        .I3(last_bram_addr_i_4_n_0),
        .I4(axi_rd_burst_two),
        .I5(ar_active_re),
        .O(brst_one_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    brst_one_i_2
       (.I0(last_bram_addr_i_6_n_0),
        .I1(I_WRAP_BRST_n_11),
        .I2(rd_data_sm_cs[3]),
        .I3(brst_cnt[2]),
        .I4(last_bram_addr_i_7_n_0),
        .I5(brst_one_i_3_n_0),
        .O(brst_one_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    brst_one_i_3
       (.I0(brst_cnt[0]),
        .I1(brst_cnt[1]),
        .O(brst_one_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_one_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_one_i_1_n_0),
        .Q(brst_one),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FF400000)) 
    brst_zero_i_1
       (.I0(brst_cnt[1]),
        .I1(brst_cnt[0]),
        .I2(brst_zero_i_2_n_0),
        .I3(brst_zero),
        .I4(s_axi_aresetn),
        .I5(ar_active_reg_0),
        .O(brst_zero_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    brst_zero_i_2
       (.I0(last_bram_addr_i_7_n_0),
        .I1(brst_cnt[2]),
        .I2(rd_data_sm_cs[3]),
        .I3(I_WRAP_BRST_n_11),
        .I4(brst_cnt[3]),
        .I5(brst_cnt[5]),
        .O(brst_zero_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    brst_zero_i_4
       (.I0(s_axi_arlen[4]),
        .I1(s_axi_arlen[5]),
        .I2(s_axi_arlen[7]),
        .I3(s_axi_arlen[6]),
        .O(axi_rd_burst_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    brst_zero_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(brst_zero_i_1_n_0),
        .Q(brst_zero),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h1)) 
    curr_fixed_burst_reg_i_1__0
       (.I0(s_axi_arburst[0]),
        .I1(s_axi_arburst[1]),
        .O(curr_fixed_burst));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(curr_fixed_burst),
        .Q(curr_fixed_burst_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    curr_wrap_burst_reg_i_1__0
       (.I0(s_axi_arburst[1]),
        .I1(s_axi_arburst[0]),
        .O(curr_wrap_burst_reg_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(curr_wrap_burst_reg_i_1__0_n_0),
        .Q(curr_wrap_burst_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000022E2E2E2)) 
    disable_b2b_brst_i_1
       (.I0(disable_b2b_brst_i_2_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(disable_b2b_brst),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(disable_b2b_brst_cmb));
  LUT6 #(
    .INIT(64'hB8BBFFFFB8BB0000)) 
    disable_b2b_brst_i_2
       (.I0(disable_b2b_brst_i_3_n_0),
        .I1(rd_data_sm_cs[1]),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(axi_rd_burst),
        .I4(rd_data_sm_cs[0]),
        .I5(disable_b2b_brst),
        .O(disable_b2b_brst_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAFFFEFFFEFFFE)) 
    disable_b2b_brst_i_3
       (.I0(disable_b2b_brst),
        .I1(brst_zero),
        .I2(end_brst_rd),
        .I3(brst_one),
        .I4(s_axi_rready),
        .I5(s_axi_rvalid),
        .O(disable_b2b_brst_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    disable_b2b_brst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(disable_b2b_brst_cmb),
        .Q(disable_b2b_brst),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFAB00005000)) 
    end_brst_rd_clr_i_1
       (.I0(rd_data_sm_cs[1]),
        .I1(ar_active_re),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[2]),
        .I4(rd_data_sm_cs[3]),
        .I5(end_brst_rd_clr),
        .O(end_brst_rd_clr_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_clr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_clr_i_1_n_0),
        .Q(end_brst_rd_clr),
        .R(SR));
  LUT5 #(
    .INIT(32'h55300000)) 
    end_brst_rd_i_1
       (.I0(end_brst_rd_clr),
        .I1(brst_cnt_max_d1),
        .I2(brst_cnt_max),
        .I3(end_brst_rd),
        .I4(s_axi_aresetn),
        .O(end_brst_rd_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    end_brst_rd_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(end_brst_rd_i_1_n_0),
        .Q(end_brst_rd),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFE2222222)) 
    last_bram_addr_i_1
       (.I0(last_bram_addr_i_2_n_0),
        .I1(rd_data_sm_cs[3]),
        .I2(p_0_in4_in),
        .I3(rd_adv_buf24_out),
        .I4(last_bram_addr_i_3_n_0),
        .I5(last_bram_addr_i_4_n_0),
        .O(last_bram_addr0));
  LUT6 #(
    .INIT(64'h8003800000008000)) 
    last_bram_addr_i_2
       (.I0(last_bram_addr_i_5_n_0),
        .I1(rd_data_sm_cs[2]),
        .I2(rd_data_sm_cs[0]),
        .I3(rd_data_sm_cs[1]),
        .I4(ar_active_re),
        .I5(axi_rd_burst_i_2_n_0),
        .O(last_bram_addr_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    last_bram_addr_i_3
       (.I0(rd_data_sm_cs[0]),
        .I1(rd_data_sm_cs[1]),
        .I2(rd_data_sm_cs[2]),
        .O(last_bram_addr_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    last_bram_addr_i_4
       (.I0(last_bram_addr_i_6_n_0),
        .I1(I_WRAP_BRST_n_11),
        .I2(rd_data_sm_cs[3]),
        .I3(brst_cnt[2]),
        .I4(last_bram_addr_i_7_n_0),
        .I5(last_bram_addr_i_8_n_0),
        .O(last_bram_addr_i_4_n_0));
  LUT6 #(
    .INIT(64'h8888888800080000)) 
    last_bram_addr_i_5
       (.I0(s_axi_rvalid),
        .I1(s_axi_rready),
        .I2(axi_rd_burst_two_reg_n_0),
        .I3(axi_rd_burst),
        .I4(pend_rd_op),
        .I5(ar_active_re),
        .O(last_bram_addr_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    last_bram_addr_i_6
       (.I0(brst_cnt[3]),
        .I1(brst_cnt[5]),
        .O(last_bram_addr_i_6_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    last_bram_addr_i_7
       (.I0(brst_cnt[4]),
        .I1(brst_cnt[7]),
        .I2(brst_cnt[6]),
        .O(last_bram_addr_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hB)) 
    last_bram_addr_i_8
       (.I0(brst_cnt[1]),
        .I1(brst_cnt[0]),
        .O(last_bram_addr_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_bram_addr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(last_bram_addr0),
        .Q(last_bram_addr),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFABFB0000A808)) 
    pend_rd_op_i_1
       (.I0(pend_rd_op_i_2_n_0),
        .I1(pend_rd_op_i_3_n_0),
        .I2(rd_data_sm_cs[2]),
        .I3(pend_rd_op_i_4_n_0),
        .I4(rd_data_sm_cs[3]),
        .I5(pend_rd_op),
        .O(pend_rd_op_i_1_n_0));
  LUT6 #(
    .INIT(64'h000000000808080C)) 
    pend_rd_op_i_2
       (.I0(rd_data_sm_cs[2]),
        .I1(p_0_out),
        .I2(ar_active_d1),
        .I3(axi_rd_burst),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(rd_data_sm_cs[1]),
        .O(pend_rd_op_i_2_n_0));
  LUT6 #(
    .INIT(64'h4444445400000000)) 
    pend_rd_op_i_3
       (.I0(rd_data_sm_cs[1]),
        .I1(pend_rd_op),
        .I2(ar_active_re),
        .I3(axi_rd_burst),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(rd_data_sm_cs[0]),
        .O(pend_rd_op_i_3_n_0));
  LUT6 #(
    .INIT(64'h8080808033333000)) 
    pend_rd_op_i_4
       (.I0(rd_adv_buf24_out),
        .I1(rd_data_sm_cs[0]),
        .I2(pend_rd_op),
        .I3(s_axi_rlast),
        .I4(ar_active_re),
        .I5(rd_data_sm_cs[1]),
        .O(pend_rd_op_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pend_rd_op_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pend_rd_op_i_1_n_0),
        .Q(pend_rd_op),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000040555500)) 
    rd_skid_buf_ld_reg_i_1
       (.I0(rd_data_sm_cs[2]),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid),
        .I3(rd_data_sm_cs[0]),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[3]),
        .O(rd_skid_buf_ld_cmb));
  FDRE #(
    .INIT(1'b0)) 
    rd_skid_buf_ld_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rd_skid_buf_ld_cmb),
        .Q(rd_skid_buf_ld_reg),
        .R(SR));
  LUT4 #(
    .INIT(16'hFB08)) 
    rddata_mux_sel_i_1
       (.I0(rddata_mux_sel_i_2_n_0),
        .I1(rddata_mux_sel_i_3_n_0),
        .I2(rd_data_sm_cs[3]),
        .I3(rddata_mux_sel),
        .O(rddata_mux_sel_i_1_n_0));
  LUT6 #(
    .INIT(64'h10FF10F0F000F000)) 
    rddata_mux_sel_i_2
       (.I0(act_rd_burst_two),
        .I1(act_rd_burst),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_adv_buf24_out),
        .I4(rd_data_sm_cs[1]),
        .I5(rd_data_sm_cs[0]),
        .O(rddata_mux_sel_i_2_n_0));
  LUT6 #(
    .INIT(64'h0FFF0FFF8F808080)) 
    rddata_mux_sel_i_3
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid),
        .I2(rd_data_sm_cs[2]),
        .I3(rd_data_sm_cs[1]),
        .I4(axi_rd_burst_two_reg_n_0),
        .I5(rd_data_sm_cs[0]),
        .O(rddata_mux_sel_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rddata_mux_sel_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rddata_mux_sel_i_1_n_0),
        .Q(rddata_mux_sel),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sng_port_arb
   (s_axi_awready,
    s_axi_arready,
    p_0_out,
    p_1_out,
    arb_sm_cs,
    brst_zero_reg,
    ar_active_re,
    \GEN_AR_SNG.ar_active_d1_reg ,
    E,
    bram_we_a,
    SR,
    s_axi_aclk,
    s_axi_arvalid,
    s_axi_awvalid,
    s_axi_arlen,
    \s_axi_arlen[6] ,
    ar_active_d1,
    s_axi_aresetn,
    s_axi_rready,
    axi_rlast_int_reg,
    \bvalid_cnt_reg[0] ,
    axi_rlast_int_reg_0,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ,
    \bvalid_cnt_reg[0]_0 ,
    aw_active_d1,
    Q,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ,
    \arb_sm_cs_reg[1]_0 );
  output s_axi_awready;
  output s_axi_arready;
  output p_0_out;
  output p_1_out;
  output [1:0]arb_sm_cs;
  output brst_zero_reg;
  output ar_active_re;
  output \GEN_AR_SNG.ar_active_d1_reg ;
  output [0:0]E;
  output [3:0]bram_we_a;
  input [0:0]SR;
  input s_axi_aclk;
  input s_axi_arvalid;
  input s_axi_awvalid;
  input [3:0]s_axi_arlen;
  input \s_axi_arlen[6] ;
  input ar_active_d1;
  input s_axi_aresetn;
  input s_axi_rready;
  input axi_rlast_int_reg;
  input \bvalid_cnt_reg[0] ;
  input axi_rlast_int_reg_0;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  input \bvalid_cnt_reg[0]_0 ;
  input aw_active_d1;
  input [3:0]Q;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  input \arb_sm_cs_reg[1]_0 ;

  wire [0:0]E;
  wire \GEN_AR_SNG.ar_active_d1_reg ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ;
  wire [3:0]Q;
  wire [0:0]SR;
  wire ar_active_cmb;
  wire ar_active_d1;
  wire ar_active_i_1_n_0;
  wire ar_active_re;
  wire [1:0]arb_sm_cs;
  wire \arb_sm_cs[0]_i_1_n_0 ;
  wire \arb_sm_cs[0]_i_2_n_0 ;
  wire \arb_sm_cs[0]_i_3_n_0 ;
  wire \arb_sm_cs[1]_i_1_n_0 ;
  wire \arb_sm_cs_reg[1]_0 ;
  wire aw_active_d1;
  wire aw_active_i_1_n_0;
  wire aw_active_i_4_n_0;
  wire aw_active_i_5_n_0;
  wire axi_arready_cmb;
  wire axi_arready_int_i_2_n_0;
  wire axi_awready_cmb;
  wire axi_awready_int_i_3_n_0;
  wire axi_rlast_int_reg;
  wire axi_rlast_int_reg_0;
  wire [3:0]bram_we_a;
  wire brst_zero_reg;
  wire \bvalid_cnt_reg[0] ;
  wire \bvalid_cnt_reg[0]_0 ;
  wire last_arb_won;
  wire last_arb_won_i_1_n_0;
  wire p_0_out;
  wire p_1_out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [3:0]s_axi_arlen;
  wire \s_axi_arlen[6] ;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_rready;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0888)) 
    \GEN_AR_SNG.ar_active_d1_i_1 
       (.I0(p_0_out),
        .I1(s_axi_aresetn),
        .I2(s_axi_rready),
        .I3(axi_rlast_int_reg),
        .O(\GEN_AR_SNG.ar_active_d1_reg ));
  LUT6 #(
    .INIT(64'hBABBBBBB8A888888)) 
    ar_active_i_1
       (.I0(ar_active_cmb),
        .I1(axi_arready_int_i_2_n_0),
        .I2(arb_sm_cs[1]),
        .I3(arb_sm_cs[0]),
        .I4(axi_rlast_int_reg_0),
        .I5(p_0_out),
        .O(ar_active_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF0F03070)) 
    ar_active_i_2
       (.I0(last_arb_won),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .I3(arb_sm_cs[0]),
        .I4(arb_sm_cs[1]),
        .O(ar_active_cmb));
  FDRE #(
    .INIT(1'b0)) 
    ar_active_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(ar_active_i_1_n_0),
        .Q(p_0_out),
        .R(SR));
  LUT6 #(
    .INIT(64'h0030FFFFD0F00000)) 
    \arb_sm_cs[0]_i_1 
       (.I0(last_arb_won),
        .I1(arb_sm_cs[1]),
        .I2(s_axi_arvalid),
        .I3(s_axi_awvalid),
        .I4(\arb_sm_cs[0]_i_2_n_0 ),
        .I5(arb_sm_cs[0]),
        .O(\arb_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEEFAAA)) 
    \arb_sm_cs[0]_i_2 
       (.I0(\bvalid_cnt_reg[0] ),
        .I1(axi_rlast_int_reg_0),
        .I2(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .I5(\arb_sm_cs[0]_i_3_n_0 ),
        .O(\arb_sm_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000070)) 
    \arb_sm_cs[0]_i_3 
       (.I0(last_arb_won),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .O(\arb_sm_cs[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00440F5500440F00)) 
    \arb_sm_cs[1]_i_1 
       (.I0(\bvalid_cnt_reg[0]_0 ),
        .I1(axi_rlast_int_reg_0),
        .I2(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .I5(axi_awready_int_i_3_n_0),
        .O(\arb_sm_cs[1]_i_1_n_0 ));
  FDRE \arb_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\arb_sm_cs[0]_i_1_n_0 ),
        .Q(arb_sm_cs[0]),
        .R(SR));
  FDRE \arb_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\arb_sm_cs[1]_i_1_n_0 ),
        .Q(arb_sm_cs[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'hDFDFDFDDC0C0C0CC)) 
    aw_active_i_1
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] ),
        .I1(\arb_sm_cs_reg[1]_0 ),
        .I2(aw_active_i_4_n_0),
        .I3(arb_sm_cs[0]),
        .I4(aw_active_i_5_n_0),
        .I5(p_1_out),
        .O(aw_active_i_1_n_0));
  LUT5 #(
    .INIT(32'h00004000)) 
    aw_active_i_4
       (.I0(arb_sm_cs[1]),
        .I1(arb_sm_cs[0]),
        .I2(s_axi_rready),
        .I3(axi_rlast_int_reg),
        .I4(\bvalid_cnt_reg[0]_0 ),
        .O(aw_active_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    aw_active_i_5
       (.I0(arb_sm_cs[1]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awvalid),
        .I3(last_arb_won),
        .O(aw_active_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    aw_active_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(aw_active_i_1_n_0),
        .Q(p_1_out),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAEAAAAA)) 
    axi_arready_int_i_1
       (.I0(axi_arready_int_i_2_n_0),
        .I1(axi_rlast_int_reg_0),
        .I2(arb_sm_cs[0]),
        .I3(arb_sm_cs[1]),
        .I4(s_axi_arvalid),
        .I5(s_axi_awvalid),
        .O(axi_arready_cmb));
  LUT6 #(
    .INIT(64'h0000F07000000070)) 
    axi_arready_int_i_2
       (.I0(last_arb_won),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .I5(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .O(axi_arready_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_cmb),
        .Q(s_axi_arready),
        .R(SR));
  LUT6 #(
    .INIT(64'h0008000F00080000)) 
    axi_awready_int_i_1
       (.I0(axi_rlast_int_reg),
        .I1(s_axi_rready),
        .I2(\bvalid_cnt_reg[0]_0 ),
        .I3(arb_sm_cs[1]),
        .I4(arb_sm_cs[0]),
        .I5(axi_awready_int_i_3_n_0),
        .O(axi_awready_cmb));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    axi_awready_int_i_3
       (.I0(last_arb_won),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .O(axi_awready_int_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_awready_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_cmb),
        .Q(s_axi_awready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[0]_INST_0 
       (.I0(p_1_out),
        .I1(Q[0]),
        .O(bram_we_a[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[1]_INST_0 
       (.I0(p_1_out),
        .I1(Q[1]),
        .O(bram_we_a[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[2]_INST_0 
       (.I0(p_1_out),
        .I1(Q[2]),
        .O(bram_we_a[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_we_a[3]_INST_0 
       (.I0(p_1_out),
        .I1(Q[3]),
        .O(bram_we_a[3]));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAA)) 
    brst_zero_i_3
       (.I0(ar_active_re),
        .I1(s_axi_arlen[2]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[0]),
        .I5(\s_axi_arlen[6] ),
        .O(brst_zero_reg));
  LUT5 #(
    .INIT(32'hAAABAAA8)) 
    last_arb_won_i_1
       (.I0(ar_active_cmb),
        .I1(axi_arready_cmb),
        .I2(\bvalid_cnt_reg[0] ),
        .I3(aw_active_i_4_n_0),
        .I4(last_arb_won),
        .O(last_arb_won_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    last_arb_won_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(last_arb_won_i_1_n_0),
        .Q(last_arb_won),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \save_init_bram_addr_ld[14]_i_1 
       (.I0(p_0_out),
        .I1(ar_active_d1),
        .O(ar_active_re));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \save_init_bram_addr_ld[14]_i_1__0 
       (.I0(p_1_out),
        .I1(aw_active_d1),
        .O(E));
endmodule

(* CHECK_LICENSE_TYPE = "system_dma_axi_bram_ctrl_1_0,axi_bram_ctrl,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_bram_ctrl,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    bram_rst_a,
    bram_clk_a,
    bram_en_a,
    bram_we_a,
    bram_addr_a,
    bram_wrdata_a,
    bram_rddata_a);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI:S_AXI_CTRL, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 1e+08, ID_WIDTH 0, ADDR_WIDTH 15, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input [14:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input s_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [14:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input s_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 32768, MEM_WIDTH 32, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *) output bram_rst_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) output bram_clk_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) output bram_en_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) output [3:0]bram_we_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) output [14:0]bram_addr_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) output [31:0]bram_wrdata_a;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) input [31:0]bram_rddata_a;

  wire \<const0> ;
  wire [14:2]\^bram_addr_a ;
  wire bram_en_a;
  wire [31:0]bram_rddata_a;
  wire bram_rst_a;
  wire [3:0]bram_we_a;
  wire [31:0]bram_wrdata_a;
  wire s_axi_aclk;
  wire [14:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire s_axi_aresetn;
  wire [7:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [14:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [7:0]s_axi_awlen;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign bram_addr_a[14:2] = \^bram_addr_a [14:2];
  assign bram_addr_a[1] = \<const0> ;
  assign bram_addr_a[0] = \<const0> ;
  assign bram_clk_a = s_axi_aclk;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_bram_ctrl U0
       (.Q(\^bram_addr_a [11:2]),
        .bram_addr_a(\^bram_addr_a [14:12]),
        .bram_en_a(bram_en_a),
        .bram_rddata_a(bram_rddata_a),
        .bram_rst_a(bram_rst_a),
        .bram_we_a(bram_we_a),
        .bram_wrdata_a(bram_wrdata_a),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[14:2]),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[14:2]),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wr_chnl
   (aw_active_d1,
    bram_wrdata_a,
    s_axi_wready,
    s_axi_bvalid,
    curr_fixed_burst_reg,
    \ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    aw_active_reg,
    aw_active_reg_0,
    \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[11]_1 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[2] ,
    D,
    \arb_sm_cs_reg[1] ,
    last_arb_won_reg,
    \arb_sm_cs_reg[1]_0 ,
    bram_en_a,
    \bram_we_a[3] ,
    SR,
    s_axi_aclk,
    p_1_out,
    s_axi_wdata,
    s_axi_wvalid,
    s_axi_wlast,
    arb_sm_cs,
    s_axi_aresetn,
    s_axi_awvalid,
    E,
    \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ,
    s_axi_bready,
    s_axi_awaddr,
    Q,
    p_7_in,
    s_axi_awburst,
    s_axi_wstrb,
    s_axi_awlen);
  output aw_active_d1;
  output [31:0]bram_wrdata_a;
  output s_axi_wready;
  output s_axi_bvalid;
  output curr_fixed_burst_reg;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output aw_active_reg;
  output aw_active_reg_0;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11]_1 ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  output [11:0]D;
  output \arb_sm_cs_reg[1] ;
  output last_arb_won_reg;
  output \arb_sm_cs_reg[1]_0 ;
  output bram_en_a;
  output [3:0]\bram_we_a[3] ;
  input [0:0]SR;
  input s_axi_aclk;
  input p_1_out;
  input [31:0]s_axi_wdata;
  input s_axi_wvalid;
  input s_axi_wlast;
  input [1:0]arb_sm_cs;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input [0:0]E;
  input \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ;
  input s_axi_bready;
  input [12:0]s_axi_awaddr;
  input [2:0]Q;
  input p_7_in;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_wstrb;
  input [3:0]s_axi_awlen;

  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[11]_1 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ;
  wire [2:0]AW2Arb_BVALID_Cnt;
  wire [11:0]D;
  wire [0:0]E;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[0]_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2_n_0 ;
  wire \GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [1:0]arb_sm_cs;
  wire \arb_sm_cs_reg[1] ;
  wire \arb_sm_cs_reg[1]_0 ;
  wire aw_active_d1;
  wire aw_active_reg;
  wire aw_active_reg_0;
  wire axi_bvalid_int_i_1_n_0;
  wire axi_bvalid_int_i_2_n_0;
  wire axi_wdata_full_cmb;
  wire axi_wdata_full_reg;
  wire axi_wr_burst;
  wire axi_wr_burst_i_1_n_0;
  wire axi_wr_burst_i_2_n_0;
  wire axi_wready_int_mod_i_1_n_0;
  wire bram_en_a;
  wire bram_en_cmb;
  wire [3:0]\bram_we_a[3] ;
  wire [31:0]bram_wrdata_a;
  wire \bvalid_cnt[0]_i_1_n_0 ;
  wire \bvalid_cnt[1]_i_1_n_0 ;
  wire \bvalid_cnt[2]_i_1_n_0 ;
  wire clr_bram_we;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_i_1_n_0;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_i_1_n_0;
  wire last_arb_won_reg;
  wire p_1_out;
  wire p_7_in;
  wire p_8_in;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [12:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awlen;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [1:0]wr_data_sng_sm_cs;
  wire wrdata_reg_ld;

  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h02FF)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_1 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(wr_data_sng_sm_cs[1]),
        .I2(E),
        .I3(s_axi_aresetn),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_4 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(wr_data_sng_sm_cs[1]),
        .I2(s_axi_wvalid),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'hFDCD3100)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.axi_wdata_full_reg_i_1 
       (.I0(p_1_out),
        .I1(wr_data_sng_sm_cs[1]),
        .I2(wr_data_sng_sm_cs[0]),
        .I3(s_axi_wvalid),
        .I4(axi_wdata_full_reg),
        .O(axi_wdata_full_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.axi_wdata_full_reg_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wdata_full_cmb),
        .Q(axi_wdata_full_reg),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h33102200)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.bram_en_int_i_1 
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(axi_wdata_full_reg),
        .I3(s_axi_wvalid),
        .I4(p_1_out),
        .O(bram_en_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.bram_en_int_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bram_en_cmb),
        .Q(p_8_in),
        .R(SR));
  LUT6 #(
    .INIT(64'h5504040404040404)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ),
        .I2(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ),
        .I3(wr_data_sng_sm_cs[1]),
        .I4(s_axi_wvalid),
        .I5(s_axi_wlast),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2 
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(p_1_out),
        .I2(s_axi_wvalid),
        .I3(axi_wdata_full_reg),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3 
       (.I0(axi_wr_burst),
        .I1(axi_wdata_full_reg),
        .I2(s_axi_wlast),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ),
        .Q(clr_bram_we),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000FFFFBFBA0000)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[0]_i_1 
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(axi_wr_burst),
        .I2(axi_wdata_full_reg),
        .I3(s_axi_wlast),
        .I4(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2_n_0 ),
        .I5(wr_data_sng_sm_cs[0]),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF00D10000)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1 
       (.I0(s_axi_wlast),
        .I1(axi_wdata_full_reg),
        .I2(axi_wr_burst),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2_n_0 ),
        .I5(wr_data_sng_sm_cs[1]),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFC080C08)) 
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2 
       (.I0(axi_wdata_full_reg),
        .I1(p_1_out),
        .I2(wr_data_sng_sm_cs[1]),
        .I3(s_axi_wvalid),
        .I4(s_axi_wlast),
        .I5(wr_data_sng_sm_cs[0]),
        .O(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_2_n_0 ));
  FDRE \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[0]_i_1_n_0 ),
        .Q(wr_data_sng_sm_cs[0]),
        .R(SR));
  FDRE \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs[1]_i_1_n_0 ),
        .Q(wr_data_sng_sm_cs[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[0].bram_wrdata_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[0]),
        .Q(bram_wrdata_a[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[10].bram_wrdata_int_reg[10] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[10]),
        .Q(bram_wrdata_a[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[11].bram_wrdata_int_reg[11] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[11]),
        .Q(bram_wrdata_a[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[12].bram_wrdata_int_reg[12] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[12]),
        .Q(bram_wrdata_a[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[13].bram_wrdata_int_reg[13] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[13]),
        .Q(bram_wrdata_a[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[14].bram_wrdata_int_reg[14] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[14]),
        .Q(bram_wrdata_a[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[15].bram_wrdata_int_reg[15] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[15]),
        .Q(bram_wrdata_a[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[16].bram_wrdata_int_reg[16] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[16]),
        .Q(bram_wrdata_a[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[17].bram_wrdata_int_reg[17] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[17]),
        .Q(bram_wrdata_a[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[18].bram_wrdata_int_reg[18] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[18]),
        .Q(bram_wrdata_a[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[19].bram_wrdata_int_reg[19] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[19]),
        .Q(bram_wrdata_a[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[1].bram_wrdata_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[1]),
        .Q(bram_wrdata_a[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[20].bram_wrdata_int_reg[20] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[20]),
        .Q(bram_wrdata_a[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[21].bram_wrdata_int_reg[21] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[21]),
        .Q(bram_wrdata_a[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[22].bram_wrdata_int_reg[22] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[22]),
        .Q(bram_wrdata_a[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[23].bram_wrdata_int_reg[23] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[23]),
        .Q(bram_wrdata_a[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[24].bram_wrdata_int_reg[24] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[24]),
        .Q(bram_wrdata_a[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[25].bram_wrdata_int_reg[25] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[25]),
        .Q(bram_wrdata_a[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[26].bram_wrdata_int_reg[26] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[26]),
        .Q(bram_wrdata_a[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[27].bram_wrdata_int_reg[27] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[27]),
        .Q(bram_wrdata_a[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[28].bram_wrdata_int_reg[28] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[28]),
        .Q(bram_wrdata_a[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[29].bram_wrdata_int_reg[29] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[29]),
        .Q(bram_wrdata_a[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[2].bram_wrdata_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[2]),
        .Q(bram_wrdata_a[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[30].bram_wrdata_int_reg[30] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[30]),
        .Q(bram_wrdata_a[30]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0CC4)) 
    \GEN_WRDATA[31].bram_wrdata_int[31]_i_1 
       (.I0(axi_wdata_full_reg),
        .I1(s_axi_wvalid),
        .I2(wr_data_sng_sm_cs[1]),
        .I3(wr_data_sng_sm_cs[0]),
        .O(wrdata_reg_ld));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[31].bram_wrdata_int_reg[31] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[31]),
        .Q(bram_wrdata_a[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[3].bram_wrdata_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[3]),
        .Q(bram_wrdata_a[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[4].bram_wrdata_int_reg[4] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[4]),
        .Q(bram_wrdata_a[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[5].bram_wrdata_int_reg[5] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[5]),
        .Q(bram_wrdata_a[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[6].bram_wrdata_int_reg[6] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[6]),
        .Q(bram_wrdata_a[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[7].bram_wrdata_int_reg[7] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[7]),
        .Q(bram_wrdata_a[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[8].bram_wrdata_int_reg[8] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[8]),
        .Q(bram_wrdata_a[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WRDATA[9].bram_wrdata_int_reg[9] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wdata[9]),
        .Q(bram_wrdata_a[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF33B0000FFFFFFFF)) 
    \GEN_WR_NO_ECC.bram_we_int[3]_i_1 
       (.I0(axi_wdata_full_reg),
        .I1(s_axi_wvalid),
        .I2(wr_data_sng_sm_cs[1]),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(clr_bram_we),
        .I5(s_axi_aresetn),
        .O(\GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[0] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[0]),
        .Q(\bram_we_a[3] [0]),
        .R(\GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[1] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[1]),
        .Q(\bram_we_a[3] [1]),
        .R(\GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[2] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[2]),
        .Q(\bram_we_a[3] [2]),
        .R(\GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_WR_NO_ECC.bram_we_int_reg[3] 
       (.C(s_axi_aclk),
        .CE(wrdata_reg_ld),
        .D(s_axi_wstrb[3]),
        .Q(\bram_we_a[3] [3]),
        .R(\GEN_WR_NO_ECC.bram_we_int[3]_i_1_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst I_WRAP_BRST
       (.\ADDR_SNG_PORT.bram_addr_int_reg[11] (\ADDR_SNG_PORT.bram_addr_int_reg[11]_1 ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2] (\ADDR_SNG_PORT.bram_addr_int_reg[2] ),
        .\ADDR_SNG_PORT.bram_addr_int_reg[2]_0 (\ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ),
        .D(D),
        .E(E),
        .\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] (\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .Q(Q),
        .SR(SR),
        .aw_active_d1_reg(aw_active_d1),
        .curr_wrap_burst_reg(curr_wrap_burst_reg),
        .p_1_out(p_1_out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awlen(s_axi_awlen));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \arb_sm_cs[1]_i_2 
       (.I0(wr_data_sng_sm_cs[0]),
        .I1(wr_data_sng_sm_cs[1]),
        .O(\arb_sm_cs_reg[1] ));
  FDRE #(
    .INIT(1'b0)) 
    aw_active_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(aw_active_d1),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h40)) 
    aw_active_i_2
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(wr_data_sng_sm_cs[0]),
        .I2(arb_sm_cs[1]),
        .O(aw_active_reg));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h15550000)) 
    aw_active_i_3
       (.I0(arb_sm_cs[1]),
        .I1(AW2Arb_BVALID_Cnt[1]),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(AW2Arb_BVALID_Cnt[0]),
        .I4(s_axi_awvalid),
        .O(aw_active_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hD555)) 
    axi_awready_int_i_2
       (.I0(s_axi_awvalid),
        .I1(AW2Arb_BVALID_Cnt[0]),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(AW2Arb_BVALID_Cnt[1]),
        .O(\arb_sm_cs_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8AAA8A8)) 
    axi_bvalid_int_i_1
       (.I0(s_axi_aresetn),
        .I1(AW2Arb_BVALID_Cnt[1]),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(axi_bvalid_int_i_2_n_0),
        .I4(AW2Arb_BVALID_Cnt[0]),
        .I5(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ),
        .O(axi_bvalid_int_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_int_i_2
       (.I0(s_axi_bvalid),
        .I1(s_axi_bready),
        .O(axi_bvalid_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_int_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_int_i_1_n_0),
        .Q(s_axi_bvalid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h74)) 
    axi_wr_burst_i_1
       (.I0(s_axi_wlast),
        .I1(axi_wr_burst_i_2_n_0),
        .I2(axi_wr_burst),
        .O(axi_wr_burst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h55450040)) 
    axi_wr_burst_i_2
       (.I0(wr_data_sng_sm_cs[1]),
        .I1(p_1_out),
        .I2(axi_wdata_full_reg),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(s_axi_wvalid),
        .O(axi_wr_burst_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wr_burst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wr_burst_i_1_n_0),
        .Q(axi_wr_burst),
        .R(SR));
  LUT6 #(
    .INIT(64'h22220AAA22220A02)) 
    axi_wready_int_mod_i_1
       (.I0(s_axi_aresetn),
        .I1(axi_wdata_full_reg),
        .I2(s_axi_wvalid),
        .I3(wr_data_sng_sm_cs[0]),
        .I4(wr_data_sng_sm_cs[1]),
        .I5(p_1_out),
        .O(axi_wready_int_mod_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_int_mod_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_int_mod_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    bram_en_a_INST_0
       (.I0(p_8_in),
        .I1(p_7_in),
        .O(bram_en_a));
  LUT6 #(
    .INIT(64'h88887777777F8880)) 
    \bvalid_cnt[0]_i_1 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(AW2Arb_BVALID_Cnt[1]),
        .I4(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ),
        .I5(AW2Arb_BVALID_Cnt[0]),
        .O(\bvalid_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE1E0787878787878)) 
    \bvalid_cnt[1]_i_1 
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ),
        .I1(AW2Arb_BVALID_Cnt[0]),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(AW2Arb_BVALID_Cnt[2]),
        .I4(s_axi_bvalid),
        .I5(s_axi_bready),
        .O(\bvalid_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE007F807F807F80)) 
    \bvalid_cnt[2]_i_1 
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.clr_bram_we_i_1_n_0 ),
        .I1(AW2Arb_BVALID_Cnt[0]),
        .I2(AW2Arb_BVALID_Cnt[1]),
        .I3(AW2Arb_BVALID_Cnt[2]),
        .I4(s_axi_bvalid),
        .I5(s_axi_bready),
        .O(\bvalid_cnt[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[0]_i_1_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[1]_i_1_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \bvalid_cnt_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bvalid_cnt[2]_i_1_n_0 ),
        .Q(AW2Arb_BVALID_Cnt[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'h000000008A8A8ABA)) 
    curr_fixed_burst_reg_i_1
       (.I0(curr_fixed_burst_reg),
        .I1(aw_active_d1),
        .I2(p_1_out),
        .I3(s_axi_awburst[1]),
        .I4(s_axi_awburst[0]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ),
        .O(curr_fixed_burst_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_fixed_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(curr_fixed_burst_reg_i_1_n_0),
        .Q(curr_fixed_burst_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000008ABA8A8A)) 
    curr_wrap_burst_reg_i_1
       (.I0(curr_wrap_burst_reg),
        .I1(aw_active_d1),
        .I2(p_1_out),
        .I3(s_axi_awburst[0]),
        .I4(s_axi_awburst[1]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[11]_0 ),
        .O(curr_wrap_burst_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    curr_wrap_burst_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(curr_wrap_burst_reg_i_1_n_0),
        .Q(curr_wrap_burst_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000002AAA)) 
    last_arb_won_i_2
       (.I0(s_axi_awvalid),
        .I1(AW2Arb_BVALID_Cnt[0]),
        .I2(AW2Arb_BVALID_Cnt[2]),
        .I3(AW2Arb_BVALID_Cnt[1]),
        .I4(arb_sm_cs[1]),
        .I5(arb_sm_cs[0]),
        .O(last_arb_won_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst
   (\ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[2] ,
    D,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ,
    curr_wrap_burst_reg,
    \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ,
    E,
    s_axi_awaddr,
    aw_active_d1_reg,
    p_1_out,
    Q,
    SR,
    s_axi_aclk,
    s_axi_awlen);
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  output [11:0]D;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  input curr_wrap_burst_reg;
  input \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ;
  input [0:0]E;
  input [12:0]s_axi_awaddr;
  input aw_active_d1_reg;
  input p_1_out;
  input [2:0]Q;
  input [0:0]SR;
  input s_axi_aclk;
  input [3:0]s_axi_awlen;

  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ;
  wire [11:0]D;
  wire [0:0]E;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  wire [2:0]Q;
  wire [0:0]SR;
  wire aw_active_d1_reg;
  wire curr_wrap_burst_reg;
  wire p_1_out;
  wire s_axi_aclk;
  wire [12:0]s_axi_awaddr;
  wire [3:0]s_axi_awlen;
  wire [14:3]save_init_bram_addr_ld;
  wire \save_init_bram_addr_ld[14]_i_3_n_0 ;
  wire \save_init_bram_addr_ld[14]_i_4__0_n_0 ;
  wire \save_init_bram_addr_ld[14]_i_5__0_n_0 ;
  wire [2:0]wrap_burst_total;
  wire \wrap_burst_total[0]_i_1_n_0 ;
  wire \wrap_burst_total[1]_i_1_n_0 ;
  wire \wrap_burst_total[2]_i_1_n_0 ;

  LUT6 #(
    .INIT(64'h000000007777FFF7)) 
    \ADDR_SNG_PORT.bram_addr_int[14]_i_3 
       (.I0(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I1(curr_wrap_burst_reg),
        .I2(\ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ),
        .I3(\save_init_bram_addr_ld[14]_i_5__0_n_0 ),
        .I4(\save_init_bram_addr_ld[14]_i_4__0_n_0 ),
        .I5(E),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \ADDR_SNG_PORT.bram_addr_int[2]_i_3 
       (.I0(s_axi_awaddr[0]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[10]_i_1__0 
       (.I0(s_axi_awaddr[8]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[10]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[11]_i_1__0 
       (.I0(s_axi_awaddr[9]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[11]),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[12]_i_1__0 
       (.I0(s_axi_awaddr[10]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[12]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[13]_i_1__0 
       (.I0(s_axi_awaddr[11]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[13]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[14]_i_2__0 
       (.I0(s_axi_awaddr[12]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[14]),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h54FFFFFF54FF54FF)) 
    \save_init_bram_addr_ld[14]_i_3 
       (.I0(\save_init_bram_addr_ld[14]_i_4__0_n_0 ),
        .I1(\save_init_bram_addr_ld[14]_i_5__0_n_0 ),
        .I2(\ADDR_SNG_PORT.bram_addr_int_reg[2]_0 ),
        .I3(curr_wrap_burst_reg),
        .I4(aw_active_d1_reg),
        .I5(p_1_out),
        .O(\save_init_bram_addr_ld[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F00A000)) 
    \save_init_bram_addr_ld[14]_i_4__0 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(wrap_burst_total[1]),
        .I3(Q[0]),
        .I4(wrap_burst_total[0]),
        .I5(wrap_burst_total[2]),
        .O(\save_init_bram_addr_ld[14]_i_4__0_n_0 ));
  LUT3 #(
    .INIT(8'hFB)) 
    \save_init_bram_addr_ld[14]_i_5__0 
       (.I0(wrap_burst_total[0]),
        .I1(wrap_burst_total[2]),
        .I2(wrap_burst_total[1]),
        .O(\save_init_bram_addr_ld[14]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'hBB88B8888888BB88)) 
    \save_init_bram_addr_ld[3]_i_1__0 
       (.I0(s_axi_awaddr[1]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(wrap_burst_total[0]),
        .I3(save_init_bram_addr_ld[3]),
        .I4(wrap_burst_total[1]),
        .I5(wrap_burst_total[2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hBB8BB8BB88888888)) 
    \save_init_bram_addr_ld[4]_i_1__0 
       (.I0(s_axi_awaddr[2]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(wrap_burst_total[0]),
        .I3(wrap_burst_total[2]),
        .I4(wrap_burst_total[1]),
        .I5(save_init_bram_addr_ld[4]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hB8B8B8B8B888B8B8)) 
    \save_init_bram_addr_ld[5]_i_1__0 
       (.I0(s_axi_awaddr[3]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[5]),
        .I3(wrap_burst_total[1]),
        .I4(wrap_burst_total[2]),
        .I5(wrap_burst_total[0]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[6]_i_1__0 
       (.I0(s_axi_awaddr[4]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[6]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[7]_i_1__0 
       (.I0(s_axi_awaddr[5]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[7]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[8]_i_1__0 
       (.I0(s_axi_awaddr[6]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[8]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \save_init_bram_addr_ld[9]_i_1__0 
       (.I0(s_axi_awaddr[7]),
        .I1(\save_init_bram_addr_ld[14]_i_3_n_0 ),
        .I2(save_init_bram_addr_ld[9]),
        .O(D[6]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[7]),
        .Q(save_init_bram_addr_ld[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[8]),
        .Q(save_init_bram_addr_ld[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[9]),
        .Q(save_init_bram_addr_ld[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[10]),
        .Q(save_init_bram_addr_ld[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[14] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[11]),
        .Q(save_init_bram_addr_ld[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[3] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[0]),
        .Q(save_init_bram_addr_ld[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[1]),
        .Q(save_init_bram_addr_ld[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[2]),
        .Q(save_init_bram_addr_ld[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[3]),
        .Q(save_init_bram_addr_ld[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[4]),
        .Q(save_init_bram_addr_ld[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[5]),
        .Q(save_init_bram_addr_ld[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(D[6]),
        .Q(save_init_bram_addr_ld[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h4004)) 
    \wrap_burst_total[0]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[0]),
        .I2(s_axi_awlen[1]),
        .I3(s_axi_awlen[2]),
        .O(\wrap_burst_total[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \wrap_burst_total[1]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[0]),
        .I2(s_axi_awlen[1]),
        .O(\wrap_burst_total[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \wrap_burst_total[2]_i_1 
       (.I0(s_axi_awlen[3]),
        .I1(s_axi_awlen[2]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awlen[1]),
        .O(\wrap_burst_total[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\wrap_burst_total[0]_i_1_n_0 ),
        .Q(wrap_burst_total[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\wrap_burst_total[1]_i_1_n_0 ),
        .Q(wrap_burst_total[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(E),
        .D(\wrap_burst_total[2]_i_1_n_0 ),
        .Q(wrap_burst_total[2]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "wrap_brst" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wrap_brst_0
   (D,
    \ADDR_SNG_PORT.bram_addr_int_reg[11] ,
    \save_init_bram_addr_ld_reg[3]_0 ,
    \ADDR_SNG_PORT.bram_addr_int_reg[6] ,
    \save_init_bram_addr_ld_reg[14]_0 ,
    E,
    bram_rst_a,
    p_0_out,
    \save_init_bram_addr_ld_reg[11]_0 ,
    Q,
    curr_wrap_burst_reg,
    out,
    s_axi_araddr,
    \ADDR_SNG_PORT.bram_addr_int_reg[2] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[4] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[5] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[7] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[8] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[9] ,
    \ADDR_SNG_PORT.bram_addr_int_reg[10] ,
    curr_wrap_burst_reg_reg,
    curr_fixed_burst_reg,
    \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ,
    curr_fixed_burst_reg_0,
    bram_addr_inc,
    ar_active_re,
    curr_wrap_burst_reg_reg_0,
    s_axi_arlen,
    axi_rvalid_int_reg,
    s_axi_rready,
    brst_zero,
    end_brst_rd,
    s_axi_aresetn,
    axi_rd_burst,
    axi_rd_burst_two_reg,
    s_axi_aclk);
  output [9:0]D;
  output \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  output \save_init_bram_addr_ld_reg[3]_0 ;
  output \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  output [2:0]\save_init_bram_addr_ld_reg[14]_0 ;
  output [0:0]E;
  output bram_rst_a;
  input p_0_out;
  input [8:0]\save_init_bram_addr_ld_reg[11]_0 ;
  input [9:0]Q;
  input curr_wrap_burst_reg;
  input [3:0]out;
  input [12:0]s_axi_araddr;
  input \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[4] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[5] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  input \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  input curr_wrap_burst_reg_reg;
  input curr_fixed_burst_reg;
  input \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  input curr_fixed_burst_reg_0;
  input bram_addr_inc;
  input ar_active_re;
  input curr_wrap_burst_reg_reg_0;
  input [3:0]s_axi_arlen;
  input axi_rvalid_int_reg;
  input s_axi_rready;
  input brst_zero;
  input end_brst_rd;
  input s_axi_aresetn;
  input axi_rd_burst;
  input axi_rd_burst_two_reg;
  input s_axi_aclk;

  wire \ADDR_SNG_PORT.bram_addr_int[2]_i_2_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[2]_i_4_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int[2]_i_5_n_0 ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[10] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[11] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[2] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[4] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[5] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[6] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[7] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[8] ;
  wire \ADDR_SNG_PORT.bram_addr_int_reg[9] ;
  wire [9:0]D;
  wire [0:0]E;
  wire \GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ;
  wire [9:0]Q;
  wire [9:1]RdChnl_BRAM_Addr_Ld;
  wire ar_active_re;
  wire axi_rd_burst;
  wire axi_rd_burst_two_reg;
  wire axi_rvalid_int_reg;
  wire bram_addr_inc;
  wire bram_addr_inc9_out;
  wire bram_rst_a;
  wire brst_zero;
  wire curr_fixed_burst_reg;
  wire curr_fixed_burst_reg_0;
  wire curr_wrap_burst_reg;
  wire curr_wrap_burst_reg_reg;
  wire curr_wrap_burst_reg_reg_0;
  wire end_brst_rd;
  wire [3:0]out;
  wire p_0_out;
  wire s_axi_aclk;
  wire [12:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire [3:0]s_axi_arlen;
  wire s_axi_rready;
  wire \save_init_bram_addr_ld[14]_i_3__0_n_0 ;
  wire \save_init_bram_addr_ld[3]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[4]_i_2_n_0 ;
  wire \save_init_bram_addr_ld[5]_i_2_n_0 ;
  wire [8:0]\save_init_bram_addr_ld_reg[11]_0 ;
  wire [2:0]\save_init_bram_addr_ld_reg[14]_0 ;
  wire \save_init_bram_addr_ld_reg[3]_0 ;
  wire \save_init_bram_addr_ld_reg_n_0_[10] ;
  wire \save_init_bram_addr_ld_reg_n_0_[11] ;
  wire \save_init_bram_addr_ld_reg_n_0_[12] ;
  wire \save_init_bram_addr_ld_reg_n_0_[13] ;
  wire \save_init_bram_addr_ld_reg_n_0_[14] ;
  wire \save_init_bram_addr_ld_reg_n_0_[3] ;
  wire \save_init_bram_addr_ld_reg_n_0_[4] ;
  wire \save_init_bram_addr_ld_reg_n_0_[5] ;
  wire \save_init_bram_addr_ld_reg_n_0_[6] ;
  wire \save_init_bram_addr_ld_reg_n_0_[7] ;
  wire \save_init_bram_addr_ld_reg_n_0_[8] ;
  wire \save_init_bram_addr_ld_reg_n_0_[9] ;
  wire \wrap_burst_total[0]_i_1__0_n_0 ;
  wire \wrap_burst_total[1]_i_1__0_n_0 ;
  wire \wrap_burst_total[2]_i_1__0_n_0 ;
  wire \wrap_burst_total_reg_n_0_[0] ;
  wire \wrap_burst_total_reg_n_0_[1] ;
  wire \wrap_burst_total_reg_n_0_[2] ;

  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[10]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[8]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [7]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[8]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[9] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hAABAFFBAAABAAABA)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_2 
       (.I0(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I1(curr_fixed_burst_reg),
        .I2(\GEN_WDATA_SM_NO_ECC_SNG_REG_WREADY.wr_data_sng_sm_cs_reg[0] ),
        .I3(p_0_out),
        .I4(curr_fixed_burst_reg_0),
        .I5(bram_addr_inc),
        .O(E));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[11]_i_3 
       (.I0(RdChnl_BRAM_Addr_Ld[9]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [8]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[9]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[10] ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFFF0080FFFFFFFF)) 
    \ADDR_SNG_PORT.bram_addr_int[14]_i_2 
       (.I0(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I1(curr_wrap_burst_reg),
        .I2(\save_init_bram_addr_ld_reg[3]_0 ),
        .I3(out[3]),
        .I4(ar_active_re),
        .I5(curr_wrap_burst_reg_reg_0),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[11] ));
  LUT6 #(
    .INIT(64'h2F2000002F20FFFF)) 
    \ADDR_SNG_PORT.bram_addr_int[2]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(\ADDR_SNG_PORT.bram_addr_int[2]_i_2_n_0 ),
        .I2(p_0_out),
        .I3(curr_wrap_burst_reg_reg),
        .I4(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I5(Q[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00000000F1000000)) 
    \ADDR_SNG_PORT.bram_addr_int[2]_i_2 
       (.I0(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .I1(\ADDR_SNG_PORT.bram_addr_int[2]_i_4_n_0 ),
        .I2(\ADDR_SNG_PORT.bram_addr_int[2]_i_5_n_0 ),
        .I3(curr_wrap_burst_reg),
        .I4(\save_init_bram_addr_ld_reg[3]_0 ),
        .I5(out[3]),
        .O(\ADDR_SNG_PORT.bram_addr_int[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \ADDR_SNG_PORT.bram_addr_int[2]_i_4 
       (.I0(\wrap_burst_total_reg_n_0_[0] ),
        .I1(\wrap_burst_total_reg_n_0_[2] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .O(\ADDR_SNG_PORT.bram_addr_int[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008F00A000)) 
    \ADDR_SNG_PORT.bram_addr_int[2]_i_5 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(Q[0]),
        .I4(\wrap_burst_total_reg_n_0_[0] ),
        .I5(\wrap_burst_total_reg_n_0_[2] ),
        .O(\ADDR_SNG_PORT.bram_addr_int[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[3]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[1]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [0]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[4]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[2]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [1]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[2]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[2] ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \ADDR_SNG_PORT.bram_addr_int[5]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[3]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [2]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[3]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[4] ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \ADDR_SNG_PORT.bram_addr_int[6]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[4]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [3]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[4]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ADDR_SNG_PORT.bram_addr_int[6]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\ADDR_SNG_PORT.bram_addr_int_reg[6] ));
  LUT6 #(
    .INIT(64'hB8FFB800B800B8FF)) 
    \ADDR_SNG_PORT.bram_addr_int[7]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[5]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [4]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(\ADDR_SNG_PORT.bram_addr_int_reg[5] ),
        .I5(Q[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[8]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[6]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [5]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[6]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[7] ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hB800B8FFB8FFB800)) 
    \ADDR_SNG_PORT.bram_addr_int[9]_i_1 
       (.I0(RdChnl_BRAM_Addr_Ld[7]),
        .I1(p_0_out),
        .I2(\save_init_bram_addr_ld_reg[11]_0 [6]),
        .I3(\ADDR_SNG_PORT.bram_addr_int_reg[11] ),
        .I4(Q[7]),
        .I5(\ADDR_SNG_PORT.bram_addr_int_reg[8] ),
        .O(D[7]));
  LUT1 #(
    .INIT(2'h1)) 
    bram_rst_a_INST_0
       (.I0(s_axi_aresetn),
        .O(bram_rst_a));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[10]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[10] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[8]),
        .O(RdChnl_BRAM_Addr_Ld[8]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[11]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[11] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[9]),
        .O(RdChnl_BRAM_Addr_Ld[9]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[12]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[12] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[10]),
        .O(\save_init_bram_addr_ld_reg[14]_0 [0]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[13]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[13] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[11]),
        .O(\save_init_bram_addr_ld_reg[14]_0 [1]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[14]_i_2 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[14] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[12]),
        .O(\save_init_bram_addr_ld_reg[14]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAAAAAABA)) 
    \save_init_bram_addr_ld[14]_i_3__0 
       (.I0(\ADDR_SNG_PORT.bram_addr_int[2]_i_5_n_0 ),
        .I1(\wrap_burst_total_reg_n_0_[0] ),
        .I2(\wrap_burst_total_reg_n_0_[2] ),
        .I3(\wrap_burst_total_reg_n_0_[1] ),
        .I4(\ADDR_SNG_PORT.bram_addr_int_reg[6] ),
        .O(\save_init_bram_addr_ld[14]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h4400558844555088)) 
    \save_init_bram_addr_ld[14]_i_4 
       (.I0(out[2]),
        .I1(bram_addr_inc9_out),
        .I2(axi_rd_burst),
        .I3(out[0]),
        .I4(out[1]),
        .I5(axi_rd_burst_two_reg),
        .O(\save_init_bram_addr_ld_reg[3]_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \save_init_bram_addr_ld[14]_i_5 
       (.I0(axi_rvalid_int_reg),
        .I1(s_axi_rready),
        .I2(brst_zero),
        .I3(end_brst_rd),
        .O(bram_addr_inc9_out));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[3]_i_1 
       (.I0(\save_init_bram_addr_ld[3]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[1]),
        .O(RdChnl_BRAM_Addr_Ld[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hC80C)) 
    \save_init_bram_addr_ld[3]_i_2 
       (.I0(\wrap_burst_total_reg_n_0_[0] ),
        .I1(\save_init_bram_addr_ld_reg_n_0_[3] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(\wrap_burst_total_reg_n_0_[2] ),
        .O(\save_init_bram_addr_ld[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[4]_i_1 
       (.I0(\save_init_bram_addr_ld[4]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[2]),
        .O(RdChnl_BRAM_Addr_Ld[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hDB00)) 
    \save_init_bram_addr_ld[4]_i_2 
       (.I0(\wrap_burst_total_reg_n_0_[0] ),
        .I1(\wrap_burst_total_reg_n_0_[2] ),
        .I2(\wrap_burst_total_reg_n_0_[1] ),
        .I3(\save_init_bram_addr_ld_reg_n_0_[4] ),
        .O(\save_init_bram_addr_ld[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[5]_i_1 
       (.I0(\save_init_bram_addr_ld[5]_i_2_n_0 ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[3]),
        .O(RdChnl_BRAM_Addr_Ld[3]));
  LUT4 #(
    .INIT(16'hAA8A)) 
    \save_init_bram_addr_ld[5]_i_2 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[5] ),
        .I1(\wrap_burst_total_reg_n_0_[1] ),
        .I2(\wrap_burst_total_reg_n_0_[2] ),
        .I3(\wrap_burst_total_reg_n_0_[0] ),
        .O(\save_init_bram_addr_ld[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[6]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[6] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[4]),
        .O(RdChnl_BRAM_Addr_Ld[4]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[7]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[7] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[5]),
        .O(RdChnl_BRAM_Addr_Ld[5]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[8]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[8] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[6]),
        .O(RdChnl_BRAM_Addr_Ld[6]));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \save_init_bram_addr_ld[9]_i_1 
       (.I0(\save_init_bram_addr_ld_reg_n_0_[9] ),
        .I1(\save_init_bram_addr_ld[14]_i_3__0_n_0 ),
        .I2(curr_wrap_burst_reg),
        .I3(\save_init_bram_addr_ld_reg[3]_0 ),
        .I4(out[3]),
        .I5(s_axi_araddr[7]),
        .O(RdChnl_BRAM_Addr_Ld[7]));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[10] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[8]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[10] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[11] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[9]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[11] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[12] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\save_init_bram_addr_ld_reg[14]_0 [0]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[12] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[13] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\save_init_bram_addr_ld_reg[14]_0 [1]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[13] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[14] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\save_init_bram_addr_ld_reg[14]_0 [2]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[14] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[3] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[1]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[3] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[4] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[2]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[4] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[5] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[3]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[5] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[6] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[4]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[6] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[7] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[5]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[7] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[8] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[6]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[8] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \save_init_bram_addr_ld_reg[9] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(RdChnl_BRAM_Addr_Ld[7]),
        .Q(\save_init_bram_addr_ld_reg_n_0_[9] ),
        .R(bram_rst_a));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0804)) 
    \wrap_burst_total[0]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[2]),
        .O(\wrap_burst_total[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \wrap_burst_total[1]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[3]),
        .O(\wrap_burst_total[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \wrap_burst_total[2]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arlen[2]),
        .I3(s_axi_arlen[3]),
        .O(\wrap_burst_total[2]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[0] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[0]_i_1__0_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[0] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[1] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[1]_i_1__0_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[1] ),
        .R(bram_rst_a));
  FDRE #(
    .INIT(1'b0)) 
    \wrap_burst_total_reg[2] 
       (.C(s_axi_aclk),
        .CE(ar_active_re),
        .D(\wrap_burst_total[2]_i_1__0_n_0 ),
        .Q(\wrap_burst_total_reg_n_0_[2] ),
        .R(bram_rst_a));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
