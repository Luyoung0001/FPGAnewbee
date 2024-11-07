# #LED
# set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
# set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
# set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
# set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
# set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {led[4]}]

# #switch

# set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
# set_property -dict {PACKAGE_PIN AA7 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
# set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
# set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]
# set_property -dict {PACKAGE_PIN AC23 IOSTANDARD LVCMOS33} [get_ports {sw[4]}]


# LED 约束
set_property PACKAGE_PIN H7 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN D5 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN A3 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN A5 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN A4 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

# Switch 约束
set_property PACKAGE_PIN Y6 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

set_property PACKAGE_PIN AA7 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]

set_property PACKAGE_PIN W6 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]

set_property PACKAGE_PIN AB6 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

set_property PACKAGE_PIN AC23 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
