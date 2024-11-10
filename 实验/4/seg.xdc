#ʱ���ź�����
set_property -dict {PACKAGE_PIN AC19 IOSTANDARD LVCMOS33} [get_ports clk]

set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports resetn]
#seg

set_property PACKAGE_PIN E26 [get_ports {an[3]}]
set_property PACKAGE_PIN G25 [get_ports {an[2]}]
set_property PACKAGE_PIN G26 [get_ports {an[1]}]
set_property PACKAGE_PIN H26 [get_ports {an[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property PACKAGE_PIN C4 [get_ports {seg[7]}]
set_property PACKAGE_PIN A2 [get_ports {seg[6]}]
set_property PACKAGE_PIN D4 [get_ports {seg[5]}]
set_property PACKAGE_PIN E5 [get_ports {seg[4]}]
set_property PACKAGE_PIN B4 [get_ports {seg[3]}]
set_property PACKAGE_PIN B2 [get_ports {seg[2]}]
set_property PACKAGE_PIN E6 [get_ports {seg[1]}]
set_property PACKAGE_PIN C3 [get_ports {seg[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

