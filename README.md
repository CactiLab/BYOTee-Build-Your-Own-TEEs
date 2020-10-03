# 2020 MITRE Collegiate eCTF Example Code

This repository contains an example reference system for MITRE's 2020 [Embedded System CTF](http://mitrecyberacademy.org/competitions/embedded/). 
This code is incomplete, insecure, and does not meet MITRE standards for quality.
This code is being provided for educational purposes to serve as a simple example that meets the minimum functional requirements for the 2020 MITRE eCTF competition.
Use this code at your own risk!

## Getting Started
Please see the [Getting Started Guide](getting_started.md).

## Compile with Mb-gcc
 * mb-gcc -Wall -O0 tes1.c -o test.elf
 * mb-objcopy --dump-section .text=test test.elf

## Project structure
The example code is structured as follows

 * `boot-image/` - Contains a stock FSBL, `image.ub`, and `u-boot.elf` for booting the project on the board. The stock FSBL is only provided for the purposes of making the `miPod.bin`, since `bootgen` requires you provide a bootloader when creating a `.bin` image.
 * `mb/` - Contains example DRM project for running on the soft-core MicroBlaze. See [DRM README](mb/README.md)
 * `miPod/` - Contains example miPod project for running the Linux-side miPod driver. See [miPod README](miPod/README.md)
 * `pl/` - Contains example PL implementation with soft-core MicroBlaze and audio codec. See [PL README](pl/README.md)
 * `tools/` - Contains example provisioning tools. See [tools README](tools/README.md)
 * `vagrant/` - Contains files for configuring the Vagrant environment. See [Vagrant README](vagrant/README.md)
 * `vivado-boards/` - Contains Vivado libraries for the board
 * `Vagrantfile` - Vagrantfile for launching the Vagrant environment - DO NOT CHANGE
 * `sample-audio` - Sample audio files for you to use

