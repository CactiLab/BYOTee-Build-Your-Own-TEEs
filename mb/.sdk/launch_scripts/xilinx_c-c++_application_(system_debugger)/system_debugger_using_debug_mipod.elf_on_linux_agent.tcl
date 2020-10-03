connect -url tcp:127.0.0.1:3121
source /home/tomal/Desktop/BUILDTEEcode/2020-ectf-insecure-example/mb/Cora-Z7-07S/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A" && level==0} -index 1
fpga -file /home/tomal/Desktop/BUILDTEEcode/2020-ectf-insecure-example/mb/Cora-Z7-07S/download.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A"} -index 0
loadhw -hw /home/tomal/Desktop/BUILDTEEcode/2020-ectf-insecure-example/mb/Cora-Z7-07S/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A"} -index 1
dow /home/tomal/Desktop/BUILDTEEcode/2020-ectf-insecure-example/mb/drm_audio_fw/Debug/drm_audio_fw.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Cora Z7 - 7007S 210370A92F69A"} -index 0
dow /home/tomal/Desktop/BUILDTEEcode/2020-ectf-insecure-example/mb/miPod/Debug/miPod.elf
configparams force-mem-access 0
bpadd -addr &main
