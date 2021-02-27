# To-do List

This is the to-do list of the project.

# Design
* [ ] How to provide the root of trust?
* [ ] How can computer-aided formal verification can be used here?

# Paper Writing
* [ ] ?

# Implementation
## Build single microblaze linker script for all SSCs and Runtime
* [X] Put the user code on SSC in a different section of the ELF file
* [X] Dump the user code section in the SSC folder (`createDumpedFiles` script)
* [X] All other code should start from a predetermined address (Fix in linker script)
* [X] Current linker scirpt does not include all the library function. If added on the SSC as Dummy function it gets included in the ELF file. `LED_SSC` includes such a dummy function `usleep`. But this is never called from the main function. This solution is not generic. Need to include all the misstion function manually this way.
* [ ] Runtime ELF file and SSC ELF include all the library functions of `libc.a, libgcc.a, libgloss.a, libm.a` and `libxil.a` . These libraries can be found in the BSP project, We have the source code for all except `libxil.a`
* [ ] Both ELF file library symbols should have the same value
* [ ] Static linking for the Runtime on microblaze and all SSC's
## Programmable Static generation of hardware design with TCL scripts
* [X] Python scripts works to generate multiple microblazes and connected peripherals
* [X] Resource configuration with the json file for microblaze
* [X] https://github.com/CactiLab/build-your-own-TEE has example python scipt that takes jason files as inputs and output tcl files to generate the FPGA configuration bitstreams
* [ ] All the peripherals we want to include in the final design needs and their connectivity configuration

## PCAP and DEVC bridge to modify bitstream files dynamically
* [ ] Use PCAP and DEVC in Runtime of the FPGA side to read the bitstream files (`in progress`)
* [ ] Runtime of the FPGA needs to modify the bitsream files dynamically to update the design

## TPM module for attestation

## Combine all sub projects
