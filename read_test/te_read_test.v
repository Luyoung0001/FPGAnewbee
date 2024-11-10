`timescale 1ns / 1ps

module tb_Memory;
    // 定义测试信号
    reg clock;
    reg reset;

    // 实例化被测模块
    Memory mem_inst (
        .clock(clock),
        .reset(reset)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // 仿真过程
    initial begin
        // 初始化
        reset = 1;
        #20;        // 等待 20ns
        reset = 0;  // 释放复位信号

        // 运行一段时间观察输出
        #200;       // 运行 200ns
        $finish;    // 结束仿真
    end
endmodule
