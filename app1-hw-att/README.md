# BYOT Example Code

This repository contains an example reference system for BYOT System Design. 


## Getting Started
Please see the [Getting Started Guide](getting_started.md).

## Project structure
The example code is structured as follows

 * `boot-image/` - Contains a stock FSBL, `image.ub`, and `u-boot.elf` for booting the project on the board. The stock FSBL is only provided for the purposes of making the `miPod.bin`, since `bootgen` requires you provide a bootloader when creating a `.bin` image.
 * `mb/` - Contains BYOT runtime and example SSC running on the soft-core MicroBlaze. See [BYOT README](mb/README.md)
 * `Untrusted_app/` - Contains example Untrusted_app project for running the Linux-side miPoUntrusted_appd driver. See [Untrusted_app README](Untrusted_app/README.md)
 * `pl/` - Contains example PL implementation with soft-core MicroBlaze and audio codec. See [PL README](pl/README.md)
 * `tools/` - Contains example provisioning tools. See [tools README](tools/README.md)
 * `vivado-boards/` - Contains Vivado libraries for the board
 * `MB_files/` - Contains testing Microblaze files. These are example files for testing purpose.


