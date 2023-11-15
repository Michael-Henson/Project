# Copyright 1991-2016 Mentor Graphics Corporation
# 
# Modification by Oklahoma State University
# Use with Testbench 
# James Stine, 2008
# Go Cowboys!!!!!!
#
# All Rights Reserved.
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION
# OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.

# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog datapath.sv datapath_tb.sv

# start and run simulation
vsim -voptargs=+acc work.stimulus

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /stimulus/*
add wave -noupdate -divider -height 32 "FSM"
add wave -hex /stimulus/dut/grid
#add wave -hex /stimulus/dut/reset
#add wave -hex /stimulus/dut/clk
add wave -hex /stimulus/dut/grid_evolve
add wave -binary /stimulus/grid15
add wave -binary /stimulus/grid14
add wave -binary /stimulus/grid13
add wave -binary /stimulus/grid12
add wave -binary /stimulus/grid11
add wave -binary /stimulus/grid10
add wave -binary /stimulus/grid9
add wave -binary /stimulus/grid8
add wave -binary /stimulus/grid7
add wave -binary /stimulus/grid6
add wave -binary /stimulus/grid5
add wave -binary /stimulus/grid4
add wave -binary /stimulus/grid3
add wave -binary /stimulus/grid2
add wave -binary /stimulus/grid1
add wave -binary /stimulus/grid0
add wave -binary /stimulus/run
add wave -binary /stimulus/reset
add wave -binary /stimulus/initial_state
add wave -binary /stimulus/dut/state
add wave -binary /stimulus/dut/nextstate


add list -hex -r /stimulus/*
add log -r /*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 1000 ns


