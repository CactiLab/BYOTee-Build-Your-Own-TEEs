# CactiLab-BYOT Getting Started

Below is the overview of how to set up the reference implementation BYOT framework for FPGA SoCs.

Please note: if any step fails, it is highly unlikely that the process will get back on track by continuing to future steps.
<!-- 
## Cloning Repository


1. Clone the BYOT repository using ssh or https 
```bash
git clone git@github.com:CactiLab/code-build-your-own-TEE.git --recursive
``` 
--->

## Download Xilinx Tools
We require using the two main Xilinx tools for the development of your
design: Vivado and the Xilinx Software Development Kit (SDK). Vivado is used to create the
Programmable Logic design. For the reference design, this includes the Xilinx MicroBlaze, a soft
microprocessor core. Applications for the MicroBlaze can be written using the Xilinx SDK. More
information about these tools will be discussed when building the reference design.

 1. [Go to the Xilinx website](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)
 2. Download the 2017.4 version -> All OS Installer Single-File Download
 3. Login or create a Xilinx account. Note: you can use your college email and location as your "corporation"
 4. Place the downloaded zip file into the root directory of your project - Vagrant will install it on the VM


## Building the Reference Design
This section assumes that you have a Vagrant development
environment running as described in the `vagrant` folder, and that you have read through all of the
`README` files in each subdirectory.

To build the reference design for the first time, follow these steps:
1. Open a terminal and `cd` to the `tools` directory.
2. Run `mkdir SSC` to make a directory called`SSC`. Dumped security sensitive code using the tool chain should be stored here to be copied to SD card.
3.  Run the device by running `./buildDevice -p ../ -n test -bf all -store_dir device1/` (note that this takes a long time to run the first time you run it! Please be patient.) This will create a Vivado project called `test` and use the `device1` store directory.
4. Run `./packageDevice ../boot-image/template.bif device1/miPod.bin device1/download.bit` to create a `miPod.BIN` file with your bitstream.
5. Run `./createDumpedFiles ../mb/LED_SSC/Debug/LED_SSC.elf` to create dumped file in `SSC` folder
 
6. Insert the SD card into the SD card reader, and insert that into your laptop.
    Ensure that this is passed through to the VM through the VirtualBox USB options
7. Run the `./deployDevice /dev/sdb ../BOOT.bin SSC/ device1/Untrusted_app ../boot-image/image.ub --Untrusted_app-bin-path device1/miPod.bin` script.
8. Remove the SD card and place it into the board.
9. Ensure that the jumper is connecting both pins of JP2 (this allows the device to boot from the SD card)
10. Connect the Cora board to the computer. Ensure that the board (Digilent Adept USB Device) is passed through to the VM.
11. Run `sudo minicom -D /dev/ttyUSB1` command

You will need to disable the `hardware flow control` setting to have UART work appropriately.
To do so, press `control A` and then `z` while running `minicom`, then hit `O`, go to `Serial port setup`, and then press `F`.
You may want to save this configuration so you don't need to set this up every time you run `minicom`.
Once you reset the board, you should see output on the screen indicating that the board is working properly.

12. Press the `RESET` button on the board to reset it. You should now see the board boot and enter a Linux shell.
13. `cd` to the `music` folder.
14. Run the `./Untrusted_app` application, and run `help` to see a list of all possible commands.


## Working With the Xilinx Tools
You can launch `vivado` to modify the reference implementation programmable logic (PL).
`vivado` will also allow you to generate the bitstream and export the hardware to the SDK.
The SDK can be launched from Vivado, or directly from the command line to allow you to modify
the DRM project runing on the MicroBlaze and the Untrusted_app project running on the Linux side.


### SDK Development Tips

When first opening the SDK GUI, the project workspace should be set to the `mb/` directory. Import
all three projects (Cora-Z7-07S, drm_audio_fw, and drm_audio_fw_bsp) and then import the Untrusted_app
project. All four projects should appear in the Project Explorer to the left. If the initial build
fails, select `Project > Clean...` to clean and rebuild the project.

#### Manual SDK Building
While teams should regularly check that the full build and provision process works using the
provisioning tools, it may be faster to build and flash the device manually. 

To update the Untrusted_app:
1. Save all files to build the project. Ensure in the Console window that the build succeeded.
2. Copy the file `Untrusted_app/Debug/Untrusted_app.elf` to `~/music/Untrusted_app` on the board (either over minicom or by USB drive)

To update the DRM:
1. Save all files to build the project. Ensure in the Console window that the build succeeded.
2. Press the `Program FPGA` button on the upper bar or `Xilinx > Program FPGA`
3. Ensure that the the ELF file to initialize in Block RAM for microblaze_0 is the drm_audio_fw.elf.
   If it is anything else, click the box and then the drop down arrow that appars to the right.
   The ELF file should appear. If it does not, ensure that the build succeeded.
4. Choose Program. A dialog box saying "Initializing Bitstream with ELF data" should appear. If it
   Disappears without an error message, the LED LD0 is red, and "MB> Audio DRM Module has Booted"
   is printed over UART, it successfully programmed.
   *NOTE: Occasionally after multiple calls to Program FPGA, the FPGA does not actually program.
   No error message prints, but the message over UART does not appear. If this happens, continue
   to the next step*
5. Using the previous step, you should be able to reprogram the FPGA without rebooting the device.
   However, these changes will not persist across power cycles. To accomplish this, insert the 
   micro SD card and select `Xilinx > Create Boot Image` in the SDK. The output path should be set to
   `<SD boot partition>/miPod.BIN`. If you have an existing BIF file, you can import from that.
   Otherwise, the following partitions should be added (**NOTE: THE ORDER MATTERS**):
       1. `boot-image/fsbl.elf` - a dummy bootloader that will never run. The real bootloader is
          encrypted for your team in `boot-image/BOOT.BIN`, however the Xilinx tools require a bootloader.
       2. `mb/Cora-Z7-07S/download.bit` - the bitstream loaded with the BYOT ELF (created by step 4)
6. Insert the SD card into the Cora board and the RESET button next to the power jack. When Linux finishes
   booting, the MicroBlaze should have the updated bitstream.
