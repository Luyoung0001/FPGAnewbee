module button_led_control(
    input [4:0] sw,       // 5 个按钮输入
    output reg [4:0] led  // 5 个 LED 输出
);

    always @(*) begin
        // 将输入开关的状态直接传递给 LED 输出
        led = sw;
    end

endmodule
