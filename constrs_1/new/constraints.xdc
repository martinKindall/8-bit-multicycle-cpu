# switches

set_property PACKAGE_PIN W17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN W15 [get_ports selector]
set_property IOSTANDARD LVCMOS33 [get_ports selector]

set_property PACKAGE_PIN V15 [get_ports clkEnable]
set_property IOSTANDARD LVCMOS33 [get_ports clkEnable]

# clock

set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#segments

set_property PACKAGE_PIN U2 [get_ports {anodeActivate[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodeActivate[0]}]

set_property PACKAGE_PIN U4 [get_ports {anodeActivate[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodeActivate[1]}]

set_property PACKAGE_PIN V4 [get_ports {anodeActivate[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodeActivate[2]}]

set_property PACKAGE_PIN W4 [get_ports {anodeActivate[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodeActivate[3]}]

set_property PACKAGE_PIN W7 [get_ports {ledSegment[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[6]}]

set_property PACKAGE_PIN W6 [get_ports {ledSegment[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[5]}]

set_property PACKAGE_PIN U8 [get_ports {ledSegment[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[4]}]

set_property PACKAGE_PIN V8 [get_ports {ledSegment[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[3]}]

set_property PACKAGE_PIN U5 [get_ports {ledSegment[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[2]}]

set_property PACKAGE_PIN V5 [get_ports {ledSegment[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[1]}]

set_property PACKAGE_PIN U7 [get_ports {ledSegment[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledSegment[0]}]

set_property PACKAGE_PIN V7 [get_ports dp]
set_property IOSTANDARD LVCMOS33 [get_ports dp]

# leds

set_property PACKAGE_PIN U16 [get_ports memEnable]
set_property IOSTANDARD LVCMOS33 [get_ports memEnable]

set_property PACKAGE_PIN E19 [get_ports regWrite]
set_property IOSTANDARD LVCMOS33 [get_ports regWrite]

set_property PACKAGE_PIN U19 [get_ports ir2En]
set_property IOSTANDARD LVCMOS33 [get_ports ir2En]

set_property PACKAGE_PIN V19 [get_ports ir1En]
set_property IOSTANDARD LVCMOS33 [get_ports ir1En]

set_property PACKAGE_PIN V13 [get_ports slowClock]
set_property IOSTANDARD LVCMOS33 [get_ports slowClock]