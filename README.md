# Project Description
This repository contains the demo implementation of BYOTee. It's a framework which implements multiple physically separated TEEs on-demand using SoC FPGAs. The framework is designed for FPGAs from all vendors. For our demo implementation, we used a Xilinx FPGA SoC: https://digilent.com/shop/cora-z7-zynq-7000-single-core-and-dual-core-options-for-arm-fpga-soc-development/

Please find the details of our work at: 

Hardware and Software requirements to reproduce our work:

* [Cora Z7s: Zynq-7000 development board](https://digilent.com/shop/cora-z7-zynq-7000-single-core-and-dual-core-options-for-arm-fpga-soc-development/)
* Xilinx Software Development Kit (XSDK 2017.04)
* Xilinx FPGA synthesis tool (Vivado 2017.04)
* A Host computer (The framework was tested on Ubuntu 20.04 and 18.04, but should work for other OS too)

The description below represents the steps to clone the repository, a short description of repository structure, and lastly, instructions to set up development tools.

## Notes
* After setting up the development tools, to build and execute each application, go to the application directories and follow the **getting started** file instructions.


## Cloning Repository


1. Clone the BYOTee repository using ssh or https 
```bash
git clone git@github.com:CactiLab/code-build-your-own-TEE.git
``` 

## Project structure
In our implementation we develop four demo applications. The example code is structured as follows:
* `app1/` - Contains an example of **Computational applications**. In this application the PS side sends a 64 bit data to the CTEE softcore(Microblaze). The CTEE SSC outputs AES encryption/decryption depending on the commands provided by the PS untrusted application.
In the hardware deisgn of the application CTEE is constructed with a micrbolze processor with its BRAM.
No peripherals are connected to the microblaze.
* `app2/` - Contains an example of **Peripheral and PS Interacting Applications**. In this application the PS side just triggers the execution of SSC application without any input or output data. The CTEE SSC continuous toggels the LED color when the button is pressed.
In the hardware deisgn of the application CTEE is constructed with a micrbolze processor with its BRAM, and two peripherals connected to that.
The LED peripheral and the button peripheral in this case is included in the hardware TCB for the system.
* `app3/` - Contains an example of **Peripheral, PS and CTEE Interacting Applications**. In this application the PS side continuously interact with the application in the CTEE. The CTEE SSC application is a digital medial player application.
The audio files are stored in the SD card. The PS application sends the file from SD card to the CTEE SSC application.
In the hardware deisgn of the application CTEE is constructed with a micrbolze processor with its BRAM, and axi dma, SPI module, peripherals.
* `app4/` - Contains an example of **Distributed Applications**. In this application the there are two CTEEs implemented in the FPGA side. Both of the CTEEs are configured with its own BRAMs. And for secure communication between the CTEEs one 32KB BRAM is shared.
The PS application here talks to the CTEE-1 through the SEB. The SSA-4 here is loaded to the CTEE-4 statically with `update-MEM` tool. Although SSAs on the CTEE-1 are loaded dynamically.
* `CTEE-HS-generation/` - Contains a tool to generate the CTEE hardware configurations. The input file is in json format and it output tcl files to build the CTEE hardware design.
* `Evaluations/` - Contains the evaluation source code of the BYOT. It incldues implementated applications performance evaluation source code, embench-iot benchmark application source code, cold-boot-attack on DRAM and BRAM source code. Note to evaluate on the MicroBlaze processor we also added a AXI timer IP in the hardware design, the tcl scripts are also added under this directory.

## Setting up Software development & Synthesis tools
We require using the two main Xilinx tools for the development of your
design: Vivado and the Xilinx Software Development Kit (SDK). Vivado is used to create the
Programmable Logic design. For the reference design, this includes the Xilinx MicroBlaze, a soft
microprocessor core. Applications for the MicroBlaze can be written using the Xilinx SDK. More
information about these tools will be discussed when building the reference design.

 1. [Go to the Xilinx website](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)
 2. Download the 2017.4 version -> All OS Installer Single-File Download
 3. Login or create a Xilinx account. Note: you can use your college email and location as your "corporation"

## Source Vivado and XSDK
The Vivado and Xilinx tools needs to be sourced in your bashrc file, as the build tools will invoke the tools from command line. Please follow the below commands and replace **user_name** with your user name.
```bash
echo "source /opt/Xilinx/Vivado/2017.4/settings64.sh" >> /home/user_name/.bashrc
echo "source /opt/Xilinx/SDK/2017.4/settings64.sh" >> /home/user_name/.bashrc
source /home/user_name/.bashrc
```
## Tips
* While compiling the software projects if errors occur such as missing peripheral driver functions, follow the below steps:
1. Open Vivado hardware project.
2. Export the hardware in the **mb** folder of that project.
3. In XSDK it should update the hardware automatically, if not right-click on the project **test**, click the update hardware option.
4. Regenerate the BSP file, sometimes it may not update properly. Then delete the current BSP and create a new BSP project with the same name.

* If  generation has have any errors, delete the **test** project in ``pl/proj``. Re-run the hardware generation script.
* For each project **boot-image** folder and **BOOT.bin** are the same.

 <!--- 
 * `boot-image/` - Contains a stock FSBL, `image.ub`, and `u-boot.elf` for booting the project on the board. The stock FSBL is only provided for the purposes of making the `miPod.bin`, since `bootgen` requires you provide a bootloader when creating a `.bin` image.
 * `mb/` - Contains BYOT runtime and example SSC running on the soft-core MicroBlaze. See [BYOT README](mb/README.md)
 * `Untrusted_app/` - Contains example Untrusted_app project for running the Linux-side miPoUntrusted_appd driver. See [Untrusted_app README](Untrusted_app/README.md)
 * `pl/` - Contains example PL implementation with soft-core MicroBlaze and audio codec. See [PL README](pl/README.md)
 * `tools/` - Contains example provisioning tools. See [tools README](tools/README.md)
 * `vivado-boards/` - Contains Vivado libraries for the board

 * `MB_files/` - Contains testing Microblaze files. These are example files for testing purpose.


## Helpful commands with Mb-gcc [run this commands in the Mb_files folder]
1. `Testing with Object files`
 * mb-gcc -c -nostdlib -static -Wall -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul test1.c -o test.o
 * mb-objcopy --dump-section .text=test test.o
 * Move the `test` file from this folder to `/tools/global_provisioning/audio/` folder after step 8 from getting started

2. `Testing with Multiple Files and generate elf and dump`
 * mb-gcc -nostdlib  -Wall -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul test2LD.c test1LD.c -o final.elf
 * mb-objcopy --dump-section .text=ltest5 final.elf

3. `Testing with generating two object files and combile with mb-ld to generate elf file then dump` [ -EL to set as little endian ]
 * mb-gcc -c -nostdlib -static -Wall -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul test1.c -o test.o
 * mb-gcc -c -nostdlib -static -Wall -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul test2.c -o test.o
 * mb-ld -EL -o final obj.o obj2.o
4. `Others`
 * mb-objcopy -O binary --only-section=.text --only-section=.data test.o test [ to dump the code and data section together ]
5. `Custom Linker`
 * mb-gcc -nostdlib -Wall -Wl,-T -Wl,./test.ld -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul test1LD.c test2LD.c -o final.elf
6. `Linking with elf [did not work] `
 * mb-gcc -nostdlib -Wall -Wl,-T -Wl,./test.ld -Wl,--gc-sections -Wl,--no-relax -O0 -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -L "/home/tomal/Desktop/BUILDTEEcode/mitre/2020-ectf-insecure-example/mb/drm_audio_fw/Debug/" -ldrm_audio_fw test1LD.c test2LD.c -o final.elf
7. `Define ssc section with user code and use firmware libraries (With constant data we need to dump the ordata section as well)`
 * mb-objcopy -O binary --only-section=.ssc --only-section=.data --only-section=.rodata LED_SSC.elf led
--->
