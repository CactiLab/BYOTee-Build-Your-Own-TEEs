# build-your-own-TEE
This is a python3 script. Run command : `./parse_config.py -d config_json_File_path`. We need to specify the configuration JSON file with `-d` as the argument to the script. Example: `./parse_config.py -d ./Examples/config.json`. `parse_config.py` will create a `design_bd.tcl` file in the specified `Location` in the configuration JSON file. Now, use vivado command to generate the actual hardware project.
Vivado command: `vivado -mode batch -source <your_Tcl_script>`. <your_Tcl_script> in you case is `design_bd.tcl`.

## Common Issues

- You may get the following error after running the vivado command:
    ```
    ERROR: [Board 49-71] The board_part definition was not found for digilentinc.com:cora-z7-07s:part0:1.0. The project's board_part property was not set, but the project's part property was set to xc7z007sclg400-1. Valid board_part values can be retrieved with the 'get_board_parts' Tcl command. Check if board.repoPaths parameter is set and the board_part is installed from the tcl app store.
    ```
   To solve the issue, you need to download the missing board definition files from [here](https://github.com/Digilent/vivado-boards/archive/master.zip) and copy the files in the appropriate location. Please follow **Section 3** (*Installing Digilent Board Files*) of the Digilent official guide [here](https://reference.digilentinc.com/vivado/installing-vivado/start#installing_digilent_board_files) for more details.

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
    
        This test case is used for development purpose.
