vlib work

vlog ../src/ShiftRegister.sv
vlog ../src/FallingEdgeDetector.sv
vlog ../src/Counter.sv
vlog ../src/SPI.sv

vlog ../tests/SPI_testbench3.sv

vsim -c work.SPI_testbench3

add wave *

#run 100ns
run -a
