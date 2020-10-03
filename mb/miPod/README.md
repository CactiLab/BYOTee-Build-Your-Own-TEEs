# miPod Linux Driver

This directory contains the Linux-side driver of the DRM. The purpose of miPod
is to act as the user interface to the DRM, taking user commands, loading
necessary files and information into the shared memory, driving the DRM to
execute the commands, and returning information and updates from the DRM to the
user and file system.

While, miPod is an executable ELF file in the reference implementation, miPod
may be any file or script type so long as it is able to be launched by running
`./miPod` from the ~/music directory.

See the rules for the specifications on required and optional commands as well
as acceptable formats for output print statements.

NOTE: as miPod is in the Linux environment, it will be at the whim of an
attacker with root privileges, and may not be considered safe.


## Reference implementation
miPod drives the DRM (implemented as a program running on a soft core
MicroBlaze processor in the PL) through shared memory and the GPIO
interrupt. The shared buffer is mapped into memory, and then interpreted as a
`cmd_channel` struct, which contains fields for exchanging common information,
and a buffer for all other data. A command is sent by setting the `cmd` field
to the desired command, filling the `buf` field with necessary infromation, and
triggering an interrupt to the MicroBlaze. While the MicroBlaze is working,
miPod can follow its state through the `drm_state` field.

The shared buffer in `cmd_channel` may be interpreted as either a `song` or a
`query`, each mapping their respective metadata and data over the buffer.

The DRM keeps the login status in the `login_status` field. If a user is logged
in, then the username and PIN are stored in their respective fields. To attempt
to log in, the miPod will place the username and PIN of the login attempt in
those same fields.

## Working on your implementation
Follow the steps in the Getting Started guide to set up the Xilinx software,
build the PL in Vivado, and then open the projects in the SDK. The SDK may then
be used to edit the miPod project.

NOTE: Your miPod project must be able to be built using the SDK, as our testing
and provisioning framework uses the same tools to build your design.
