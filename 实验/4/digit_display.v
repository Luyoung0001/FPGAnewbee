module digit_display(
    input clk,              // 输入时钟
    input resetn,           // 复位信号
    input [3:0] hex0,       // 数码管0显示的数字
    input [3:0] hex1,       // 数码管1显示的数字
    input [3:0] hex2,       // 数码管2显示的数字
    input [3:0] hex3,       // 数码管3显示的数字
    output reg [7:0] seg,   // 8 段数码管显示
    output reg [3:0] an     // 数码管选择
);
    reg [3:0] digit;
    reg [15:0] clk_div;
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            clk_div <= 0;
        end else begin
            clk_div <= clk_div + 1;
        end
    end

    always @(*) begin
        case (clk_div[15:14])
            2'b00: begin
                an = 4'b1110;
                digit = hex0;
            end
            2'b01: begin
                an = 4'b1101;
                digit = hex1;
            end
            2'b10: begin
                an = 4'b1011;
                digit = hex2;
            end
            2'b11: begin
                an = 4'b0111;
                digit = hex3;
            end
        endcase
    end

    hex_to_7seg hex_decoder(
        .hex(digit),
        .seg(seg)
    );
endmodule
