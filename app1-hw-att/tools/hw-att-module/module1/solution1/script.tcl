############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project module1
set_top blake2s
add_files blake2s.c
add_files blake2s.h
add_files -tb module1/solution1/main.c
open_solution "solution1"
set_part {xc7z007sclg400-2} -tool vivado
create_clock -period 10 -name default
#source "./module1/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
