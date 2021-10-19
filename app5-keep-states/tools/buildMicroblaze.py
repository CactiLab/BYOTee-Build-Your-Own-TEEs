#!/usr/bin/env python3

"""
buildMicroblaze.py
Automate building of microblaze

This calls on the build_microblaze.tcl script in the /tools,
and will add in the /mb and /Untrusted_app directories to the workspace to be built.

The output for Untrusted_app will show up under /Untrusted_app/debug
"""
import os
from shutil import copy2

def output_helper(dev_path, device_dir):
    """ A helper that handles mb build output, including saving old Untrusted_app copies """

    UA_path = dev_path + "/Untrusted_app/Debug/"
    inter_path = dev_path + "/mb/Untrusted_app/Debug/Untrusted_app.elf"
    Untrusted_app_elf = UA_path + "Untrusted_app.elf"
    Untrusted_app = device_dir + "/Untrusted_app"
    #Untrusted_app_old = device_dir + "/Untrusted_app_old"

    banner = "#######"
    stmt = ("Copying generated Untrusted_app.elf to %s as Untrusted_app" % device_dir)
    print("\n %s %s %s \n" % (banner, stmt, banner))

    try:
        """
        if os.path.exists(Untrusted_app):
            print("Saving %s as %s\n" % (Untrusted_app, Untrusted_app_old))
            os.rename(Untrusted_app, Untrusted_app_old)

            print("Please delete or save your old Untrusted_app copy\n")

        os.rename(Untrusted_app_elf, Untrusted_app)
        print("Output produced: %s\n" % Untrusted_app)
        """

        copy2(inter_path, Untrusted_app)
        print("Copied Untrusted_app.elf to \n %s" % (Untrusted_app))

    except Exception as err:
        print("Error copying Untrusted_app to %s:\n {%s}\n" % (Untrusted_app, err))

def build_microblaze(xsct, proj_name, dev_path_tools, dev_path, device_dir):
    """ Automate calling a tcl script that builds microblaze"""

    build_tcl = dev_path_tools + "/build_microblaze.tcl"
    # xsct script.tcl arg1 arg2
    xsct_script = xsct + " " + build_tcl + " " + proj_name + " " + dev_path
    os.system(xsct_script)

    output_helper(dev_path, device_dir)
