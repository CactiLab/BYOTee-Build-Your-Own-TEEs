onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blade2s_block_design_opt

do {wave.do}

view wave
view structure
view signals

do {blade2s_block_design.udo}

run -all

quit -force
