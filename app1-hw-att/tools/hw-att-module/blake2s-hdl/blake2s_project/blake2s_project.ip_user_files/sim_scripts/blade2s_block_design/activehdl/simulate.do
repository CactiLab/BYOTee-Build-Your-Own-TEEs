onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+blade2s_block_design -L xil_defaultlib -L secureip -O5 xil_defaultlib.blade2s_block_design

do {wave.do}

view wave
view structure

do {blade2s_block_design.udo}

run -all

endsim

quit -force
