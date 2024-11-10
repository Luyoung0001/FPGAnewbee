`timescale 1ns / 1ps

module top_module_tb;
    reg clk;
    reg resetn;
    wire [7:0] seg;
    wire [3:0] an;

    top_module uut (
        .clk(clk),
        .resetn(resetn),
        .seg(seg),
        .an(an)
    );

    initial begin
        clk = 0;
        resetn = 0;
        #10 resetn = 1;
    end

    always #5 clk = ~clk;

    initial begin
        #1000 $stop;
    end
endmodule
