module top_module(
    input clk,
    input resetn,
    input direction,
    output [7:0] seg,
    output [3:0] an
);
    wire clk_out;
    wire [3:0] count;

    // 实例化 32 位分频器
    clk_divider clk_div(
        .clk(clk),
        .resetn(resetn),
        .n(5'd24),          // 经过不断测试 24 比较好，可以观察，太大太慢，太小太快，观察不到
        .clk_out(clk_out)
    );

    // 实例化 4 位加/减法计数器
    counter count_mod(
        .clk(clk_out),
        .resetn(resetn),
        .direction(direction),
        .max_count(4'd9),   // 模 10 计数器
        .count(count)
    );

    // 实例化数码管显示模块
    hex_to_7seg display(
        .hex(count),
        .seg(seg)
    );

    assign an = 4'b1110; // 激活数码管的一个位置
endmodule
