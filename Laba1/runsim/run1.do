vlog ../LogicFunc.sv
vlog ../LogicFunc_testbench.sv

vsim -c work.LogicFunc_testbench

add wave *

#run 100ns
run -a