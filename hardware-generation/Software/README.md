# Build_your_own_TEE
This is a python3 script. Run command : python3 parse_config.py

# Test cases:
This foldre contains example software codes of the along with the hardware design.

    #Interrupt_Controller_test folder contains the software code for setting a interrupt handler between the Coretx-A and MicroBlaze Processor.
    
    #Shared_Memory_Without_Interrupt folder contains the software code for setting a shared BRAM between the Cortex-A and MicroBlaze processor and simple code to show that we can write from one processor to a memory address and read the same memory address from the other one. The hardware design configuration file can be found in the Test case 5(share_memory_design_with_two_MB.json) file.
    
    
    #UartLite_with_resticted_access folder contains the software code for accessing an uartlite peripheral between the processors and one of the Microblaze processor does not have access to one UartLite peripheral
    
    