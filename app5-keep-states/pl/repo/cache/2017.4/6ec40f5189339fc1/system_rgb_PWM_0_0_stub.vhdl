-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Tue Jul 20 12:45:11 2021
-- Host        : tomal running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_rgb_PWM_0_0_stub.vhdl
-- Design      : system_rgb_PWM_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    pwm : out STD_LOGIC_VECTOR ( 5 downto 0 );
    pwm_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    pwm_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm_axi_awvalid : in STD_LOGIC;
    pwm_axi_awready : out STD_LOGIC;
    pwm_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pwm_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pwm_axi_wvalid : in STD_LOGIC;
    pwm_axi_wready : out STD_LOGIC;
    pwm_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pwm_axi_bvalid : out STD_LOGIC;
    pwm_axi_bready : in STD_LOGIC;
    pwm_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    pwm_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm_axi_arvalid : in STD_LOGIC;
    pwm_axi_arready : out STD_LOGIC;
    pwm_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pwm_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pwm_axi_rvalid : out STD_LOGIC;
    pwm_axi_rready : in STD_LOGIC;
    pwm_axi_aclk : in STD_LOGIC;
    pwm_axi_aresetn : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pwm[5:0],pwm_axi_awaddr[6:0],pwm_axi_awprot[2:0],pwm_axi_awvalid,pwm_axi_awready,pwm_axi_wdata[31:0],pwm_axi_wstrb[3:0],pwm_axi_wvalid,pwm_axi_wready,pwm_axi_bresp[1:0],pwm_axi_bvalid,pwm_axi_bready,pwm_axi_araddr[6:0],pwm_axi_arprot[2:0],pwm_axi_arvalid,pwm_axi_arready,pwm_axi_rdata[31:0],pwm_axi_rresp[1:0],pwm_axi_rvalid,pwm_axi_rready,pwm_axi_aclk,pwm_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "PWM_v2_0,Vivado 2017.4";
begin
end;
