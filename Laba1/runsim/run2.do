vlog ../LogicFunc.sv
vlog ../Decoder15.sv
vlog ../Demultiplexer17.sv
vlog ../CompleteCircuit.sv
vlog ../CompleteCircuit_testbench.sv

vsim -c work.CompleteCircuit_testbench

add wave *

#run 100ns
run -a