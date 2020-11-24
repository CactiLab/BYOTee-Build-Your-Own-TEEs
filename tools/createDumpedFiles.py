#!/usr/bin/env python3

import argparse, sys, os
def main():
    global abs_SSC_elf_path, dump_command

    parser = argparse.ArgumentParser(description="""
    The purpose of this script is to create dumped files from executable (elf) files
    \t this dumped files will run on top of the runtime.
    """,  formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument('SSC_elf_path', help="Direcotry of SSC Elf file")
    args = parser.parse_args()

    abs_SSC_elf_path = os.path.abspath(str(args.SSC_elf_path))
    if not os.path.exists(abs_SSC_elf_path):
        print ("SSC Elf file Does not exist")
    SSC_dump_location = str(os.path.splitext(str(os.path.basename(abs_SSC_elf_path)))[0])
    dump_command = 'mb-objcopy -O binary --only-section=.ssc --only-section=.data --only-section=.rodata ' + abs_SSC_elf_path + ' ' + 'SSC/' + SSC_dump_location 
    print ("Running command : \n")
    print (dump_command)
    print ("\n" + SSC_dump_location + " --dumped file dumped at location -> SSC/")

    os.system(dump_command)

if __name__ == '__main__':
    main()
