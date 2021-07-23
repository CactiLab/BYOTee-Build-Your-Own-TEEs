# Cora Z7-07S Base Linux Design

This repository contains the programmable logic for the reference system for MITRE's 2020 Embedded System CTF. This code is incomplete, insecure, and does not meet MITRE standards for quality. This code is being provided for educational purposes to serve as a simple example that meets the minimum functional requirements for the 2020 MITRE eCTF competition. Use this code at your own risk!

## General Project Information
Created for Vivado 2017.4.

This project is built on top of an internal project used by Digilent for the Cora Z7-07S
Petalinux Project (https://github.com/Digilent/Cora-Z7-07S-base-linux)

This project contains an example PL implementation with soft-core MicroBlaze and audio codec.

## Usage

The `/proj` directory contains the `create_project.tcl` script which handles the creation of your project for the Cora Z7-07S.

Once created, a project folder with your specified name (default `cora_z7_07s` as specified in `buildDevice.py`) will be generated, along with an `.xpr` file (that can be opened directly if you launch the Vivado GUI). If loaded, you will be able to  view the project's *Block Design* and the parts associated with the board. You may also want to take a look at `system_wrapper.vhd`.

This project uses Vivado to build the block design and generate an intial bitstream. After creating your Vivado project, `buildDevice` can be used to generate the bitstream (`createBitstream.py` and `create_bitstream.tcl`).

This actually occurs in three steps:
* Synthesis
* Implementation
* Bitstream generation

Once the bitstream has been generated, the Vivado SDK is used to create a combined bitstream file (called `download.bit`). This contains both the bitstream and the `.elf` file for the DRM module in the MicroBlaze. The `download.bit` is later used to create a `miPod.bin` so that the FSBL can securely load it into the FPGA.
