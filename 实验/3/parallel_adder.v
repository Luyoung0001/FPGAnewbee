module parallel_adder(
    input [3:0] A,           // 第一个 4 位加数
    input [3:0] B,           // 第二个 4 位加数
    input Ci,                // 输入进位
    output [3:0] S,          // 输出和
    output Co                // 输出进位
);
    wire [3:0] P, G;
    wire C1, C2, C3, C4;

    // Generate 和 Propagate 信号
    assign P = A ^ B; // Propagate
    assign G = A & B; // Generate

    // 计算各级进位
    assign C1 = G[0] | (P[0] & Ci);
    assign C2 = G[1] | (P[1] & C1);
    assign C3 = G[2] | (P[2] & C2);
    assign Co = G[3] | (P[3] & C3);

    // 计算和
    assign S[0] = P[0] ^ Ci;
    assign S[1] = P[1] ^ C1;
    assign S[2] = P[2] ^ C2;
    assign S[3] = P[3] ^ C3;
endmodule
