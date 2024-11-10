# FPGAnewbee

FPGA 在 xc7a200tfbg676ABX1733（事实上， 对应着实验室 xc7a200tfbg676-2 的板子） 板子上运行的案例程序。

## 在入门前，请务必仔细阅读该文件

## 项目说明

本项目一共有 buttons、LCD、VGA、UART、GPIO 五个实验。

因此本项目一共有上述 5 个子文件夹，这些文件夹中放置了相应的顶层模块、测试模块（可选）、以及约束文件（可复用）。

## vivado 工作原理

首先得知道，vivado 是什么，以及它做了什么。

Vivado是由Xilinx公司开发的FPGA设计与开发工具，主要用于Xilinx FPGA器件的设计、验证、综合和实现。与传统的ISE Design Suite相比，Vivado提供了更高效的设计流程、更多的优化特性以及更现代化的用户界面。

### 1. 前端设计输入

Vivado支持多种设计输入方式，设计者可以使用硬件描述语言（如Verilog、VHDL）进行代码输入。目前阶段只需要了解它接受 HDL 设计的文件比如 leds.v 来创建工程。

### 2. 分析与仿真

Vivado在设计输入后，允许用户对设计进行功能仿真，以验证设计的正确性。在仿真阶段，用户可以使用Vivado自带的仿真工具（Vivado Simulator）或者其他第三方仿真工具（如ModelSim）来进行验证。

- **功能仿真**：在不考虑时序的情况下，通过模拟输入激励验证电路逻辑是否满足设计需求。
- **时序仿真**：在综合后，仿真器会考虑器件的实际时序参数，进一步验证电路在实际时钟速度下的行为是否正确。

这个步骤，需要你自己设计出 testbench 模块来测试，生成时序图后通过观察结果来判断你的 HDL 代码设计是否符合预期。事实上，这一步不是必须的，你可以不用写这个，但前提是你不太关注功能是否符合预期，比如初学者，写的 HDL 代码很简单，根本不用测试，一看就知道是否正确。这也是为什么你能看到某些项目里面没有 testbench.v 文件。

### 3. 合成（Synthesis）

合成是将设计从抽象的HDL代码或模块连接图转化为FPGA可实现的 网表 的过程。在Vivado中，合成阶段分为两个步骤：

- **逻辑综合**：将HDL代码翻译为布尔逻辑电路，优化逻辑结构以减少资源占用，并生成中间表示的逻辑网表。
- **技术映射**：将逻辑电路映射到具体的FPGA器件资源中，比如LUT（查找表）、寄存器等。最终生成一个特定于FPGA的网表，表示该设计在FPGA上可以实现的电路结构。

### 4. 实现（Implementation）

实现阶段是将设计映射到FPGA的实际硬件资源上，使设计适应FPGA的物理结构，包括布线和资源分配等。Vivado的实现阶段通常分为三个主要步骤：

- **布局（Placement）**：将逻辑模块分配到FPGA器件的物理资源上，如LUT、DSP块、BRAM（块RAM）等。Vivado会根据时序和面积需求，将模块放置在最合适的位置。
- **布线（Routing）**：为模块之间的信号分配连接路径，以满足时序和面积的约束。Vivado会根据布线要求为信号选择最短的路径，同时确保满足信号传播延迟和其他时序约束。
- **时序分析**：在布线完成后，Vivado会进行静态时序分析（STA），验证电路在设定的时钟频率下能否正确工作。时序分析会考虑所有信号路径的延迟，确保电路在所需的频率下稳定运行。

### 5. 位流生成（Bitstream Generation）

在设计实现完成并通过时序验证后，Vivado会生成FPGA的位流文件（.bit文件）。该文件包含了FPGA所需的配置信息，用于配置FPGA硬件以实现设计功能。

- **生成位流文件**：位流文件将FPGA设计映射到具体的硬件资源上。生成位流时，Vivado会将布线、布局和配置信息合并成一个可下载到FPGA的文件。
- **下载与配置**：将位流文件下载到FPGA中，FPGA硬件会加载该配置，启动电路运行。

### 6. 调试与验证

在将位流文件下载到FPGA并加载后，可以通过Vivado的硬件调试工具（如ILA - Integrated Logic Analyzer）对电路进行实时监测和调试。

现在就可以将位流文件变成到 fpga 中了，也就是经常说的 下板子。

## 项目工程详细介绍

## buttons

文件 buttons 是一个简单的通过控制 switch 来控制相应的 led 灯的亮灭，功能很简单，虽然这是第一个简单的程序，最好还是完整走一下流程，熟悉 fpga 小板子过程。

