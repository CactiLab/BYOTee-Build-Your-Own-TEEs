#******************************************************************
# buildMicroblaze.tcl: Tcl script for automating microblaze building
#
# This file contains tcl commands for building the microblaze project
# after successful generation of the bitstream
#
# ** Note ** this is mainly to automate the first time build.
#    Subsequent builds mainly need to set the workspace and build
#******************************************************************

if { $argc != 2 } {
    puts "buildMicroblaze requires the user to provide the following:
    project_name and dev_path."
    exit 1
}

set project_name [lindex $argv 0]
set dev_path [lindex $argv 1]

set worksp "$dev_path/mb"

set pl_sdk "$dev_path/pl/proj/$project_name/$project_name.sdk"
set pl_sysdef "$dev_path/pl/proj/$project_name/$project_name.runs/impl_1/system_wrapper.sysdef"
set mb_hdf "$worksp/system_wrapper.hdf"
set Untrusted_app "$dev_path/Untrusted_app"

puts "####### Script variables set ########\n"

if {[catch {file mkdir $pl_sdk} errmsg]} {
    puts "$pl_sdk already exists"
}

file copy -force $pl_sysdef $mb_hdf

puts "Setting workspace\n"

setws $worksp

puts "####### Attempting project imports ########\n"

if {[catch {importprojects $worksp} errmsg]} {
    puts "Already imported $worksp"
}

if {[catch {deleteprojects -name "Untrusted_app"} errmsg]} {
    puts "$Untrusted_app not yet added"
}

if {[catch {importprojects $Untrusted_app} errmsg]} {
    puts "Already imported $Untrusted_app"
}

#file delete -force "$worksp/Untrusted_app"
#exec ln -sv $Untrusted_app "$worksp/Untrusted_app"

puts "\n####### Creating Project hw ########\n"

# only need if doesn't already exist
if {[catch {createhw -name $project_name -hwspec "$worksp/system_wrapper.hdf"} errmsg]} {
    puts "Already created the project hw"
}

puts "\n####### Building Microblaze ########\n"

projects -clean
projects -build
