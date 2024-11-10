module Top(
        input   clock,
        input   resetn,
        output  io_exit,
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

    reg[31:0] clk_div;
    reg cpu_clk;
    always @(posedge clock) begin
        if (!resetn) begin
            clk_div <= 1'b0;
        end
        else if(clk_div == 26'h3ffffff) begin
            clk_div <= 0;
            cpu_clk <= ~cpu_clk;
        end
        else
            clk_div <= clk_div + 1;
    end
    wire  core_clock; // @[Top.scala 12:25]
    wire  core_reset; // @[Top.scala 12:25]
    wire [31:0] core_io_imem_addr; // @[Top.scala 12:25]
    wire [31:0] core_io_imem_inst; // @[Top.scala 12:25]
    wire [31:0] core_io_dmem_addr; // @[Top.scala 12:25]
    wire [31:0] core_io_dmem_rdata; // @[Top.scala 12:25]
    wire  core_io_dmem_wen; // @[Top.scala 12:25]
    wire [31:0] core_io_dmem_wdata; // @[Top.scala 12:25]
    wire  core_io_exit; // @[Top.scala 12:25]
    wire  memory_clock; // @[Top.scala 13:25]
    wire [31:0] memory_io_imem_addr; // @[Top.scala 13:25]
    wire [31:0] memory_io_imem_inst; // @[Top.scala 13:25]
    wire [31:0] memory_io_dmem_addr; // @[Top.scala 13:25]
    wire [31:0] memory_io_dmem_rdata; // @[Top.scala 13:25]
    wire  memory_io_dmem_wen; // @[Top.scala 13:25]
    wire [31:0] memory_io_dmem_wdata; // @[Top.scala 13:25]
    Core core ( // @[Top.scala 12:25]
             .clock(core_clock),
             .reset(core_reset),
             .io_imem_addr(core_io_imem_addr),
             .io_imem_inst(core_io_imem_inst),
             .io_dmem_addr(core_io_dmem_addr),
             .io_dmem_rdata(core_io_dmem_rdata),
             .io_dmem_wen(core_io_dmem_wen),
             .io_dmem_wdata(core_io_dmem_wdata),
             .io_exit(core_io_exit)
         );
    Memory memory ( // @[Top.scala 13:25]
               .clock(memory_clock),
               .io_imem_addr(memory_io_imem_addr),
               .io_imem_inst(memory_io_imem_inst),
               .io_dmem_addr(memory_io_dmem_addr),
               .io_dmem_rdata(memory_io_dmem_rdata),
               .io_dmem_wen(memory_io_dmem_wen),
               .io_dmem_wdata(memory_io_dmem_wdata)
           );
    reg         display_valid;
    reg  [39:0] display_name;
    reg  [31:0] display_value;
    wire [5 :0] display_number;
    wire        input_valid;
    wire [31:0] input_value;

    lcd_module lcd_module(
                   .clk            (clock           ),   //100Mhz
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



    reg choice;
    // 初始化 `choice`
    initial begin
        choice = 1'b0;
    end
    // 切换显示内容
    always @(posedge cpu_clk) begin
        if (choice) begin
            display_valid <= 1'b1;
            display_name  <= "   PC";
            display_value <= core_io_imem_addr;
        end
        else begin
            display_valid <= 1'b1;
            display_name  <= " INST";
            display_value <= memory_io_imem_inst;
        end
        choice <= ~choice;
    end

    assign io_exit = core_io_exit; // @[Top.scala 18:13]
    assign core_clock = cpu_clk;
    assign core_reset = !resetn;
    assign core_io_imem_inst = memory_io_imem_inst; // @[Top.scala 16:18]
    assign core_io_dmem_rdata = memory_io_dmem_rdata; // @[Top.scala 17:18]
    assign memory_clock = cpu_clk;
    assign memory_io_imem_addr = core_io_imem_addr; // @[Top.scala 16:18]
    assign memory_io_dmem_addr = core_io_dmem_addr; // @[Top.scala 17:18]
    assign memory_io_dmem_wen = core_io_dmem_wen; // @[Top.scala 17:18]
    assign memory_io_dmem_wdata = core_io_dmem_wdata; // @[Top.scala 17:18]
endmodule
