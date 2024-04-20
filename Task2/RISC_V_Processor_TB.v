`timescale 1ns / 1ps

module RISC_V_Processor_TB();
   
    reg clk;
    reg reset;
    wire [63:0] PC_Out;
    wire [63:0] PC_In;
    wire [31:0] Instruction;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [63:0] WriteData;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [63:0] imm_data;
    wire [63:0] Mux2Out;
    wire [63:0] Result;
    wire ZERO;
    wire [63:0] Read_Data;
    wire [63:0] Adder1Out;
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [1:0] ALUOp;
    wire [63:0] Adder2Out;
    wire [3:0] Operation;
    wire [63:0] val1;
    wire [63:0] val2;
    wire [63:0] val3;
    wire [63:0] val4;
   
    // Instantiate RISC_V_Processor module
    RISC_V_Processor P(
        .clk(clk),
        .reset(reset),
        .PC_Out(PC_Out),
        .PC_In(PC_In),
        .Instruction(Instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .imm_data(imm_data),
        .Mux2Out(Mux2Out),
        .Result(Result),
        .ZERO(ZERO),
        .Read_Data(Read_Data),
        .Adder1Out(Adder1Out),
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp),
        .Adder2Out(Adder2Out),
        .Operation(Operation),
        .val1(val1),
        .val2(val2),
        .val3(val3),
        .val4(val4)
    );

initial begin
clk = 0; reset = 1'b0;
#5 reset = 1;
#5 reset = 0;
//#5 reset = 0;
end

always
    #5 clk = ~clk;
    
endmodule
