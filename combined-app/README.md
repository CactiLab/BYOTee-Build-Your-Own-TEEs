# CactiLab-BYOT Example Code

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

