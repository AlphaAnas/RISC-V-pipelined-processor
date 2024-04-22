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
 wire [63:0] element1;
   wire [63:0] element2;
   wire [63:0] element3;
   wire [63:0] element4;
   wire [63:0] element5;
   wire [63:0] element6;
   wire [63:0] element7;
   wire [63:0] element8;
   
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
   element1,
     element2,
     element3,
     element4,
     element5,
     element6,
     element7,
     element8);

initial begin
clk = 0; reset = 1'b1;
#5 reset = 0;
end

always
    #1 clk = ~clk;

endmodule




//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 04/16/2024 05:16:08 PM
//// Design Name: 
//// Module Name: RISC_V_Processor_TB
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//// this is a change
//module RISC_V_Processor_TB();

//    reg clk;
//    reg reset;
    
//    wire [63:0] PC_Out;        // Instr Addr
//    wire [63:0] PC_In;
//    wire [31:0] Instruction;
//    wire [4:0] rs1;
//    wire [4:0] rs2;
//    wire [4:0] rd;
//    wire [63:0] WriteData;
//    wire [63:0] ReadData1;
//    wire [63:0] ReadData2;
//    wire [63:0] imm_data;
//    wire [63:0] Mux2Out;
//    wire [63:0] Result;        // Mem Addr
//    wire ZERO;
//    wire [63:0] dataMemory_Read_Data;
//    wire [63:0] Adder1Out;
//    wire [6:0] opcode;
//    wire [2:0] funct3;
//    wire [6:0] funct7;
//    wire Branch;
//    wire MemRead;
//    wire MemtoReg;
//    wire MemWrite;
//    wire ALUSrc;
//    wire RegWrite;
//    wire [1:0] ALUOp;
//    wire [63:0] Adder2Out;
//    wire [3:0] Operation;
//     wire [63:0] val1;
//     wire [63:0] val2;
//     wire [63:0] val3;
//     wire [63:0] val4;
//      wire [63:0] val5;
//       wire [63:0] val6;
//        wire [63:0] val7; 
//        wire [63:0] val8;
        
        
    

//    // Instantiate RISC_V_Processor module
//    RISC_V_Processor P(
//        .clk(clk),
//        .reset(reset),
//        .PC_Out(PC_Out),
//        .PC_In(PC_In),
//        .Instruction(Instruction),
//        .rs1(rs1),
//        .rs2(rs2),
//        .rd(rd),
//        .WriteData(WriteData),
//        .ReadData1(ReadData1),
//        .ReadData2(ReadData2),
//        .imm_data(imm_data),
//        .Mux2Out(Mux2Out),
//        .Result(Result),
//        .ZERO(ZERO),
//        .dataMemory_Read_Data(dataMemory_Read_Data),
//        .Adder1Out(Adder1Out),
//        .opcode(opcode),
//        .funct3(funct3),
//        .funct7(funct7),
//        .Branch(Branch),
//        .MemRead(MemRead),
//        .MemtoReg(MemtoReg),
//        .MemWrite(MemWrite),
//        .ALUSrc(ALUSrc),
//        .RegWrite(RegWrite),
//        .ALUOp(ALUOp),
//        .Adder2Out(Adder2Out),
//        .Operation(Operation),
//        .val1(val1),
//        .val2(val2),
//        .val3(val3),
//        .val4(val4),
//        .val5(val5),
//        .val6(val6),
//        .val7(val7),
//        .val8(val8)
        
//    );
    
//    initial begin
//    clk = 0; reset = 1'b1;
//    #10 reset = 0;
//    end
    
//    always
//        #1 clk = ~clk;
    
//    endmodule
