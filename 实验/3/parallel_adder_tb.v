`timescale 1ns / 1ps

module parallel_adder_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg Ci;
    wire [3:0] S;
    wire Co;

    parallel_adder uut (
        .A(A),
        .B(B),
        .Ci(Ci),
        .S(S),
        .Co(Co)
    );

    initial begin
        // Test Case 1
        A = 4'b1010; B = 4'b0101; Ci = 0;
        #10;
        // Test Case 2
        A = 4'b1111; B = 4'b0001; Ci = 1;
        #10;
        // Test Case 3
        A = 4'b0011; B = 4'b0010; Ci = 0;
        #10;
        // Test Case 4
        A = 4'b0100; B = 4'b0111; Ci = 1;
        #10;
        $stop;
    end
endmodule
