#!/usr/bin/env python3

"""
buildBitstream.py automates the generation of the Bitstream using Vivado.

It does the following:
- Create Vivado project from TCL script
- Synthesis, Implementation, and Bitstream generation

** Please note that this process will take awhile **
"""
import os
import sys
import subprocess

def path_util(dev_path_pl):
    """ Change dir for create_project.tcl script exec """
    if (os.path.exists(dev_path_pl)):
        print("Changing dir to: ", dev_path_pl)
        os.chdir(dev_path_pl)
        #os.system("pwd")
    else:
        print("Invalid dev_path provided.")
        sys.exit(1)

def create_project(vivado_batch, path_to_proj_tcl, proj_name):
    """ Invoke Vivado batch mode to run create_project.tcl. Pre-cond: pl-repo root"""

    # vivado batch mode
    src_create = vivado_batch + path_to_proj_tcl + " -tclargs --project_name " + proj_name
    print("Running: " + src_create + "\n")
    os.system(src_create)

def gen_bitstream(dev_path_pl, proj_name, vivado_batch, path_to_bits_tcl):
    """ Invoke Vivado batch mode to run gen_bitstream.tcl """

    proj_path = dev_path_pl + "/proj/" + proj_name + "/" + proj_name + ".xpr"
    proj_bd = dev_path_pl + "/proj/" + proj_name + "/" + proj_name + ".srcs/sources_1/bd/system/system.bd"

    src_bitstream = vivado_batch + path_to_bits_tcl + " -tclargs --project_file " + proj_path + " --project_bd " + proj_bd
    print("\nRunning: " + src_bitstream)
    print("\n Beginning Synthesis, Implementation, and Bitstream Generation")
    os.system(src_bitstream)

    print("\n Bitstream generation complete!\n")
