vlib work

vlog ../src/Lecture6.sv
vlog ../tests/Lecture6_testbench.sv

vsim -c work.Lecture6_testbench

add wave *

#run 100ns
run -a
