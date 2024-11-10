module clk_divider(
    input clk,             // 输入时钟 (100MHz)
    input resetn,          // 异步复位
    input [4:0] n,         // 分频因子 2^n (1 ≤ n ≤ 32)
    output reg clk_out     // 输出分频时钟
);
    reg [31:0] counter;

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            counter <= 32'd0;
        else
            counter <= counter + 1;
    end

    always @(posedge clk) begin
        clk_out <= counter[n]; // 分频输出
    end
endmodule
