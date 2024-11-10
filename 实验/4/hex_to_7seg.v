module hex_to_7seg(
    input [3:0] hex,
    output reg [7:0] seg
);
    always @(*) begin
        case (hex)
            4'h0: seg = 8'b01111110; // 0
            4'h1: seg = 8'b00110000; // 1
            4'h2: seg = 8'b01101101; // 2
            4'h3: seg = 8'b01111001; // 3
            4'h4: seg = 8'b00110011; // 4
            4'h5: seg = 8'b01011011; // 5
            4'h6: seg = 8'b01011111; // 6
            4'h7: seg = 8'b01110000; // 7
            4'h8: seg = 8'b01111111; // 8
            4'h9: seg = 8'b01111011; // 9
            4'hA: seg = 8'b01110111; // A
            4'hB: seg = 8'b00011111; // B
            4'hC: seg = 8'b01001110; // C
            4'hD: seg = 8'b00111101; // D
            4'hE: seg = 8'b01001111; // E
            4'hF: seg = 8'b01000111; // F
            default: seg = 8'b11111111;
        endcase
    end
endmodule
