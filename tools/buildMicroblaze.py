#!/usr/bin/env python3

"""
buildMicroblaze.py
Automate building of microblaze

This calls on the build_microblaze.tcl script in the /tools,
and will add in the /mb and /miPod directories to the workspace to be built.

The output for miPod will show up under /miPod/debug
"""
import os
from shutil import copy2

def output_helper(dev_path, device_dir):
    """ A helper that handles mb build output, including saving old mipod copies """

    mi_path = dev_path + "/miPod/Debug/"
    inter_path = dev_path + "/mb/miPod/Debug/miPod.elf"
    mipod_elf = mi_path + "miPod.elf"
    mipod = device_dir + "/miPod"
    #mipod_old = device_dir + "/miPod_old"

    banner = "#######"
    stmt = ("Copying generated miPod.elf to %s as miPod" % device_dir)
    print("\n %s %s %s \n" % (banner, stmt, banner))

    try:
        """
        if os.path.exists(mipod):
            print("Saving %s as %s\n" % (mipod, mipod_old))
            os.rename(mipod, mipod_old)

            print("Please delete or save your old miPod copy\n")

        os.rename(mipod_elf, mipod)
        print("Output produced: %s\n" % mipod)
        """

        copy2(inter_path, mipod)
        print("Copied miPod.elf to \n %s" % (mipod))

    except Exception as err:
        print("Error copying miPod to %s:\n {%s}\n" % (mipod, err))

def build_microblaze(xsct, proj_name, dev_path_tools, dev_path, device_dir):
    """ Automate calling a tcl script that builds microblaze"""

    build_tcl = dev_path_tools + "/build_microblaze.tcl"
    # xsct script.tcl arg1 arg2
    xsct_script = xsct + " " + build_tcl + " " + proj_name + " " + dev_path
    os.system(xsct_script)

    output_helper(dev_path, device_dir)
