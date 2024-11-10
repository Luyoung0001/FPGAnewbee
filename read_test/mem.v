// module Memory(
//     input         clock,
//     input         reset
// );
//     reg [7:0] mem [0:1023]; // 1KB 内存，每个元素 8 位
//     reg [31:0] pc;

//     // 初始化加载内存数据
//     initial begin
//         $readmemh("dummy.hex", mem);
//     end

//     always @(posedge clock) begin
//         if (reset) begin
//             pc <= 0;
//         end else begin
//             // 组合 4 个字节为一个 32 位指令
//             reg [31:0] instruction;
//             instruction = {mem[pc+3], mem[pc+2], mem[pc+1], mem[pc]};

//             // 打印 32 位数据
//             $display("PC: %0d, Instruction: 0x%h", pc, instruction);

//             // 增加 PC 指针
//             pc <= pc + 4;
//         end
//     end
// endmodule




module Memory(
  input         clock,
  input         reset,
  input  [31:0] io_imem_addr,
  output [31:0] io_imem_inst,
  input  [31:0] io_dmem_addr,
  output [31:0] io_dmem_rdata,
  input         io_dmem_wen,
  input  [31:0] io_dmem_wdata
);
reg [31:0] pc;
// 组合 4 个字节为一个 32 位指令
reg [31:0] instruction;
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:2047]; // @[Memory.scala 27:18]
  // 读取内存
    initial begin
        $readmemh("C:/Share/FPGAnewbee/read_test/dummy.hex", Memory.mem);
    end
  wire  mem_io_imem_inst_MPORT_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_imem_inst_MPORT_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_imem_inst_MPORT_data; // @[Memory.scala 27:18]
  wire  mem_io_imem_inst_MPORT_1_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_imem_inst_MPORT_1_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_imem_inst_MPORT_1_data; // @[Memory.scala 27:18]
  wire  mem_io_imem_inst_MPORT_2_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_imem_inst_MPORT_2_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_imem_inst_MPORT_2_data; // @[Memory.scala 27:18]
  wire  mem_io_imem_inst_MPORT_3_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_imem_inst_MPORT_3_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_imem_inst_MPORT_3_data; // @[Memory.scala 27:18]
  wire  mem_io_dmem_rdata_MPORT_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_dmem_rdata_MPORT_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_dmem_rdata_MPORT_data; // @[Memory.scala 27:18]
  wire  mem_io_dmem_rdata_MPORT_1_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_dmem_rdata_MPORT_1_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_dmem_rdata_MPORT_1_data; // @[Memory.scala 27:18]
  wire  mem_io_dmem_rdata_MPORT_2_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_dmem_rdata_MPORT_2_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_dmem_rdata_MPORT_2_data; // @[Memory.scala 27:18]
  wire  mem_io_dmem_rdata_MPORT_3_en; // @[Memory.scala 27:18]
  wire [9:0] mem_io_dmem_rdata_MPORT_3_addr; // @[Memory.scala 27:18]
  wire [7:0] mem_io_dmem_rdata_MPORT_3_data; // @[Memory.scala 27:18]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 27:18]
  wire [9:0] mem_MPORT_addr; // @[Memory.scala 27:18]
  wire  mem_MPORT_mask; // @[Memory.scala 27:18]
  wire  mem_MPORT_en; // @[Memory.scala 27:18]
  wire [7:0] mem_MPORT_1_data; // @[Memory.scala 27:18]
  wire [9:0] mem_MPORT_1_addr; // @[Memory.scala 27:18]
  wire  mem_MPORT_1_mask; // @[Memory.scala 27:18]
  wire  mem_MPORT_1_en; // @[Memory.scala 27:18]
  wire [7:0] mem_MPORT_2_data; // @[Memory.scala 27:18]
  wire [9:0] mem_MPORT_2_addr; // @[Memory.scala 27:18]
  wire  mem_MPORT_2_mask; // @[Memory.scala 27:18]
  wire  mem_MPORT_2_en; // @[Memory.scala 27:18]
  wire [7:0] mem_MPORT_3_data; // @[Memory.scala 27:18]
  wire [9:0] mem_MPORT_3_addr; // @[Memory.scala 27:18]
  wire  mem_MPORT_3_mask; // @[Memory.scala 27:18]
  wire  mem_MPORT_3_en; // @[Memory.scala 27:18]
  wire [31:0] _io_imem_inst_T_1 = io_imem_addr + 32'h3; // @[Memory.scala 34:26]
  wire [31:0] _io_imem_inst_T_4 = io_imem_addr + 32'h2; // @[Memory.scala 35:26]
  wire [31:0] _io_imem_inst_T_7 = io_imem_addr + 32'h1; // @[Memory.scala 36:26]
  wire [15:0] io_imem_inst_lo = {mem_io_imem_inst_MPORT_2_data,mem_io_imem_inst_MPORT_3_data}; // @[Cat.scala 31:58]
  wire [15:0] io_imem_inst_hi = {mem_io_imem_inst_MPORT_data,mem_io_imem_inst_MPORT_1_data}; // @[Cat.scala 31:58]
  wire [31:0] _io_dmem_rdata_T_1 = io_dmem_addr + 32'h3; // @[Memory.scala 40:26]
  wire [31:0] _io_dmem_rdata_T_4 = io_dmem_addr + 32'h2; // @[Memory.scala 41:26]
  wire [31:0] _io_dmem_rdata_T_7 = io_dmem_addr + 32'h1; // @[Memory.scala 42:26]
  wire [15:0] io_dmem_rdata_lo = {mem_io_dmem_rdata_MPORT_2_data,mem_io_dmem_rdata_MPORT_3_data}; // @[Cat.scala 31:58]
  wire [15:0] io_dmem_rdata_hi = {mem_io_dmem_rdata_MPORT_data,mem_io_dmem_rdata_MPORT_1_data}; // @[Cat.scala 31:58]
  assign mem_io_imem_inst_MPORT_en = 1'h1;
  assign mem_io_imem_inst_MPORT_addr = _io_imem_inst_T_1[9:0];
  assign mem_io_imem_inst_MPORT_data = mem[mem_io_imem_inst_MPORT_addr]; // @[Memory.scala 27:18]
  assign mem_io_imem_inst_MPORT_1_en = 1'h1;
  assign mem_io_imem_inst_MPORT_1_addr = _io_imem_inst_T_4[9:0];
  assign mem_io_imem_inst_MPORT_1_data = mem[mem_io_imem_inst_MPORT_1_addr]; // @[Memory.scala 27:18]
  assign mem_io_imem_inst_MPORT_2_en = 1'h1;
  assign mem_io_imem_inst_MPORT_2_addr = _io_imem_inst_T_7[9:0];
  assign mem_io_imem_inst_MPORT_2_data = mem[mem_io_imem_inst_MPORT_2_addr]; // @[Memory.scala 27:18]
  assign mem_io_imem_inst_MPORT_3_en = 1'h1;
  assign mem_io_imem_inst_MPORT_3_addr = io_imem_addr[9:0];
  assign mem_io_imem_inst_MPORT_3_data = mem[mem_io_imem_inst_MPORT_3_addr]; // @[Memory.scala 27:18]
  assign mem_io_dmem_rdata_MPORT_en = 1'h1;
  assign mem_io_dmem_rdata_MPORT_addr = _io_dmem_rdata_T_1[9:0];
  assign mem_io_dmem_rdata_MPORT_data = mem[mem_io_dmem_rdata_MPORT_addr]; // @[Memory.scala 27:18]
  assign mem_io_dmem_rdata_MPORT_1_en = 1'h1;
  assign mem_io_dmem_rdata_MPORT_1_addr = _io_dmem_rdata_T_4[9:0];
  assign mem_io_dmem_rdata_MPORT_1_data = mem[mem_io_dmem_rdata_MPORT_1_addr]; // @[Memory.scala 27:18]
  assign mem_io_dmem_rdata_MPORT_2_en = 1'h1;
  assign mem_io_dmem_rdata_MPORT_2_addr = _io_dmem_rdata_T_7[9:0];
  assign mem_io_dmem_rdata_MPORT_2_data = mem[mem_io_dmem_rdata_MPORT_2_addr]; // @[Memory.scala 27:18]
  assign mem_io_dmem_rdata_MPORT_3_en = 1'h1;
  assign mem_io_dmem_rdata_MPORT_3_addr = io_dmem_addr[9:0];
  assign mem_io_dmem_rdata_MPORT_3_data = mem[mem_io_dmem_rdata_MPORT_3_addr]; // @[Memory.scala 27:18]
  assign mem_MPORT_data = io_dmem_wdata[7:0];
  assign mem_MPORT_addr = io_dmem_addr[9:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_dmem_wen;
  assign mem_MPORT_1_data = io_dmem_wdata[15:8];
  assign mem_MPORT_1_addr = _io_dmem_rdata_T_7[9:0];
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_dmem_wen;
  assign mem_MPORT_2_data = io_dmem_wdata[23:16];
  assign mem_MPORT_2_addr = _io_dmem_rdata_T_4[9:0];
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_dmem_wen;
  assign mem_MPORT_3_data = io_dmem_wdata[31:24];
  assign mem_MPORT_3_addr = _io_dmem_rdata_T_1[9:0];
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = io_dmem_wen;
  assign io_imem_inst = {io_imem_inst_hi,io_imem_inst_lo}; // @[Cat.scala 31:58]
  assign io_dmem_rdata = {io_dmem_rdata_hi,io_dmem_rdata_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 27:18]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[Memory.scala 27:18]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[Memory.scala 27:18]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[Memory.scala 27:18]
    end
  end


  always @(posedge clock) begin
        if (reset) begin
            pc <= 0;
        end else begin
            instruction = {mem[pc+3], mem[pc+2], mem[pc+1], mem[pc]};

            // 打印 32 位数据
            $display("PC: %0d, Instruction: 0x%h", pc, instruction);

            // 增加 PC 指针
            pc <= pc + 4;
        end
    end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

