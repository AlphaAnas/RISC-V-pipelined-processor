`timescale 1ns / 1ps


module RISC_V_Processor_TB();
reg clk;
reg reset;
 wire [63:0] pc_out;
 wire [63:0] adder1_out;
 wire [63:0] adder2_out;
 wire [63:0] pc_in;
// wire branch;
 wire zero;
 wire [31:0] instruction;
 wire [6:0] opcode;
 wire [4:0] rd;
 wire [2:0] funct3;
 wire [4:0] rs1;
 wire [4:0] rs2;
 wire [6:0] funct7;
 wire [63:0]writeData;
// wire regwrite;
 wire [63:0]readdata1;
 wire [63:0]readdata2;
 wire branch, memread, memtoreg, memwrite, alusrc, regwrite;
 wire [1:0] aluop;
 wire [63:0] immdata;
 wire [63:0] mux2out;
 wire [3:0] operation;
 wire [63:0] aluout;
 wire [63:0] datamemoryreaddata;
 wire [63:0] val1;
   wire [63:0] val2;
   wire [63:0] val3;
   wire [63:0] val4;
   
RISC_V_Processor riscv(clk,
reset,
   pc_out,
   adder1_out,
   adder2_out,
   pc_in,
  zero,
  instruction,
  opcode,
  rd,
  funct3,
  rs1,
  rs2,
  funct7,
  writeData,
  readdata1,
  readdata2,
  branch, memread, memtoreg, memwrite, alusrc, regwrite,
  aluop,
   immdata,
   mux2out,
  operation,
   aluout,
   datamemoryreaddata,
   val1,
     val2,
     val3,
     val4);

initial begin
clk = 0; reset = 1'b1;
#5 reset = 0;
end

always
    #1 clk = ~clk;

endmodule