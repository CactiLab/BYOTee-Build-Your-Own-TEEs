# Untrusted_app Linux Driver

This directory contains the Linux-side driver of the BYOT. The purpose of Untrusted_app
is to handle the normal execution on the Cortex-A processor, taking user commands, loading
necessary `ssc` programs and information into the shared memory, driving the `BYOT_runtime` to
execute the `ssc`.

While, Untrusted_app is an executable ELF file in the reference implementation, Untrusted_app
may be any file or script type so long as it is able to be launched by running
`./Untrusted_app` from the ~/music directory.

See the rules for the specifications on required and optional commands as well
as acceptable formats for output print statements.

NOTE: as Untrusted_app is in the Linux environment, it will be at the whim of an
attacker with root privileges, and may not be considered safe.
