#!/usr/bin/env python3

"""
buildDevice.py is a wrapper script responsible for automating the steps
that would be done in Vivado and the SDK.

It can be used to call the whole process or just one step.
packageSystem is the tool that should be called upon after succesfully project
generation and up to a successful combination of the bitstream.

Usage:
python3 buildDevice.py --dev_path path [--proj_name name] --build_flag flag

dev_path: path to the 2002-ectf repo root
proj_name: optional; name the project -- default is "cora_z7_07s"
build_flag:
    [cs]: copy device_secrets.h to microblaze dir
    [cp]: create project
    [gb]: generate bitstream
    [bm]: build microblaze
    [cb]: combine bitstream
    [all]: run all build device functions

The processes are defined as follows:
* Copies secrets.h into microblaze dir - created via createDevice.py
* Creates Project - buildBitstream.py, create_project.tcl
* Generates Bitstream - buildBitstream.py, gen_bitstream.tcl
* Builds Microblaze - buildMicroblaze.py, build_microblaze.tcl
* Combines Bitstream - combineBitstream.py, combine_bitstream.tcl
"""
import argparse, sys, os, subprocess
from shutil import copy2 # should copy metadata, permissions
from buildBitstream import *
from buildMicroblaze import build_microblaze
from combineBitstream import combine_bitstream

build_flags = ["cs", "cp", "gb", "bm", "cb", "all"]
proj_name = "cora_z7_07s"
default_bif = "output.bif"
input_secrets = "device_secrets"
output_secrets = "secrets.h"
device_dir = ""

# e.g. /media/sf_Vagrant/2020-ectf/
dev_path = ""
dev_path_pl = ""
dev_path_mb = ""
path_to_proj_tcl = ""
path_to_bits_tcl = ""
bif_outpath = ""

# based on use of Vagrant dev box
vagrant_vivado_path = "/opt/Xilinx/Vivado/2017.4/settings64.sh"
xsct = "/opt/Xilinx/SDK/2017.4/bin/xsct"
vivado_batch = "vivado -mode batch -source "

def cpy_secrets(device_dir, dev_path_mb):
    """ Copy secrets file to /mb/drm_audio_fw/src/secrets.h """

    try:
        mb_cpy = dev_path_mb + "/drm_audio_fw/src/" + output_secrets
        secrets = device_dir + "/" + input_secrets
        copy2(secrets, mb_cpy)
        print("Copied %s to\n %s" % (secrets, mb_cpy))

    except Exception as err:
        print("Error copying %s to %s: {%s}" % (secrets, mb_cpy, err))

def verify_secrets(secrets_directory):
    """ Helper containing verify -secrets_dir arg """
    global device_dir

    if not secrets_directory:
        print ("Please provide a filepath to the directory containg device files [-device_dir]")
        sys.exit(1)

    else:
        device_dir = secrets_directory
        secrets = secrets_directory + "/" + input_secrets

        if (not os.path.exists(secrets)):
            print("The given filepath {%s} does not contain the expected device files" % secrets_directory)
            sys.exit(1)
        else:
            #cpy_secrets(secrets_dir, dev_path_mb)
            return True

def main():
    global dev_path, proj_name, path_to_proj_tcl, path_to_bits_tcl, bif_output, dev_path_mb, device_dir

    parser = argparse.ArgumentParser(description="""
    buildDevice requires the following:
    \t dev_path: The file path to the repo root of 2020-ectf
    \t proj_name: Optional variable to custom name Vivado project
    \t secrets_dir: Filepath to directory storing device files, including device_secrets
    \t build_flag:
         [cs]: copy device_secrets.h to microblaze dir
         [cp]: create project
         [gb]: generate bitstream
         [bm]: build microblaze
         [cb]: combine bitstream
         [all]: run all build device functions
    """,  formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument("-p", "--dev_path", required=True, help="Path to 2020-ectf repo root")
    parser.add_argument("-n", "--proj_name", help="Vivado project name")
    parser.add_argument("-bf", "--build_flag", type=lambda t:t.lower(), choices=build_flags, default="all")
    parser.add_argument("-secrets_dir", "--secrets_directory", help="Filepath to directory storing device files")
    args = parser.parse_args()

    dev_path = args.dev_path

    if (not os.path.exists(dev_path)):
        print("Error... invalid dev_path {%s} provided." % dev_path)
        sys.exit(1)

    dev_path_pl = dev_path + "/pl"
    dev_path_mb = dev_path + "/mb"
    dev_path_tools = dev_path + "/tools"
    opt_proj_name = args.proj_name
    path_to_proj_tcl = dev_path_pl + "/proj/create_project.tcl"
    path_to_bits_tcl = dev_path_pl + "/proj/gen_bitstream.tcl"
    bif_outpath = dev_path_mb + "/BOOT.bin"
    run_dir = os.getcwd()

    if opt_proj_name:
        proj_name = opt_proj_name
    else:
        print("No project name passed, using default: %s\n" % (proj_name))

    print("Beginning build tool processes...\n")

    if args.build_flag == "all":
        # verify supplementary args
        if verify_secrets(args.secrets_directory):

            print("\nProceeding to Copy Secrets File:\n")
            cpy_secrets(device_dir, dev_path_mb)
            path_util(dev_path_pl)

            print("\nProceeding to Create Project {%s}:\n" % proj_name)
            create_project(vivado_batch, path_to_proj_tcl, proj_name)

            print("\nProceeding to Generate Bitstream:\n")
            print("Please be warned this will take a while a long time.\n")
            gen_bitstream(dev_path_pl, proj_name, vivado_batch, path_to_bits_tcl)

            path_util(run_dir)

            print("\nProceeding to Build Microblaze:\n")
            build_microblaze(xsct, proj_name, dev_path_tools, dev_path, device_dir)

            print("\nProceeding to Combine Bitstream:\n")
            combine_bitstream(xsct, dev_path_tools, dev_path, device_dir, proj_name)

    else:
        if args.build_flag == "cs":
            if verify_secrets(args.secrets_directory):
                cpy_secrets(device_dir, dev_path_mb)
        elif args.build_flag == "cp":
            path_util(dev_path_pl)
            create_project(vivado_batch, path_to_proj_tcl, proj_name)
            path_util(run_dir)
        elif args.build_flag == "gb":
            path_util(dev_path_pl)
            gen_bitstream(dev_path_pl, proj_name, vivado_batch, path_to_bits_tcl)
            path_util(run_dir)
        elif args.build_flag == "bm":
            if verify_secrets(args.secrets_directory):
                build_microblaze(xsct, proj_name, dev_path_tools, dev_path, device_dir)
        elif args.build_flag == "cb":
            if verify_secrets(args.secrets_directory):
                combine_bitstream(xsct, dev_path_tools, dev_path, device_dir, proj_name)

if __name__ == '__main__':
    main()
