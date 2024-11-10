module top_module(
    input [3:0] sw,       // sw[3:0] -> A, sw[7:4] -> B
    input sw15,           // sw15 -> Ci
    output [3:0] led,     // led[3:0] -> Sum
    output led4           // led4 -> Carry Out
);
    wire [3:0] A = sw[3:0];
    wire [3:0] B = sw[7:4];
    wire Ci = sw15;

    wire [3:0] S;
    wire Co;

    // 并行加法器实例化
    parallel_adder u_parallel_adder (
        .A(A),
        .B(B),
        .Ci(Ci),
        .S(S),
        .Co(Co)
    );

    assign led = S;
    assign led4 = Co;
endmodule
