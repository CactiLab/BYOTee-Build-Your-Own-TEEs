-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Fri Jul 23 11:36:20 2021
-- Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_data_lmb_bram_if_cntlr_1_0_sim_netlist.vhdl
-- Design      : system_data_lmb_bram_if_cntlr_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr is
  port (
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_Ready : out STD_LOGIC;
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 1 downto 0 );
    LMB_Clk : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr is
  signal \No_ECC.Sl_Rdy_i_1_n_0\ : STD_LOGIC;
  signal \No_ECC.lmb_as_i_1_n_0\ : STD_LOGIC;
  signal Sl_Rdy : STD_LOGIC;
  signal lmb_as : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BRAM_WEN_A[0]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[2]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \BRAM_WEN_A[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \No_ECC.Sl_Rdy_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \No_ECC.lmb_as_i_1\ : label is "soft_lutpair2";
begin
\BRAM_WEN_A[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => LMB_WriteStrobe,
      I1 => LMB_BE(0),
      I2 => LMB_ABus(0),
      I3 => LMB_ABus(1),
      O => BRAM_WEN_A(0)
    );
\BRAM_WEN_A[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => LMB_ABus(0),
      I1 => LMB_ABus(1),
      I2 => LMB_WriteStrobe,
      I3 => LMB_BE(1),
      O => BRAM_WEN_A(1)
    );
\BRAM_WEN_A[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => LMB_ABus(0),
      I1 => LMB_ABus(1),
      I2 => LMB_WriteStrobe,
      I3 => LMB_BE(2),
      O => BRAM_WEN_A(2)
    );
\BRAM_WEN_A[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => LMB_ABus(0),
      I1 => LMB_ABus(1),
      I2 => LMB_WriteStrobe,
      I3 => LMB_BE(3),
      O => BRAM_WEN_A(3)
    );
\No_ECC.Sl_Rdy_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => LMB_ABus(1),
      I1 => LMB_ABus(0),
      I2 => LMB_Rst,
      O => \No_ECC.Sl_Rdy_i_1_n_0\
    );
\No_ECC.Sl_Rdy_reg\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => '1',
      D => \No_ECC.Sl_Rdy_i_1_n_0\,
      Q => Sl_Rdy,
      R => '0'
    );
\No_ECC.lmb_as_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => LMB_AddrStrobe,
      I1 => LMB_Rst,
      O => \No_ECC.lmb_as_i_1_n_0\
    );
\No_ECC.lmb_as_reg\: unisim.vcomponents.FDRE
     port map (
      C => LMB_Clk,
      CE => '1',
      D => \No_ECC.lmb_as_i_1_n_0\,
      Q => lmb_as,
      R => '0'
    );
