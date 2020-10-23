# Cadence Genus(TM) Synthesis Solution, Version 18.10-p003_1, built Jun  7 2018 23:53:27

# Date: Thu Oct 22 16:56:25 2020
# Host: tiuelabb4.ti.lab (x86_64 w/Linux 3.10.0-1127.19.1.el7.x86_64) (4cores*4cpus*1physical cpu*Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz 6144KB)
# OS:   CentOS Linux release 7.8.2003 (Core)

source /scripts/synth.tcl
source scripts/synth.tcl
source scripts/synth.tcl
gui_show
create_clock -period 100 -name my_clock [get_ports clk]
report_timing
report_timing -lint
gui_show
