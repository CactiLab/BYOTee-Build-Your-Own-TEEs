#******************************************************************
# combineBitstream.tcl: Tcl script for automating download.bit generation
#
#******************************************************************

if { $argc != 3 } {
    puts "buildMicroblaze requires the user to provide the following:
    dev_path and proj_name."
    exit 1
}

set dev_path [lindex $argv 0]
set device_dir [lindex $argv 1]
set proj_name [lindex $argv 2]
set worksp "$dev_path/mb"

set sw_mmi "$worksp/$proj_name/system_wrapper.mmi"
set sw_bit "$worksp/$proj_name/system_wrapper.bit"
set BYOT_elf "$worksp/BYOT_runtime/Debug/BYOT_runtime.elf"
set output "$device_dir/download.bit"

puts "\nCalling updatemem as follows:
updatemem -force -meminfo \
$sw_mmi \
-bit \
$sw_bit \
-data $BYOT_elf \
-proc system_i/microblaze_0 -out \
$output\n"

exec updatemem -force -meminfo \
$sw_mmi \
-bit \
$sw_bit \
-data $BYOT_elf \
-proc system_i/microblaze_0 -out \
$output

puts "Created download.bit at: $output"