Sl_Ready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Sl_Rdy,
      I1 => lmb_as,
      O => Sl_Ready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    LMB_Clk : in STD_LOGIC;
    LMB_Rst : in STD_LOGIC;
    LMB_ABus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_WriteDBus : in STD_LOGIC_VECTOR ( 0 to 31 );
    LMB_AddrStrobe : in STD_LOGIC;
    LMB_ReadStrobe : in STD_LOGIC;
    LMB_WriteStrobe : in STD_LOGIC;
    LMB_BE : in STD_LOGIC_VECTOR ( 0 to 3 );
    Sl_DBus : out STD_LOGIC_VECTOR ( 0 to 31 );
    Sl_Ready : out STD_LOGIC;
    Sl_Wait : out STD_LOGIC;
    Sl_UE : out STD_LOGIC;
    Sl_CE : out STD_LOGIC;
    BRAM_Rst_A : out STD_LOGIC;
    BRAM_Clk_A : out STD_LOGIC;
    BRAM_Addr_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_EN_A : out STD_LOGIC;
    BRAM_WEN_A : out STD_LOGIC_VECTOR ( 0 to 3 );
    BRAM_Dout_A : out STD_LOGIC_VECTOR ( 0 to 31 );
    BRAM_Din_A : in STD_LOGIC_VECTOR ( 0 to 31 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_data_lmb_bram_if_cntlr_1_0,lmb_bram_if_cntlr,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "lmb_bram_if_cntlr,Vivado 2017.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^bram_din_a\ : STD_LOGIC_VECTOR ( 0 to 31 );
  signal \^lmb_abus\ : STD_LOGIC_VECTOR ( 0 to 31 );
  signal \^lmb_addrstrobe\ : STD_LOGIC;
  signal \^lmb_clk\ : STD_LOGIC;
  signal \^lmb_writedbus\ : STD_LOGIC_VECTOR ( 0 to 31 );
  attribute x_interface_info : string;
  attribute x_interface_info of BRAM_Clk_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT CLK";
  attribute x_interface_info of BRAM_EN_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT EN";
  attribute x_interface_info of BRAM_Rst_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of BRAM_Rst_A : signal is "XIL_INTERFACENAME BRAM_PORT, MEM_SIZE 131072, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE";
  attribute x_interface_info of LMB_AddrStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB ADDRSTROBE";
  attribute x_interface_info of LMB_Clk : signal is "xilinx.com:signal:clock:1.0 CLK.LMB_Clk CLK";
  attribute x_interface_parameter of LMB_Clk : signal is "XIL_INTERFACENAME CLK.LMB_Clk, ASSOCIATED_BUSIF SLMB:SLMB1:SLMB2:SLMB3, ASSOCIATED_RESET LMB_Rst, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0";
  attribute x_interface_info of LMB_ReadStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB READSTROBE";
  attribute x_interface_info of LMB_Rst : signal is "xilinx.com:signal:reset:1.0 RST.LMB_Rst RST";
  attribute x_interface_parameter of LMB_Rst : signal is "XIL_INTERFACENAME RST.LMB_Rst, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT";
  attribute x_interface_info of LMB_WriteStrobe : signal is "xilinx.com:interface:lmb:1.0 SLMB WRITESTROBE";
  attribute x_interface_info of Sl_CE : signal is "xilinx.com:interface:lmb:1.0 SLMB CE";
  attribute x_interface_info of Sl_Ready : signal is "xilinx.com:interface:lmb:1.0 SLMB READY";
  attribute x_interface_info of Sl_UE : signal is "xilinx.com:interface:lmb:1.0 SLMB UE";
  attribute x_interface_info of Sl_Wait : signal is "xilinx.com:interface:lmb:1.0 SLMB WAIT";
  attribute x_interface_info of BRAM_Addr_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT ADDR";
  attribute x_interface_info of BRAM_Din_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT DOUT";
  attribute x_interface_info of BRAM_Dout_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT DIN";
  attribute x_interface_info of BRAM_WEN_A : signal is "xilinx.com:interface:bram:1.0 BRAM_PORT WE";
  attribute x_interface_info of LMB_ABus : signal is "xilinx.com:interface:lmb:1.0 SLMB ABUS";
  attribute x_interface_parameter of LMB_ABus : signal is "XIL_INTERFACENAME SLMB, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE";
  attribute x_interface_info of LMB_BE : signal is "xilinx.com:interface:lmb:1.0 SLMB BE";
  attribute x_interface_info of LMB_WriteDBus : signal is "xilinx.com:interface:lmb:1.0 SLMB WRITEDBUS";
  attribute x_interface_info of Sl_DBus : signal is "xilinx.com:interface:lmb:1.0 SLMB READDBUS";
begin
  BRAM_Addr_A(0 to 31) <= \^lmb_abus\(0 to 31);
  BRAM_Clk_A <= \^lmb_clk\;
  BRAM_Dout_A(0 to 31) <= \^lmb_writedbus\(0 to 31);
  BRAM_EN_A <= \^lmb_addrstrobe\;
  BRAM_Rst_A <= \<const0>\;
  Sl_CE <= \<const0>\;
  Sl_DBus(0 to 31) <= \^bram_din_a\(0 to 31);
  Sl_UE <= \<const0>\;
  Sl_Wait <= \<const0>\;
  \^bram_din_a\(0 to 31) <= BRAM_Din_A(0 to 31);
  \^lmb_abus\(0 to 31) <= LMB_ABus(0 to 31);
  \^lmb_addrstrobe\ <= LMB_AddrStrobe;
  \^lmb_clk\ <= LMB_Clk;
  \^lmb_writedbus\(0 to 31) <= LMB_WriteDBus(0 to 31);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lmb_bram_if_cntlr
     port map (
      BRAM_WEN_A(0 to 3) => BRAM_WEN_A(0 to 3),
      LMB_ABus(1) => \^lmb_abus\(2),
      LMB_ABus(0) => \^lmb_abus\(14),
      LMB_AddrStrobe => \^lmb_addrstrobe\,
      LMB_BE(0 to 3) => LMB_BE(0 to 3),
      LMB_Clk => \^lmb_clk\,
      LMB_Rst => LMB_Rst,
      LMB_WriteStrobe => LMB_WriteStrobe,
      Sl_Ready => Sl_Ready
    );
end STRUCTURE;
