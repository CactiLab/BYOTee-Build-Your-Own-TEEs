# 2020 MITRE Collegiate eCTF Getting Started

Below is the overview of how to set up the reference implementation for the 2020 Collegiate eCTF.

Please note: if any step fails, it is highly unlikely that the process will get back on track by continuing to future steps.

## Creating Your Own Fork
We suggest you create a fork of this repo so that you can begin to develop
your solution to the eCTF. To do this, you must fork the repo, change your fork to the `origin`, and
then add the MITRE repo as another remote. Follow these steps below.

1. Clone the eCTF repository using ssh or https 
```bash
git clone https://github.com/mitre-cyber-academy/2020-ectf-insecure-example --recursive
``` 
2. Change the current origin remote to another name
```bash
git remote rename origin mitre
```

3. Fork the MITRE repo on github (Note that you probably want to make the repo private for now so
   that other teams cannot borrow your development ideas) 

4. Add the fork as the new origin
```bash
git remote add origin <git_path>.git
```

You can now fetch and push as you normally would using `git fetch origin` and `git push origin`.
If we push out updated code, you can fetch this new code using `git fetch mitre`.


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


## Vagrant
In order to manage dependencies and allow for easier cross-platform development, a VM provisioned by
[Vagrant](https://vagrantup.com) will be used for building and provisioning the design. Please see
the [Vagrant README](vagrant/README.md) file for information about setting up the Vagrant environment before
proceeding. Setting up the vagrant machine will take at least 1 hour and should be completed in one sitting
to avoid common errors that occur when pausing and resuming the setup process.
Please allocate enough time for this process and be sure the follow the steps in the `README`
carefully.


## Building the Reference Design
This section assumes that you have a Vagrant development
environment running as described in the `vagrant` folder, and that you have read through all of the
`README` files in each subdirectory.

To build the reference design for the first time, follow these steps:
1.  Ensure that all steps to provision the development environment were completed as described
    in the [Vagrant README](vagrant/README.md) file.
2.  Log in to the virtual machine using the credentials `vagrant:vagrant`.
3.  Open a terminal and `cd` to the `tools` directory.
4.  Run `mkdir global_provisioning/audio -p` to make a directory called `global_provisioning`, with a subfolder of `audio` for audio files.
5.  Run `./createRegions --region-list "United States" "Japan" "Australia" --outfile global_provisioning/region.secrets` script to create the geographical regions (USA, Japan, and Australia in this case)
6.  Run `./createUsers --user-list "drew:1234567890" "ben:00000000" "misha:0987654321" --outfile global_provisioning/user.secrets` script to create the 3 users ("drew", "ben" and "misha") with their pins.
7.  Run `./protectSong --region-list "United States" --region-secrets-path global_provisioning/region.secrets --outfile global_provisioning/audio/demo.drm --infile ../sample-audio/Sound-Bite_One-Small-Step.wav --owner "drew" --user-secrets-path global_provisioning/user.secrets` to provision a song for the United States region, with "drew" as an owner.
8.  Run `./createDevice --region-list "United States" "Japan" --region-secrets-path global_provisioning/region.secrets --user-list "drew" "ben" "misha" --user-secrets-path global_provisioning/user.secrets --device-dir device1`. This will create a device for the "United States" and "Japan" regions and provision the device for "drew", "ben", and "misha", allowing each of them to log in. Any output files will be put into a "device" directory.
9.  Run the device by running `./buildDevice -p ../ -n test -bf all -secrets_dir device1/` (note that this takes a long time to run the first time you run it! Please be patient.) This will create a Vivado project called `test` and use the `device1` secrets directory.
10. Run `./packageDevice ../boot-image/template.bif device1/miPod.bin device1/download.bit` to create a `miPod.BIN` file with your bitstream.
11. Insert the SD card into the SD card reader, and insert that into your laptop.
    Ensure that this is passed through to the VM through the VirtualBox USB options
12. Run the `./deployDevice /dev/sdb ../BOOT.BIN global_provisioning/audio/ device1/miPod ../boot-image/image.ub --mipod-bin-path device1/miPod.bin` script.
13. Remove the SD card and place it into the board.
14. Ensure that the jumper is connecting both pins of JP2 (this allows the device to boot from the SD card)
15. Connect the Cora board to the computer. Ensure that the board (Digilent Adept USB Device) is passed through to the VM.
16. See the **Accessing UART From Inside the VM** section of the [Vagrant README](vagrant/README.md) file to start minicom.
17. Press the `RESET` button on the board to reset it. You should now see the board boot and enter a Linux shell.
18. `cd` to the `music` folder.
19. Run the `./miPod` application, and run `help` to see a list of all possible commands.


## Working With the Xilinx Tools
You can launch `vivado` to modify the reference implementation programmable logic (PL).
`vivado` will also allow you to generate the bitstream and export the hardware to the SDK.
The SDK can be launched from Vivado, or directly from the command line to allow you to modify
the DRM project runing on the MicroBlaze and the miPod project running on the Linux side.


### SDK Development Tips

When first opening the SDK GUI, the project workspace should be set to the `mb/` directory. Import
all three projects (Cora-Z7-07S, drm_audio_fw, and drm_audio_fw_bsp) and then import the miPod
project. All four projects should appear in the Project Explorer to the left. If the initial build
fails, select `Project > Clean...` to clean and rebuild the project.

#### Manual SDK Building
While teams should regularly check that the full build and provision process works using the
provisioning tools, it may be faster to build and flash the device manually. 

To update the miPod:
1. Save all files to build the project. Ensure in the Console window that the build succeeded.
2. Copy the file `miPod/Debug/miPod.elf` to `~/music/miPod` on the board (either over minicom or by USB drive)

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
       2. `mb/Cora-Z7-07S/download.bit` - the bitstream loaded with the DRM ELF (created by step 4)
6. Insert the SD card into the Cora board and the RESET button next to the power jack. When Linux finishes
   booting, the MicroBlaze should have the updated bitstream.
