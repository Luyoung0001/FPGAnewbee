module top_module(
    input clk,
    input resetn,
    output [7:0] seg,
    output [3:0] an
);
    wire [3:0] hex0, hex1, hex2, hex3;

    reg[31:0] clk_div;
    reg cpu_clk;
    always @(posedge clk) begin
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
    // 自动生成 BCD 数字
    bcd_counter counter0(.clk(cpu_clk), .resetn(resetn), .bcd(hex0));
    bcd_counter counter1(.clk(cpu_clk), .resetn(resetn), .bcd(hex1));
    bcd_counter counter2(.clk(cpu_clk), .resetn(resetn), .bcd(hex2));
    bcd_counter counter3(.clk(cpu_clk), .resetn(resetn), .bcd(hex3));

    // 数码管动态扫描
    digit_display display(
        .clk(clk),
        .resetn(resetn),
        .hex0(hex0),
        .hex1(hex1),
        .hex2(hex2),
        .hex3(hex3),
        .seg(seg),
        .an(an)
    );
endmodule
