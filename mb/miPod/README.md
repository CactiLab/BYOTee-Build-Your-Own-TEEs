# miPod Linux Driver

This directory contains the Linux-side driver of the BYOT. The purpose of miPod
is to handle the normal execution on the Cortex-A processor, taking user commands, loading
necessary `ssc` programs and information into the shared memory, driving the `BYOT_runtime` to
execute the `ssc`.

While, miPod is an executable ELF file in the reference implementation, miPod
may be any file or script type so long as it is able to be launched by running
`./miPod` from the ~/music directory.

See the rules for the specifications on required and optional commands as well
as acceptable formats for output print statements.

NOTE: as miPod is in the Linux environment, it will be at the whim of an
attacker with root privileges, and may not be considered safe.
