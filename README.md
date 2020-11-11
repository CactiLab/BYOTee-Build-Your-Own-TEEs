# 2020 MITRE Collegiate eCTF Example Code

This repository contains an example reference system for MITRE's 2020 [Embedded System CTF](http://mitrecyberacademy.org/competitions/embedded/). 
This code is incomplete, insecure, and does not meet MITRE standards for quality.
This code is being provided for educational purposes to serve as a simple example that meets the minimum functional requirements for the 2020 MITRE eCTF competition.
Use this code at your own risk!

## Getting Started
Please see the [Getting Started Guide](getting_started.md).

## Compile with Mb-gcc [run this commands in the Mb_files folder]
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

