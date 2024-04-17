`timescale 1ns / 1ps

// hellooooooooooooooooooooooooooooooooo

module RISC_V_Processor(
    input clk,
    input reset,
    output wire [63:0] PC_Out,
    output wire [63:0] PC_In,
    output wire [31:0] Instruction,
    output wire [4:0] rs1,
    output wire [4:0] rs2,
    output wire [4:0] rd,
    output wire [63:0] WriteData,
    output wire [63:0] ReadData1,
    output wire [63:0] ReadData2,
    output wire [63:0] imm_data,
    output wire [63:0] Mux2Out,
    output wire [63:0] Result,
    output wire ZERO,
    output wire [63:0] Read_Data,
    output wire [63:0] Adder1Out,
    output wire [6:0] opcode,
    output wire [2:0] funct3,
    output wire [6:0] funct7,
    output wire Branch,
    output wire MemRead,
    output wire MemtoReg,
    output wire MemWrite,
    output wire ALUSrc,
    output wire RegWrite,
    output wire [1:0] ALUOp,
    output wire [63:0] Adder2Out,
    output wire [3:0] Operation

);

wire [3:0] Funct;
wire [63:0] b = imm_data << 2; // doing shift left by 1 bit
wire PC_Src = Branch & ZERO;

Adder A1(PC_Out, 64'd4, Adder1Out);
Mux M1(Adder1Out, Adder2Out, PC_Src, PC_In);
Program_Counter PC(clk, reset, PC_In, PC_Out);
Instruction_Memory IM(PC_Out, Instruction);
InsParser IP(Instruction, opcode, rd, funct3, rs1, rs2, funct7);
Control_Unit CU(opcode, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp);
registerFile RF(WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1, ReadData2);
ImmGen IG(Instruction, imm_data);
Mux M2(ReadData2, imm_data, ALUSrc, Mux2Out);

assign funct = {Instruction[30], Instruction[14:12]};
ALU_Control AC(ALUOp, funct, Operation);
Adder A2(PC_Out, b, Adder2Out);
ALU_64_bit A(ReadData1, Mux2Out, Operation, Result, ZERO);
Data_Memory DM(Result, ReadData2, clk, MemWrite, MemRead, Read_Data);
Mux M3(Read_Data, Result, MemtoReg, WriteData);

endmodule
