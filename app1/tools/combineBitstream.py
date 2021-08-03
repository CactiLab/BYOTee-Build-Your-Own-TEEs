#!/usr/bin/env python3

"""
combineBitstream.py
Automate creation of download.bit
To be called after microblaze is built
"""
import os

def combine_bitstream(xsct, dev_path_tools, dev_path, device_dir, proj_name):
    """ Automate calling a tcl script that creates download.bit"""

    try:
        build_tcl = dev_path_tools + "/combine_bitstream.tcl"
        # xsct script.tcl arg1
        xsct_script = xsct + " " + build_tcl + " " + dev_path + " " + device_dir + " " + proj_name
        os.system(xsct_script)

    except Exception as err:
        print("Combine bitstream failed with error %s" % (err))
