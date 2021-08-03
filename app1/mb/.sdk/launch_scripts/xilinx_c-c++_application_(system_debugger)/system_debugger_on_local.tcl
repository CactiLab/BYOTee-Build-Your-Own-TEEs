connect -url tcp:127.0.0.1:3121
source /home/tomal/Desktop/cacti_lab/BYOT/code-build-your-own-TEE/mb/Cora-Z7-07S/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F79A" && level==0} -index 1
fpga -file /home/tomal/Desktop/cacti_lab/BYOT/code-build-your-own-TEE/mb/Cora-Z7-07S/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F79A"} -index 0
loadhw -hw /home/tomal/Desktop/cacti_lab/BYOT/code-build-your-own-TEE/mb/Cora-Z7-07S/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F79A"} -index 0
stop
ps7_init
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F79A"} -index 1
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F79A"} -index 1
dow /home/tomal/Desktop/cacti_lab/BYOT/code-build-your-own-TEE/mb/BYOT_runtime/Debug/BYOT_runtime.elf
configparams force-mem-access 0
bpadd -addr &main
