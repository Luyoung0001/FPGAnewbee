module serial_adder(
    input wire [3:0] A,      // 第一个 4 位加数
    input wire [3:0] B,      // 第二个 4 位加数
    input wire Ci,           // 输入进位
    output reg [3:0] S,      // 输出和
    output reg Co            // 输出进位
);
    reg [4:0] sum;

    always @(*) begin
        sum = A + B + Ci;
        S = sum[3:0];
        Co = sum[4];
    end
endmodule
