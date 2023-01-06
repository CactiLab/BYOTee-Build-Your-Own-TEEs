onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.blade2s_block_design

do {wave.do}

view wave
view structure
view signals

do {blade2s_block_design.udo}

run -all

quit -force
