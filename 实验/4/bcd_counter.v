module bcd_counter(
    input clk,
    input resetn,
    output reg [3:0] bcd
);
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            bcd <= 0;
        else if (bcd == 4'hF)
            bcd <= 0;
        else
            bcd <= bcd + 1;
    end
endmodule
