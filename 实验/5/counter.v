module counter(
    input clk,
    input resetn,
    input direction,       // 方向选择信号 (1: 加法, 0: 减法)
    input [3:0] max_count, // 模 N 计数器的最大值
    output reg [3:0] count // 输出计数值
);
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            count <= 4'd0;
        else if (direction) begin
            if (count == max_count)
                count <= 4'd0;
            else
                count <= count + 1;
        end else begin
            if (count == 4'd0)
                count <= max_count;
            else
                count <= count - 1;
        end
    end
endmodule
