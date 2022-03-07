# BYOTee: Build Your Own TEEs
This repository contains an implementation of the BYOTee system, which is a framework to build multiple physically separated TEEs on-demand using FPGAs. The idea of BYOTee can be applied and implemented on FPGAs from all vendors. For this implementation, we use a [Xilinx SoC FPGA](https://digilent.com/shop/cora-z7-zynq-7000-single-core-and-dual-core-options-for-arm-fpga-soc-development/). 
This page include the steps to clone the repository, a short description of repository structure, and lastly, instructions to set up development tools.

If you want to cite our paper in your work, please use the following BibTeX entry.

```
@article{BYOTee2022,
  title={BYOTee: Towards Building Your Own Trusted Execution Environments Using FPGA},
  author={Armanuzzaman, Md. and Zhao, Ziming},
  journal={arXiv preprint arXiv:2202.10673},
  year={2022}
}
```

## Hardware and Software Requirements

* [Cora Z7s: Zynq-7000 development board](https://digilent.com/shop/cora-z7-zynq-7000-single-core-and-dual-core-options-for-arm-fpga-soc-development/)
* Xilinx Software Development Kit (XSDK 2017.04)
* Xilinx FPGA synthesis tool (Vivado 2017.04)
* A Host computer (The framework was tested on Ubuntu 20.04 and 18.04, but should work for other OS too)


After setting up the development tools, to build and execute each application, go to the application directories and follow the **getting started** file instructions.

## Project Structure
We developed four demo applications. The example code is structured as follows:
* `app1/` - Contains an example of **Computational applications**. In this application the Hardcore System side sends a 64 bit data to the Enclave softcore(Microblaze). The Enclave SSC outputs AES encryption/decryption depending on the commands provided by the Hardcore System untrusted application.
In the hardware deisgn of the application Enclave is constructed with a micrbolze processor with its BRAM.
No peripherals are connected to the microblaze.
* `app2/` - Contains an example of **Peripheral and Hardcore System Interacting Applications**. In this application the Hardcore System side just triggers the execution of SSC application without any input or output data. The Enclave SSC continuous toggels the LED color when the button is pressed.
In the hardware deisgn of the application Enclave is constructed with a micrbolze processor with its BRAM, and two peripherals connected to that.
The LED peripheral and the button peripheral in this case is included in the hardware TCB for the system.
* `app3/` - Contains an example of **Peripheral, Hardcore System and Enclave Interacting Applications**. In this application the Hardcore System side continuously interact with the application in the Enclave. The Enclave SSC application is a digital medial player application.
The audio files are stored in the SD card. The Hardcore System application sends the file from SD card to the Enclave SSC application.
In the hardware deisgn of the application Enclave is constructed with a micrbolze processor with its BRAM, and axi dma, SPI module, peripherals.
* `app4/` - Contains an example of **Distributed Applications**. In this application the there are two Enclaves implemented in the FPGA side. Both of the Enclaves are configured with its own BRAMs. And for secure communication between the Enclaves one 32KB BRAM is shared.
The Hardcore System application here talks to the Enclave-1 through the SEB. The SSA-4 here is loaded to the Enclave-4 statically with `update-MEM` tool. Although SSAs on the Enclave-1 are loaded dynamically.
* `HBUILDER/` - Contains a tool to generate the Enclave hardware configurations. The input file is in json format and it output tcl files to build the Enclave hardware design.
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
