#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/safayat/BYOTee/BYOTee-Build-Your-Own-TEEs/app1-hw-att/tools/hw-att-module/module1/solution1/.autopilot/db/a.g.bc ${1+"$@"}
