
# miPod Digital Rights Manager (DRM)

This directory contains the core of the miPod - the DRM. The DRM handles all
of the sensitive operations of the device and drives the audio codec that plays
actual music. The DRM, located in the PL, is itself driven by the Linux-side
miPod driver, which is the user and file system interface to the DRM.

See the rules for the specifications on required and optional commands as well
as acceptable formats for output print statements.


## Reference implementation
The reference DRM is implemented as a program running on a soft core MicroBlaze
processor in the PL. While it is possible to implement parts of or the entire
DRM in hardware in the PL, we strongly recommend that teams reuse as much of the
reference hardware as possible due to the tight time restrictions of the
competition. However, teams may see fit and feasible to implement specific
functions of the DRM as individual hardware modules connected to the
MicroBlaze.

The DRM waits idle until receiving an interrupt from the miPod driver. Once
triggered, the DRM checks for the `operation` field in the shared memory interpreted
as a `mipod_buffer` struct and executes the command. After the DRM is finished,
it sets the state in the `mipod_buffer` to STOPPED, signalling to the miPod
driver that it has finished, and waits for another command.

Most operations simply involve reading and/or modifying the song or query in the
buffer. However, for the play command, the DRM has to begin dumping the music to
the audio codec and wait for further playback commands (pause, resumes, stop,
etc.) To play music, the DRM must write the samples to a FIFO and trigger the
codec to begin playback. 

The DRM keeps the login status in the `login_data` field. If a user is logged
in, then the username and PIN are stored in their respective fields. To attempt
to log in, the miPod will place the username and PIN of the login attempt in
those same fields.

## Working on your implementation
Follow the steps in the Getting Started guide to set up the Xilinx software,
build the PL in Vivado, and then open the projects in the SDK. The SDK may then
be used to edit the DRM project called `mb`.

NOTE: Your DRM project must be able to be built using the SDK, as our testing
and provisioning framework uses the same tools to build your design.
