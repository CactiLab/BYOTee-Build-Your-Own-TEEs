# build-your-own-TEE
This is a python3 script. Run command : `./parse_config.py -d config_json_File_path`. We need to specify the configuration jason file with -d as the argument to the script. Example: `./parse_config.py -d ./Examples/config.json`

# Test cases:
To test different files you have to modify the configuration file name in the `parse_config.py` file.

    # Test case 1 (oneTEE_config.json):
        This test create one Trusted Execution Environment along with one cortex-A processor on the PS side. There will be two peripherals, one UART and one GPIO
    
    # Test cse 2 (twoTEE_With_BRAM_size_config.json):
        This test create two Trusted Execution Environment along with one cortex-A processor on the PS side. There will be two peripherals, one UART and one GPIO. The first TEE (microblaze) will have 16KB of BRAM and the second one will have 32KB of BRAM.
    
    # Test cse 3 (twoTEE_With_cache_set_config.json):
        This test create two Trusted Execution Environment along with one cortex-A processor on the PS side. There will be two peripherals, one UART and one GPIO. The first TEE (microblaze) will have no cache configured for that. For the second Cache will be configured such as 8KB of data cache and 8KB of instruction cache.
    
     # Test cse 4 (twoTEE_With_selected_communcation_config.json):
        This test create two Trusted Execution Environment along with one cortex-A processor on the PS side. There will be three peripherals, two UART and one GPIO. The first UARTLite will be configured such that only Rich Execution Environment (REE) and the second microblaze has access to that. Microblaze_0's memory map will be execuled from the first UARTLite. But for the second UARTLite all processors will have access to the that.
    
     # Test cse 5 (share_memory_design_with_two_MB.json):
        This test create two Trusted Execution Environment along with one cortex-A processor on the PS side. There will be two peripherals, one UART and one GPIO. UART Lite will be accessable from all the processors. This configuration file will create a shared BRAM between the processors of size 32KB.
    
     # Test cse 5 (config.json):
    
     This test case is used for development purpose
