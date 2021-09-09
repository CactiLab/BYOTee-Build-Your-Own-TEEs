#!/usr/bin/env python3

import argparse, sys, os, struct, hmac

def read_file_content(dumped_command, path_to_dumped_file):
    print ("Running command : \n")
    print (dumped_command)
    os.system(dumped_command)
    try:
        f = open(path_to_dumped_file, "rb")
    except:
        print("File opening failure")
        raise
    data = f.read()
    f.close()
    try:
        os.remove(path_to_dumped_file)
    except:
        print("Failed to remove file")
        raise
    return data

def main():
    global abs_SSC_elf_path, dump_command
    auth_array = [124, 73, 204, 35, 31, 248, 199, 135, 157, 91, 95, 40, 62, 136, 208, 25, 153, 121, 155, 100, 31, 67, 202, 205, 135, 118, 191, 117, 171, 144, 170, 188, 47, 139, 28, 64, 254, 159, 226, 14, 147, 17, 58, 224, 216, 14, 107, 172, 249, 70, 243, 62, 61, 127, 228, 33, 248, 189, 246, 212, 37, 187, 197, 169]
    auth_key = bytearray(auth_array)
    
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
    #dump_command = 'mb-objcopy -O binary --only-section=.test --only-section=.data --only-section=.rodata ' + abs_SSC_elf_path + ' ' + 'SSC/' + SSC_dump_location 
    dump_command = 'mb-objcopy -O binary --only-section=.test ' + abs_SSC_elf_path + ' ' + 'SSC/' + SSC_dump_location
    
    test_data = read_file_content(dump_command, 'SSC/' + SSC_dump_location)
    dump_command = 'mb-objcopy -O binary --only-section=.data ' + abs_SSC_elf_path + ' ' + 'SSC/' + SSC_dump_location
    data = read_file_content(dump_command, 'SSC/' + SSC_dump_location)
    dump_command = 'mb-objcopy -O binary --only-section=.rodata ' + abs_SSC_elf_path + ' ' + 'SSC/' + SSC_dump_location
    rodata = read_file_content(dump_command, 'SSC/' + SSC_dump_location)

    try:
        SSC_file = open('SSC/' + SSC_dump_location, "wb")
    except:
        print("Could not open writable file")
        raise

    test_address = 0x50
    data_address = 0x13ed4
    rodata_address = 0x144cc
    final_data = struct.pack(">i",test_address) + struct.pack(">i",data_address) + struct.pack(">i",rodata_address) + struct.pack(">i",len(test_data)) + struct.pack(">i",len(data)) + struct.pack(">i",len(rodata))
    
    final_data = final_data + test_data + data + rodata
    #print("TEst section size: " + str(len(test_data)))
    #print(auth_key)
    #print(len(final_data))
    #print (','.join(format(x, '02x') for x in final_data))
    m = hmac.new(auth_key, digestmod="sha512")
    m.update(auth_key)
    ssa_sig = m.digest()
    #print (','.join(format(x, '02x') for x in auth_key))
    #print(type(ssa_sig))
    #print (','.join(format(x, '02x') for x in ssa_sig))
    
    final_data = ssa_sig + final_data
    try:
        SSC_file.write(final_data)
    except:
        print("Write to file failed")
        raise
    SSC_file.close()
    os.system("./encrypt_SSA SSC/AES_SSC")
    print ("\n" + SSC_dump_location + " --dumped file dumped at location -> SSC/")

if __name__ == '__main__':
    main()
