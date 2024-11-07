`timescale 1ns / 1ps

module lcd(
        input clk,
        input resetn,
        output lcd_rst,
        output lcd_cs,
        output lcd_rs,
        output lcd_wr,
        output lcd_rd,
        inout[15:0] lcd_data_io,
        output lcd_bl_ctr,
        inout ct_int,
        inout ct_sda,
        output ct_scl,
        output ct_rstn
    );

    reg         display_valid;
    reg  [39:0] display_name;
    reg  [31:0] display_value;
    wire [5 :0] display_number;
    wire        input_valid;
    wire [31:0] input_value;

    lcd_module lcd_module(
                   .clk            (clk           ),
                   .resetn         (resetn        ),


                   .display_valid  (display_valid ),
                   .display_name   (display_name  ),
                   .display_value  (display_value ),
                   .display_number (display_number),
                   .input_valid    (input_valid   ),
                   .input_value    (input_value   ),

                   .lcd_rst        (lcd_rst       ),
                   .lcd_cs         (lcd_cs        ),
                   .lcd_rs         (lcd_rs        ),
                   .lcd_wr         (lcd_wr        ),
                   .lcd_rd         (lcd_rd        ),
                   .lcd_data_io    (lcd_data_io   ),
                   .lcd_bl_ctr     (lcd_bl_ctr    ),
                   .ct_int         (ct_int        ),
                   .ct_sda         (ct_sda        ),
                   .ct_scl         (ct_scl        ),
                   .ct_rstn        (ct_rstn       )
               );

    always @(posedge clk) begin
        display_valid <= 1'b1;
        display_name  <= "Data";
        display_value <= 32'd20241106;
        display_number <= 6'd6;
    end
endmodule
