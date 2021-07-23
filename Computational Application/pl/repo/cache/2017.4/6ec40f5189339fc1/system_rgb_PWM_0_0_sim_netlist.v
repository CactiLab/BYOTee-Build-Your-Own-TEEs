// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Tue Jul 20 12:45:11 2021
// Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_rgb_PWM_0_0_sim_netlist.v
// Design      : system_rgb_PWM_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PWM_AXI
   (pwm_axi_awready,
    pwm_axi_wready,
    pwm_axi_arready,
    pwm_axi_rvalid,
    pwm_axi_bvalid,
    Q,
    \genblk1[1].duty_reg_latch_reg[1][31] ,
    \genblk1[2].duty_reg_latch_reg[2][31] ,
    \genblk1[3].duty_reg_latch_reg[3][31] ,
    \genblk1[4].duty_reg_latch_reg[4][31] ,
    \genblk1[5].duty_reg_latch_reg[5][31] ,
    \max_reg[31] ,
    enable_reg,
    pwm_axi_rdata,
    SR,
    pwm_axi_aclk,
    pwm_axi_arvalid,
    axi_bvalid_reg_0,
    axi_arready_reg_0,
    pwm_axi_awaddr,
    pwm_axi_wdata,
    pwm_axi_araddr,
    pwm_axi_awvalid,
    pwm_axi_wvalid,
    pwm_axi_wstrb);
  output pwm_axi_awready;
  output pwm_axi_wready;
  output pwm_axi_arready;
  output pwm_axi_rvalid;
  output pwm_axi_bvalid;
  output [31:0]Q;
  output [31:0]\genblk1[1].duty_reg_latch_reg[1][31] ;
  output [31:0]\genblk1[2].duty_reg_latch_reg[2][31] ;
  output [31:0]\genblk1[3].duty_reg_latch_reg[3][31] ;
  output [31:0]\genblk1[4].duty_reg_latch_reg[4][31] ;
  output [31:0]\genblk1[5].duty_reg_latch_reg[5][31] ;
  output [31:0]\max_reg[31] ;
  output [0:0]enable_reg;
  output [31:0]pwm_axi_rdata;
  input [0:0]SR;
  input pwm_axi_aclk;
  input pwm_axi_arvalid;
  input axi_bvalid_reg_0;
  input axi_arready_reg_0;
  input [4:0]pwm_axi_awaddr;
  input [31:0]pwm_axi_wdata;
  input [4:0]pwm_axi_araddr;
  input pwm_axi_awvalid;
  input pwm_axi_wvalid;
  input [3:0]pwm_axi_wstrb;

  wire [31:0]Q;
  wire [0:0]SR;
  wire \axi_araddr_reg_n_0_[5] ;
  wire \axi_araddr_reg_n_0_[6] ;
  wire axi_arready_i_1_n_0;
  wire axi_arready_reg_0;
  wire axi_awready0;
  wire axi_bvalid_reg_0;
  wire \axi_rdata[0]_i_1_n_0 ;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire \axi_rdata[0]_i_4_n_0 ;
  wire \axi_rdata[10]_i_1_n_0 ;
  wire \axi_rdata[10]_i_2_n_0 ;
  wire \axi_rdata[10]_i_3_n_0 ;
  wire \axi_rdata[10]_i_4_n_0 ;
  wire \axi_rdata[11]_i_1_n_0 ;
  wire \axi_rdata[11]_i_2_n_0 ;
  wire \axi_rdata[11]_i_3_n_0 ;
  wire \axi_rdata[11]_i_4_n_0 ;
  wire \axi_rdata[12]_i_1_n_0 ;
  wire \axi_rdata[12]_i_2_n_0 ;
  wire \axi_rdata[12]_i_3_n_0 ;
  wire \axi_rdata[12]_i_4_n_0 ;
  wire \axi_rdata[13]_i_1_n_0 ;
  wire \axi_rdata[13]_i_2_n_0 ;
  wire \axi_rdata[13]_i_3_n_0 ;
  wire \axi_rdata[13]_i_4_n_0 ;
  wire \axi_rdata[14]_i_1_n_0 ;
  wire \axi_rdata[14]_i_2_n_0 ;
  wire \axi_rdata[14]_i_3_n_0 ;
  wire \axi_rdata[14]_i_4_n_0 ;
  wire \axi_rdata[15]_i_1_n_0 ;
  wire \axi_rdata[15]_i_2_n_0 ;
  wire \axi_rdata[15]_i_3_n_0 ;
  wire \axi_rdata[15]_i_4_n_0 ;
  wire \axi_rdata[16]_i_1_n_0 ;
  wire \axi_rdata[16]_i_2_n_0 ;
  wire \axi_rdata[16]_i_3_n_0 ;
  wire \axi_rdata[16]_i_4_n_0 ;
  wire \axi_rdata[17]_i_1_n_0 ;
  wire \axi_rdata[17]_i_2_n_0 ;
  wire \axi_rdata[17]_i_3_n_0 ;
  wire \axi_rdata[17]_i_4_n_0 ;
  wire \axi_rdata[18]_i_1_n_0 ;
  wire \axi_rdata[18]_i_2_n_0 ;
  wire \axi_rdata[18]_i_3_n_0 ;
  wire \axi_rdata[18]_i_4_n_0 ;
  wire \axi_rdata[19]_i_1_n_0 ;
  wire \axi_rdata[19]_i_2_n_0 ;
  wire \axi_rdata[19]_i_3_n_0 ;
  wire \axi_rdata[19]_i_4_n_0 ;
  wire \axi_rdata[1]_i_1_n_0 ;
  wire \axi_rdata[1]_i_2_n_0 ;
  wire \axi_rdata[1]_i_3_n_0 ;
  wire \axi_rdata[1]_i_4_n_0 ;
  wire \axi_rdata[20]_i_1_n_0 ;
  wire \axi_rdata[20]_i_2_n_0 ;
  wire \axi_rdata[20]_i_3_n_0 ;
  wire \axi_rdata[20]_i_4_n_0 ;
  wire \axi_rdata[21]_i_1_n_0 ;
  wire \axi_rdata[21]_i_2_n_0 ;
  wire \axi_rdata[21]_i_3_n_0 ;
  wire \axi_rdata[21]_i_4_n_0 ;
  wire \axi_rdata[22]_i_1_n_0 ;
  wire \axi_rdata[22]_i_2_n_0 ;
  wire \axi_rdata[22]_i_3_n_0 ;
  wire \axi_rdata[22]_i_4_n_0 ;
  wire \axi_rdata[23]_i_1_n_0 ;
  wire \axi_rdata[23]_i_2_n_0 ;
  wire \axi_rdata[23]_i_3_n_0 ;
  wire \axi_rdata[23]_i_4_n_0 ;
  wire \axi_rdata[24]_i_1_n_0 ;
  wire \axi_rdata[24]_i_2_n_0 ;
  wire \axi_rdata[24]_i_3_n_0 ;
  wire \axi_rdata[24]_i_4_n_0 ;
  wire \axi_rdata[25]_i_1_n_0 ;
  wire \axi_rdata[25]_i_2_n_0 ;
  wire \axi_rdata[25]_i_3_n_0 ;
  wire \axi_rdata[25]_i_4_n_0 ;
  wire \axi_rdata[26]_i_1_n_0 ;
  wire \axi_rdata[26]_i_2_n_0 ;
  wire \axi_rdata[26]_i_3_n_0 ;
  wire \axi_rdata[26]_i_4_n_0 ;
  wire \axi_rdata[27]_i_1_n_0 ;
  wire \axi_rdata[27]_i_2_n_0 ;
  wire \axi_rdata[27]_i_3_n_0 ;
  wire \axi_rdata[27]_i_4_n_0 ;
  wire \axi_rdata[28]_i_1_n_0 ;
  wire \axi_rdata[28]_i_2_n_0 ;
  wire \axi_rdata[28]_i_3_n_0 ;
  wire \axi_rdata[28]_i_4_n_0 ;
  wire \axi_rdata[29]_i_1_n_0 ;
  wire \axi_rdata[29]_i_2_n_0 ;
  wire \axi_rdata[29]_i_3_n_0 ;
  wire \axi_rdata[29]_i_4_n_0 ;
  wire \axi_rdata[2]_i_1_n_0 ;
  wire \axi_rdata[2]_i_2_n_0 ;
  wire \axi_rdata[2]_i_3_n_0 ;
  wire \axi_rdata[2]_i_4_n_0 ;
  wire \axi_rdata[30]_i_1_n_0 ;
  wire \axi_rdata[30]_i_2_n_0 ;
  wire \axi_rdata[30]_i_3_n_0 ;
  wire \axi_rdata[30]_i_4_n_0 ;
  wire \axi_rdata[31]_i_1_n_0 ;
  wire \axi_rdata[31]_i_2_n_0 ;
  wire \axi_rdata[31]_i_3_n_0 ;
  wire \axi_rdata[31]_i_4_n_0 ;
  wire \axi_rdata[3]_i_1_n_0 ;
  wire \axi_rdata[3]_i_2_n_0 ;
  wire \axi_rdata[3]_i_3_n_0 ;
  wire \axi_rdata[3]_i_4_n_0 ;
  wire \axi_rdata[4]_i_1_n_0 ;
  wire \axi_rdata[4]_i_2_n_0 ;
  wire \axi_rdata[4]_i_3_n_0 ;
  wire \axi_rdata[4]_i_4_n_0 ;
  wire \axi_rdata[5]_i_1_n_0 ;
  wire \axi_rdata[5]_i_2_n_0 ;
  wire \axi_rdata[5]_i_3_n_0 ;
  wire \axi_rdata[5]_i_4_n_0 ;
  wire \axi_rdata[6]_i_1_n_0 ;
  wire \axi_rdata[6]_i_2_n_0 ;
  wire \axi_rdata[6]_i_3_n_0 ;
  wire \axi_rdata[6]_i_4_n_0 ;
  wire \axi_rdata[7]_i_1_n_0 ;
  wire \axi_rdata[7]_i_2_n_0 ;
  wire \axi_rdata[7]_i_3_n_0 ;
  wire \axi_rdata[7]_i_4_n_0 ;
  wire \axi_rdata[8]_i_1_n_0 ;
  wire \axi_rdata[8]_i_2_n_0 ;
  wire \axi_rdata[8]_i_3_n_0 ;
  wire \axi_rdata[8]_i_4_n_0 ;
  wire \axi_rdata[9]_i_1_n_0 ;
  wire \axi_rdata[9]_i_2_n_0 ;
  wire \axi_rdata[9]_i_3_n_0 ;
  wire \axi_rdata[9]_i_4_n_0 ;
  wire axi_wready0;
  wire \ctrl_reg[15]_i_1_n_0 ;
  wire \ctrl_reg[23]_i_1_n_0 ;
  wire \ctrl_reg[31]_i_1_n_0 ;
  wire \ctrl_reg[31]_i_2_n_0 ;
  wire \ctrl_reg[7]_i_1_n_0 ;
  wire \ctrl_reg_reg_n_0_[10] ;
  wire \ctrl_reg_reg_n_0_[11] ;
  wire \ctrl_reg_reg_n_0_[12] ;
  wire \ctrl_reg_reg_n_0_[13] ;
  wire \ctrl_reg_reg_n_0_[14] ;
  wire \ctrl_reg_reg_n_0_[15] ;
  wire \ctrl_reg_reg_n_0_[16] ;
  wire \ctrl_reg_reg_n_0_[17] ;
  wire \ctrl_reg_reg_n_0_[18] ;
  wire \ctrl_reg_reg_n_0_[19] ;
  wire \ctrl_reg_reg_n_0_[1] ;
  wire \ctrl_reg_reg_n_0_[20] ;
  wire \ctrl_reg_reg_n_0_[21] ;
  wire \ctrl_reg_reg_n_0_[22] ;
  wire \ctrl_reg_reg_n_0_[23] ;
  wire \ctrl_reg_reg_n_0_[24] ;
  wire \ctrl_reg_reg_n_0_[25] ;
  wire \ctrl_reg_reg_n_0_[26] ;
  wire \ctrl_reg_reg_n_0_[27] ;
  wire \ctrl_reg_reg_n_0_[28] ;
  wire \ctrl_reg_reg_n_0_[29] ;
  wire \ctrl_reg_reg_n_0_[2] ;
  wire \ctrl_reg_reg_n_0_[30] ;
  wire \ctrl_reg_reg_n_0_[31] ;
  wire \ctrl_reg_reg_n_0_[3] ;
  wire \ctrl_reg_reg_n_0_[4] ;
  wire \ctrl_reg_reg_n_0_[5] ;
  wire \ctrl_reg_reg_n_0_[6] ;
  wire \ctrl_reg_reg_n_0_[7] ;
  wire \ctrl_reg_reg_n_0_[8] ;
  wire \ctrl_reg_reg_n_0_[9] ;
  wire \duty_reg[0][31]_i_2_n_0 ;
  wire \duty_reg[0][31]_i_3_n_0 ;
  wire \duty_reg[1][15]_i_1_n_0 ;
  wire \duty_reg[1][23]_i_1_n_0 ;
  wire \duty_reg[1][31]_i_1_n_0 ;
  wire \duty_reg[1][31]_i_2_n_0 ;
  wire \duty_reg[1][7]_i_1_n_0 ;
  wire \duty_reg[2][15]_i_1_n_0 ;
  wire \duty_reg[2][23]_i_1_n_0 ;
  wire \duty_reg[2][31]_i_1_n_0 ;
  wire \duty_reg[2][31]_i_2_n_0 ;
  wire \duty_reg[2][7]_i_1_n_0 ;
  wire \duty_reg[3][15]_i_1_n_0 ;
  wire \duty_reg[3][23]_i_1_n_0 ;
  wire \duty_reg[3][31]_i_1_n_0 ;
  wire \duty_reg[3][31]_i_2_n_0 ;
  wire \duty_reg[3][7]_i_1_n_0 ;
  wire \duty_reg[4][15]_i_1_n_0 ;
  wire \duty_reg[4][23]_i_1_n_0 ;
  wire \duty_reg[4][31]_i_1_n_0 ;
  wire \duty_reg[4][31]_i_2_n_0 ;
  wire \duty_reg[4][7]_i_1_n_0 ;
  wire \duty_reg[5][15]_i_1_n_0 ;
  wire \duty_reg[5][23]_i_1_n_0 ;
  wire \duty_reg[5][31]_i_1_n_0 ;
  wire \duty_reg[5][31]_i_2_n_0 ;
  wire \duty_reg[5][7]_i_1_n_0 ;
  wire [0:0]enable_reg;
  wire [31:0]\genblk1[1].duty_reg_latch_reg[1][31] ;
  wire [31:0]\genblk1[2].duty_reg_latch_reg[2][31] ;
  wire [31:0]\genblk1[3].duty_reg_latch_reg[3][31] ;
  wire [31:0]\genblk1[4].duty_reg_latch_reg[4][31] ;
  wire [31:0]\genblk1[5].duty_reg_latch_reg[5][31] ;
  wire [31:0]\max_reg[31] ;
  wire [4:0]p_0_in;
  wire [31:7]p_1_in;
  wire \period_reg[15]_i_1_n_0 ;
  wire \period_reg[23]_i_1_n_0 ;
  wire \period_reg[31]_i_1_n_0 ;
  wire \period_reg[31]_i_2_n_0 ;
  wire \period_reg[7]_i_1_n_0 ;
  wire pwm_axi_aclk;
  wire [4:0]pwm_axi_araddr;
  wire pwm_axi_arready;
  wire pwm_axi_arvalid;
  wire [4:0]pwm_axi_awaddr;
  wire pwm_axi_awready;
  wire pwm_axi_awvalid;
  wire pwm_axi_bvalid;
  wire [31:0]pwm_axi_rdata;
  wire pwm_axi_rvalid;
  wire [31:0]pwm_axi_wdata;
  wire pwm_axi_wready;
  wire [3:0]pwm_axi_wstrb;
  wire pwm_axi_wvalid;
  wire [2:0]sel0;
  wire slv_reg_rden__0;
  wire \status_reg[15]_i_1_n_0 ;
  wire \status_reg[23]_i_1_n_0 ;
  wire \status_reg[31]_i_1_n_0 ;
  wire \status_reg[31]_i_2_n_0 ;
  wire \status_reg[7]_i_1_n_0 ;
  wire \status_reg_reg_n_0_[0] ;
  wire \status_reg_reg_n_0_[10] ;
  wire \status_reg_reg_n_0_[11] ;
  wire \status_reg_reg_n_0_[12] ;
  wire \status_reg_reg_n_0_[13] ;
  wire \status_reg_reg_n_0_[14] ;
  wire \status_reg_reg_n_0_[15] ;
  wire \status_reg_reg_n_0_[16] ;
  wire \status_reg_reg_n_0_[17] ;
  wire \status_reg_reg_n_0_[18] ;
  wire \status_reg_reg_n_0_[19] ;
  wire \status_reg_reg_n_0_[1] ;
  wire \status_reg_reg_n_0_[20] ;
  wire \status_reg_reg_n_0_[21] ;
  wire \status_reg_reg_n_0_[22] ;
  wire \status_reg_reg_n_0_[23] ;
  wire \status_reg_reg_n_0_[24] ;
  wire \status_reg_reg_n_0_[25] ;
  wire \status_reg_reg_n_0_[26] ;
  wire \status_reg_reg_n_0_[27] ;
  wire \status_reg_reg_n_0_[28] ;
  wire \status_reg_reg_n_0_[29] ;
  wire \status_reg_reg_n_0_[2] ;
  wire \status_reg_reg_n_0_[30] ;
  wire \status_reg_reg_n_0_[31] ;
  wire \status_reg_reg_n_0_[3] ;
  wire \status_reg_reg_n_0_[4] ;
  wire \status_reg_reg_n_0_[5] ;
  wire \status_reg_reg_n_0_[6] ;
  wire \status_reg_reg_n_0_[7] ;
  wire \status_reg_reg_n_0_[8] ;
  wire \status_reg_reg_n_0_[9] ;

  FDRE \axi_araddr_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(axi_arready_i_1_n_0),
        .D(pwm_axi_araddr[0]),
        .Q(sel0[0]),
        .R(SR));
  FDRE \axi_araddr_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(axi_arready_i_1_n_0),
        .D(pwm_axi_araddr[1]),
        .Q(sel0[1]),
        .R(SR));
  FDRE \axi_araddr_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(axi_arready_i_1_n_0),
        .D(pwm_axi_araddr[2]),
        .Q(sel0[2]),
        .R(SR));
  FDRE \axi_araddr_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(axi_arready_i_1_n_0),
        .D(pwm_axi_araddr[3]),
        .Q(\axi_araddr_reg_n_0_[5] ),
        .R(SR));
  FDRE \axi_araddr_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(axi_arready_i_1_n_0),
        .D(pwm_axi_araddr[4]),
        .Q(\axi_araddr_reg_n_0_[6] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(pwm_axi_arvalid),
        .I1(pwm_axi_arready),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(pwm_axi_arready),
        .R(SR));
  FDRE \axi_awaddr_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(axi_awready0),
        .D(pwm_axi_awaddr[0]),
        .Q(p_0_in[0]),
        .R(SR));
  FDRE \axi_awaddr_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(axi_awready0),
        .D(pwm_axi_awaddr[1]),
        .Q(p_0_in[1]),
        .R(SR));
  FDRE \axi_awaddr_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(axi_awready0),
        .D(pwm_axi_awaddr[2]),
        .Q(p_0_in[2]),
        .R(SR));
  FDRE \axi_awaddr_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(axi_awready0),
        .D(pwm_axi_awaddr[3]),
        .Q(p_0_in[3]),
        .R(SR));
  FDRE \axi_awaddr_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(axi_awready0),
        .D(pwm_axi_awaddr[4]),
        .Q(p_0_in[4]),
        .R(SR));
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_2
       (.I0(pwm_axi_awvalid),
        .I1(pwm_axi_wvalid),
        .I2(pwm_axi_awready),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(pwm_axi_awready),
        .R(SR));
  FDRE axi_bvalid_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_reg_0),
        .Q(pwm_axi_bvalid),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[0]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[0]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [0]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [0]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [0]),
        .I4(sel0[0]),
        .I5(Q[0]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[0]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [0]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [0]),
        .I3(sel0[1]),
        .O(\axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[0]_i_4 
       (.I0(enable_reg),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[0] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [0]),
        .I5(sel0[2]),
        .O(\axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata[10]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[10]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[10]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [10]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [10]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [10]),
        .I4(sel0[0]),
        .I5(Q[10]),
        .O(\axi_rdata[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[10]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [10]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [10]),
        .I3(sel0[1]),
        .O(\axi_rdata[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[10]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[10] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[10] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [10]),
        .I5(sel0[2]),
        .O(\axi_rdata[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata[11]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[11]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[11]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [11]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [11]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [11]),
        .I4(sel0[0]),
        .I5(Q[11]),
        .O(\axi_rdata[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[11]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [11]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [11]),
        .I3(sel0[1]),
        .O(\axi_rdata[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[11]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[11] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[11] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [11]),
        .I5(sel0[2]),
        .O(\axi_rdata[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[12]_i_1 
       (.I0(\axi_rdata[12]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[12]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[12]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [12]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [12]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [12]),
        .I4(sel0[0]),
        .I5(Q[12]),
        .O(\axi_rdata[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[12]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [12]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [12]),
        .I3(sel0[1]),
        .O(\axi_rdata[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[12]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[12] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[12] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [12]),
        .I5(sel0[2]),
        .O(\axi_rdata[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata[13]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[13]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[13]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [13]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [13]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [13]),
        .I4(sel0[0]),
        .I5(Q[13]),
        .O(\axi_rdata[13]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[13]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [13]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [13]),
        .I3(sel0[1]),
        .O(\axi_rdata[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[13]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[13] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[13] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [13]),
        .I5(sel0[2]),
        .O(\axi_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata[14]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[14]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[14]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [14]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [14]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [14]),
        .I4(sel0[0]),
        .I5(Q[14]),
        .O(\axi_rdata[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[14]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [14]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [14]),
        .I3(sel0[1]),
        .O(\axi_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[14]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[14] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[14] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [14]),
        .I5(sel0[2]),
        .O(\axi_rdata[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata[15]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[15]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[15]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [15]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [15]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [15]),
        .I4(sel0[0]),
        .I5(Q[15]),
        .O(\axi_rdata[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[15]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [15]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [15]),
        .I3(sel0[1]),
        .O(\axi_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[15]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[15] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[15] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [15]),
        .I5(sel0[2]),
        .O(\axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[16]_i_1 
       (.I0(\axi_rdata[16]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[16]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[16]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [16]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [16]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [16]),
        .I4(sel0[0]),
        .I5(Q[16]),
        .O(\axi_rdata[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[16]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [16]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [16]),
        .I3(sel0[1]),
        .O(\axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[16]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[16] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[16] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [16]),
        .I5(sel0[2]),
        .O(\axi_rdata[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[17]_i_1 
       (.I0(\axi_rdata[17]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[17]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[17]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [17]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [17]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [17]),
        .I4(sel0[0]),
        .I5(Q[17]),
        .O(\axi_rdata[17]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[17]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [17]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [17]),
        .I3(sel0[1]),
        .O(\axi_rdata[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[17]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[17] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[17] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [17]),
        .I5(sel0[2]),
        .O(\axi_rdata[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[18]_i_1 
       (.I0(\axi_rdata[18]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[18]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[18]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [18]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [18]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [18]),
        .I4(sel0[0]),
        .I5(Q[18]),
        .O(\axi_rdata[18]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[18]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [18]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [18]),
        .I3(sel0[1]),
        .O(\axi_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[18]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[18] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[18] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [18]),
        .I5(sel0[2]),
        .O(\axi_rdata[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[19]_i_1 
       (.I0(\axi_rdata[19]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[19]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[19]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [19]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [19]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [19]),
        .I4(sel0[0]),
        .I5(Q[19]),
        .O(\axi_rdata[19]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[19]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [19]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [19]),
        .I3(sel0[1]),
        .O(\axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[19]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[19] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[19] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [19]),
        .I5(sel0[2]),
        .O(\axi_rdata[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[1]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[1]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[1]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [1]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [1]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [1]),
        .I4(sel0[0]),
        .I5(Q[1]),
        .O(\axi_rdata[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[1]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [1]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [1]),
        .I3(sel0[1]),
        .O(\axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[1]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[1] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[1] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [1]),
        .I5(sel0[2]),
        .O(\axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[20]_i_1 
       (.I0(\axi_rdata[20]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[20]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[20]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [20]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [20]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [20]),
        .I4(sel0[0]),
        .I5(Q[20]),
        .O(\axi_rdata[20]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[20]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [20]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [20]),
        .I3(sel0[1]),
        .O(\axi_rdata[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[20]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[20] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[20] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [20]),
        .I5(sel0[2]),
        .O(\axi_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[21]_i_1 
       (.I0(\axi_rdata[21]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[21]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[21]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [21]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [21]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [21]),
        .I4(sel0[0]),
        .I5(Q[21]),
        .O(\axi_rdata[21]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[21]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [21]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [21]),
        .I3(sel0[1]),
        .O(\axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[21]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[21] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[21] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [21]),
        .I5(sel0[2]),
        .O(\axi_rdata[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[22]_i_1 
       (.I0(\axi_rdata[22]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[22]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[22]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [22]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [22]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [22]),
        .I4(sel0[0]),
        .I5(Q[22]),
        .O(\axi_rdata[22]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[22]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [22]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [22]),
        .I3(sel0[1]),
        .O(\axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[22]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[22] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[22] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [22]),
        .I5(sel0[2]),
        .O(\axi_rdata[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[23]_i_1 
       (.I0(\axi_rdata[23]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[23]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[23]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [23]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [23]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [23]),
        .I4(sel0[0]),
        .I5(Q[23]),
        .O(\axi_rdata[23]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[23]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [23]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [23]),
        .I3(sel0[1]),
        .O(\axi_rdata[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[23]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[23] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[23] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [23]),
        .I5(sel0[2]),
        .O(\axi_rdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[24]_i_1 
       (.I0(\axi_rdata[24]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[24]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[24]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [24]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [24]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [24]),
        .I4(sel0[0]),
        .I5(Q[24]),
        .O(\axi_rdata[24]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[24]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [24]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [24]),
        .I3(sel0[1]),
        .O(\axi_rdata[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[24]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[24] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[24] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [24]),
        .I5(sel0[2]),
        .O(\axi_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[25]_i_1 
       (.I0(\axi_rdata[25]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[25]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[25]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [25]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [25]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [25]),
        .I4(sel0[0]),
        .I5(Q[25]),
        .O(\axi_rdata[25]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[25]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [25]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [25]),
        .I3(sel0[1]),
        .O(\axi_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[25]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[25] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[25] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [25]),
        .I5(sel0[2]),
        .O(\axi_rdata[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[26]_i_1 
       (.I0(\axi_rdata[26]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[26]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[26]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [26]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [26]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [26]),
        .I4(sel0[0]),
        .I5(Q[26]),
        .O(\axi_rdata[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[26]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [26]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [26]),
        .I3(sel0[1]),
        .O(\axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[26]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[26] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[26] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [26]),
        .I5(sel0[2]),
        .O(\axi_rdata[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[27]_i_1 
       (.I0(\axi_rdata[27]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[27]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[27]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [27]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [27]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [27]),
        .I4(sel0[0]),
        .I5(Q[27]),
        .O(\axi_rdata[27]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[27]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [27]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [27]),
        .I3(sel0[1]),
        .O(\axi_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[27]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[27] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[27] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [27]),
        .I5(sel0[2]),
        .O(\axi_rdata[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[28]_i_1 
       (.I0(\axi_rdata[28]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[28]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[28]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [28]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [28]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [28]),
        .I4(sel0[0]),
        .I5(Q[28]),
        .O(\axi_rdata[28]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[28]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [28]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [28]),
        .I3(sel0[1]),
        .O(\axi_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[28]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[28] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[28] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [28]),
        .I5(sel0[2]),
        .O(\axi_rdata[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[29]_i_1 
       (.I0(\axi_rdata[29]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[29]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[29]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [29]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [29]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [29]),
        .I4(sel0[0]),
        .I5(Q[29]),
        .O(\axi_rdata[29]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[29]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [29]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [29]),
        .I3(sel0[1]),
        .O(\axi_rdata[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[29]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[29] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[29] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [29]),
        .I5(sel0[2]),
        .O(\axi_rdata[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[2]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[2]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[2]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [2]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [2]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [2]),
        .I4(sel0[0]),
        .I5(Q[2]),
        .O(\axi_rdata[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[2]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [2]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [2]),
        .I3(sel0[1]),
        .O(\axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[2]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[2] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[2] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [2]),
        .I5(sel0[2]),
        .O(\axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[30]_i_1 
       (.I0(\axi_rdata[30]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[30]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[30]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [30]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [30]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [30]),
        .I4(sel0[0]),
        .I5(Q[30]),
        .O(\axi_rdata[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[30]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [30]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [30]),
        .I3(sel0[1]),
        .O(\axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[30]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[30] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[30] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [30]),
        .I5(sel0[2]),
        .O(\axi_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[31]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[31]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [31]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [31]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [31]),
        .I4(sel0[0]),
        .I5(Q[31]),
        .O(\axi_rdata[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[31]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [31]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [31]),
        .I3(sel0[1]),
        .O(\axi_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[31]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[31] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[31] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [31]),
        .I5(sel0[2]),
        .O(\axi_rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata[3]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[3]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[3]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [3]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [3]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [3]),
        .I4(sel0[0]),
        .I5(Q[3]),
        .O(\axi_rdata[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[3]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [3]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [3]),
        .I3(sel0[1]),
        .O(\axi_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[3]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[3] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[3] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [3]),
        .I5(sel0[2]),
        .O(\axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata[4]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[4]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[4]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [4]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [4]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [4]),
        .I4(sel0[0]),
        .I5(Q[4]),
        .O(\axi_rdata[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[4]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [4]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [4]),
        .I3(sel0[1]),
        .O(\axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[4]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[4] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[4] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [4]),
        .I5(sel0[2]),
        .O(\axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[5]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[5]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[5]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [5]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [5]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [5]),
        .I4(sel0[0]),
        .I5(Q[5]),
        .O(\axi_rdata[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[5]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [5]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [5]),
        .I3(sel0[1]),
        .O(\axi_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[5]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[5] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[5] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [5]),
        .I5(sel0[2]),
        .O(\axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata[6]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[6]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[6]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [6]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [6]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [6]),
        .I4(sel0[0]),
        .I5(Q[6]),
        .O(\axi_rdata[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[6]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [6]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [6]),
        .I3(sel0[1]),
        .O(\axi_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[6]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[6] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[6] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [6]),
        .I5(sel0[2]),
        .O(\axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata[7]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[7]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[7]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [7]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [7]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [7]),
        .I4(sel0[0]),
        .I5(Q[7]),
        .O(\axi_rdata[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[7]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [7]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [7]),
        .I3(sel0[1]),
        .O(\axi_rdata[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[7]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[7] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[7] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [7]),
        .I5(sel0[2]),
        .O(\axi_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata[8]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[8]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[8]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [8]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [8]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [8]),
        .I4(sel0[0]),
        .I5(Q[8]),
        .O(\axi_rdata[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[8]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [8]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [8]),
        .I3(sel0[1]),
        .O(\axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[8]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[8] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[8] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [8]),
        .I5(sel0[2]),
        .O(\axi_rdata[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000E2FFE200)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata[9]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\axi_rdata[9]_i_3_n_0 ),
        .I3(\axi_araddr_reg_n_0_[6] ),
        .I4(\axi_rdata[9]_i_4_n_0 ),
        .I5(\axi_araddr_reg_n_0_[5] ),
        .O(\axi_rdata[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_2 
       (.I0(\genblk1[3].duty_reg_latch_reg[3][31] [9]),
        .I1(\genblk1[2].duty_reg_latch_reg[2][31] [9]),
        .I2(sel0[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1][31] [9]),
        .I4(sel0[0]),
        .I5(Q[9]),
        .O(\axi_rdata[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \axi_rdata[9]_i_3 
       (.I0(\genblk1[4].duty_reg_latch_reg[4][31] [9]),
        .I1(sel0[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5][31] [9]),
        .I3(sel0[1]),
        .O(\axi_rdata[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \axi_rdata[9]_i_4 
       (.I0(\ctrl_reg_reg_n_0_[9] ),
        .I1(sel0[0]),
        .I2(\status_reg_reg_n_0_[9] ),
        .I3(sel0[1]),
        .I4(\max_reg[31] [9]),
        .I5(sel0[2]),
        .O(\axi_rdata[9]_i_4_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[0]_i_1_n_0 ),
        .Q(pwm_axi_rdata[0]),
        .R(SR));
  FDRE \axi_rdata_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[10]_i_1_n_0 ),
        .Q(pwm_axi_rdata[10]),
        .R(SR));
  FDRE \axi_rdata_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[11]_i_1_n_0 ),
        .Q(pwm_axi_rdata[11]),
        .R(SR));
  FDRE \axi_rdata_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[12]_i_1_n_0 ),
        .Q(pwm_axi_rdata[12]),
        .R(SR));
  FDRE \axi_rdata_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[13]_i_1_n_0 ),
        .Q(pwm_axi_rdata[13]),
        .R(SR));
  FDRE \axi_rdata_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[14]_i_1_n_0 ),
        .Q(pwm_axi_rdata[14]),
        .R(SR));
  FDRE \axi_rdata_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[15]_i_1_n_0 ),
        .Q(pwm_axi_rdata[15]),
        .R(SR));
  FDRE \axi_rdata_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[16]_i_1_n_0 ),
        .Q(pwm_axi_rdata[16]),
        .R(SR));
  FDRE \axi_rdata_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[17]_i_1_n_0 ),
        .Q(pwm_axi_rdata[17]),
        .R(SR));
  FDRE \axi_rdata_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[18]_i_1_n_0 ),
        .Q(pwm_axi_rdata[18]),
        .R(SR));
  FDRE \axi_rdata_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[19]_i_1_n_0 ),
        .Q(pwm_axi_rdata[19]),
        .R(SR));
  FDRE \axi_rdata_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[1]_i_1_n_0 ),
        .Q(pwm_axi_rdata[1]),
        .R(SR));
  FDRE \axi_rdata_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[20]_i_1_n_0 ),
        .Q(pwm_axi_rdata[20]),
        .R(SR));
  FDRE \axi_rdata_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[21]_i_1_n_0 ),
        .Q(pwm_axi_rdata[21]),
        .R(SR));
  FDRE \axi_rdata_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[22]_i_1_n_0 ),
        .Q(pwm_axi_rdata[22]),
        .R(SR));
  FDRE \axi_rdata_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[23]_i_1_n_0 ),
        .Q(pwm_axi_rdata[23]),
        .R(SR));
  FDRE \axi_rdata_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[24]_i_1_n_0 ),
        .Q(pwm_axi_rdata[24]),
        .R(SR));
  FDRE \axi_rdata_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[25]_i_1_n_0 ),
        .Q(pwm_axi_rdata[25]),
        .R(SR));
  FDRE \axi_rdata_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[26]_i_1_n_0 ),
        .Q(pwm_axi_rdata[26]),
        .R(SR));
  FDRE \axi_rdata_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[27]_i_1_n_0 ),
        .Q(pwm_axi_rdata[27]),
        .R(SR));
  FDRE \axi_rdata_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[28]_i_1_n_0 ),
        .Q(pwm_axi_rdata[28]),
        .R(SR));
  FDRE \axi_rdata_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[29]_i_1_n_0 ),
        .Q(pwm_axi_rdata[29]),
        .R(SR));
  FDRE \axi_rdata_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[2]_i_1_n_0 ),
        .Q(pwm_axi_rdata[2]),
        .R(SR));
  FDRE \axi_rdata_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[30]_i_1_n_0 ),
        .Q(pwm_axi_rdata[30]),
        .R(SR));
  FDRE \axi_rdata_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[31]_i_1_n_0 ),
        .Q(pwm_axi_rdata[31]),
        .R(SR));
  FDRE \axi_rdata_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[3]_i_1_n_0 ),
        .Q(pwm_axi_rdata[3]),
        .R(SR));
  FDRE \axi_rdata_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[4]_i_1_n_0 ),
        .Q(pwm_axi_rdata[4]),
        .R(SR));
  FDRE \axi_rdata_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[5]_i_1_n_0 ),
        .Q(pwm_axi_rdata[5]),
        .R(SR));
  FDRE \axi_rdata_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[6]_i_1_n_0 ),
        .Q(pwm_axi_rdata[6]),
        .R(SR));
  FDRE \axi_rdata_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[7]_i_1_n_0 ),
        .Q(pwm_axi_rdata[7]),
        .R(SR));
  FDRE \axi_rdata_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[8]_i_1_n_0 ),
        .Q(pwm_axi_rdata[8]),
        .R(SR));
  FDRE \axi_rdata_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(\axi_rdata[9]_i_1_n_0 ),
        .Q(pwm_axi_rdata[9]),
        .R(SR));
  FDRE axi_rvalid_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_reg_0),
        .Q(pwm_axi_rvalid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(pwm_axi_awvalid),
        .I1(pwm_axi_wvalid),
        .I2(pwm_axi_wready),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(pwm_axi_wready),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \ctrl_reg[15]_i_1 
       (.I0(\ctrl_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\ctrl_reg[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ctrl_reg[23]_i_1 
       (.I0(\ctrl_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\ctrl_reg[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ctrl_reg[31]_i_1 
       (.I0(\ctrl_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\ctrl_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \ctrl_reg[31]_i_2 
       (.I0(p_0_in[4]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[3]),
        .I4(\duty_reg[0][31]_i_3_n_0 ),
        .I5(p_0_in[2]),
        .O(\ctrl_reg[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ctrl_reg[7]_i_1 
       (.I0(\ctrl_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\ctrl_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(enable_reg),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\ctrl_reg_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\ctrl_reg_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\ctrl_reg_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\ctrl_reg_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\ctrl_reg_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\ctrl_reg_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\ctrl_reg_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\ctrl_reg_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\ctrl_reg_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\ctrl_reg_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\ctrl_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\ctrl_reg_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\ctrl_reg_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\ctrl_reg_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\ctrl_reg_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\ctrl_reg_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\ctrl_reg_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\ctrl_reg_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\ctrl_reg_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\ctrl_reg_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\ctrl_reg_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\ctrl_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\ctrl_reg_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\ctrl_reg_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\ctrl_reg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\ctrl_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\ctrl_reg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\ctrl_reg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\ctrl_reg_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\ctrl_reg_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_reg_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(\ctrl_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\ctrl_reg_reg_n_0_[9] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[0][15]_i_1 
       (.I0(\duty_reg[0][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[0][23]_i_1 
       (.I0(\duty_reg[0][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[0][31]_i_1 
       (.I0(\duty_reg[0][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(p_1_in[31]));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \duty_reg[0][31]_i_2 
       (.I0(p_0_in[0]),
        .I1(p_0_in[3]),
        .I2(\duty_reg[0][31]_i_3_n_0 ),
        .I3(p_0_in[2]),
        .I4(p_0_in[1]),
        .I5(p_0_in[4]),
        .O(\duty_reg[0][31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \duty_reg[0][31]_i_3 
       (.I0(pwm_axi_wready),
        .I1(pwm_axi_awready),
        .I2(pwm_axi_awvalid),
        .I3(pwm_axi_wvalid),
        .O(\duty_reg[0][31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[0][7]_i_1 
       (.I0(\duty_reg[0][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(p_1_in[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[1][15]_i_1 
       (.I0(\duty_reg[1][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\duty_reg[1][15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[1][23]_i_1 
       (.I0(\duty_reg[1][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\duty_reg[1][23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[1][31]_i_1 
       (.I0(\duty_reg[1][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\duty_reg[1][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \duty_reg[1][31]_i_2 
       (.I0(p_0_in[0]),
        .I1(p_0_in[3]),
        .I2(\duty_reg[0][31]_i_3_n_0 ),
        .I3(p_0_in[2]),
        .I4(p_0_in[1]),
        .I5(p_0_in[4]),
        .O(\duty_reg[1][31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[1][7]_i_1 
       (.I0(\duty_reg[1][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\duty_reg[1][7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[2][15]_i_1 
       (.I0(\duty_reg[2][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\duty_reg[2][15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[2][23]_i_1 
       (.I0(\duty_reg[2][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\duty_reg[2][23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[2][31]_i_1 
       (.I0(\duty_reg[2][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\duty_reg[2][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \duty_reg[2][31]_i_2 
       (.I0(p_0_in[4]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[3]),
        .I4(\duty_reg[0][31]_i_3_n_0 ),
        .I5(p_0_in[2]),
        .O(\duty_reg[2][31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[2][7]_i_1 
       (.I0(\duty_reg[2][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\duty_reg[2][7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[3][15]_i_1 
       (.I0(\duty_reg[3][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\duty_reg[3][15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[3][23]_i_1 
       (.I0(\duty_reg[3][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\duty_reg[3][23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[3][31]_i_1 
       (.I0(\duty_reg[3][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\duty_reg[3][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \duty_reg[3][31]_i_2 
       (.I0(p_0_in[4]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[3]),
        .I4(\duty_reg[0][31]_i_3_n_0 ),
        .I5(p_0_in[2]),
        .O(\duty_reg[3][31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[3][7]_i_1 
       (.I0(\duty_reg[3][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\duty_reg[3][7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[4][15]_i_1 
       (.I0(\duty_reg[4][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\duty_reg[4][15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[4][23]_i_1 
       (.I0(\duty_reg[4][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\duty_reg[4][23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[4][31]_i_1 
       (.I0(\duty_reg[4][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\duty_reg[4][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002000000)) 
    \duty_reg[4][31]_i_2 
       (.I0(\duty_reg[0][31]_i_3_n_0 ),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[4]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\duty_reg[4][31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[4][7]_i_1 
       (.I0(\duty_reg[4][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\duty_reg[4][7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[5][15]_i_1 
       (.I0(\duty_reg[5][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\duty_reg[5][15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[5][23]_i_1 
       (.I0(\duty_reg[5][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\duty_reg[5][23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[5][31]_i_1 
       (.I0(\duty_reg[5][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\duty_reg[5][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    \duty_reg[5][31]_i_2 
       (.I0(\duty_reg[0][31]_i_3_n_0 ),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[4]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\duty_reg[5][31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_reg[5][7]_i_1 
       (.I0(\duty_reg[5][31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\duty_reg[5][7]_i_1_n_0 ));
  FDRE \duty_reg_reg[0][0] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE \duty_reg_reg[0][10] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE \duty_reg_reg[0][11] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE \duty_reg_reg[0][12] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[12]),
        .Q(Q[12]),
        .R(SR));
  FDRE \duty_reg_reg[0][13] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[13]),
        .Q(Q[13]),
        .R(SR));
  FDRE \duty_reg_reg[0][14] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[14]),
        .Q(Q[14]),
        .R(SR));
  FDRE \duty_reg_reg[0][15] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[15]),
        .Q(Q[15]),
        .R(SR));
  FDRE \duty_reg_reg[0][16] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[16]),
        .Q(Q[16]),
        .R(SR));
  FDRE \duty_reg_reg[0][17] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[17]),
        .Q(Q[17]),
        .R(SR));
  FDRE \duty_reg_reg[0][18] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[18]),
        .Q(Q[18]),
        .R(SR));
  FDRE \duty_reg_reg[0][19] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[19]),
        .Q(Q[19]),
        .R(SR));
  FDRE \duty_reg_reg[0][1] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE \duty_reg_reg[0][20] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[20]),
        .Q(Q[20]),
        .R(SR));
  FDRE \duty_reg_reg[0][21] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[21]),
        .Q(Q[21]),
        .R(SR));
  FDRE \duty_reg_reg[0][22] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[22]),
        .Q(Q[22]),
        .R(SR));
  FDRE \duty_reg_reg[0][23] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[23]),
        .D(pwm_axi_wdata[23]),
        .Q(Q[23]),
        .R(SR));
  FDRE \duty_reg_reg[0][24] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[24]),
        .Q(Q[24]),
        .R(SR));
  FDRE \duty_reg_reg[0][25] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[25]),
        .Q(Q[25]),
        .R(SR));
  FDRE \duty_reg_reg[0][26] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[26]),
        .Q(Q[26]),
        .R(SR));
  FDRE \duty_reg_reg[0][27] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[27]),
        .Q(Q[27]),
        .R(SR));
  FDRE \duty_reg_reg[0][28] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[28]),
        .Q(Q[28]),
        .R(SR));
  FDRE \duty_reg_reg[0][29] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[29]),
        .Q(Q[29]),
        .R(SR));
  FDRE \duty_reg_reg[0][2] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE \duty_reg_reg[0][30] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[30]),
        .Q(Q[30]),
        .R(SR));
  FDRE \duty_reg_reg[0][31] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[31]),
        .D(pwm_axi_wdata[31]),
        .Q(Q[31]),
        .R(SR));
  FDRE \duty_reg_reg[0][3] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE \duty_reg_reg[0][4] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE \duty_reg_reg[0][5] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE \duty_reg_reg[0][6] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE \duty_reg_reg[0][7] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[7]),
        .D(pwm_axi_wdata[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE \duty_reg_reg[0][8] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE \duty_reg_reg[0][9] 
       (.C(pwm_axi_aclk),
        .CE(p_1_in[15]),
        .D(pwm_axi_wdata[9]),
        .Q(Q[9]),
        .R(SR));
  FDRE \duty_reg_reg[1][0] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [0]),
        .R(SR));
  FDRE \duty_reg_reg[1][10] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [10]),
        .R(SR));
  FDRE \duty_reg_reg[1][11] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [11]),
        .R(SR));
  FDRE \duty_reg_reg[1][12] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [12]),
        .R(SR));
  FDRE \duty_reg_reg[1][13] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [13]),
        .R(SR));
  FDRE \duty_reg_reg[1][14] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [14]),
        .R(SR));
  FDRE \duty_reg_reg[1][15] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [15]),
        .R(SR));
  FDRE \duty_reg_reg[1][16] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [16]),
        .R(SR));
  FDRE \duty_reg_reg[1][17] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [17]),
        .R(SR));
  FDRE \duty_reg_reg[1][18] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [18]),
        .R(SR));
  FDRE \duty_reg_reg[1][19] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [19]),
        .R(SR));
  FDRE \duty_reg_reg[1][1] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [1]),
        .R(SR));
  FDRE \duty_reg_reg[1][20] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [20]),
        .R(SR));
  FDRE \duty_reg_reg[1][21] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [21]),
        .R(SR));
  FDRE \duty_reg_reg[1][22] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [22]),
        .R(SR));
  FDRE \duty_reg_reg[1][23] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [23]),
        .R(SR));
  FDRE \duty_reg_reg[1][24] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [24]),
        .R(SR));
  FDRE \duty_reg_reg[1][25] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [25]),
        .R(SR));
  FDRE \duty_reg_reg[1][26] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [26]),
        .R(SR));
  FDRE \duty_reg_reg[1][27] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [27]),
        .R(SR));
  FDRE \duty_reg_reg[1][28] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [28]),
        .R(SR));
  FDRE \duty_reg_reg[1][29] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [29]),
        .R(SR));
  FDRE \duty_reg_reg[1][2] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [2]),
        .R(SR));
  FDRE \duty_reg_reg[1][30] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [30]),
        .R(SR));
  FDRE \duty_reg_reg[1][31] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [31]),
        .R(SR));
  FDRE \duty_reg_reg[1][3] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [3]),
        .R(SR));
  FDRE \duty_reg_reg[1][4] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [4]),
        .R(SR));
  FDRE \duty_reg_reg[1][5] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [5]),
        .R(SR));
  FDRE \duty_reg_reg[1][6] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [6]),
        .R(SR));
  FDRE \duty_reg_reg[1][7] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [7]),
        .R(SR));
  FDRE \duty_reg_reg[1][8] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [8]),
        .R(SR));
  FDRE \duty_reg_reg[1][9] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[1][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\genblk1[1].duty_reg_latch_reg[1][31] [9]),
        .R(SR));
  FDRE \duty_reg_reg[2][0] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [0]),
        .R(SR));
  FDRE \duty_reg_reg[2][10] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [10]),
        .R(SR));
  FDRE \duty_reg_reg[2][11] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [11]),
        .R(SR));
  FDRE \duty_reg_reg[2][12] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [12]),
        .R(SR));
  FDRE \duty_reg_reg[2][13] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [13]),
        .R(SR));
  FDRE \duty_reg_reg[2][14] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [14]),
        .R(SR));
  FDRE \duty_reg_reg[2][15] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [15]),
        .R(SR));
  FDRE \duty_reg_reg[2][16] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [16]),
        .R(SR));
  FDRE \duty_reg_reg[2][17] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [17]),
        .R(SR));
  FDRE \duty_reg_reg[2][18] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [18]),
        .R(SR));
  FDRE \duty_reg_reg[2][19] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [19]),
        .R(SR));
  FDRE \duty_reg_reg[2][1] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [1]),
        .R(SR));
  FDRE \duty_reg_reg[2][20] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [20]),
        .R(SR));
  FDRE \duty_reg_reg[2][21] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [21]),
        .R(SR));
  FDRE \duty_reg_reg[2][22] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [22]),
        .R(SR));
  FDRE \duty_reg_reg[2][23] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [23]),
        .R(SR));
  FDRE \duty_reg_reg[2][24] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [24]),
        .R(SR));
  FDRE \duty_reg_reg[2][25] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [25]),
        .R(SR));
  FDRE \duty_reg_reg[2][26] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [26]),
        .R(SR));
  FDRE \duty_reg_reg[2][27] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [27]),
        .R(SR));
  FDRE \duty_reg_reg[2][28] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [28]),
        .R(SR));
  FDRE \duty_reg_reg[2][29] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [29]),
        .R(SR));
  FDRE \duty_reg_reg[2][2] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [2]),
        .R(SR));
  FDRE \duty_reg_reg[2][30] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [30]),
        .R(SR));
  FDRE \duty_reg_reg[2][31] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [31]),
        .R(SR));
  FDRE \duty_reg_reg[2][3] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [3]),
        .R(SR));
  FDRE \duty_reg_reg[2][4] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [4]),
        .R(SR));
  FDRE \duty_reg_reg[2][5] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [5]),
        .R(SR));
  FDRE \duty_reg_reg[2][6] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [6]),
        .R(SR));
  FDRE \duty_reg_reg[2][7] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [7]),
        .R(SR));
  FDRE \duty_reg_reg[2][8] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [8]),
        .R(SR));
  FDRE \duty_reg_reg[2][9] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[2][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\genblk1[2].duty_reg_latch_reg[2][31] [9]),
        .R(SR));
  FDRE \duty_reg_reg[3][0] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [0]),
        .R(SR));
  FDRE \duty_reg_reg[3][10] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [10]),
        .R(SR));
  FDRE \duty_reg_reg[3][11] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [11]),
        .R(SR));
  FDRE \duty_reg_reg[3][12] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [12]),
        .R(SR));
  FDRE \duty_reg_reg[3][13] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [13]),
        .R(SR));
  FDRE \duty_reg_reg[3][14] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [14]),
        .R(SR));
  FDRE \duty_reg_reg[3][15] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [15]),
        .R(SR));
  FDRE \duty_reg_reg[3][16] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [16]),
        .R(SR));
  FDRE \duty_reg_reg[3][17] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [17]),
        .R(SR));
  FDRE \duty_reg_reg[3][18] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [18]),
        .R(SR));
  FDRE \duty_reg_reg[3][19] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [19]),
        .R(SR));
  FDRE \duty_reg_reg[3][1] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [1]),
        .R(SR));
  FDRE \duty_reg_reg[3][20] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [20]),
        .R(SR));
  FDRE \duty_reg_reg[3][21] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [21]),
        .R(SR));
  FDRE \duty_reg_reg[3][22] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [22]),
        .R(SR));
  FDRE \duty_reg_reg[3][23] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [23]),
        .R(SR));
  FDRE \duty_reg_reg[3][24] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [24]),
        .R(SR));
  FDRE \duty_reg_reg[3][25] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [25]),
        .R(SR));
  FDRE \duty_reg_reg[3][26] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [26]),
        .R(SR));
  FDRE \duty_reg_reg[3][27] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [27]),
        .R(SR));
  FDRE \duty_reg_reg[3][28] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [28]),
        .R(SR));
  FDRE \duty_reg_reg[3][29] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [29]),
        .R(SR));
  FDRE \duty_reg_reg[3][2] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [2]),
        .R(SR));
  FDRE \duty_reg_reg[3][30] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [30]),
        .R(SR));
  FDRE \duty_reg_reg[3][31] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [31]),
        .R(SR));
  FDRE \duty_reg_reg[3][3] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [3]),
        .R(SR));
  FDRE \duty_reg_reg[3][4] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [4]),
        .R(SR));
  FDRE \duty_reg_reg[3][5] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [5]),
        .R(SR));
  FDRE \duty_reg_reg[3][6] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [6]),
        .R(SR));
  FDRE \duty_reg_reg[3][7] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [7]),
        .R(SR));
  FDRE \duty_reg_reg[3][8] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [8]),
        .R(SR));
  FDRE \duty_reg_reg[3][9] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[3][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\genblk1[3].duty_reg_latch_reg[3][31] [9]),
        .R(SR));
  FDRE \duty_reg_reg[4][0] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [0]),
        .R(SR));
  FDRE \duty_reg_reg[4][10] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [10]),
        .R(SR));
  FDRE \duty_reg_reg[4][11] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [11]),
        .R(SR));
  FDRE \duty_reg_reg[4][12] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [12]),
        .R(SR));
  FDRE \duty_reg_reg[4][13] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [13]),
        .R(SR));
  FDRE \duty_reg_reg[4][14] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [14]),
        .R(SR));
  FDRE \duty_reg_reg[4][15] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [15]),
        .R(SR));
  FDRE \duty_reg_reg[4][16] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [16]),
        .R(SR));
  FDRE \duty_reg_reg[4][17] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [17]),
        .R(SR));
  FDRE \duty_reg_reg[4][18] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [18]),
        .R(SR));
  FDRE \duty_reg_reg[4][19] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [19]),
        .R(SR));
  FDRE \duty_reg_reg[4][1] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [1]),
        .R(SR));
  FDRE \duty_reg_reg[4][20] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [20]),
        .R(SR));
  FDRE \duty_reg_reg[4][21] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [21]),
        .R(SR));
  FDRE \duty_reg_reg[4][22] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [22]),
        .R(SR));
  FDRE \duty_reg_reg[4][23] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [23]),
        .R(SR));
  FDRE \duty_reg_reg[4][24] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [24]),
        .R(SR));
  FDRE \duty_reg_reg[4][25] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [25]),
        .R(SR));
  FDRE \duty_reg_reg[4][26] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [26]),
        .R(SR));
  FDRE \duty_reg_reg[4][27] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [27]),
        .R(SR));
  FDRE \duty_reg_reg[4][28] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [28]),
        .R(SR));
  FDRE \duty_reg_reg[4][29] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [29]),
        .R(SR));
  FDRE \duty_reg_reg[4][2] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [2]),
        .R(SR));
  FDRE \duty_reg_reg[4][30] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [30]),
        .R(SR));
  FDRE \duty_reg_reg[4][31] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [31]),
        .R(SR));
  FDRE \duty_reg_reg[4][3] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [3]),
        .R(SR));
  FDRE \duty_reg_reg[4][4] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [4]),
        .R(SR));
  FDRE \duty_reg_reg[4][5] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [5]),
        .R(SR));
  FDRE \duty_reg_reg[4][6] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [6]),
        .R(SR));
  FDRE \duty_reg_reg[4][7] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [7]),
        .R(SR));
  FDRE \duty_reg_reg[4][8] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [8]),
        .R(SR));
  FDRE \duty_reg_reg[4][9] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[4][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\genblk1[4].duty_reg_latch_reg[4][31] [9]),
        .R(SR));
  FDRE \duty_reg_reg[5][0] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [0]),
        .R(SR));
  FDRE \duty_reg_reg[5][10] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [10]),
        .R(SR));
  FDRE \duty_reg_reg[5][11] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [11]),
        .R(SR));
  FDRE \duty_reg_reg[5][12] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [12]),
        .R(SR));
  FDRE \duty_reg_reg[5][13] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [13]),
        .R(SR));
  FDRE \duty_reg_reg[5][14] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [14]),
        .R(SR));
  FDRE \duty_reg_reg[5][15] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [15]),
        .R(SR));
  FDRE \duty_reg_reg[5][16] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [16]),
        .R(SR));
  FDRE \duty_reg_reg[5][17] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [17]),
        .R(SR));
  FDRE \duty_reg_reg[5][18] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [18]),
        .R(SR));
  FDRE \duty_reg_reg[5][19] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [19]),
        .R(SR));
  FDRE \duty_reg_reg[5][1] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [1]),
        .R(SR));
  FDRE \duty_reg_reg[5][20] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [20]),
        .R(SR));
  FDRE \duty_reg_reg[5][21] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [21]),
        .R(SR));
  FDRE \duty_reg_reg[5][22] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [22]),
        .R(SR));
  FDRE \duty_reg_reg[5][23] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [23]),
        .R(SR));
  FDRE \duty_reg_reg[5][24] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [24]),
        .R(SR));
  FDRE \duty_reg_reg[5][25] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [25]),
        .R(SR));
  FDRE \duty_reg_reg[5][26] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [26]),
        .R(SR));
  FDRE \duty_reg_reg[5][27] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [27]),
        .R(SR));
  FDRE \duty_reg_reg[5][28] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [28]),
        .R(SR));
  FDRE \duty_reg_reg[5][29] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [29]),
        .R(SR));
  FDRE \duty_reg_reg[5][2] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [2]),
        .R(SR));
  FDRE \duty_reg_reg[5][30] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [30]),
        .R(SR));
  FDRE \duty_reg_reg[5][31] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [31]),
        .R(SR));
  FDRE \duty_reg_reg[5][3] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [3]),
        .R(SR));
  FDRE \duty_reg_reg[5][4] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [4]),
        .R(SR));
  FDRE \duty_reg_reg[5][5] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [5]),
        .R(SR));
  FDRE \duty_reg_reg[5][6] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [6]),
        .R(SR));
  FDRE \duty_reg_reg[5][7] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [7]),
        .R(SR));
  FDRE \duty_reg_reg[5][8] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [8]),
        .R(SR));
  FDRE \duty_reg_reg[5][9] 
       (.C(pwm_axi_aclk),
        .CE(\duty_reg[5][15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\genblk1[5].duty_reg_latch_reg[5][31] [9]),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \period_reg[15]_i_1 
       (.I0(\period_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\period_reg[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \period_reg[23]_i_1 
       (.I0(\period_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\period_reg[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \period_reg[31]_i_1 
       (.I0(\period_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\period_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \period_reg[31]_i_2 
       (.I0(p_0_in[4]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[3]),
        .I4(\duty_reg[0][31]_i_3_n_0 ),
        .I5(p_0_in[2]),
        .O(\period_reg[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \period_reg[7]_i_1 
       (.I0(\period_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\period_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\max_reg[31] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\max_reg[31] [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\max_reg[31] [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b1)) 
    \period_reg_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\max_reg[31] [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\max_reg[31] [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\max_reg[31] [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\max_reg[31] [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\max_reg[31] [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\max_reg[31] [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\max_reg[31] [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\max_reg[31] [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\max_reg[31] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\max_reg[31] [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\max_reg[31] [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\max_reg[31] [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\max_reg[31] [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\max_reg[31] [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\max_reg[31] [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\max_reg[31] [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\max_reg[31] [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\max_reg[31] [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\max_reg[31] [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\max_reg[31] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\max_reg[31] [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\max_reg[31] [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\max_reg[31] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\max_reg[31] [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\max_reg[31] [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\max_reg[31] [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\max_reg[31] [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\max_reg[31] [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \period_reg_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(\period_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\max_reg[31] [9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h40)) 
    slv_reg_rden
       (.I0(pwm_axi_rvalid),
        .I1(pwm_axi_arvalid),
        .I2(pwm_axi_arready),
        .O(slv_reg_rden__0));
  LUT2 #(
    .INIT(4'h8)) 
    \status_reg[15]_i_1 
       (.I0(\status_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[1]),
        .O(\status_reg[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \status_reg[23]_i_1 
       (.I0(\status_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[2]),
        .O(\status_reg[23]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \status_reg[31]_i_1 
       (.I0(\status_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[3]),
        .O(\status_reg[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \status_reg[31]_i_2 
       (.I0(p_0_in[4]),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[3]),
        .I4(\duty_reg[0][31]_i_3_n_0 ),
        .I5(p_0_in[2]),
        .O(\status_reg[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \status_reg[7]_i_1 
       (.I0(\status_reg[31]_i_2_n_0 ),
        .I1(pwm_axi_wstrb[0]),
        .O(\status_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[0]),
        .Q(\status_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[10]),
        .Q(\status_reg_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[11]),
        .Q(\status_reg_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[12]),
        .Q(\status_reg_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[13]),
        .Q(\status_reg_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[14]),
        .Q(\status_reg_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[15]),
        .Q(\status_reg_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[16]),
        .Q(\status_reg_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[17]),
        .Q(\status_reg_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[18]),
        .Q(\status_reg_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[19]),
        .Q(\status_reg_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[1]),
        .Q(\status_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[20]),
        .Q(\status_reg_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[21]),
        .Q(\status_reg_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[22]),
        .Q(\status_reg_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[23]_i_1_n_0 ),
        .D(pwm_axi_wdata[23]),
        .Q(\status_reg_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[24]),
        .Q(\status_reg_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[25]),
        .Q(\status_reg_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[26]),
        .Q(\status_reg_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[27]),
        .Q(\status_reg_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[28]),
        .Q(\status_reg_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[29]),
        .Q(\status_reg_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[2]),
        .Q(\status_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[30]),
        .Q(\status_reg_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[31]_i_1_n_0 ),
        .D(pwm_axi_wdata[31]),
        .Q(\status_reg_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[3]),
        .Q(\status_reg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[4]),
        .Q(\status_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[5]),
        .Q(\status_reg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[6]),
        .Q(\status_reg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[7]_i_1_n_0 ),
        .D(pwm_axi_wdata[7]),
        .Q(\status_reg_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[8]),
        .Q(\status_reg_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(\status_reg[15]_i_1_n_0 ),
        .D(pwm_axi_wdata[9]),
        .Q(\status_reg_reg_n_0_[9] ),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PWM_v2_0
   (pwm_axi_arready,
    pwm_axi_awready,
    pwm_axi_wready,
    pwm_axi_rdata,
    pwm_axi_rvalid,
    pwm_axi_bvalid,
    pwm,
    pwm_axi_arvalid,
    pwm_axi_aclk,
    pwm_axi_awaddr,
    pwm_axi_wdata,
    pwm_axi_araddr,
    pwm_axi_awvalid,
    pwm_axi_wvalid,
    pwm_axi_wstrb,
    pwm_axi_aresetn,
    pwm_axi_bready,
    pwm_axi_rready);
  output pwm_axi_arready;
  output pwm_axi_awready;
  output pwm_axi_wready;
  output [31:0]pwm_axi_rdata;
  output pwm_axi_rvalid;
  output pwm_axi_bvalid;
  output [5:0]pwm;
  input pwm_axi_arvalid;
  input pwm_axi_aclk;
  input [4:0]pwm_axi_awaddr;
  input [31:0]pwm_axi_wdata;
  input [4:0]pwm_axi_araddr;
  input pwm_axi_awvalid;
  input pwm_axi_wvalid;
  input [3:0]pwm_axi_wstrb;
  input pwm_axi_aresetn;
  input pwm_axi_bready;
  input pwm_axi_rready;

  wire \_inferred__0/i__carry__0_n_0 ;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__1_n_0 ;
  wire \_inferred__0/i__carry__1_n_1 ;
  wire \_inferred__0/i__carry__1_n_2 ;
  wire \_inferred__0/i__carry__1_n_3 ;
  wire \_inferred__0/i__carry__2_n_0 ;
  wire \_inferred__0/i__carry__2_n_1 ;
  wire \_inferred__0/i__carry__2_n_2 ;
  wire \_inferred__0/i__carry__2_n_3 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire count1;
  wire count1_carry__0_i_1_n_0;
  wire count1_carry__0_i_2_n_0;
  wire count1_carry__0_i_3_n_0;
  wire count1_carry__0_i_4_n_0;
  wire count1_carry__0_i_5_n_0;
  wire count1_carry__0_i_6_n_0;
  wire count1_carry__0_i_7_n_0;
  wire count1_carry__0_i_8_n_0;
  wire count1_carry__0_n_0;
  wire count1_carry__0_n_1;
  wire count1_carry__0_n_2;
  wire count1_carry__0_n_3;
  wire count1_carry__1_i_1_n_0;
  wire count1_carry__1_i_2_n_0;
  wire count1_carry__1_i_3_n_0;
  wire count1_carry__1_i_4_n_0;
  wire count1_carry__1_i_5_n_0;
  wire count1_carry__1_i_6_n_0;
  wire count1_carry__1_i_7_n_0;
  wire count1_carry__1_i_8_n_0;
  wire count1_carry__1_n_0;
  wire count1_carry__1_n_1;
  wire count1_carry__1_n_2;
  wire count1_carry__1_n_3;
  wire count1_carry__2_i_1_n_0;
  wire count1_carry__2_i_2_n_0;
  wire count1_carry__2_i_3_n_0;
  wire count1_carry__2_i_4_n_0;
  wire count1_carry__2_i_5_n_0;
  wire count1_carry__2_i_6_n_0;
  wire count1_carry__2_i_7_n_0;
  wire count1_carry__2_i_8_n_0;
  wire count1_carry__2_n_1;
  wire count1_carry__2_n_2;
  wire count1_carry__2_n_3;
  wire count1_carry_i_1_n_0;
  wire count1_carry_i_2_n_0;
  wire count1_carry_i_3_n_0;
  wire count1_carry_i_4_n_0;
  wire count1_carry_i_5_n_0;
  wire count1_carry_i_6_n_0;
  wire count1_carry_i_7_n_0;
  wire count1_carry_i_8_n_0;
  wire count1_carry_n_0;
  wire count1_carry_n_1;
  wire count1_carry_n_2;
  wire count1_carry_n_3;
  wire \count[0]_i_2_n_0 ;
  wire [31:0]count_reg;
  wire \count_reg[0]_i_1_n_0 ;
  wire \count_reg[0]_i_1_n_1 ;
  wire \count_reg[0]_i_1_n_2 ;
  wire \count_reg[0]_i_1_n_3 ;
  wire \count_reg[0]_i_1_n_4 ;
  wire \count_reg[0]_i_1_n_5 ;
  wire \count_reg[0]_i_1_n_6 ;
  wire \count_reg[0]_i_1_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[16]_i_1_n_0 ;
  wire \count_reg[16]_i_1_n_1 ;
  wire \count_reg[16]_i_1_n_2 ;
  wire \count_reg[16]_i_1_n_3 ;
  wire \count_reg[16]_i_1_n_4 ;
  wire \count_reg[16]_i_1_n_5 ;
  wire \count_reg[16]_i_1_n_6 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[20]_i_1_n_0 ;
  wire \count_reg[20]_i_1_n_1 ;
  wire \count_reg[20]_i_1_n_2 ;
  wire \count_reg[20]_i_1_n_3 ;
  wire \count_reg[20]_i_1_n_4 ;
  wire \count_reg[20]_i_1_n_5 ;
  wire \count_reg[20]_i_1_n_6 ;
  wire \count_reg[20]_i_1_n_7 ;
  wire \count_reg[24]_i_1_n_0 ;
  wire \count_reg[24]_i_1_n_1 ;
  wire \count_reg[24]_i_1_n_2 ;
  wire \count_reg[24]_i_1_n_3 ;
  wire \count_reg[24]_i_1_n_4 ;
  wire \count_reg[24]_i_1_n_5 ;
  wire \count_reg[24]_i_1_n_6 ;
  wire \count_reg[24]_i_1_n_7 ;
  wire \count_reg[28]_i_1_n_1 ;
  wire \count_reg[28]_i_1_n_2 ;
  wire \count_reg[28]_i_1_n_3 ;
  wire \count_reg[28]_i_1_n_4 ;
  wire \count_reg[28]_i_1_n_5 ;
  wire \count_reg[28]_i_1_n_6 ;
  wire \count_reg[28]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire ctrl_reg;
  wire [31:0]\duty_reg[0]_0 ;
  wire [31:0]\duty_reg[1]_1 ;
  wire [31:0]\duty_reg[2]_2 ;
  wire [31:0]\duty_reg[3]_3 ;
  wire [31:0]\duty_reg[4]_4 ;
  wire [31:0]\duty_reg[5]_5 ;
  wire enable;
  wire \genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ;
  wire [31:0]\genblk1[0].duty_reg_latch_reg[0] ;
  wire [31:0]\genblk1[1].duty_reg_latch_reg[1] ;
  wire [31:0]\genblk1[2].duty_reg_latch_reg[2] ;
  wire [31:0]\genblk1[3].duty_reg_latch_reg[3] ;
  wire [31:0]\genblk1[4].duty_reg_latch_reg[4] ;
  wire [31:0]\genblk1[5].duty_reg_latch_reg[5] ;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1__1_n_0;
  wire i__carry__0_i_1__2_n_0;
  wire i__carry__0_i_1__3_n_0;
  wire i__carry__0_i_1__4_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2__1_n_0;
  wire i__carry__0_i_2__2_n_0;
  wire i__carry__0_i_2__3_n_0;
  wire i__carry__0_i_2__4_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_3__1_n_0;
  wire i__carry__0_i_3__2_n_0;
  wire i__carry__0_i_3__3_n_0;
  wire i__carry__0_i_3__4_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_4__1_n_0;
  wire i__carry__0_i_4__2_n_0;
  wire i__carry__0_i_4__3_n_0;
  wire i__carry__0_i_4__4_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5__0_n_0;
  wire i__carry__0_i_5__1_n_0;
  wire i__carry__0_i_5__2_n_0;
  wire i__carry__0_i_5__3_n_0;
  wire i__carry__0_i_5__4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6__0_n_0;
  wire i__carry__0_i_6__1_n_0;
  wire i__carry__0_i_6__2_n_0;
  wire i__carry__0_i_6__3_n_0;
  wire i__carry__0_i_6__4_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7__0_n_0;
  wire i__carry__0_i_7__1_n_0;
  wire i__carry__0_i_7__2_n_0;
  wire i__carry__0_i_7__3_n_0;
  wire i__carry__0_i_7__4_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8__0_n_0;
  wire i__carry__0_i_8__1_n_0;
  wire i__carry__0_i_8__2_n_0;
  wire i__carry__0_i_8__3_n_0;
  wire i__carry__0_i_8__4_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry__1_i_1__0_n_0;
  wire i__carry__1_i_1__1_n_0;
  wire i__carry__1_i_1__2_n_0;
  wire i__carry__1_i_1__3_n_0;
  wire i__carry__1_i_1__4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_2__1_n_0;
  wire i__carry__1_i_2__2_n_0;
  wire i__carry__1_i_2__3_n_0;
  wire i__carry__1_i_2__4_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_3__1_n_0;
  wire i__carry__1_i_3__2_n_0;
  wire i__carry__1_i_3__3_n_0;
  wire i__carry__1_i_3__4_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4__0_n_0;
  wire i__carry__1_i_4__1_n_0;
  wire i__carry__1_i_4__2_n_0;
  wire i__carry__1_i_4__3_n_0;
  wire i__carry__1_i_4__4_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__1_i_5__0_n_0;
  wire i__carry__1_i_5__1_n_0;
  wire i__carry__1_i_5__2_n_0;
  wire i__carry__1_i_5__3_n_0;
  wire i__carry__1_i_5__4_n_0;
  wire i__carry__1_i_5_n_0;
  wire i__carry__1_i_6__0_n_0;
  wire i__carry__1_i_6__1_n_0;
  wire i__carry__1_i_6__2_n_0;
  wire i__carry__1_i_6__3_n_0;
  wire i__carry__1_i_6__4_n_0;
  wire i__carry__1_i_6_n_0;
  wire i__carry__1_i_7__0_n_0;
  wire i__carry__1_i_7__1_n_0;
  wire i__carry__1_i_7__2_n_0;
  wire i__carry__1_i_7__3_n_0;
  wire i__carry__1_i_7__4_n_0;
  wire i__carry__1_i_7_n_0;
  wire i__carry__1_i_8__0_n_0;
  wire i__carry__1_i_8__1_n_0;
  wire i__carry__1_i_8__2_n_0;
  wire i__carry__1_i_8__3_n_0;
  wire i__carry__1_i_8__4_n_0;
  wire i__carry__1_i_8_n_0;
  wire i__carry__2_i_1__0_n_0;
  wire i__carry__2_i_1__1_n_0;
  wire i__carry__2_i_1__2_n_0;
  wire i__carry__2_i_1__3_n_0;
  wire i__carry__2_i_1__4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2__0_n_0;
  wire i__carry__2_i_2__1_n_0;
  wire i__carry__2_i_2__2_n_0;
  wire i__carry__2_i_2__3_n_0;
  wire i__carry__2_i_2__4_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3__0_n_0;
  wire i__carry__2_i_3__1_n_0;
  wire i__carry__2_i_3__2_n_0;
  wire i__carry__2_i_3__3_n_0;
  wire i__carry__2_i_3__4_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4__0_n_0;
  wire i__carry__2_i_4__1_n_0;
  wire i__carry__2_i_4__2_n_0;
  wire i__carry__2_i_4__3_n_0;
  wire i__carry__2_i_4__4_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__2_i_5__0_n_0;
  wire i__carry__2_i_5__1_n_0;
  wire i__carry__2_i_5__2_n_0;
  wire i__carry__2_i_5__3_n_0;
  wire i__carry__2_i_5__4_n_0;
  wire i__carry__2_i_5_n_0;
  wire i__carry__2_i_6__0_n_0;
  wire i__carry__2_i_6__1_n_0;
  wire i__carry__2_i_6__2_n_0;
  wire i__carry__2_i_6__3_n_0;
  wire i__carry__2_i_6__4_n_0;
  wire i__carry__2_i_6_n_0;
  wire i__carry__2_i_7__0_n_0;
  wire i__carry__2_i_7__1_n_0;
  wire i__carry__2_i_7__2_n_0;
  wire i__carry__2_i_7__3_n_0;
  wire i__carry__2_i_7__4_n_0;
  wire i__carry__2_i_7_n_0;
  wire i__carry__2_i_8__0_n_0;
  wire i__carry__2_i_8__1_n_0;
  wire i__carry__2_i_8__2_n_0;
  wire i__carry__2_i_8__3_n_0;
  wire i__carry__2_i_8__4_n_0;
  wire i__carry__2_i_8_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_1__2_n_0;
  wire i__carry_i_1__3_n_0;
  wire i__carry_i_1__4_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_2__2_n_0;
  wire i__carry_i_2__3_n_0;
  wire i__carry_i_2__4_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_3__2_n_0;
  wire i__carry_i_3__3_n_0;
  wire i__carry_i_3__4_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_4__2_n_0;
  wire i__carry_i_4__3_n_0;
  wire i__carry_i_4__4_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_5__1_n_0;
  wire i__carry_i_5__2_n_0;
  wire i__carry_i_5__3_n_0;
  wire i__carry_i_5__4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6__0_n_0;
  wire i__carry_i_6__1_n_0;
  wire i__carry_i_6__2_n_0;
  wire i__carry_i_6__3_n_0;
  wire i__carry_i_6__4_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7__0_n_0;
  wire i__carry_i_7__1_n_0;
  wire i__carry_i_7__2_n_0;
  wire i__carry_i_7__3_n_0;
  wire i__carry_i_7__4_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8__0_n_0;
  wire i__carry_i_8__1_n_0;
  wire i__carry_i_8__2_n_0;
  wire i__carry_i_8__3_n_0;
  wire i__carry_i_8__4_n_0;
  wire i__carry_i_8_n_0;
  wire [31:0]max;
  wire \max[31]_i_1_n_0 ;
  wire [31:0]period_reg;
  wire [5:0]pwm;
  wire pwm1;
  wire pwm10_in;
  wire pwm12_in;
  wire pwm14_in;
  wire pwm16_in;
  wire pwm18_in;
  wire pwm1_carry__0_i_1_n_0;
  wire pwm1_carry__0_i_2_n_0;
  wire pwm1_carry__0_i_3_n_0;
  wire pwm1_carry__0_i_4_n_0;
  wire pwm1_carry__0_i_5_n_0;
  wire pwm1_carry__0_i_6_n_0;
  wire pwm1_carry__0_i_7_n_0;
  wire pwm1_carry__0_i_8_n_0;
  wire pwm1_carry__0_n_0;
  wire pwm1_carry__0_n_1;
  wire pwm1_carry__0_n_2;
  wire pwm1_carry__0_n_3;
  wire pwm1_carry__1_i_1_n_0;
  wire pwm1_carry__1_i_2_n_0;
  wire pwm1_carry__1_i_3_n_0;
  wire pwm1_carry__1_i_4_n_0;
  wire pwm1_carry__1_i_5_n_0;
  wire pwm1_carry__1_i_6_n_0;
  wire pwm1_carry__1_i_7_n_0;
  wire pwm1_carry__1_i_8_n_0;
  wire pwm1_carry__1_n_0;
  wire pwm1_carry__1_n_1;
  wire pwm1_carry__1_n_2;
  wire pwm1_carry__1_n_3;
  wire pwm1_carry__2_i_1_n_0;
  wire pwm1_carry__2_i_2_n_0;
  wire pwm1_carry__2_i_3_n_0;
  wire pwm1_carry__2_i_4_n_0;
  wire pwm1_carry__2_i_5_n_0;
  wire pwm1_carry__2_i_6_n_0;
  wire pwm1_carry__2_i_7_n_0;
  wire pwm1_carry__2_i_8_n_0;
  wire pwm1_carry__2_n_1;
  wire pwm1_carry__2_n_2;
  wire pwm1_carry__2_n_3;
  wire pwm1_carry_i_1_n_0;
  wire pwm1_carry_i_2_n_0;
  wire pwm1_carry_i_3_n_0;
  wire pwm1_carry_i_4_n_0;
  wire pwm1_carry_i_5_n_0;
  wire pwm1_carry_i_6_n_0;
  wire pwm1_carry_i_7_n_0;
  wire pwm1_carry_i_8_n_0;
  wire pwm1_carry_n_0;
  wire pwm1_carry_n_1;
  wire pwm1_carry_n_2;
  wire pwm1_carry_n_3;
  wire \pwm1_inferred__0/i__carry__0_n_0 ;
  wire \pwm1_inferred__0/i__carry__0_n_1 ;
  wire \pwm1_inferred__0/i__carry__0_n_2 ;
  wire \pwm1_inferred__0/i__carry__0_n_3 ;
  wire \pwm1_inferred__0/i__carry__1_n_0 ;
  wire \pwm1_inferred__0/i__carry__1_n_1 ;
  wire \pwm1_inferred__0/i__carry__1_n_2 ;
  wire \pwm1_inferred__0/i__carry__1_n_3 ;
  wire \pwm1_inferred__0/i__carry__2_n_1 ;
  wire \pwm1_inferred__0/i__carry__2_n_2 ;
  wire \pwm1_inferred__0/i__carry__2_n_3 ;
  wire \pwm1_inferred__0/i__carry_n_0 ;
  wire \pwm1_inferred__0/i__carry_n_1 ;
  wire \pwm1_inferred__0/i__carry_n_2 ;
  wire \pwm1_inferred__0/i__carry_n_3 ;
  wire \pwm1_inferred__1/i__carry__0_n_0 ;
  wire \pwm1_inferred__1/i__carry__0_n_1 ;
  wire \pwm1_inferred__1/i__carry__0_n_2 ;
  wire \pwm1_inferred__1/i__carry__0_n_3 ;
  wire \pwm1_inferred__1/i__carry__1_n_0 ;
  wire \pwm1_inferred__1/i__carry__1_n_1 ;
  wire \pwm1_inferred__1/i__carry__1_n_2 ;
  wire \pwm1_inferred__1/i__carry__1_n_3 ;
  wire \pwm1_inferred__1/i__carry__2_n_1 ;
  wire \pwm1_inferred__1/i__carry__2_n_2 ;
  wire \pwm1_inferred__1/i__carry__2_n_3 ;
  wire \pwm1_inferred__1/i__carry_n_0 ;
  wire \pwm1_inferred__1/i__carry_n_1 ;
  wire \pwm1_inferred__1/i__carry_n_2 ;
  wire \pwm1_inferred__1/i__carry_n_3 ;
  wire \pwm1_inferred__2/i__carry__0_n_0 ;
  wire \pwm1_inferred__2/i__carry__0_n_1 ;
  wire \pwm1_inferred__2/i__carry__0_n_2 ;
  wire \pwm1_inferred__2/i__carry__0_n_3 ;
  wire \pwm1_inferred__2/i__carry__1_n_0 ;
  wire \pwm1_inferred__2/i__carry__1_n_1 ;
  wire \pwm1_inferred__2/i__carry__1_n_2 ;
  wire \pwm1_inferred__2/i__carry__1_n_3 ;
  wire \pwm1_inferred__2/i__carry__2_n_1 ;
  wire \pwm1_inferred__2/i__carry__2_n_2 ;
  wire \pwm1_inferred__2/i__carry__2_n_3 ;
  wire \pwm1_inferred__2/i__carry_n_0 ;
  wire \pwm1_inferred__2/i__carry_n_1 ;
  wire \pwm1_inferred__2/i__carry_n_2 ;
  wire \pwm1_inferred__2/i__carry_n_3 ;
  wire \pwm1_inferred__3/i__carry__0_n_0 ;
  wire \pwm1_inferred__3/i__carry__0_n_1 ;
  wire \pwm1_inferred__3/i__carry__0_n_2 ;
  wire \pwm1_inferred__3/i__carry__0_n_3 ;
  wire \pwm1_inferred__3/i__carry__1_n_0 ;
  wire \pwm1_inferred__3/i__carry__1_n_1 ;
  wire \pwm1_inferred__3/i__carry__1_n_2 ;
  wire \pwm1_inferred__3/i__carry__1_n_3 ;
  wire \pwm1_inferred__3/i__carry__2_n_1 ;
  wire \pwm1_inferred__3/i__carry__2_n_2 ;
  wire \pwm1_inferred__3/i__carry__2_n_3 ;
  wire \pwm1_inferred__3/i__carry_n_0 ;
  wire \pwm1_inferred__3/i__carry_n_1 ;
  wire \pwm1_inferred__3/i__carry_n_2 ;
  wire \pwm1_inferred__3/i__carry_n_3 ;
  wire \pwm1_inferred__4/i__carry__0_n_0 ;
  wire \pwm1_inferred__4/i__carry__0_n_1 ;
  wire \pwm1_inferred__4/i__carry__0_n_2 ;
  wire \pwm1_inferred__4/i__carry__0_n_3 ;
  wire \pwm1_inferred__4/i__carry__1_n_0 ;
  wire \pwm1_inferred__4/i__carry__1_n_1 ;
  wire \pwm1_inferred__4/i__carry__1_n_2 ;
  wire \pwm1_inferred__4/i__carry__1_n_3 ;
  wire \pwm1_inferred__4/i__carry__2_n_1 ;
  wire \pwm1_inferred__4/i__carry__2_n_2 ;
  wire \pwm1_inferred__4/i__carry__2_n_3 ;
  wire \pwm1_inferred__4/i__carry_n_0 ;
  wire \pwm1_inferred__4/i__carry_n_1 ;
  wire \pwm1_inferred__4/i__carry_n_2 ;
  wire \pwm1_inferred__4/i__carry_n_3 ;
  wire pwm_axi_aclk;
  wire [4:0]pwm_axi_araddr;
  wire pwm_axi_aresetn;
  wire pwm_axi_arready;
  wire pwm_axi_arvalid;
  wire [4:0]pwm_axi_awaddr;
  wire pwm_axi_awready;
  wire pwm_axi_awvalid;
  wire pwm_axi_bready;
  wire pwm_axi_bvalid;
  wire [31:0]pwm_axi_rdata;
  wire pwm_axi_rready;
  wire pwm_axi_rvalid;
  wire [31:0]pwm_axi_wdata;
  wire pwm_axi_wready;
  wire [3:0]pwm_axi_wstrb;
  wire pwm_axi_wvalid;
  wire [3:0]\NLW__inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__2_O_UNCONNECTED ;
  wire [3:0]NLW_count1_carry_O_UNCONNECTED;
  wire [3:0]NLW_count1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_count1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_count1_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_pwm1_carry_O_UNCONNECTED;
  wire [3:0]NLW_pwm1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_pwm1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_pwm1_carry__2_O_UNCONNECTED;
  wire [3:0]\NLW_pwm1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__0/i__carry__2_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__1/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__1/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__1/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__1/i__carry__2_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__2/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__2/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__2/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__2/i__carry__2_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__3/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__3/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__3/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__3/i__carry__2_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__4/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__4/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__4/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_pwm1_inferred__4/i__carry__2_O_UNCONNECTED ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PWM_AXI PWM_AXI_inst
       (.Q(\duty_reg[0]_0 ),
        .SR(axi_awready_i_1_n_0),
        .axi_arready_reg_0(axi_rvalid_i_1_n_0),
        .axi_bvalid_reg_0(axi_bvalid_i_1_n_0),
        .enable_reg(ctrl_reg),
        .\genblk1[1].duty_reg_latch_reg[1][31] (\duty_reg[1]_1 ),
        .\genblk1[2].duty_reg_latch_reg[2][31] (\duty_reg[2]_2 ),
        .\genblk1[3].duty_reg_latch_reg[3][31] (\duty_reg[3]_3 ),
        .\genblk1[4].duty_reg_latch_reg[4][31] (\duty_reg[4]_4 ),
        .\genblk1[5].duty_reg_latch_reg[5][31] (\duty_reg[5]_5 ),
        .\max_reg[31] (period_reg),
        .pwm_axi_aclk(pwm_axi_aclk),
        .pwm_axi_araddr(pwm_axi_araddr),
        .pwm_axi_arready(pwm_axi_arready),
        .pwm_axi_arvalid(pwm_axi_arvalid),
        .pwm_axi_awaddr(pwm_axi_awaddr),
        .pwm_axi_awready(pwm_axi_awready),
        .pwm_axi_awvalid(pwm_axi_awvalid),
        .pwm_axi_bvalid(pwm_axi_bvalid),
        .pwm_axi_rdata(pwm_axi_rdata),
        .pwm_axi_rvalid(pwm_axi_rvalid),
        .pwm_axi_wdata(pwm_axi_wdata),
        .pwm_axi_wready(pwm_axi_wready),
        .pwm_axi_wstrb(pwm_axi_wstrb),
        .pwm_axi_wvalid(pwm_axi_wvalid));
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O(\NLW__inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\_inferred__0/i__carry__0_n_0 ,\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}),
        .O(\NLW__inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}));
  CARRY4 \_inferred__0/i__carry__1 
       (.CI(\_inferred__0/i__carry__0_n_0 ),
        .CO({\_inferred__0/i__carry__1_n_0 ,\_inferred__0/i__carry__1_n_1 ,\_inferred__0/i__carry__1_n_2 ,\_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}),
        .O(\NLW__inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5_n_0,i__carry__1_i_6_n_0,i__carry__1_i_7_n_0,i__carry__1_i_8_n_0}));
  CARRY4 \_inferred__0/i__carry__2 
       (.CI(\_inferred__0/i__carry__1_n_0 ),
        .CO({\_inferred__0/i__carry__2_n_0 ,\_inferred__0/i__carry__2_n_1 ,\_inferred__0/i__carry__2_n_2 ,\_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}),
        .O(\NLW__inferred__0/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5_n_0,i__carry__2_i_6_n_0,i__carry__2_i_7_n_0,i__carry__2_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(pwm_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h7444444444444444)) 
    axi_bvalid_i_1
       (.I0(pwm_axi_bready),
        .I1(pwm_axi_bvalid),
        .I2(pwm_axi_wready),
        .I3(pwm_axi_awready),
        .I4(pwm_axi_awvalid),
        .I5(pwm_axi_wvalid),
        .O(axi_bvalid_i_1_n_0));
  LUT4 #(
    .INIT(16'h0F88)) 
    axi_rvalid_i_1
       (.I0(pwm_axi_arready),
        .I1(pwm_axi_arvalid),
        .I2(pwm_axi_rready),
        .I3(pwm_axi_rvalid),
        .O(axi_rvalid_i_1_n_0));
  CARRY4 count1_carry
       (.CI(1'b0),
        .CO({count1_carry_n_0,count1_carry_n_1,count1_carry_n_2,count1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({count1_carry_i_1_n_0,count1_carry_i_2_n_0,count1_carry_i_3_n_0,count1_carry_i_4_n_0}),
        .O(NLW_count1_carry_O_UNCONNECTED[3:0]),
        .S({count1_carry_i_5_n_0,count1_carry_i_6_n_0,count1_carry_i_7_n_0,count1_carry_i_8_n_0}));
  CARRY4 count1_carry__0
       (.CI(count1_carry_n_0),
        .CO({count1_carry__0_n_0,count1_carry__0_n_1,count1_carry__0_n_2,count1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({count1_carry__0_i_1_n_0,count1_carry__0_i_2_n_0,count1_carry__0_i_3_n_0,count1_carry__0_i_4_n_0}),
        .O(NLW_count1_carry__0_O_UNCONNECTED[3:0]),
        .S({count1_carry__0_i_5_n_0,count1_carry__0_i_6_n_0,count1_carry__0_i_7_n_0,count1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__0_i_1
       (.I0(max[14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(max[15]),
        .O(count1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__0_i_2
       (.I0(max[12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(max[13]),
        .O(count1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__0_i_3
       (.I0(max[10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(max[11]),
        .O(count1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__0_i_4
       (.I0(max[8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(max[9]),
        .O(count1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__0_i_5
       (.I0(max[14]),
        .I1(count_reg[14]),
        .I2(max[15]),
        .I3(count_reg[15]),
        .O(count1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__0_i_6
       (.I0(max[12]),
        .I1(count_reg[12]),
        .I2(max[13]),
        .I3(count_reg[13]),
        .O(count1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__0_i_7
       (.I0(max[10]),
        .I1(count_reg[10]),
        .I2(max[11]),
        .I3(count_reg[11]),
        .O(count1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__0_i_8
       (.I0(max[8]),
        .I1(count_reg[8]),
        .I2(max[9]),
        .I3(count_reg[9]),
        .O(count1_carry__0_i_8_n_0));
  CARRY4 count1_carry__1
       (.CI(count1_carry__0_n_0),
        .CO({count1_carry__1_n_0,count1_carry__1_n_1,count1_carry__1_n_2,count1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({count1_carry__1_i_1_n_0,count1_carry__1_i_2_n_0,count1_carry__1_i_3_n_0,count1_carry__1_i_4_n_0}),
        .O(NLW_count1_carry__1_O_UNCONNECTED[3:0]),
        .S({count1_carry__1_i_5_n_0,count1_carry__1_i_6_n_0,count1_carry__1_i_7_n_0,count1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__1_i_1
       (.I0(max[22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(max[23]),
        .O(count1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__1_i_2
       (.I0(max[20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(max[21]),
        .O(count1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__1_i_3
       (.I0(max[18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(max[19]),
        .O(count1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__1_i_4
       (.I0(max[16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(max[17]),
        .O(count1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__1_i_5
       (.I0(max[22]),
        .I1(count_reg[22]),
        .I2(max[23]),
        .I3(count_reg[23]),
        .O(count1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__1_i_6
       (.I0(max[20]),
        .I1(count_reg[20]),
        .I2(max[21]),
        .I3(count_reg[21]),
        .O(count1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__1_i_7
       (.I0(max[18]),
        .I1(count_reg[18]),
        .I2(max[19]),
        .I3(count_reg[19]),
        .O(count1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__1_i_8
       (.I0(max[16]),
        .I1(count_reg[16]),
        .I2(max[17]),
        .I3(count_reg[17]),
        .O(count1_carry__1_i_8_n_0));
  CARRY4 count1_carry__2
       (.CI(count1_carry__1_n_0),
        .CO({count1,count1_carry__2_n_1,count1_carry__2_n_2,count1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({count1_carry__2_i_1_n_0,count1_carry__2_i_2_n_0,count1_carry__2_i_3_n_0,count1_carry__2_i_4_n_0}),
        .O(NLW_count1_carry__2_O_UNCONNECTED[3:0]),
        .S({count1_carry__2_i_5_n_0,count1_carry__2_i_6_n_0,count1_carry__2_i_7_n_0,count1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__2_i_1
       (.I0(max[30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(max[31]),
        .O(count1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__2_i_2
       (.I0(max[28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(max[29]),
        .O(count1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__2_i_3
       (.I0(max[26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(max[27]),
        .O(count1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry__2_i_4
       (.I0(max[24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(max[25]),
        .O(count1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__2_i_5
       (.I0(max[30]),
        .I1(count_reg[30]),
        .I2(max[31]),
        .I3(count_reg[31]),
        .O(count1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__2_i_6
       (.I0(max[28]),
        .I1(count_reg[28]),
        .I2(max[29]),
        .I3(count_reg[29]),
        .O(count1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__2_i_7
       (.I0(max[26]),
        .I1(count_reg[26]),
        .I2(max[27]),
        .I3(count_reg[27]),
        .O(count1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry__2_i_8
       (.I0(max[24]),
        .I1(count_reg[24]),
        .I2(max[25]),
        .I3(count_reg[25]),
        .O(count1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_1
       (.I0(max[6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(max[7]),
        .O(count1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_2
       (.I0(max[4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(max[5]),
        .O(count1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_3
       (.I0(max[2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(max[3]),
        .O(count1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count1_carry_i_4
       (.I0(max[0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(max[1]),
        .O(count1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_5
       (.I0(max[6]),
        .I1(count_reg[6]),
        .I2(max[7]),
        .I3(count_reg[7]),
        .O(count1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_6
       (.I0(max[4]),
        .I1(count_reg[4]),
        .I2(max[5]),
        .I3(count_reg[5]),
        .O(count1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_7
       (.I0(max[2]),
        .I1(count_reg[2]),
        .I2(max[3]),
        .I3(count_reg[3]),
        .O(count1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count1_carry_i_8
       (.I0(max[0]),
        .I1(count_reg[0]),
        .I2(max[1]),
        .I3(count_reg[1]),
        .O(count1_carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_2 
       (.I0(count_reg[0]),
        .O(\count[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_7 ),
        .Q(count_reg[0]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\count_reg[0]_i_1_n_0 ,\count_reg[0]_i_1_n_1 ,\count_reg[0]_i_1_n_2 ,\count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\count_reg[0]_i_1_n_4 ,\count_reg[0]_i_1_n_5 ,\count_reg[0]_i_1_n_6 ,\count_reg[0]_i_1_n_7 }),
        .S({count_reg[3:1],\count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S(count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(count_reg[15]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[16]_i_1_n_7 ),
        .Q(count_reg[16]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CO({\count_reg[16]_i_1_n_0 ,\count_reg[16]_i_1_n_1 ,\count_reg[16]_i_1_n_2 ,\count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[16]_i_1_n_4 ,\count_reg[16]_i_1_n_5 ,\count_reg[16]_i_1_n_6 ,\count_reg[16]_i_1_n_7 }),
        .S(count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[16]_i_1_n_6 ),
        .Q(count_reg[17]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[16]_i_1_n_5 ),
        .Q(count_reg[18]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[16]_i_1_n_4 ),
        .Q(count_reg[19]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_6 ),
        .Q(count_reg[1]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[20]_i_1_n_7 ),
        .Q(count_reg[20]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[20]_i_1 
       (.CI(\count_reg[16]_i_1_n_0 ),
        .CO({\count_reg[20]_i_1_n_0 ,\count_reg[20]_i_1_n_1 ,\count_reg[20]_i_1_n_2 ,\count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[20]_i_1_n_4 ,\count_reg[20]_i_1_n_5 ,\count_reg[20]_i_1_n_6 ,\count_reg[20]_i_1_n_7 }),
        .S(count_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[20]_i_1_n_6 ),
        .Q(count_reg[21]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[20]_i_1_n_5 ),
        .Q(count_reg[22]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[20]_i_1_n_4 ),
        .Q(count_reg[23]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[24]_i_1_n_7 ),
        .Q(count_reg[24]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[24]_i_1 
       (.CI(\count_reg[20]_i_1_n_0 ),
        .CO({\count_reg[24]_i_1_n_0 ,\count_reg[24]_i_1_n_1 ,\count_reg[24]_i_1_n_2 ,\count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[24]_i_1_n_4 ,\count_reg[24]_i_1_n_5 ,\count_reg[24]_i_1_n_6 ,\count_reg[24]_i_1_n_7 }),
        .S(count_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[24]_i_1_n_6 ),
        .Q(count_reg[25]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[24]_i_1_n_5 ),
        .Q(count_reg[26]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[24]_i_1_n_4 ),
        .Q(count_reg[27]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[28]_i_1_n_7 ),
        .Q(count_reg[28]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[28]_i_1 
       (.CI(\count_reg[24]_i_1_n_0 ),
        .CO({\NLW_count_reg[28]_i_1_CO_UNCONNECTED [3],\count_reg[28]_i_1_n_1 ,\count_reg[28]_i_1_n_2 ,\count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[28]_i_1_n_4 ,\count_reg[28]_i_1_n_5 ,\count_reg[28]_i_1_n_6 ,\count_reg[28]_i_1_n_7 }),
        .S(count_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[28]_i_1_n_6 ),
        .Q(count_reg[29]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_5 ),
        .Q(count_reg[2]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[28]_i_1_n_5 ),
        .Q(count_reg[30]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[28]_i_1_n_4 ),
        .Q(count_reg[31]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[0]_i_1_n_4 ),
        .Q(count_reg[3]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_1_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S(count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(\max[31]_i_1_n_0 ));
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S(count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    enable_reg
       (.C(pwm_axi_aclk),
        .CE(1'b1),
        .D(ctrl_reg),
        .Q(enable),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \genblk1[0].duty_reg_latch[0][31]_i_1 
       (.I0(\_inferred__0/i__carry__2_n_0 ),
        .I1(enable),
        .O(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ));
  FDRE \genblk1[0].duty_reg_latch_reg[0][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [0]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [0]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [10]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [10]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [11]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [11]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [12]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [12]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [13]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [13]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [14]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [14]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [15]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [15]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [16]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [16]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [17]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [17]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [18]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [18]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [19]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [19]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [1]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [1]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [20]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [20]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [21]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [21]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [22]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [22]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [23]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [23]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [24]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [24]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [25]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [25]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [26]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [26]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [27]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [27]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [28]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [28]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [29]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [29]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [2]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [2]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [30]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [30]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [31]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [31]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [3]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [3]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [4]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [4]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [5]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [5]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [6]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [6]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [7]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [7]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [8]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [8]),
        .R(1'b0));
  FDRE \genblk1[0].duty_reg_latch_reg[0][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[0]_0 [9]),
        .Q(\genblk1[0].duty_reg_latch_reg[0] [9]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [0]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [0]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [10]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [10]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [11]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [11]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [12]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [12]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [13]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [13]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [14]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [14]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [15]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [15]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [16]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [16]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [17]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [17]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [18]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [18]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [19]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [19]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [1]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [1]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [20]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [20]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [21]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [21]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [22]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [22]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [23]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [23]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [24]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [24]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [25]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [25]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [26]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [26]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [27]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [27]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [28]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [28]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [29]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [29]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [2]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [2]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [30]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [30]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [31]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [31]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [3]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [3]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [4]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [4]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [5]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [5]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [6]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [6]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [7]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [7]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [8]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [8]),
        .R(1'b0));
  FDRE \genblk1[1].duty_reg_latch_reg[1][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[1]_1 [9]),
        .Q(\genblk1[1].duty_reg_latch_reg[1] [9]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [0]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [0]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [10]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [10]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [11]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [11]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [12]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [12]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [13]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [13]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [14]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [14]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [15]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [15]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [16]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [16]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [17]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [17]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [18]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [18]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [19]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [19]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [1]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [1]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [20]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [20]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [21]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [21]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [22]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [22]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [23]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [23]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [24]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [24]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [25]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [25]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [26]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [26]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [27]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [27]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [28]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [28]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [29]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [29]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [2]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [2]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [30]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [30]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [31]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [31]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [3]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [3]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [4]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [4]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [5]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [5]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [6]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [6]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [7]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [7]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [8]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [8]),
        .R(1'b0));
  FDRE \genblk1[2].duty_reg_latch_reg[2][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[2]_2 [9]),
        .Q(\genblk1[2].duty_reg_latch_reg[2] [9]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [0]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [0]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [10]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [10]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [11]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [11]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [12]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [12]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [13]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [13]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [14]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [14]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [15]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [15]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [16]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [16]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [17]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [17]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [18]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [18]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [19]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [19]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [1]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [1]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [20]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [20]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [21]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [21]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [22]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [22]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [23]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [23]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [24]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [24]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [25]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [25]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [26]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [26]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [27]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [27]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [28]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [28]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [29]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [29]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [2]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [2]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [30]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [30]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [31]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [31]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [3]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [3]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [4]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [4]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [5]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [5]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [6]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [6]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [7]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [7]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [8]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [8]),
        .R(1'b0));
  FDRE \genblk1[3].duty_reg_latch_reg[3][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[3]_3 [9]),
        .Q(\genblk1[3].duty_reg_latch_reg[3] [9]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [0]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [0]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [10]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [10]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [11]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [11]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [12]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [12]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [13]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [13]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [14]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [14]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [15]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [15]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [16]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [16]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [17]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [17]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [18]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [18]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [19]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [19]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [1]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [1]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [20]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [20]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [21]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [21]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [22]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [22]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [23]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [23]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [24]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [24]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [25]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [25]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [26]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [26]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [27]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [27]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [28]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [28]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [29]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [29]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [2]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [2]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [30]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [30]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [31]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [31]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [3]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [3]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [4]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [4]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [5]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [5]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [6]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [6]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [7]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [7]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [8]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [8]),
        .R(1'b0));
  FDRE \genblk1[4].duty_reg_latch_reg[4][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[4]_4 [9]),
        .Q(\genblk1[4].duty_reg_latch_reg[4] [9]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][0] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [0]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [0]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][10] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [10]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [10]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][11] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [11]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [11]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][12] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [12]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [12]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][13] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [13]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [13]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][14] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [14]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [14]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][15] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [15]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [15]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][16] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [16]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [16]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][17] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [17]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [17]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][18] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [18]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [18]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][19] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [19]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [19]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][1] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [1]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [1]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][20] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [20]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [20]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][21] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [21]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [21]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][22] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [22]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [22]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][23] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [23]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [23]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][24] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [24]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [24]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][25] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [25]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [25]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][26] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [26]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [26]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][27] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [27]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [27]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][28] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [28]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [28]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][29] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [29]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [29]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][2] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [2]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [2]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][30] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [30]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [30]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][31] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [31]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [31]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][3] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [3]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [3]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][4] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [4]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [4]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][5] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [5]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [5]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][6] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [6]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [6]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][7] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [7]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [7]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][8] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [8]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [8]),
        .R(1'b0));
  FDRE \genblk1[5].duty_reg_latch_reg[5][9] 
       (.C(pwm_axi_aclk),
        .CE(\genblk1[0].duty_reg_latch[0][31]_i_1_n_0 ),
        .D(\duty_reg[5]_5 [9]),
        .Q(\genblk1[5].duty_reg_latch_reg[5] [9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1
       (.I0(count_reg[14]),
        .I1(max[14]),
        .I2(max[15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [15]),
        .O(i__carry__0_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [15]),
        .O(i__carry__0_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [15]),
        .O(i__carry__0_i_1__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [15]),
        .O(i__carry__0_i_1__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_1__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [15]),
        .O(i__carry__0_i_1__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2
       (.I0(count_reg[12]),
        .I1(max[12]),
        .I2(max[13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [13]),
        .O(i__carry__0_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [13]),
        .O(i__carry__0_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [13]),
        .O(i__carry__0_i_2__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [13]),
        .O(i__carry__0_i_2__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_2__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [13]),
        .O(i__carry__0_i_2__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3
       (.I0(count_reg[10]),
        .I1(max[10]),
        .I2(max[11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [11]),
        .O(i__carry__0_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [11]),
        .O(i__carry__0_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [11]),
        .O(i__carry__0_i_3__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [11]),
        .O(i__carry__0_i_3__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_3__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [11]),
        .O(i__carry__0_i_3__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4
       (.I0(count_reg[8]),
        .I1(max[8]),
        .I2(max[9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [9]),
        .O(i__carry__0_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [9]),
        .O(i__carry__0_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [9]),
        .O(i__carry__0_i_4__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [9]),
        .O(i__carry__0_i_4__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__0_i_4__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [9]),
        .O(i__carry__0_i_4__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5
       (.I0(count_reg[14]),
        .I1(max[14]),
        .I2(count_reg[15]),
        .I3(max[15]),
        .O(i__carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_5__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [15]),
        .I3(count_reg[15]),
        .O(i__carry__0_i_5__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6
       (.I0(count_reg[12]),
        .I1(max[12]),
        .I2(count_reg[13]),
        .I3(max[13]),
        .O(i__carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_6__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_6__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_6__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_6__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [13]),
        .I3(count_reg[13]),
        .O(i__carry__0_i_6__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7
       (.I0(count_reg[10]),
        .I1(max[10]),
        .I2(count_reg[11]),
        .I3(max[11]),
        .O(i__carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_7__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_7__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_7__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [11]),
        .I3(count_reg[11]),
        .O(i__carry__0_i_7__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8
       (.I0(count_reg[8]),
        .I1(max[8]),
        .I2(count_reg[9]),
        .I3(max[9]),
        .O(i__carry__0_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_8__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_8__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__0_i_8__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [9]),
        .I3(count_reg[9]),
        .O(i__carry__0_i_8__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1
       (.I0(count_reg[22]),
        .I1(max[22]),
        .I2(max[23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [23]),
        .O(i__carry__1_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [23]),
        .O(i__carry__1_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [23]),
        .O(i__carry__1_i_1__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [23]),
        .O(i__carry__1_i_1__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_1__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [23]),
        .O(i__carry__1_i_1__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2
       (.I0(count_reg[20]),
        .I1(max[20]),
        .I2(max[21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [21]),
        .O(i__carry__1_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [21]),
        .O(i__carry__1_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [21]),
        .O(i__carry__1_i_2__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [21]),
        .O(i__carry__1_i_2__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_2__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [21]),
        .O(i__carry__1_i_2__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3
       (.I0(count_reg[18]),
        .I1(max[18]),
        .I2(max[19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [19]),
        .O(i__carry__1_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [19]),
        .O(i__carry__1_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [19]),
        .O(i__carry__1_i_3__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [19]),
        .O(i__carry__1_i_3__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_3__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [19]),
        .O(i__carry__1_i_3__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4
       (.I0(count_reg[16]),
        .I1(max[16]),
        .I2(max[17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [17]),
        .O(i__carry__1_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [17]),
        .O(i__carry__1_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [17]),
        .O(i__carry__1_i_4__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [17]),
        .O(i__carry__1_i_4__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__1_i_4__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [17]),
        .O(i__carry__1_i_4__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5
       (.I0(count_reg[22]),
        .I1(max[22]),
        .I2(count_reg[23]),
        .I3(max[23]),
        .O(i__carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_5__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [23]),
        .I3(count_reg[23]),
        .O(i__carry__1_i_5__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6
       (.I0(count_reg[20]),
        .I1(max[20]),
        .I2(count_reg[21]),
        .I3(max[21]),
        .O(i__carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_6__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_6__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_6__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_6__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [21]),
        .I3(count_reg[21]),
        .O(i__carry__1_i_6__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7
       (.I0(count_reg[18]),
        .I1(max[18]),
        .I2(count_reg[19]),
        .I3(max[19]),
        .O(i__carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_7__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_7__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_7__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [19]),
        .I3(count_reg[19]),
        .O(i__carry__1_i_7__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8
       (.I0(count_reg[16]),
        .I1(max[16]),
        .I2(count_reg[17]),
        .I3(max[17]),
        .O(i__carry__1_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_8__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_8__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__1_i_8__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [17]),
        .I3(count_reg[17]),
        .O(i__carry__1_i_8__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1
       (.I0(count_reg[30]),
        .I1(max[30]),
        .I2(max[31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [31]),
        .O(i__carry__2_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [31]),
        .O(i__carry__2_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [31]),
        .O(i__carry__2_i_1__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [31]),
        .O(i__carry__2_i_1__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_1__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [31]),
        .O(i__carry__2_i_1__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2
       (.I0(count_reg[28]),
        .I1(max[28]),
        .I2(max[29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [29]),
        .O(i__carry__2_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [29]),
        .O(i__carry__2_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [29]),
        .O(i__carry__2_i_2__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [29]),
        .O(i__carry__2_i_2__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_2__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [29]),
        .O(i__carry__2_i_2__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3
       (.I0(count_reg[26]),
        .I1(max[26]),
        .I2(max[27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [27]),
        .O(i__carry__2_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [27]),
        .O(i__carry__2_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [27]),
        .O(i__carry__2_i_3__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [27]),
        .O(i__carry__2_i_3__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_3__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [27]),
        .O(i__carry__2_i_3__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4
       (.I0(count_reg[24]),
        .I1(max[24]),
        .I2(max[25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [25]),
        .O(i__carry__2_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [25]),
        .O(i__carry__2_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [25]),
        .O(i__carry__2_i_4__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [25]),
        .O(i__carry__2_i_4__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry__2_i_4__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [25]),
        .O(i__carry__2_i_4__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5
       (.I0(count_reg[30]),
        .I1(max[30]),
        .I2(count_reg[31]),
        .I3(max[31]),
        .O(i__carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_5__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [31]),
        .I3(count_reg[31]),
        .O(i__carry__2_i_5__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6
       (.I0(count_reg[28]),
        .I1(max[28]),
        .I2(count_reg[29]),
        .I3(max[29]),
        .O(i__carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_6__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_6__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_6__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_6__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [29]),
        .I3(count_reg[29]),
        .O(i__carry__2_i_6__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7
       (.I0(count_reg[26]),
        .I1(max[26]),
        .I2(count_reg[27]),
        .I3(max[27]),
        .O(i__carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_7__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_7__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_7__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [27]),
        .I3(count_reg[27]),
        .O(i__carry__2_i_7__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8
       (.I0(count_reg[24]),
        .I1(max[24]),
        .I2(count_reg[25]),
        .I3(max[25]),
        .O(i__carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_8__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_8__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry__2_i_8__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [25]),
        .I3(count_reg[25]),
        .O(i__carry__2_i_8__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1
       (.I0(count_reg[6]),
        .I1(max[6]),
        .I2(max[7]),
        .I3(count_reg[7]),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [7]),
        .O(i__carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [7]),
        .O(i__carry_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [7]),
        .O(i__carry_i_1__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [7]),
        .O(i__carry_i_1__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_1__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [7]),
        .O(i__carry_i_1__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2
       (.I0(count_reg[4]),
        .I1(max[4]),
        .I2(max[5]),
        .I3(count_reg[5]),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [5]),
        .O(i__carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [5]),
        .O(i__carry_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [5]),
        .O(i__carry_i_2__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [5]),
        .O(i__carry_i_2__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [5]),
        .O(i__carry_i_2__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3
       (.I0(count_reg[2]),
        .I1(max[2]),
        .I2(max[3]),
        .I3(count_reg[3]),
        .O(i__carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [3]),
        .O(i__carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [3]),
        .O(i__carry_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [3]),
        .O(i__carry_i_3__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [3]),
        .O(i__carry_i_3__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [3]),
        .O(i__carry_i_3__4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4
       (.I0(count_reg[0]),
        .I1(max[0]),
        .I2(max[1]),
        .I3(count_reg[1]),
        .O(i__carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[1].duty_reg_latch_reg[1] [1]),
        .O(i__carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[2].duty_reg_latch_reg[2] [1]),
        .O(i__carry_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[3].duty_reg_latch_reg[3] [1]),
        .O(i__carry_i_4__2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[4].duty_reg_latch_reg[4] [1]),
        .O(i__carry_i_4__3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[5].duty_reg_latch_reg[5] [1]),
        .O(i__carry_i_4__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5
       (.I0(count_reg[6]),
        .I1(max[6]),
        .I2(count_reg[7]),
        .I3(max[7]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [7]),
        .I3(count_reg[7]),
        .O(i__carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [7]),
        .I3(count_reg[7]),
        .O(i__carry_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [7]),
        .I3(count_reg[7]),
        .O(i__carry_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [7]),
        .I3(count_reg[7]),
        .O(i__carry_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [7]),
        .I3(count_reg[7]),
        .O(i__carry_i_5__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6
       (.I0(count_reg[4]),
        .I1(max[4]),
        .I2(count_reg[5]),
        .I3(max[5]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [5]),
        .I3(count_reg[5]),
        .O(i__carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [5]),
        .I3(count_reg[5]),
        .O(i__carry_i_6__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [5]),
        .I3(count_reg[5]),
        .O(i__carry_i_6__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [5]),
        .I3(count_reg[5]),
        .O(i__carry_i_6__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [5]),
        .I3(count_reg[5]),
        .O(i__carry_i_6__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7
       (.I0(count_reg[2]),
        .I1(max[2]),
        .I2(count_reg[3]),
        .I3(max[3]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [3]),
        .I3(count_reg[3]),
        .O(i__carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [3]),
        .I3(count_reg[3]),
        .O(i__carry_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [3]),
        .I3(count_reg[3]),
        .O(i__carry_i_7__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [3]),
        .I3(count_reg[3]),
        .O(i__carry_i_7__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [3]),
        .I3(count_reg[3]),
        .O(i__carry_i_7__4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8
       (.I0(count_reg[0]),
        .I1(max[0]),
        .I2(count_reg[1]),
        .I3(max[1]),
        .O(i__carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__0
       (.I0(\genblk1[1].duty_reg_latch_reg[1] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[1].duty_reg_latch_reg[1] [1]),
        .I3(count_reg[1]),
        .O(i__carry_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__1
       (.I0(\genblk1[2].duty_reg_latch_reg[2] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[2].duty_reg_latch_reg[2] [1]),
        .I3(count_reg[1]),
        .O(i__carry_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__2
       (.I0(\genblk1[3].duty_reg_latch_reg[3] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[3].duty_reg_latch_reg[3] [1]),
        .I3(count_reg[1]),
        .O(i__carry_i_8__2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__3
       (.I0(\genblk1[4].duty_reg_latch_reg[4] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[4].duty_reg_latch_reg[4] [1]),
        .I3(count_reg[1]),
        .O(i__carry_i_8__3_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__4
       (.I0(\genblk1[5].duty_reg_latch_reg[5] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[5].duty_reg_latch_reg[5] [1]),
        .I3(count_reg[1]),
        .O(i__carry_i_8__4_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    \max[31]_i_1 
       (.I0(enable),
        .I1(count1),
        .O(\max[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[0] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[0]),
        .Q(max[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[10] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[10]),
        .Q(max[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[11] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[11]),
        .Q(max[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \max_reg[12] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[12]),
        .Q(max[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[13] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[13]),
        .Q(max[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[14] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[14]),
        .Q(max[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[15] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[15]),
        .Q(max[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[16] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[16]),
        .Q(max[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[17] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[17]),
        .Q(max[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[18] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[18]),
        .Q(max[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[19] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[19]),
        .Q(max[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[1] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[1]),
        .Q(max[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[20] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[20]),
        .Q(max[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[21] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[21]),
        .Q(max[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[22] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[22]),
        .Q(max[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[23] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[23]),
        .Q(max[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[24] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[24]),
        .Q(max[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[25] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[25]),
        .Q(max[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[26] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[26]),
        .Q(max[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[27] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[27]),
        .Q(max[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[28] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[28]),
        .Q(max[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[29] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[29]),
        .Q(max[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[2] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[2]),
        .Q(max[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[30] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[30]),
        .Q(max[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[31] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[31]),
        .Q(max[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[3] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[3]),
        .Q(max[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[4] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[4]),
        .Q(max[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[5] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[5]),
        .Q(max[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[6] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[6]),
        .Q(max[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[7] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[7]),
        .Q(max[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[8] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[8]),
        .Q(max[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \max_reg[9] 
       (.C(pwm_axi_aclk),
        .CE(\max[31]_i_1_n_0 ),
        .D(period_reg[9]),
        .Q(max[9]),
        .R(1'b0));
  CARRY4 pwm1_carry
       (.CI(1'b0),
        .CO({pwm1_carry_n_0,pwm1_carry_n_1,pwm1_carry_n_2,pwm1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({pwm1_carry_i_1_n_0,pwm1_carry_i_2_n_0,pwm1_carry_i_3_n_0,pwm1_carry_i_4_n_0}),
        .O(NLW_pwm1_carry_O_UNCONNECTED[3:0]),
        .S({pwm1_carry_i_5_n_0,pwm1_carry_i_6_n_0,pwm1_carry_i_7_n_0,pwm1_carry_i_8_n_0}));
  CARRY4 pwm1_carry__0
       (.CI(pwm1_carry_n_0),
        .CO({pwm1_carry__0_n_0,pwm1_carry__0_n_1,pwm1_carry__0_n_2,pwm1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({pwm1_carry__0_i_1_n_0,pwm1_carry__0_i_2_n_0,pwm1_carry__0_i_3_n_0,pwm1_carry__0_i_4_n_0}),
        .O(NLW_pwm1_carry__0_O_UNCONNECTED[3:0]),
        .S({pwm1_carry__0_i_5_n_0,pwm1_carry__0_i_6_n_0,pwm1_carry__0_i_7_n_0,pwm1_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__0_i_1
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [14]),
        .I1(count_reg[14]),
        .I2(count_reg[15]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [15]),
        .O(pwm1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__0_i_2
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [12]),
        .I1(count_reg[12]),
        .I2(count_reg[13]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [13]),
        .O(pwm1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__0_i_3
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [10]),
        .I1(count_reg[10]),
        .I2(count_reg[11]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [11]),
        .O(pwm1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__0_i_4
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [8]),
        .I1(count_reg[8]),
        .I2(count_reg[9]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [9]),
        .O(pwm1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__0_i_5
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [14]),
        .I1(count_reg[14]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [15]),
        .I3(count_reg[15]),
        .O(pwm1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__0_i_6
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [12]),
        .I1(count_reg[12]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [13]),
        .I3(count_reg[13]),
        .O(pwm1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__0_i_7
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [10]),
        .I1(count_reg[10]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [11]),
        .I3(count_reg[11]),
        .O(pwm1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__0_i_8
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [8]),
        .I1(count_reg[8]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [9]),
        .I3(count_reg[9]),
        .O(pwm1_carry__0_i_8_n_0));
  CARRY4 pwm1_carry__1
       (.CI(pwm1_carry__0_n_0),
        .CO({pwm1_carry__1_n_0,pwm1_carry__1_n_1,pwm1_carry__1_n_2,pwm1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({pwm1_carry__1_i_1_n_0,pwm1_carry__1_i_2_n_0,pwm1_carry__1_i_3_n_0,pwm1_carry__1_i_4_n_0}),
        .O(NLW_pwm1_carry__1_O_UNCONNECTED[3:0]),
        .S({pwm1_carry__1_i_5_n_0,pwm1_carry__1_i_6_n_0,pwm1_carry__1_i_7_n_0,pwm1_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__1_i_1
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [22]),
        .I1(count_reg[22]),
        .I2(count_reg[23]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [23]),
        .O(pwm1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__1_i_2
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [20]),
        .I1(count_reg[20]),
        .I2(count_reg[21]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [21]),
        .O(pwm1_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__1_i_3
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [18]),
        .I1(count_reg[18]),
        .I2(count_reg[19]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [19]),
        .O(pwm1_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__1_i_4
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [16]),
        .I1(count_reg[16]),
        .I2(count_reg[17]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [17]),
        .O(pwm1_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__1_i_5
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [22]),
        .I1(count_reg[22]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [23]),
        .I3(count_reg[23]),
        .O(pwm1_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__1_i_6
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [20]),
        .I1(count_reg[20]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [21]),
        .I3(count_reg[21]),
        .O(pwm1_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__1_i_7
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [18]),
        .I1(count_reg[18]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [19]),
        .I3(count_reg[19]),
        .O(pwm1_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__1_i_8
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [16]),
        .I1(count_reg[16]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [17]),
        .I3(count_reg[17]),
        .O(pwm1_carry__1_i_8_n_0));
  CARRY4 pwm1_carry__2
       (.CI(pwm1_carry__1_n_0),
        .CO({pwm1,pwm1_carry__2_n_1,pwm1_carry__2_n_2,pwm1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({pwm1_carry__2_i_1_n_0,pwm1_carry__2_i_2_n_0,pwm1_carry__2_i_3_n_0,pwm1_carry__2_i_4_n_0}),
        .O(NLW_pwm1_carry__2_O_UNCONNECTED[3:0]),
        .S({pwm1_carry__2_i_5_n_0,pwm1_carry__2_i_6_n_0,pwm1_carry__2_i_7_n_0,pwm1_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__2_i_1
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [30]),
        .I1(count_reg[30]),
        .I2(count_reg[31]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [31]),
        .O(pwm1_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__2_i_2
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [28]),
        .I1(count_reg[28]),
        .I2(count_reg[29]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [29]),
        .O(pwm1_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__2_i_3
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [26]),
        .I1(count_reg[26]),
        .I2(count_reg[27]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [27]),
        .O(pwm1_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry__2_i_4
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [24]),
        .I1(count_reg[24]),
        .I2(count_reg[25]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [25]),
        .O(pwm1_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__2_i_5
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [30]),
        .I1(count_reg[30]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [31]),
        .I3(count_reg[31]),
        .O(pwm1_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__2_i_6
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [28]),
        .I1(count_reg[28]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [29]),
        .I3(count_reg[29]),
        .O(pwm1_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__2_i_7
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [26]),
        .I1(count_reg[26]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [27]),
        .I3(count_reg[27]),
        .O(pwm1_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry__2_i_8
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [24]),
        .I1(count_reg[24]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [25]),
        .I3(count_reg[25]),
        .O(pwm1_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry_i_1
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [6]),
        .I1(count_reg[6]),
        .I2(count_reg[7]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [7]),
        .O(pwm1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry_i_2
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [4]),
        .I1(count_reg[4]),
        .I2(count_reg[5]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [5]),
        .O(pwm1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry_i_3
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [2]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [3]),
        .O(pwm1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm1_carry_i_4
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [0]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(\genblk1[0].duty_reg_latch_reg[0] [1]),
        .O(pwm1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry_i_5
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [6]),
        .I1(count_reg[6]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [7]),
        .I3(count_reg[7]),
        .O(pwm1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry_i_6
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [4]),
        .I1(count_reg[4]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [5]),
        .I3(count_reg[5]),
        .O(pwm1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry_i_7
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [2]),
        .I1(count_reg[2]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [3]),
        .I3(count_reg[3]),
        .O(pwm1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm1_carry_i_8
       (.I0(\genblk1[0].duty_reg_latch_reg[0] [0]),
        .I1(count_reg[0]),
        .I2(\genblk1[0].duty_reg_latch_reg[0] [1]),
        .I3(count_reg[1]),
        .O(pwm1_carry_i_8_n_0));
  CARRY4 \pwm1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\pwm1_inferred__0/i__carry_n_0 ,\pwm1_inferred__0/i__carry_n_1 ,\pwm1_inferred__0/i__carry_n_2 ,\pwm1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}),
        .O(\NLW_pwm1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__0_n_0,i__carry_i_6__0_n_0,i__carry_i_7__0_n_0,i__carry_i_8__0_n_0}));
  CARRY4 \pwm1_inferred__0/i__carry__0 
       (.CI(\pwm1_inferred__0/i__carry_n_0 ),
        .CO({\pwm1_inferred__0/i__carry__0_n_0 ,\pwm1_inferred__0/i__carry__0_n_1 ,\pwm1_inferred__0/i__carry__0_n_2 ,\pwm1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}),
        .O(\NLW_pwm1_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5__0_n_0,i__carry__0_i_6__0_n_0,i__carry__0_i_7__0_n_0,i__carry__0_i_8__0_n_0}));
  CARRY4 \pwm1_inferred__0/i__carry__1 
       (.CI(\pwm1_inferred__0/i__carry__0_n_0 ),
        .CO({\pwm1_inferred__0/i__carry__1_n_0 ,\pwm1_inferred__0/i__carry__1_n_1 ,\pwm1_inferred__0/i__carry__1_n_2 ,\pwm1_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1__0_n_0,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0,i__carry__1_i_4__0_n_0}),
        .O(\NLW_pwm1_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5__0_n_0,i__carry__1_i_6__0_n_0,i__carry__1_i_7__0_n_0,i__carry__1_i_8__0_n_0}));
  CARRY4 \pwm1_inferred__0/i__carry__2 
       (.CI(\pwm1_inferred__0/i__carry__1_n_0 ),
        .CO({pwm10_in,\pwm1_inferred__0/i__carry__2_n_1 ,\pwm1_inferred__0/i__carry__2_n_2 ,\pwm1_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1__0_n_0,i__carry__2_i_2__0_n_0,i__carry__2_i_3__0_n_0,i__carry__2_i_4__0_n_0}),
        .O(\NLW_pwm1_inferred__0/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5__0_n_0,i__carry__2_i_6__0_n_0,i__carry__2_i_7__0_n_0,i__carry__2_i_8__0_n_0}));
  CARRY4 \pwm1_inferred__1/i__carry 
       (.CI(1'b0),
        .CO({\pwm1_inferred__1/i__carry_n_0 ,\pwm1_inferred__1/i__carry_n_1 ,\pwm1_inferred__1/i__carry_n_2 ,\pwm1_inferred__1/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0}),
        .O(\NLW_pwm1_inferred__1/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__1_n_0,i__carry_i_6__1_n_0,i__carry_i_7__1_n_0,i__carry_i_8__1_n_0}));
  CARRY4 \pwm1_inferred__1/i__carry__0 
       (.CI(\pwm1_inferred__1/i__carry_n_0 ),
        .CO({\pwm1_inferred__1/i__carry__0_n_0 ,\pwm1_inferred__1/i__carry__0_n_1 ,\pwm1_inferred__1/i__carry__0_n_2 ,\pwm1_inferred__1/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__1_n_0,i__carry__0_i_2__1_n_0,i__carry__0_i_3__1_n_0,i__carry__0_i_4__1_n_0}),
        .O(\NLW_pwm1_inferred__1/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5__1_n_0,i__carry__0_i_6__1_n_0,i__carry__0_i_7__1_n_0,i__carry__0_i_8__1_n_0}));
  CARRY4 \pwm1_inferred__1/i__carry__1 
       (.CI(\pwm1_inferred__1/i__carry__0_n_0 ),
        .CO({\pwm1_inferred__1/i__carry__1_n_0 ,\pwm1_inferred__1/i__carry__1_n_1 ,\pwm1_inferred__1/i__carry__1_n_2 ,\pwm1_inferred__1/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1__1_n_0,i__carry__1_i_2__1_n_0,i__carry__1_i_3__1_n_0,i__carry__1_i_4__1_n_0}),
        .O(\NLW_pwm1_inferred__1/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5__1_n_0,i__carry__1_i_6__1_n_0,i__carry__1_i_7__1_n_0,i__carry__1_i_8__1_n_0}));
  CARRY4 \pwm1_inferred__1/i__carry__2 
       (.CI(\pwm1_inferred__1/i__carry__1_n_0 ),
        .CO({pwm12_in,\pwm1_inferred__1/i__carry__2_n_1 ,\pwm1_inferred__1/i__carry__2_n_2 ,\pwm1_inferred__1/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1__1_n_0,i__carry__2_i_2__1_n_0,i__carry__2_i_3__1_n_0,i__carry__2_i_4__1_n_0}),
        .O(\NLW_pwm1_inferred__1/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5__1_n_0,i__carry__2_i_6__1_n_0,i__carry__2_i_7__1_n_0,i__carry__2_i_8__1_n_0}));
  CARRY4 \pwm1_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\pwm1_inferred__2/i__carry_n_0 ,\pwm1_inferred__2/i__carry_n_1 ,\pwm1_inferred__2/i__carry_n_2 ,\pwm1_inferred__2/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__2_n_0,i__carry_i_2__2_n_0,i__carry_i_3__2_n_0,i__carry_i_4__2_n_0}),
        .O(\NLW_pwm1_inferred__2/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__2_n_0,i__carry_i_6__2_n_0,i__carry_i_7__2_n_0,i__carry_i_8__2_n_0}));
  CARRY4 \pwm1_inferred__2/i__carry__0 
       (.CI(\pwm1_inferred__2/i__carry_n_0 ),
        .CO({\pwm1_inferred__2/i__carry__0_n_0 ,\pwm1_inferred__2/i__carry__0_n_1 ,\pwm1_inferred__2/i__carry__0_n_2 ,\pwm1_inferred__2/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__2_n_0,i__carry__0_i_2__2_n_0,i__carry__0_i_3__2_n_0,i__carry__0_i_4__2_n_0}),
        .O(\NLW_pwm1_inferred__2/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5__2_n_0,i__carry__0_i_6__2_n_0,i__carry__0_i_7__2_n_0,i__carry__0_i_8__2_n_0}));
  CARRY4 \pwm1_inferred__2/i__carry__1 
       (.CI(\pwm1_inferred__2/i__carry__0_n_0 ),
        .CO({\pwm1_inferred__2/i__carry__1_n_0 ,\pwm1_inferred__2/i__carry__1_n_1 ,\pwm1_inferred__2/i__carry__1_n_2 ,\pwm1_inferred__2/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1__2_n_0,i__carry__1_i_2__2_n_0,i__carry__1_i_3__2_n_0,i__carry__1_i_4__2_n_0}),
        .O(\NLW_pwm1_inferred__2/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5__2_n_0,i__carry__1_i_6__2_n_0,i__carry__1_i_7__2_n_0,i__carry__1_i_8__2_n_0}));
  CARRY4 \pwm1_inferred__2/i__carry__2 
       (.CI(\pwm1_inferred__2/i__carry__1_n_0 ),
        .CO({pwm14_in,\pwm1_inferred__2/i__carry__2_n_1 ,\pwm1_inferred__2/i__carry__2_n_2 ,\pwm1_inferred__2/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1__2_n_0,i__carry__2_i_2__2_n_0,i__carry__2_i_3__2_n_0,i__carry__2_i_4__2_n_0}),
        .O(\NLW_pwm1_inferred__2/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5__2_n_0,i__carry__2_i_6__2_n_0,i__carry__2_i_7__2_n_0,i__carry__2_i_8__2_n_0}));
  CARRY4 \pwm1_inferred__3/i__carry 
       (.CI(1'b0),
        .CO({\pwm1_inferred__3/i__carry_n_0 ,\pwm1_inferred__3/i__carry_n_1 ,\pwm1_inferred__3/i__carry_n_2 ,\pwm1_inferred__3/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__3_n_0,i__carry_i_2__3_n_0,i__carry_i_3__3_n_0,i__carry_i_4__3_n_0}),
        .O(\NLW_pwm1_inferred__3/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__3_n_0,i__carry_i_6__3_n_0,i__carry_i_7__3_n_0,i__carry_i_8__3_n_0}));
  CARRY4 \pwm1_inferred__3/i__carry__0 
       (.CI(\pwm1_inferred__3/i__carry_n_0 ),
        .CO({\pwm1_inferred__3/i__carry__0_n_0 ,\pwm1_inferred__3/i__carry__0_n_1 ,\pwm1_inferred__3/i__carry__0_n_2 ,\pwm1_inferred__3/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__3_n_0,i__carry__0_i_2__3_n_0,i__carry__0_i_3__3_n_0,i__carry__0_i_4__3_n_0}),
        .O(\NLW_pwm1_inferred__3/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5__3_n_0,i__carry__0_i_6__3_n_0,i__carry__0_i_7__3_n_0,i__carry__0_i_8__3_n_0}));
  CARRY4 \pwm1_inferred__3/i__carry__1 
       (.CI(\pwm1_inferred__3/i__carry__0_n_0 ),
        .CO({\pwm1_inferred__3/i__carry__1_n_0 ,\pwm1_inferred__3/i__carry__1_n_1 ,\pwm1_inferred__3/i__carry__1_n_2 ,\pwm1_inferred__3/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1__3_n_0,i__carry__1_i_2__3_n_0,i__carry__1_i_3__3_n_0,i__carry__1_i_4__3_n_0}),
        .O(\NLW_pwm1_inferred__3/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5__3_n_0,i__carry__1_i_6__3_n_0,i__carry__1_i_7__3_n_0,i__carry__1_i_8__3_n_0}));
  CARRY4 \pwm1_inferred__3/i__carry__2 
       (.CI(\pwm1_inferred__3/i__carry__1_n_0 ),
        .CO({pwm16_in,\pwm1_inferred__3/i__carry__2_n_1 ,\pwm1_inferred__3/i__carry__2_n_2 ,\pwm1_inferred__3/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1__3_n_0,i__carry__2_i_2__3_n_0,i__carry__2_i_3__3_n_0,i__carry__2_i_4__3_n_0}),
        .O(\NLW_pwm1_inferred__3/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5__3_n_0,i__carry__2_i_6__3_n_0,i__carry__2_i_7__3_n_0,i__carry__2_i_8__3_n_0}));
  CARRY4 \pwm1_inferred__4/i__carry 
       (.CI(1'b0),
        .CO({\pwm1_inferred__4/i__carry_n_0 ,\pwm1_inferred__4/i__carry_n_1 ,\pwm1_inferred__4/i__carry_n_2 ,\pwm1_inferred__4/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__4_n_0,i__carry_i_2__4_n_0,i__carry_i_3__4_n_0,i__carry_i_4__4_n_0}),
        .O(\NLW_pwm1_inferred__4/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__4_n_0,i__carry_i_6__4_n_0,i__carry_i_7__4_n_0,i__carry_i_8__4_n_0}));
  CARRY4 \pwm1_inferred__4/i__carry__0 
       (.CI(\pwm1_inferred__4/i__carry_n_0 ),
        .CO({\pwm1_inferred__4/i__carry__0_n_0 ,\pwm1_inferred__4/i__carry__0_n_1 ,\pwm1_inferred__4/i__carry__0_n_2 ,\pwm1_inferred__4/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__4_n_0,i__carry__0_i_2__4_n_0,i__carry__0_i_3__4_n_0,i__carry__0_i_4__4_n_0}),
        .O(\NLW_pwm1_inferred__4/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_5__4_n_0,i__carry__0_i_6__4_n_0,i__carry__0_i_7__4_n_0,i__carry__0_i_8__4_n_0}));
  CARRY4 \pwm1_inferred__4/i__carry__1 
       (.CI(\pwm1_inferred__4/i__carry__0_n_0 ),
        .CO({\pwm1_inferred__4/i__carry__1_n_0 ,\pwm1_inferred__4/i__carry__1_n_1 ,\pwm1_inferred__4/i__carry__1_n_2 ,\pwm1_inferred__4/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__1_i_1__4_n_0,i__carry__1_i_2__4_n_0,i__carry__1_i_3__4_n_0,i__carry__1_i_4__4_n_0}),
        .O(\NLW_pwm1_inferred__4/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_5__4_n_0,i__carry__1_i_6__4_n_0,i__carry__1_i_7__4_n_0,i__carry__1_i_8__4_n_0}));
  CARRY4 \pwm1_inferred__4/i__carry__2 
       (.CI(\pwm1_inferred__4/i__carry__1_n_0 ),
        .CO({pwm18_in,\pwm1_inferred__4/i__carry__2_n_1 ,\pwm1_inferred__4/i__carry__2_n_2 ,\pwm1_inferred__4/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__2_i_1__4_n_0,i__carry__2_i_2__4_n_0,i__carry__2_i_3__4_n_0,i__carry__2_i_4__4_n_0}),
        .O(\NLW_pwm1_inferred__4/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_5__4_n_0,i__carry__2_i_6__4_n_0,i__carry__2_i_7__4_n_0,i__carry__2_i_8__4_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[0]_INST_0 
       (.I0(pwm1),
        .I1(enable),
        .O(pwm[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[1]_INST_0 
       (.I0(pwm10_in),
        .I1(enable),
        .O(pwm[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[2]_INST_0 
       (.I0(pwm12_in),
        .I1(enable),
        .O(pwm[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[3]_INST_0 
       (.I0(pwm14_in),
        .I1(enable),
        .O(pwm[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[4]_INST_0 
       (.I0(pwm16_in),
        .I1(enable),
        .O(pwm[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pwm[5]_INST_0 
       (.I0(pwm18_in),
        .I1(enable),
        .O(pwm[5]));
endmodule

(* CHECK_LICENSE_TYPE = "system_rgb_PWM_0_0,PWM_v2_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "PWM_v2_0,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (pwm,
    pwm_axi_awaddr,
    pwm_axi_awprot,
    pwm_axi_awvalid,
    pwm_axi_awready,
    pwm_axi_wdata,
    pwm_axi_wstrb,
    pwm_axi_wvalid,
    pwm_axi_wready,
    pwm_axi_bresp,
    pwm_axi_bvalid,
    pwm_axi_bready,
    pwm_axi_araddr,
    pwm_axi_arprot,
    pwm_axi_arvalid,
    pwm_axi_arready,
    pwm_axi_rdata,
    pwm_axi_rresp,
    pwm_axi_rvalid,
    pwm_axi_rready,
    pwm_axi_aclk,
    pwm_axi_aresetn);
  output [5:0]pwm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI AWADDR" *) input [6:0]pwm_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI AWPROT" *) input [2:0]pwm_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI AWVALID" *) input pwm_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI AWREADY" *) output pwm_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI WDATA" *) input [31:0]pwm_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI WSTRB" *) input [3:0]pwm_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI WVALID" *) input pwm_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI WREADY" *) output pwm_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI BRESP" *) output [1:0]pwm_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI BVALID" *) output pwm_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI BREADY" *) input pwm_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI ARADDR" *) input [6:0]pwm_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI ARPROT" *) input [2:0]pwm_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI ARVALID" *) input pwm_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI ARREADY" *) output pwm_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI RDATA" *) output [31:0]pwm_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI RRESP" *) output [1:0]pwm_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI RVALID" *) output pwm_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 PWM_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PWM_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input pwm_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PWM_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PWM_AXI_CLK, ASSOCIATED_BUSIF PWM_AXI, ASSOCIATED_RESET pwm_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0" *) input pwm_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 PWM_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PWM_AXI_RST, POLARITY ACTIVE_LOW" *) input pwm_axi_aresetn;

  wire \<const0> ;
  wire [5:0]pwm;
  wire pwm_axi_aclk;
  wire [6:0]pwm_axi_araddr;
  wire pwm_axi_aresetn;
  wire pwm_axi_arready;
  wire pwm_axi_arvalid;
  wire [6:0]pwm_axi_awaddr;
  wire pwm_axi_awready;
  wire pwm_axi_awvalid;
  wire pwm_axi_bready;
  wire pwm_axi_bvalid;
  wire [31:0]pwm_axi_rdata;
  wire pwm_axi_rready;
  wire pwm_axi_rvalid;
  wire [31:0]pwm_axi_wdata;
  wire pwm_axi_wready;
  wire [3:0]pwm_axi_wstrb;
  wire pwm_axi_wvalid;

  assign pwm_axi_bresp[1] = \<const0> ;
  assign pwm_axi_bresp[0] = \<const0> ;
  assign pwm_axi_rresp[1] = \<const0> ;
  assign pwm_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_PWM_v2_0 inst
       (.pwm(pwm),
        .pwm_axi_aclk(pwm_axi_aclk),
        .pwm_axi_araddr(pwm_axi_araddr[6:2]),
        .pwm_axi_aresetn(pwm_axi_aresetn),
        .pwm_axi_arready(pwm_axi_arready),
        .pwm_axi_arvalid(pwm_axi_arvalid),
        .pwm_axi_awaddr(pwm_axi_awaddr[6:2]),
        .pwm_axi_awready(pwm_axi_awready),
        .pwm_axi_awvalid(pwm_axi_awvalid),
        .pwm_axi_bready(pwm_axi_bready),
        .pwm_axi_bvalid(pwm_axi_bvalid),
        .pwm_axi_rdata(pwm_axi_rdata),
        .pwm_axi_rready(pwm_axi_rready),
        .pwm_axi_rvalid(pwm_axi_rvalid),
        .pwm_axi_wdata(pwm_axi_wdata),
        .pwm_axi_wready(pwm_axi_wready),
        .pwm_axi_wstrb(pwm_axi_wstrb),
        .pwm_axi_wvalid(pwm_axi_wvalid));
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
