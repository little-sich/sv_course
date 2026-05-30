#####################################################
# library work create
vlib work
#####################################################
# add and compile source project files

vlog ../src/Register.sv
vlog ../src/RegisterSync.sv
vlog ../src/RegisterAsyncN.sv
vlog ../src/Mux2If.sv
vlog ../src/Mux2Case.sv
vlog ../src/Mux2Vector.sv
vlog ../tests/Practice5_testbench.sv

#####################################################
# use top level testbench

vsim -c work.Practice5_testbench

# add signals on waveform diagram
# add wave *

# radix: binary, hexadecimal, octal, ASCII, unsigned, decimal, symbolic, time

add wave -radix unsigned -group TOP sim:/Practice5_testbench/*
add wave -radix unsigned -group REG1 sim:/Practice5_testbench/reg1/*
add wave -radix unsigned -group REG2 sim:/Practice5_testbench/reg2/*
add wave -radix unsigned -group REG3 sim:/Practice5_testbench/reg3/*
add wave -radix unsigned -group MUX1 sim:/Practice5_testbench/mux1/*
add wave -radix unsigned -group MUX2 sim:/Practice5_testbench/mux2/*
add wave -radix unsigned -group MUX3 sim:/Practice5_testbench/mux3/*

#####################################################
# run simulation
#run 100ns
run -a 
