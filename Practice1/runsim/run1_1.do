vlog ../Practice1_1.sv
vlog ../Practice1_1_testbench.sv

vsim -c work.Practice1_1_testbench

add wave *

#run 100ns
run -a