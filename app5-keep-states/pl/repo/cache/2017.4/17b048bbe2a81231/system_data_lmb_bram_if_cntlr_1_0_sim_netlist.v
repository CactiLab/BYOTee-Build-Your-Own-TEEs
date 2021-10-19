// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Thu Jul 22 14:17:48 2021
// Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_data_lmb_bram_if_cntlr_1_0_sim_netlist.v
// Design      : system_data_lmb_bram_if_cntlr_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr
   (BRAM_WEN_A,
    Sl_Ready,
    LMB_AddrStrobe,
    LMB_Rst,
    LMB_ABus,
    LMB_Clk,
    LMB_WriteStrobe,
    LMB_BE);
  output [0:3]BRAM_WEN_A;
  output Sl_Ready;
  input LMB_AddrStrobe;
  input LMB_Rst;
  input [2:0]LMB_ABus;
  input LMB_Clk;
  input LMB_WriteStrobe;
  input [0:3]LMB_BE;

  wire [0:3]BRAM_WEN_A;
  wire [2:0]LMB_ABus;
  wire LMB_AddrStrobe;
  wire [0:3]LMB_BE;
  wire LMB_Clk;
  wire LMB_Rst;
  wire LMB_WriteStrobe;
  wire \No_ECC.Sl_Rdy_i_1_n_0 ;
  wire \No_ECC.lmb_as_i_1_n_0 ;
  wire Sl_Rdy;
  wire Sl_Ready;
  wire lmb_as;

  LUT5 #(
    .INIT(32'h00000008)) 
    \BRAM_WEN_A[0]_INST_0 
       (.I0(LMB_WriteStrobe),
        .I1(LMB_BE[0]),
        .I2(LMB_ABus[2]),
        .I3(LMB_ABus[1]),
        .I4(LMB_ABus[0]),
        .O(BRAM_WEN_A[0]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \BRAM_WEN_A[1]_INST_0 
       (.I0(LMB_ABus[2]),
        .I1(LMB_ABus[1]),
        .I2(LMB_ABus[0]),
        .I3(LMB_WriteStrobe),
        .I4(LMB_BE[1]),
        .O(BRAM_WEN_A[1]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \BRAM_WEN_A[2]_INST_0 
       (.I0(LMB_ABus[2]),
        .I1(LMB_ABus[1]),
        .I2(LMB_ABus[0]),
        .I3(LMB_WriteStrobe),
        .I4(LMB_BE[2]),
        .O(BRAM_WEN_A[2]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \BRAM_WEN_A[3]_INST_0 
       (.I0(LMB_ABus[2]),
        .I1(LMB_ABus[1]),
        .I2(LMB_ABus[0]),
        .I3(LMB_WriteStrobe),
        .I4(LMB_BE[3]),
        .O(BRAM_WEN_A[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \No_ECC.Sl_Rdy_i_1 
       (.I0(LMB_ABus[0]),
        .I1(LMB_ABus[1]),
        .I2(LMB_ABus[2]),
        .I3(LMB_Rst),
        .O(\No_ECC.Sl_Rdy_i_1_n_0 ));
  FDRE \No_ECC.Sl_Rdy_reg 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(\No_ECC.Sl_Rdy_i_1_n_0 ),
        .Q(Sl_Rdy),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \No_ECC.lmb_as_i_1 
       (.I0(LMB_AddrStrobe),
        .I1(LMB_Rst),
        .O(\No_ECC.lmb_as_i_1_n_0 ));
  FDRE \No_ECC.lmb_as_reg 
       (.C(LMB_Clk),
        .CE(1'b1),
        .D(\No_ECC.lmb_as_i_1_n_0 ),
        .Q(lmb_as),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    Sl_Ready_INST_0
       (.I0(Sl_Rdy),
        .I1(lmb_as),
        .O(Sl_Ready));
endmodule

(* CHECK_LICENSE_TYPE = "system_data_lmb_bram_if_cntlr_1_0,lmb_bram_if_cntlr,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "lmb_bram_if_cntlr,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_Addr_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Dout_A,
    BRAM_Din_A);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.LMB_Clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.LMB_Clk, ASSOCIATED_BUSIF SLMB:SLMB1:SLMB2:SLMB3, ASSOCIATED_RESET LMB_Rst, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0" *) input LMB_Clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.LMB_Rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.LMB_Rst, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT" *) input LMB_Rst;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB ABUS" *) (* x_interface_parameter = "XIL_INTERFACENAME SLMB, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE" *) input [0:31]LMB_ABus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WRITEDBUS" *) input [0:31]LMB_WriteDBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB ADDRSTROBE" *) input LMB_AddrStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READSTROBE" *) input LMB_ReadStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WRITESTROBE" *) input LMB_WriteStrobe;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB BE" *) input [0:3]LMB_BE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READDBUS" *) output [0:31]Sl_DBus;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB READY" *) output Sl_Ready;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB WAIT" *) output Sl_Wait;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB UE" *) output Sl_UE;
  (* x_interface_info = "xilinx.com:interface:lmb:1.0 SLMB CE" *) output Sl_CE;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT RST" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORT, MEM_SIZE 131072, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *) output BRAM_Rst_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT CLK" *) output BRAM_Clk_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT ADDR" *) output [0:31]BRAM_Addr_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT EN" *) output BRAM_EN_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT WE" *) output [0:3]BRAM_WEN_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT DIN" *) output [0:31]BRAM_Dout_A;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORT DOUT" *) input [0:31]BRAM_Din_A;

  wire \<const0> ;
  wire [0:31]BRAM_Din_A;
  wire [0:3]BRAM_WEN_A;
  wire [0:31]LMB_ABus;
  wire LMB_AddrStrobe;
  wire [0:3]LMB_BE;
  wire LMB_Clk;
  wire LMB_Rst;
  wire [0:31]LMB_WriteDBus;
  wire LMB_WriteStrobe;
  wire Sl_Ready;

  assign BRAM_Addr_A[0:31] = LMB_ABus;
  assign BRAM_Clk_A = LMB_Clk;
  assign BRAM_Dout_A[0:31] = LMB_WriteDBus;
  assign BRAM_EN_A = LMB_AddrStrobe;
  assign BRAM_Rst_A = \<const0> ;
  assign Sl_CE = \<const0> ;
  assign Sl_DBus[0:31] = BRAM_Din_A;
  assign Sl_UE = \<const0> ;
  assign Sl_Wait = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr U0
       (.BRAM_WEN_A(BRAM_WEN_A),
        .LMB_ABus({LMB_ABus[1],LMB_ABus[2],LMB_ABus[11]}),
        .LMB_AddrStrobe(LMB_AddrStrobe),
        .LMB_BE(LMB_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_Rst(LMB_Rst),
        .LMB_WriteStrobe(LMB_WriteStrobe),
        .Sl_Ready(Sl_Ready));
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
