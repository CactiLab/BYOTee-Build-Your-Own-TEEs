# BYOT Evaluations: Implemented Application, Cold-boot-attack on DRAM & SRAM, Embench-Iot

1. To evaluate the performance implemented application of BYOT we added the AXI timer IP in the hardware desing. The tcl source codes can be found under the `./BYOT-apps/Hardware` folder. To generate those hardwares use our provided build scripts. On the software side we included the software implementation to measure each operation under `BYOT-apps\XSDK` folder.

2. We perform the Cold-boot-attacks on DRAM as well as BRAM. `./Cold-boot-attack/DRAM` includes the source code, data used to perfrom the result, and lastly the results after the attack. We used a `bmp` file which is `./Cold-boot-attack/DRAM/Data/1.bmp` and we remove the header before doing the attacks. After the attack we reattach the header with decayed data to get the reuslts. All the results are under `./Cold-boot-attack/DRAM/Result` folder

3. The Embench-iot bench mark is evaluated on both Cortex-A and MicroBlaze processors. We modified the sources code of some applications to make them compilable with processor specific tool chains. Thr sourced of the applications in the bench mark is under `./Embench-iot`