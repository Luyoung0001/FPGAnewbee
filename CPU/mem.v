module Memory(
  input         clock,
  input  [31:0] io_imem_addr,
  output [31:0] io_imem_inst,
  input  [31:0] io_dmem_addr,
  output [31:0] io_dmem_rdata,
  input         io_dmem_wen,
  input  [31:0] io_dmem_wdata
);

  // 内存定义（大小为2048字节）
  reg [7:0] mem [0:2047];

  initial begin
    $readmemh("C:/Share/FPGAnewbee/read_test/dummy.hex", mem);
  end

  // 指令读取（4字节对齐）
  assign io_imem_inst = {mem[io_imem_addr[10:0] + 3],
                         mem[io_imem_addr[10:0] + 2],
                         mem[io_imem_addr[10:0] + 1],
                         mem[io_imem_addr[10:0]]};

  assign io_dmem_rdata = {mem[io_dmem_addr[10:0] + 3],
                          mem[io_dmem_addr[10:0] + 2],
                          mem[io_dmem_addr[10:0] + 1],
                          mem[io_dmem_addr[10:0]]};

  always @(posedge clock) begin
    if (io_dmem_wen) begin
      mem[io_dmem_addr[10:0]]     <= io_dmem_wdata[7:0];
      mem[io_dmem_addr[10:0] + 1] <= io_dmem_wdata[15:8];
      mem[io_dmem_addr[10:0] + 2] <= io_dmem_wdata[23:16];
      mem[io_dmem_addr[10:0] + 3] <= io_dmem_wdata[31:24];
    end
  end

endmodule