这个项目分为三个文件：

- top.v: 这是顶层文件，描述了 HDL 代码设计的功能；
- testbench.v: 这是测试文件，不是必须的；

接下来讲第三个文件： buttons.xdc，约束文件。

约束文件是一个很重要的文件，没有约束文件，是不可能完成下板子这个操作的。约束文件的功能就是将顶层模块中定义的引脚，比如本 buttons：

```Verilog
module button_led_control(
    input [4:0] sw,       // 5 个按钮输入
    output reg [4:0] led  // 5 个 LED 输出
);

    always @(*) begin
        // 将输入开关的状态直接传递给 LED 输出
        led = sw;
    end

endmodule

```

sw、led 是输入和输出，那么如何把这个输入和输出映射到开发板上呢？那就需要约束文件来干这件事：

```Verilog
#LED
set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {led[4]}]

#switch

set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN AA7 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]
set_property -dict {PACKAGE_PIN AC23 IOSTANDARD LVCMOS33} [get_ports {sw[4]}]
```

可以看到，约束文件把 led[0] 绑定到了引脚 H7 上，同时呢定义了一些引脚的电气特性，比如 IOSTANDARD LVCMOS33，其它引脚同理。

一个问题，约束文件的引脚信息是哪里来的？答案是，你可以在网上找，也可以找一个该型号开发板的案例，然后找到约束文件，里面可能就有你想要的引脚定义。

然后就可以打开 vivado，新建工程，添加新文件，跟着一步一步操作，就行了。

## lcd

lcd 这个实验和上面的有点不一样，它使用了一个类似于黑盒子的模块，lcd_module.dcp。
这是因为Vivado中的**DCP文件（Design Checkpoint）**包含了特定设计阶段的完整实现数据，包括网表信息、布局布线信息、时序约束等。Vivado可以使用DCP文件来引用设计的实现，而不需要源代码。因此，当你将`lcd_module.dcp`文件包含到Vivado的源文件中时，它作为一个预先综合和实现过的模块直接被引用，Vivado可以将这个模块链接到你的设计中，无需源代码。

### 具体工作原理

Vivado在生成DCP文件时，会将设计模块转换成FPGA器件资源可以识别的格式，同时包含了模块的I/O接口和内部逻辑。因此，当你在项目中包含DCP文件：

1. **Vivado将DCP视为预编译的模块**：Vivado在读取DCP文件时会将其作为一个“黑盒”模块，不会试图重新综合或实现它，而是直接使用DCP文件中保存的网表和布局布线信息。

2. **DCP文件提供的接口与Verilog实例匹配**：Vivado会检查DCP文件中的接口定义，并将其与你代码中的`lcd_module`实例接口对比匹配。一旦接口正确匹配，Vivado就可以将该DCP文件的实现内容引用到你的设计中。

3. **设计流程加速**：这种方法避免了Vivado重新综合和实现`lcd_module`模块，节省了设计时间，尤其是在复杂或经常复用的模块中非常有效。

### 优势

- **节省时间**：不必重新综合或实现，直接使用DCP文件中包含的实现。
- **设计模块复用**：可以将已验证和实现的模块保存为DCP文件，在不同项目中重复使用。
- **更简单的项目管理**：在大型设计中，可以将各模块单独综合并保存为DCP文件，最后通过顶层设计进行模块化管理。

因此，当你将`lcd_module.dcp`文件添加到Vivado项目时，Vivado自动识别它为模块的实现，从而成功实例化`lcd_module`。这就是不需要模块源代码，仅凭DCP文件即可使用的原因。

同时由于 lcd.v 设计的比较复杂，我们必须加入更多的约束，因此约束文件得扩大一些。

这个实验就随便选了一个区域(6 号区域)，然后显示一段数字（一个 10 进制的日期）：

```Verilog
always @(posedge clk) begin
        display_valid <= 1'b1;
        display_name  <= "Data";
        display_value <= 32'd20241106;
        display_number <= 6'd6;
    end
```

## VGA

VGA 这个实验的目的是给显示器上显示一个图像。

VGA 显示的工作原理比较复杂，lcd 实验之所以简单，是因为它的 lcd_module.dcp 做了大量的工作，暴露出了简单易用的接口，但这不意味着 lcd 显示就很简单，这可能会涉及到类似于驱动开发的工作。

VGA 这个实验就得深入了解 VGA 的工作原理了。

