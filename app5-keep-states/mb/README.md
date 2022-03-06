
# Build Your Own Trusted Execution Environments (BYOT)

This directory contains the core of the BYOT. BYOT system runs all security 
sensitive-code in the softcore processors. The softcore( i.e Microblaze)
will execute `BYOT_runtime` and `BYOT_runtime` will handle the execution of 
developer-defined security-sensitive code. Example security sensitive 
program such a `LED_SSC` will be compiled and only the user code will be executed 
by `BYOT_runtime`. Other portions of the `sss` will be stripped off by our provided scripts.
`Untrusted_app` application here is the program running on the Hardcore System side. This folder will be coppied 
from the parent directory.

See the rules for the specifications on required and optional commands as well
as acceptable formats for output print statements.

