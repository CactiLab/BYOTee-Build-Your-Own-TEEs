# BYOT Evaluations: Implemented Application, Cold-boot-attack on DRAM & SRAM, Embench-Iot

1. To evaluate the performance implemented application of BYOT we added the AXI timer IP in the hardware desing. A separete project for evaluation is provided in,  `./Embench-IoT-measurement-microblaze` folder. Follow the getting started application similar to other apps to build the project.

2. We perform the Cold-boot-attacks on DRAM as well as BRAM. `./Cold-boot-attack/DRAM` includes the source code, data used to perfrom the result, and lastly the results after the attack. We used a `bmp` file which is `./Cold-boot-attack/DRAM/Data/1.bmp` and we remove the header before doing the attacks. After the attack we reattach the header with decayed data to get the reuslts. All the results are under `./Cold-boot-attack/DRAM/Result` folder. Similary for the Cold-boot attack on BRAM its under `./Cold-boot-attack/BRAM`

3. The Embench-iot bench mark is evaluated on MicroBlaze processors. We modified the sources code of some applications to make them compilable with processor specific tool chains. Thr sourced of the applications in the bench mark is under [Embench-IoT source code](./Embench-IoT/)