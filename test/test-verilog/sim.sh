#!/bin/bash

# Compile the Verilog files
iverilog -o counter_tb counter.v counter_tb.v

# Run the simulation
vvp counter_tb

# Open the waveform with GTKWave
gtkwave counter_tb.vcd