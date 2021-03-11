
# Project Build and File Creation Toolchain

The following set of tools provides an example to build the BYOT hardware design, insecure execution in the PS side, BYOT runtime and security sensitive codes.

### buildDevice
Syntax:
> ./buildDevice -p <DEV_PATH_BYOT> -n <PROJ_NAME> -bf <BUILD_FLAG> -secrets_dir <STORAGE_DIR>

Args:
- <DEV_PATH_BYOT> : is the path of your main working directory.
- <PROJ_NAME> : name of the project to be created and referenced;
              it will be possible to open a `.xpr` (from create_project) in the Vivado gui
- <BUILD_FLAG> : one of the modes defined above; the default will be to run [all] options
- <STORAGE_DIR> : is a path to the directory containing bitstream and miPod exetable

Please note:
* buildDevice (the bash script) passes args directly to the buildDevice.py script.
  This is done to allow sourcing of the Vivado path, and is assumed to be under `/opt/path/etc/`
* Although it is possible to call the build_flag functions individually, all handling of
  function input is handled in the main() of buildDevice.py.
* You may wish to review any `tcl` scripts and modify them if you see fit:
      `/dev/path/BYOT/pl/proj/` : create_project.tcl, gen_bitstream.tcl
      `/dev/path/BYOT/tools/` :  build_microblaze.tcl, combine_bitstream.tcl


### packageDevice
Syntax:
> ./packageDevice <SYSTEM.bif> <OUTPATH> <BITSTREAM_PATH>

Args:
- <SYSTEM.bif> : A path to the BIF to provide to bootgen to create a miPod.bin
- <OUTPATH> : The path to the output file (miPod.bin)
- <BITSTREAM_PATH> : The path to the bitstream file that will be used in the BIF.

* Similar to `buildDevice`, `packageDevice` was created to handle the
creation of a BOOT.bin (which is deployed via deployDevice)

* `createDumpedFiles` script will dump only the used defined security sensitive code on `SSC` folder.
* `packageDevice` will source the Xilinx SDK (for running bootgen)

### deployDevice
Syntax:
> ./deployDevice <SD_DEVICE> <BOOT.bin>  <SSC_FOLDER> <MIPOD_APPLICATION> <IMAGE.ub> [--no-format]

Args:
- <SD_DEVICE> : The path to the SD card device to deploy the system to.
- <BOOT.bin> : The path to the BOOT.bin
- <SSC_FOLDER> : The path to the folder with the SSC files that will be loaded
- <MIPOD_APPLICATION> : The path to the miPod application to run in Linux.
- <IMAGE.ub> : The path to the Petalinux kernel.
- no-format : an optional flag that if present will not format the SD card.

## buildDevice Details
This example buildDevice script has a modular design to help with testing.
The following section describes these details.

### Wrapper
* A bash wrapper script: `buildDevice`, which can be called as follows:
      $ ./buildDevice

This bash script will `source` the settings64.sh for `Vivado`
(likely downloaded to `/opt` in your Vagrant box), before calling the `buildDevice.py` script.

* A python script: `buildDevice.py`, which is called within `buildDevice`.

This script handles user input options and automates the creation of a Vivado
project up through the step of combining an elf and bitstream into download.bit.

### Build Flags
buildDevice supports multiple "build flags" as described below.  These are used with the `-bf` cmdline option.

     [cs]: copy device_secrets.h to microblaze dir

     [cp]: create project

     [gb]: generate bitstream

     [bm]: build microblaze

     [cb]: combine bitstream

     [all]: run all build device functions

You can open the project created by [cp] using the Vivado GUI and selecting the `filename.xpr`
file to open.


### Helper scripts

buildDevice relies on the following python and tcl scripts for each of its sub-components:


[cp]: buildBitstream.py, create_project.tcl

[gb]: buildBitstream.py, gen_bitstream.tcl

[bm]: buildMicroblaze.py, build_microblaze.tcl

[cb]: combineBitstream.py, combine_bitstream.tcl

[all]: runs all of the above, in order.

### buildDevice Functionality Overview

**[cp]**: `create_project` in buildBitstream.py

Creates a new Vivado project -- should you want to, it is possible to create multiple,
as long as unique name is used.

This must exist in order to generate a bitstream.

**[gb]**: `gen_bitstream` in buildBitstream.py

Runs through the steps of creating a bitstream:
Synthesis, Implementation, and finally Bitstream Generation

Please be warned, this *will* take a decent amount of time; especially
if this is your first time running this.


**[bm]**: `build_microblaze` in buildMicroblaze.py

Builds the code in `/mb` and `miPod`, and produces a miPod that can be run.

The following are used by the process:

`(lines 25-27, build_microblaze.tcl)`

set pl_sdk "$dev_path/pl/proj/$project_name/$project_name.sdk"

set pl_sysdef "$dev_path/pl/proj/$project_name/$project_name.runs/impl_1/system_wrapper.sysdef"

set mb_hdf "$worksp/system_wrapper.hdf"


**[cb]**: `combine_bitstream` in combineBitstream.py

Creates the `download.bit` as output in the given secrets/device directory.

The following are used by the process, which will call upon updatemem:

`(lines 17-19, combine_bitstream.tcl)`

set sw_mmi "$worksp/$proj_name/system_wrapper.mmi"

set sw_bit "$worksp/$proj_name/system_wrapper.bit"

set drm_elf "$worksp/drm_audio_fw/Debug/drm_audio_fw.elf"

**[all]**: Contains functionality from all of the above flags, in order.

* Create Project
* Generate Bitstream
* Build Microblaze
* Combine Bitstream
