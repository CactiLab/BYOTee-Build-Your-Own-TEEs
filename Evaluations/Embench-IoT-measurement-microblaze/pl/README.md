## Usage

The `/proj` directory contains the `create_project.tcl` script which handles the creation of your project for the Cora Z7-07S.

Once created, a project folder with your specified name (default `cora_z7_07s` as specified in `buildDevice.py`) will be generated, along with an `.xpr` file (that can be opened directly if you launch the Vivado GUI). If loaded, you will be able to  view the project's *Block Design* and the parts associated with the board. You may also want to take a look at `system_wrapper.vhd`.

This project uses Vivado to build the block design and generate an intial bitstream. After creating your Vivado project, `buildDevice` can be used to generate the bitstream (`createBitstream.py` and `create_bitstream.tcl`).

This actually occurs in three steps:
* Synthesis
* Implementation
* Bitstream generation

Once the bitstream has been generated, the Vivado SDK is used to create a combined bitstream file (called `download.bit`). This contains both the bitstream and the `.elf` file for the DRM module in the MicroBlaze. The `download.bit` is later used to create a `miPod.bin` so that the FSBL can securely load it into the FPGA.
