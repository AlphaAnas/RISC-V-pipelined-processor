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
    output wire [3:0] Operation,
    output wire [63:0] val1,
    output wire [63:0] val2,
    output wire [63:0] val3,
    output wire [63:0] val4

);

wire [3:0] Funct;
wire branch_out;
//wire PC_Src = branch_out & ZERO;

assign funct = {Instruction[30], Instruction[14:12]};



wire [63:0] IFID_Out;
wire [31:0] IFIDIns_Out;

wire [63:0] IDEX_Out, IDEXReadData1, IDEXReadData2;
wire [4:0] IDEXrs1, IDEXrs2, IDEXrd;
wire [3:0] IDEXfunct3;
wire IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, IDEXALUSrc;
wire [1:0] IDEXALUOp;

wire [1:0] Forwarda, Forwardb;
wire [63:0] Mux_3to1Out1, Mux_3to1Out2;

wire [3:0] idexfunct;

wire [63:0] EXMEMADDOUT;
wire EXMEMZero;
wire [63:0] EXMEMMux_3to1Out2;
wire EXMEMbranch_out;

Program_Counter PC(clk, reset, PC_In, PC_Out);
Instruction_Memory IM(PC_Out, Instruction);
Adder A1(PC_Out, 64'd4, Adder1Out);

IFID ifid(clk, reset, PC_Out, Instruction, IFID_Out, IFIDIns_Out);

InsParser IP(IFIDIns_Out, opcode, rd, funct3, rs1, rs2, funct7);
Control_Unit CU(opcode, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp);
registerFile RF(WriteData, rs1, rs2, MEMWEBrd, MEMWEBRegWrite, clk, reset, ReadData1, ReadData2);

ImmGen IG(IFIDIns_Out, imm_data);

IDEX idex (clk, reset, IFID_Out, ReadData1, ReadData2, imm_data, rs1, rs2, rd, {IFIDIns_Out[30],IFIDIns_Out[14:12]},
    Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc, ALUOp,
    IDEX_Out,IDEXReadData1,IDEXReadData2, IDEXimm_data,
    IDEXrs1, IDEXrs2, IDEXrd,
    IDEXfunct3,
    IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, IDEXALUSrc,
    IDEXALUOp);
    
Adder A2(IDEX_Out, IDEXimm_data*2, Adder2Out);
    
Mux_3to1 mm(IDEXReadData1, WriteData, EXMEMALUResultOut, Forwarda, Mux_3to1Out1);
Mux_3to1 mn(IDEXReadData2, WriteData, EXMEMALUResultOut, Forwardb, Mux_3to1Out2);

Mux M2(Mux_3to1Out2, IDEXimm_data, IDEXALUSrc, Mux2Out);

ALU_64_bit A(Mux_3to1Out1, Mux2Out, Operation, Result, ZERO);
ALU_Control AC(IDEXALUOp, IDEXfunct3, Operation);

EXMEM exmem (clk, reset,  Adder2Out, Result, ZERO, Mux_3to1Out2, IDEXrd, IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, 
  branch_out, EXMEMADDOUT, EXMEMZero, EXMEMALUResultOut, EXMEMMux_3to1Out2, EXMEMRD, EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite, EXMEMbranch_out);

Data_Memory DM(EXMEMALUResultOut, EXMEMMux_3to1Out2, clk, EXMEMMemWrite, EXMEMMemRead, val1, val2, val3, val4, Read_Data);
Mux M1(Adder1Out, EXMEMADDOUT, ( EXMEMbranch_out && EXMEMZero), PC_In); // right pr sb se ooper wala

MEMWEB mw(clk, reset, Read_Data, EXMEMALUResultOut, EXMEMRD, EXMEMMemtoReg, EXMEMRegWrite, 
                           MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBrd, MEMWEBMemtoReg, MEMWEBregwrite);

Mux M3(MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBMemtoReg, WriteData);                           
Forwarding_Unit fu(IDEXrs1, IDEXrs2, EXMEMRD, MEMWEBrd, MEMWEBregwrite, EXMEMRegWrite, Forwarda, Forwardb);
branching_module bu(funct3, IDEXReadData1, Mux2Out, branch_out);
      
endmodule
