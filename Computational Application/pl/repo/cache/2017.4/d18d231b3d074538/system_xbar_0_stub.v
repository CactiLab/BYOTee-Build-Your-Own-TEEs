// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Fri Jul 23 11:36:42 2021
// Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_xbar_0_stub.v
// Design      : system_xbar_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_crossbar_v2_1_16_axi_crossbar,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(aclk, aresetn, s_axi_awid, s_axi_awaddr, 
  s_axi_awlen, s_axi_awsize, s_axi_awburst, s_axi_awlock, s_axi_awcache, s_axi_awprot, 
  s_axi_awqos, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wlast, 
  s_axi_wvalid, s_axi_wready, s_axi_bid, s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_arid, 
  s_axi_araddr, s_axi_arlen, s_axi_arsize, s_axi_arburst, s_axi_arlock, s_axi_arcache, 
  s_axi_arprot, s_axi_arqos, s_axi_arvalid, s_axi_arready, s_axi_rid, s_axi_rdata, s_axi_rresp, 
  s_axi_rlast, s_axi_rvalid, s_axi_rready, m_axi_awid, m_axi_awaddr, m_axi_awlen, m_axi_awsize, 
  m_axi_awburst, m_axi_awlock, m_axi_awcache, m_axi_awprot, m_axi_awregion, m_axi_awqos, 
  m_axi_awvalid, m_axi_awready, m_axi_wdata, m_axi_wstrb, m_axi_wlast, m_axi_wvalid, 
  m_axi_wready, m_axi_bid, m_axi_bresp, m_axi_bvalid, m_axi_bready, m_axi_arid, m_axi_araddr, 
  m_axi_arlen, m_axi_arsize, m_axi_arburst, m_axi_arlock, m_axi_arcache, m_axi_arprot, 
  m_axi_arregion, m_axi_arqos, m_axi_arvalid, m_axi_arready, m_axi_rid, m_axi_rdata, 
  m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axi_awid[14:0],s_axi_awaddr[159:0],s_axi_awlen[39:0],s_axi_awsize[14:0],s_axi_awburst[9:0],s_axi_awlock[4:0],s_axi_awcache[19:0],s_axi_awprot[14:0],s_axi_awqos[19:0],s_axi_awvalid[4:0],s_axi_awready[4:0],s_axi_wdata[159:0],s_axi_wstrb[19:0],s_axi_wlast[4:0],s_axi_wvalid[4:0],s_axi_wready[4:0],s_axi_bid[14:0],s_axi_bresp[9:0],s_axi_bvalid[4:0],s_axi_bready[4:0],s_axi_arid[14:0],s_axi_araddr[159:0],s_axi_arlen[39:0],s_axi_arsize[14:0],s_axi_arburst[9:0],s_axi_arlock[4:0],s_axi_arcache[19:0],s_axi_arprot[14:0],s_axi_arqos[19:0],s_axi_arvalid[4:0],s_axi_arready[4:0],s_axi_rid[14:0],s_axi_rdata[159:0],s_axi_rresp[9:0],s_axi_rlast[4:0],s_axi_rvalid[4:0],s_axi_rready[4:0],m_axi_awid[20:0],m_axi_awaddr[223:0],m_axi_awlen[55:0],m_axi_awsize[20:0],m_axi_awburst[13:0],m_axi_awlock[6:0],m_axi_awcache[27:0],m_axi_awprot[20:0],m_axi_awregion[27:0],m_axi_awqos[27:0],m_axi_awvalid[6:0],m_axi_awready[6:0],m_axi_wdata[223:0],m_axi_wstrb[27:0],m_axi_wlast[6:0],m_axi_wvalid[6:0],m_axi_wready[6:0],m_axi_bid[20:0],m_axi_bresp[13:0],m_axi_bvalid[6:0],m_axi_bready[6:0],m_axi_arid[20:0],m_axi_araddr[223:0],m_axi_arlen[55:0],m_axi_arsize[20:0],m_axi_arburst[13:0],m_axi_arlock[6:0],m_axi_arcache[27:0],m_axi_arprot[20:0],m_axi_arregion[27:0],m_axi_arqos[27:0],m_axi_arvalid[6:0],m_axi_arready[6:0],m_axi_rid[20:0],m_axi_rdata[223:0],m_axi_rresp[13:0],m_axi_rlast[6:0],m_axi_rvalid[6:0],m_axi_rready[6:0]" */;
  input aclk;
  input aresetn;
  input [14:0]s_axi_awid;
  input [159:0]s_axi_awaddr;
  input [39:0]s_axi_awlen;
  input [14:0]s_axi_awsize;
  input [9:0]s_axi_awburst;
  input [4:0]s_axi_awlock;
  input [19:0]s_axi_awcache;
  input [14:0]s_axi_awprot;
  input [19:0]s_axi_awqos;
  input [4:0]s_axi_awvalid;
  output [4:0]s_axi_awready;
  input [159:0]s_axi_wdata;
  input [19:0]s_axi_wstrb;
  input [4:0]s_axi_wlast;
  input [4:0]s_axi_wvalid;
  output [4:0]s_axi_wready;
  output [14:0]s_axi_bid;
  output [9:0]s_axi_bresp;
  output [4:0]s_axi_bvalid;
  input [4:0]s_axi_bready;
  input [14:0]s_axi_arid;
  input [159:0]s_axi_araddr;
  input [39:0]s_axi_arlen;
  input [14:0]s_axi_arsize;
  input [9:0]s_axi_arburst;
  input [4:0]s_axi_arlock;
  input [19:0]s_axi_arcache;
  input [14:0]s_axi_arprot;
  input [19:0]s_axi_arqos;
  input [4:0]s_axi_arvalid;
  output [4:0]s_axi_arready;
  output [14:0]s_axi_rid;
  output [159:0]s_axi_rdata;
  output [9:0]s_axi_rresp;
  output [4:0]s_axi_rlast;
  output [4:0]s_axi_rvalid;
  input [4:0]s_axi_rready;
  output [20:0]m_axi_awid;
  output [223:0]m_axi_awaddr;
  output [55:0]m_axi_awlen;
  output [20:0]m_axi_awsize;
  output [13:0]m_axi_awburst;
  output [6:0]m_axi_awlock;
  output [27:0]m_axi_awcache;
  output [20:0]m_axi_awprot;
  output [27:0]m_axi_awregion;
  output [27:0]m_axi_awqos;
  output [6:0]m_axi_awvalid;
  input [6:0]m_axi_awready;
  output [223:0]m_axi_wdata;
  output [27:0]m_axi_wstrb;
  output [6:0]m_axi_wlast;
  output [6:0]m_axi_wvalid;
  input [6:0]m_axi_wready;
  input [20:0]m_axi_bid;
  input [13:0]m_axi_bresp;
  input [6:0]m_axi_bvalid;
  output [6:0]m_axi_bready;
  output [20:0]m_axi_arid;
  output [223:0]m_axi_araddr;
  output [55:0]m_axi_arlen;
  output [20:0]m_axi_arsize;
  output [13:0]m_axi_arburst;
  output [6:0]m_axi_arlock;
  output [27:0]m_axi_arcache;
  output [20:0]m_axi_arprot;
  output [27:0]m_axi_arregion;
  output [27:0]m_axi_arqos;
  output [6:0]m_axi_arvalid;
  input [6:0]m_axi_arready;
  input [20:0]m_axi_rid;
  input [223:0]m_axi_rdata;
  input [13:0]m_axi_rresp;
  input [6:0]m_axi_rlast;
  input [6:0]m_axi_rvalid;
  output [6:0]m_axi_rready;
endmodule
