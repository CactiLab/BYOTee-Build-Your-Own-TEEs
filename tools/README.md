
# Project Build and File Creation Toolchain

The following set of tools provides an example that meets all eCTF functional requirements (although in an insecure way).  
Note that several of the implementation details here are NOT required, but might be useful to keep around (e.g., the use of json format
and the modular design of the buildDevice script)

## Insecure Example to Protect a Song
Here is an example of how to use these scripts together to define regions and users, and then protect a song.
For more information and diagrams please see the rules document.

1. Create system wide secrets. This script is used to provision the secret component of a set of devices. In the insecure design, the regions are simply linked with an ID.
    > ./createRegions --region-list USA Canada Japan --outfile region_secrets.json

2. Create user specific secrets. This script is used to create secrets for all possible users that can exist on a device or own a song.
    > ./createUsers --user-list user1:12345678 user2:12345679 user3:12345677 --outfile user_secrets.json
3. Create device specific secrets. These secrets will be loaded onto the individual device, and will be ran once per device.
    > ./createDevice --region-list Canada --region-secrets-path region_secrets.json --user-list user1 user2 --user-secrets-path user_secrets.json --device-dir <ENTER_YOUR_DIRECTORY>
4. Protect a song by adding metadata:
    > ./protectSong --region-list USA --region-secrets-path region_secrets.json --outfile test.wav --infile <ENTER_PATH_TO_EXAMPLE_SONG> --owner user1 --user-secrets-path user_secrets.json

After running through the above example, look below to see more information on the specific argument descriptions for each script.

## Argument Descriptions
Find the argument descriptions for each of the provisioning scripts.
### createRegions
Syntax:
> ./createRegions –-region-list <REGION_LIST> --outfile <REGION_SECRETS>

Args:
- <REGION_LIST> : list of regions the system will work with seperated by spaces. Example: --region-list USA Canada Japan
- <REGION_SECRETS>: filepath to save region secrets file to. example: --outfile region_secrets.json
### createUsers
Syntax:
> ./createUsers --user-list <USER_PIN_LIST> --outfile <USER_SECRETS>

Args:
- <USER_PIN_LIST>: space seperated list of usernames:pins. Example: --user-pin-list user1:12345678 user2:12345679
- <USER_SECRETS>: filepath to save user secrets. Example: --outfile user_secrets.json
### provisionDevice
Syntax:
> ./createDevice --region-list <REGION_LIST> --region-secrets-path <REGION_SECRETS_PATH> --user-list <USER_LIST> --user-secrets-path <USER_SECRETS_PATH> --device-dir <OUTPUT_FOLDER>

Args:
- <REGION_LIST>: A space separated list of regions to provision this device for. Note that regions may have spaces in them, but if they do, they will be enclosed in quotes.
- <REGION_SECRETS_PATH>: The path (relative or absolute) to the region_secrets file created by the createRegions script.  
- <USER_LIST>: A list of usernames to provision for this device. Usernames will be space separated.
- <USER_SECRETS_PATH>: The path to the user_secrets file created by the createUsers script.
- <OUTPUT_FOLDER>: The path (relative or absolute) to store the any device related information required to build a device.

### protectSong
Syntax:
> ./protectSong --region-list <REGION_LIST> --region-secrets-path <PATH_TO_REGION_INFORMATION> --infile <PATH_TO_SONG> --path-to-save-song <PATH_TO_OUTPUT_SONG> --owner <USER> --user-secrets-path <USER_SECRETS>

Args:
- <REGION_LIST> : List of country names to region-lock a song to.  These names are simply separated by a space.  Valid names include: USA, Canada, Mexico, Australia, and Japan.
- <PATH_TO_REGION_INFORMATION > : The absolute or relative path to region secrets file.
- <PATH_TO_SONG> : The absolute or relative path to the input song to protect.  Input song must conform to our audio requirements see Audio File Format.
- <PATH_TO_OUTPUT_SONG> : the absolute or relative path to save the output song to.
- <USER> : The username that the song is owned by.
- <USER_SECRETS> : The path to the user secrets file.

