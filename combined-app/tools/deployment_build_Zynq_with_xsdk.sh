#!/bin/bash
#./buildDevice -p ../ -n test -bf bm -store_dir device1
cp ../mb/Untrusted_app/src/main.c ../Untrusted_app/src/
cp ../mb/Untrusted_app/src/untrusted_app.h ../Untrusted_app/src/
./buildDevice -p ../ -n test -bf all -store_dir device1/
./packageDevice ../boot-image/template.bif device1/miPod.bin device1/download.bit
./createDumpedFiles ../mb/LED_SSC/Debug/LED_SSC.elf
./createDumpedFiles ../mb/Secure_DRM/Debug/Secure_DRM.elf
./createDumpedFiles ../mb/AES_SSC/Debug/AES_SSC.elf
