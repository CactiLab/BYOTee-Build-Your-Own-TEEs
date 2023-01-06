--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
--Date        : Thu Jan  5 17:51:21 2023
--Host        : safa running 64-bit Ubuntu 20.04.5 LTS
--Command     : generate_target blade2s_block_design_wrapper.bd
--Design      : blade2s_block_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blade2s_block_design_wrapper is
end blade2s_block_design_wrapper;

architecture STRUCTURE of blade2s_block_design_wrapper is
  component blade2s_block_design is
  end component blade2s_block_design;
begin
blade2s_block_design_i: component blade2s_block_design
 ;
end STRUCTURE;