*hint*: test your metadata addition with the metadata_read.py script


### buildDevice
Syntax:
> ./buildDevice -p <DEV_PATH_ECTF> -n <PROJ_NAME> -bf <BUILD_FLAG> -secrets_dir <SECRETS_DIR>

Args:
- <DEV_PATH_ECTF> : is the path of your main working directory e.g. '/media/sf_ectf/2020-ectf/'
- <PROJ_NAME> : name of the project to be created and referenced;
              it will be possible to open a `.xpr` (from create_project) in the Vivado gui
- <BUILD_FLAG> : one of the modes defined above; the default will be to run [all] options
- <SECRETS_DIR> : is a path to the directory containing "device_secrets" and other device files.

Please note:
* buildDevice (the bash script) passes args directly to the buildDevice.py script.
  This is done to allow sourcing of the Vivado path, and is assumed to be under `/opt/path/etc/`,
  based on the use of the provided Vagrant dev environment
* Although it is possible to call the build_flag functions individually, all handling of
  function input is handled in the main() of buildDevice.py.
* You may wish to review any `tcl` scripts and modify them if you see fit:
      `/dev/path/ectf/pl/proj/` : create_project.tcl, gen_bitstream.tcl
      `/dev/path/ectf/tools/` :  build_microblaze.tcl, combine_bitstream.tcl

*hint*: buildDevice will not work until after you run any necessary `create` scripts, including createDevice,
which generates `device_secrets.h`

### packageDevice
Syntax:
> ./packageDevice <SYSTEM.bif> <OUTPATH> <BITSTREAM_PATH>

Args:
- <SYSTEM.bif> : A path to the BIF to provide to bootgen to create a miPod.bin
- <OUTPATH> : The path to the output file (miPod.bin)
- <BITSTREAM_PATH> : The path to the bitstream file that will be used in the BIF.

* Similar to `buildDevice`, `packageDevice` was created to handle the
creation of a BOOT.bin (which is deployed via deployDevice)

* `packageDevice` will source the Xilinx SDK (for running bootgen)

### deployDevice
Syntax:
> ./deployDevice <SD_DEVICE> <BOOT.bin> <miPod.bin> <AUDIO_FOLDER> <MIPOD_APPLICATION> <IMAGE.ub> [--no-format]

Args:
- <SD_DEVICE> : The path to the SD card device to deploy the system to.
- <BOOT.bin> : The path to the BOOT.bin
- <miPod.bin> : The path to the miPod.bin, containing your bitstream
- <AUDIO_FOLDER> : The path to the folder with the provisioned audio files.
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

### More examples

Calling everything:
`./buildDevice -p "/dev/path/to/2020-ectf" -n cora_z7_07s -bf all -secrets_dir`

Regenerate the Bitstream (note: must have an existing project):
`./buildDevice -p "/dev/path/to/2020-ectf" -n cora_z7_07s -bf cp`

Re-build the microblaze:
`./buildDevice -p "/dev/path/to/2020-ectf" -n cora_z7_07s -bf bm`

### Helper scripts

buildDevice relies on the following python and tcl scripts for each of its sub-components:

[cs]: pre-cond: createDevice.py is run and generates device_secrets.h

[cp]: buildBitstream.py, create_project.tcl

[gb]: buildBitstream.py, gen_bitstream.tcl

[bm]: buildMicroblaze.py, build_microblaze.tcl

[cb]: combineBitstream.py, combine_bitstream.tcl

[all]: runs all of the above, in order.

### buildDevice Functionality Overview

**[cs]**: `cpy_secrets` in buildDevice

Looks for and copies the `device_secrets.h` located in your secrets/device directory.
It is initially produced by createDevice, and copied to `secrets.h`.

This is located at: `/mb/drm_audio_fw/src/secrets.h`

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

* Copy Secrets
* Create Project
* Generate Bitstream
* Build Microblaze
* Combine Bitstream
