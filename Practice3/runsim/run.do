#####################################################
# library work create
vlib work
#####################################################
# add and compile source project files

vlog ../src/Practice3.sv
vlog ../tests/Practice3_testbench.sv

#####################################################
# use top level testbench

vsim -c work.Practice3_testbench

# add signals on waveform diagram
# add wave *

# radix: binary, hexadecimal, octal, ASCII, unsigned, decimal, symbolic, time

add wave -radix unsigned -group TOP sim:/Practice3_testbench/*
add wave -radix unsigned -group DUT sim:/Practice3_testbench/dut/*

#####################################################
# run simulation
#run 100ns
run -a 
