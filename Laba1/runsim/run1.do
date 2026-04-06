vlib work

vlog ../src/LogicFunc.sv
vlog ../tests/LogicFunc_testbench.sv

vsim -c work.LogicFunc_testbench

add wave *

#run 100ns
run -a