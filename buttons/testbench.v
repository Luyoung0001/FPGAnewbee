module tb_button_led_control;

    reg [4:0] sw;         // 5 个按钮输入
    wire [4:0] led;       // 5 个 LED 输出

    button_led_control uut (
        .sw(sw),
        .led(led)
    );

    initial begin
        // 初始化所有开关为 0，所有 LED 应该是熄灭的
        sw = 5'b00000;
        #100;  // 等待 10 个时间单位

        // 测试每个单独开关按下的情况
        sw = 5'b00001;  // 按下按钮 1
        #100;

        sw = 5'b00010;  // 按下按钮 2
        #100;

        sw = 5'b00100;  // 按下按钮 3
        #100;

        sw = 5'b01000;  // 按下按钮 4
        #100;

        sw = 5'b10000;  // 按下按钮 5
        #100;

        // 测试多个按钮同时按下的情况
        sw = 5'b10101;  // 按下按钮 1、3 和 5
        #100;

        sw = 5'b11111;  // 所有按钮按下
        #100;
        $finish;
    end
endmodule
