# 

This repository contains the RIT system for MITRE's 2020 [Embedded System CTF](http://mitrecyberacademy.org/competitions/embedded/). The original insecure reference system developed by MITRE can be found at [MITRE Insecure Reference](https://github.com/mitre-cyber-academy/2020-ectf-insecure-example).

## Getting Started
Please see the [Getting Started Guide](getting_started.md). Please see the [RIT Design](2020ectf-rit-design.pdf) for the design and implementation details of our system.

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

