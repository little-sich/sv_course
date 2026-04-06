vlib work

vlog ../src/LogicFunc.sv
vlog ../src/Decoder15.sv
vlog ../src/Demultiplexer17.sv
vlog ../src/CompleteCircuit.sv

vlog ../tests/CompleteCircuit_testbench.sv

vsim -c work.CompleteCircuit_testbench

add wave *

#run 100ns
run -a