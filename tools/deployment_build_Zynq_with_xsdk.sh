#!/bin/bash
#./buildDevice -p ../ -n test -bf bm -store_dir device1/
./buildDevice -p ../ -n test -bf cb -store_dir device1/
./packageDevice ../boot-image/template.bif device1/miPod.bin device1/download.bit
./createDumpedFiles ../mb/LED_SSC/Debug/LED_SSC.elf
