#******************************************************************
# gen_bitstream.tcl: Tcl script for automating bitstream generation
#
# This file contains tcl commands for running the synthesis,
# implementation, and bitstream generation steps.
#
# Note: You may need to run
#  * reset_run synth_1, reset_run impl_1, etc.
# if this is run without fully generating the bitstream
#******************************************************************

set origin_dir "."
set project_bd "$origin_dir/src/bd/system/system.bd"

set synth_comp "synth_design Complete!"
set impl_run "Running Design Initialization..."
set bitstream_comp "write_bitstream Complete!"

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--project_file" { incr i; set project_file [lindex $::argv $i] }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, expecting --project_file arg.\n"
          return 1
        }
      }
    }
  }
  open_project $project_file
  open_bd_design $project_bd
}

# synthesis
puts "Launching Synthesis"
save_bd_design
launch_runs synth_1 -jobs 2

time {
  while { [get_property STATUS [get_runs synth_1]] != $synth_comp } {
  }
}

# implementation
puts "Launching Implementation"
save_bd_design
launch_runs impl_1 -jobs 2

#time {
#  while { [get_property STATUS [get_runs impl_1]] == $impl_run } {
#  }
#}

wait_on_run impl_1


# generate bitstream
puts "Launching Write Bitstream"
launch_runs impl_1 -to_step write_bitstream -jobs 2


time {
  while { [get_property STATUS [get_runs impl_1]] != $bitstream_comp } {
  }
}