要把一个图像显示到显示器上，需要给开发板传入几个必要的参数：

```Verilog
module vga(
        input clk,               // 100MHz
        input lcd_rst,             // 复位信号
        input select,            // 模式选择
        output hsync,            // 行同步信号
        output vsync,            // 场同步信号
        output [3:0] vga_r,      // VGA红色信号
        output [3:0] vga_g,      // VGA绿色信号
        output [3:0] vga_b       // VGA蓝色信号
    );
```

其中的输出引脚就是必须的，比如：hsync、vsync、vga_x。

VGA 显示器显示图像，并不是直接让图像在显示器上显示出来，而是采用扫描的方式，将构成图像的像素点，在行同步信号和场同步信号的同步下，按照从上到下、由左到右的顺序扫描到显示屏上。输出的都是一个一个的像素点，至于输出到哪里，这个信息需要传给 hsync、vsync。

我们简要说明一下 VGA 显示器的扫描规律：

(1) 在行、场同步信号的同步作用下，扫描坐标定位到左上角第一个像素点坐标；

(2) 自左上角 ( 第一行 ) 第一个像素点坐标，逐个像素点向右扫描 ( 图中第一个水平方向箭头) ；

(3) 扫描到第一行最后一个数据，一行图像扫描完成，进行图像消隐，扫描坐标自第一行行尾转移到第二行行首( 图中第一条虚线 ) ；

(4) 重复若干次扫描至最后一行行尾，一帧图像扫描完成，进行图像消隐，扫描坐标跳转回到左上角第一行行首( 图中对角线箭头 ) ，开始下一帧图像的扫描。

在扫描的过程中会对每一个像素点进行单独赋值，使每个像素点显示对应色彩信息，当一帧图像扫描结束后，开始下一帧图像的扫描，循环往复，当扫描速度足够快，加之人眼的视觉暂留特性，我们会看到一幅完整的图片，而不是一个个闪烁的像素点。这就是VGA 显示的原理。

至于其它的知识，还是建议好好研究研究现有资料。

本实验是显示 512X255 的图像，匹配的显示规格是640X480@60。
大概时钟需要 25.175Mhz，行同步 96 像素，周期为 800；场同步 2 像素，周期为 525，因此有：

```Verilog
// 生成25MHz VGA时钟
always @(posedge clk) begin
        if (!lcd_rst)
            clk_vga <= 0;
        else if (clk_cnt == 1) begin
            clk_vga <= ~clk_vga;
            clk_cnt <= 0;
        end
        else
            clk_cnt <= clk_cnt + 1;
    end

// VGA行和列计数
always @ (posedge clk_vga) begin
        if (!lcd_rst)
            x_cnt <= 10'd0;
        else if (x_cnt == 10'd799)
            x_cnt <= 10'd0;
        else
            x_cnt <= x_cnt + 1;
    end

always @ (posedge clk_vga) begin
        if (!lcd_rst)
            y_cnt <= 10'd0;
        else if (x_cnt == 10'd799) begin
            if (y_cnt == 10'd524)
                y_cnt <= 10'd0;
            else
                y_cnt <= y_cnt + 1;
        end
    end
```

上述定义了行扫描周期、场扫描周期。

现在定义同步：

```Verilog
// VGA同步信号生成
reg hsync_r, vsync_r;
always @ (posedge clk_vga) begin
        if (!lcd_rst)
            hsync_r <= 1'b1;
        else if (x_cnt == 10'd0)
            hsync_r <= 1'b0;
        else if (x_cnt == 10'd96)
            hsync_r <= 1'b1;
end

always @ (posedge clk_vga) begin
        if (!lcd_rst)
            vsync_r <= 1'b1;
        else if (y_cnt == 10'd0)
            vsync_r <= 1'b0;
        else if (y_cnt == 10'd2)
            vsync_r <= 1'b1;
end

assign hsync = hsync_r;
assign vsync = vsync_r;
```

因此，在 x_cnt 同步阶段，hsync_r 保持 96 个像素的低电平信号，vsync_r 保持 2 个像素的低电平信号。之后都拉高。

我们应该怎么显示图像呢？

我们应该指出，当扫描到：

```Verilog
wire display_active = (x_cnt >= 10'd180 && x_cnt < 10'd692) && (y_cnt >= 10'd190 && y_cnt <= 10'd445);
```

这个范围的时候，表明有效，其它区域，直接显示黑色。这个范围就是我们的 LOGO 图像大小。

然后就很简单了，将颜色信息传入到 vga_x 就行了。
