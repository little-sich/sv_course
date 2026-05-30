#####################################################
# library work create
vlib work
#####################################################
# add and compile source project files

vlog ../FIFO.sv
vlog ../FIFO_testbench.sv

#####################################################
# use top level testbench

vsim -c work.FIFO_testbench

# add signals on waveform diagram
add wave *

#####################################################
# run simulation
#run 100ns
run -a