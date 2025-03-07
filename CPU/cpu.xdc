# Top
set_property -dict {PACKAGE_PIN AC19 IOSTANDARD LVCMOS33} [get_ports clock]
set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS33} [get_ports resetn]

set_property -dict {PACKAGE_PIN J25 IOSTANDARD LVCMOS33}  [get_ports lcd_rst]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33}  [get_ports  lcd_cs]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33}  [get_ports  lcd_rs]
set_property -dict {PACKAGE_PIN L8 IOSTANDARD LVCMOS33}   [get_ports  lcd_wr]
set_property -dict {PACKAGE_PIN K8 IOSTANDARD LVCMOS33}   [get_ports  lcd_rd]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33}  [get_ports  lcd_bl_ctr]

set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33}  [get_ports  ct_int]
set_property -dict {PACKAGE_PIN J24 IOSTANDARD LVCMOS33}  [get_ports  ct_sda]
set_property -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS33}  [get_ports  ct_scl]
set_property -dict {PACKAGE_PIN G24 IOSTANDARD LVCMOS33}  [get_ports  ct_rstn]

set_property -dict {PACKAGE_PIN H9 IOSTANDARD LVCMOS33}   [get_ports { lcd_data_io[0]}]
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[1]}]
set_property -dict {PACKAGE_PIN J20 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[2]}]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[3]}]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[4]}]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[5]}]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[6]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[7]}]
set_property -dict {PACKAGE_PIN M16 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[8]}]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[9]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[10]}]
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[11]}]
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[12]}]
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[13]}]
set_property -dict {PACKAGE_PIN H24 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[14]}]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33}  [get_ports { lcd_data_io[15]}]

#LED
set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports  io_exit]

