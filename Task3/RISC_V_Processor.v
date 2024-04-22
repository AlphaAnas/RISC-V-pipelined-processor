`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 04:28:36 AM
// Design Name: 
// Module Name: RISC_V_Processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

// hellooooooooooooooooooooooooooooooooo

module RISC_V_Processor(
    input clk,
    input reset,
    input wire [63:0] val1,
    input wire [63:0] val2,
    input wire [63:0] val3,
    input wire [63:0] val4,
    input flush, stall
//    output wire [63:0] PC_Out,
//    output wire [63:0] PC_In,
//    output wire [31:0] Instruction,
//    output wire [4:0] rs1,
//    output wire [4:0] rs2,
//    output wire [4:0] rd,
//    output wire [63:0] WriteData,
//    output wire [63:0] ReadData1,
//    output wire [63:0] ReadData2,
//    output wire [63:0] imm_data,
//    output wire [63:0] Mux2Out,
//    output wire [63:0] Result,
//    output wire ZERO,
//    output wire [63:0] Read_Data,
//    output wire [63:0] Adder1Out,
//    output wire [6:0] opcode,
//    output wire [2:0] funct3,
//    output wire [6:0] funct7,
//    output wire Branch,
//    output wire MemRead,
//    output wire MemtoReg,
//    output wire MemWrite,
//    output wire ALUSrc,
//    output wire RegWrite,
//    output wire [1:0] ALUOp,
//    output wire [63:0] Adder2Out,
//    output wire [3:0] Operation
//    output wire [63:0] val1,
//    output wire [63:0] val2,
//    output wire [63:0] val3,
//    output wire [63:0] val4,
    

);


//Control Unit
wire branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;

//Register File
wire MEMWEBRegWrite_Out;
wire [63:0] ReadData1;
wire [63:0] ReadData2;
wire [63:0] R8;
wire [63:0] R19;
wire [63:0] R20;
wire [63:0] R21;
wire [63:0] R22;
wire [63:0] WriteData;


//Program Control
wire [63:0] PC_In, PC_Out;


//Adder
wire [63:0] AdderOut1, AdderOu2;

//Instruction Memory
wire [31:0] Instruction, IFIDIns_Out;

//Instruction Parser
wire [6:0] Opcode;
wire [4:0] RS1, RS2, RD;
wire [2:0] funct3;
wire[6:0] funct7;


//ImmGen
wire  [63:0] imm_data;


//IFID
wire [63:0] random;

//IDEX
  wire [63:0] IFID_Out;
  wire [4:0] RS1;
  wire [4:0] RS2;
  wire [4:0] RD;
  wire Readdata1, Readdata2, immm_data;
  wire Branch, MemRead, MemToReg, MemWrite, RegWrite, Alusrc;
  wire [1:0] ALUOp;
  wire [3:0] Func3;
  
  
  //MUX
  wire [63:0] Mux_3to1Out1, Mux_3to1Out2, EXMEMALUResultOut;
  
  //EXMEM
  wire [63:0] EXMEMALUResultOut, EXMEMADDOUT, EXMEMALUResultOut;
  wire EXMEMZero;
  wire EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite;
  
  
  //ALU_64_BIT
  wire [63:0] Result;
  wire ZERO;
  
  
 //ALU_Control;
 wire [3:0] Operation;
 
 //Data Memory
 wire [63:0] ReadData;
 
 //MEMWEB
 wire [63:0] muxin1, muxin2;
 wire MEMWEBMemtoReg, MEMWEBregwrite;
 wire [4:0] MEMWEBrd;
 
 //Forwarding Unit
 wire [1:0] Forwarda, Forwardb;
 
 //Branching Unit
 wire addermuxselect, branch_out;
 
  
  PipelineFlush pf(.branch(branch_final & BRANCH),
    .flush(flush));
    
  
   HazardDetUnit hu
  (
    .Memread(Memread),
    .inst(inst_ifid_out),
    .Rd(RD),
    .stall(stall)
  );
  
  Program_Counter PC(clk, reset, stall, PC_In, PC_Out);
  Instruction_Memory IM(PC_Out, Instruction);
  Adder A1(PC_Out, 64'd4, Adder1Out);

  IFID ifid(clk, reset, PC_Out, flush, Instruction, IFID_Out, IFIDIns_Out);

  InsParser IP(IFIDIns_Out, opcode, rd, funct3, rs1, rs2, funct7);
  Control_Unit CU(opcode, stall, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp);

  ImmGen IG(IFIDIns_Out, imm_data);
  registerFile RF(WriteData, rs1, rs2, MEMWEBrd, MEMWEBRegWrite, clk, reset, ReadData1, ReadData2,R8, R19, R20,
R21,
 R22);

  IDEX idex (clk, reset, flush, IFID_Out, ReadData1, ReadData2, imm_data, rs1, rs2, rd, {IFIDIns_Out[30],IFIDIns_Out[14:12]},
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
  branch_out,flush, EXMEMADDOUT, EXMEMZero, EXMEMALUResultOut, EXMEMMux_3to1Out2, EXMEMRD, EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite, EXMEMbranch_out);

Data_Memory DM(EXMEMALUResultOut, EXMEMMux_3to1Out2, clk, EXMEMMemWrite, EXMEMMemRead, val1, val2, val3, val4, Read_Data);
Mux M1(Adder1Out, EXMEMADDOUT, ( EXMEMbranch_out && EXMEMZero), PC_In); // right pr sb se ooper wala
MEMWEB mw(clk, reset, Read_Data, EXMEMALUResultOut, EXMEMRD, EXMEMMemtoReg, EXMEMRegWrite, 
                           MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBrd, MEMWEBMemtoReg, MEMWEBregwrite);

Mux M3(MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBMemtoReg, WriteData);                           
Forwarding_Unit fu(IDEXrs1, IDEXrs2, EXMEMRD, MEMWEBrd, MEMWEBregwrite, EXMEMRegWrite, Forwarda, Forwardb);
branching_module bu(funct3, IDEXReadData1, Mux2Out, branch_out);





































//wire [3:0] Funct;
//wire branch_out;
////wire PC_Src = branch_out & ZERO;

assign funct = {Instruction[30], Instruction[14:12]};

//wire [63:0] IFID_Out;
//wire [31:0] IFIDIns_Out;

//wire [63:0] IDEX_Out, IDEXReadData1, IDEXReadData2, IDEXimm_data;
//wire [4:0] IDEXrs1, IDEXrs2, IDEXrd;
//wire [3:0] IDEXfunct3;
//wire IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, IDEXALUSrc;
//wire [1:0] IDEXALUOp;

//wire [1:0] Forwarda, Forwardb;
//wire [63:0] Mux_3to1Out1, Mux_3to1Out2;

//wire [3:0] idexfunct;

//wire [63:0] EXMEMADDOUT;
//wire EXMEMZero;
//wire [63:0] EXMEMALUResultOut;
//wire [63:0] EXMEMMux_3to1Out2;
//wire EXMEMbranch_out;
//wire [4:0]  EXMEMRD;
//wire EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite;

//wire [63:0] MEMWEBRead_DataOut, MEMWEBALUOut;
//wire [4:0] MEMWEBrd; 
//wire MEMWEBMemtoReg, MEMWEBregwrite;







      
endmodule
