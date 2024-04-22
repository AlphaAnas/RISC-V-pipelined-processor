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


////Control Unit
//wire branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
//wire [1:0] ALUOp;

////Register File
//wire MEMWEBRegWrite;//MEMWEBRegWrite_Out;
//wire [63:0] ReadData1;
//wire [63:0] ReadData2;
//wire [63:0] R8;
//wire [63:0] R19;
//wire [63:0] R20;
//wire [63:0] R21;
//wire [63:0] R22;
//wire [63:0] WriteData;


////Program Control
//wire [63:0] PC_In, PC_Out;


////Adder
//wire [63:0] Adder1Out, Adder2Out;

////Instruction Memory
//wire [31:0] Instruction, PC_Out, IFIDIns_Out;

////Instruction Parser
//wire [6:0] opcode;
//wire [4:0] rs1, rs2, rd;
//wire [2:0] funct3;
//wire[6:0] funct7;


////ImmGen
//wire  [63:0] imm_data;


////IFID
//wire [63:0] random;

////IDEX
//  wire [63:0] IFID_Out;
//  wire [4:0] RS1;
//  wire [4:0] RS2;
//  wire [4:0] RD;
//  wire Readdata1, Readdata2, immm_data;
//  wire Branch, MemRead, MemToReg, MemWrite, RegWrite, Alusrc;
//  wire [1:0] ALUOp;
//  wire [3:0] Func3;
  
  
//  //MUX
//  wire [63:0] Mux_3to1Out1, Mux_3to1Out2, EXMEMALUResultOut;
  
//  //EXMEM
//  wire [63:0] EXMEMALUResultOut, EXMEMADDOUT, EXMEMALUResultOut;
//  wire EXMEMZero;
//  wire EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite;
  
  
//  //ALU_64_BIT
//  wire [63:0] Result;
//  wire ZERO;
  
  
// //ALU_Control;
// wire [3:0] Operation;
 
// //Data Memory
// wire [63:0] ReadData;
 
// //MEMWEB
// wire [63:0] muxin1, muxin2;
// wire MEMWEBMemtoReg, MEMWEBregwrite;
// wire [4:0] MEMWEBrd;
 
// //Forwarding Unit
// wire [1:0] Forwarda, Forwardb;
 
// //Branching Unit
// wire addermuxselect, branch_out;
 
  
//  PipelineFlush pf(.branch(branch_final & BRANCH),
//    .flush(flush));
    
  
//   HazardDetUnit hu
//  (
//    .Memread(Memread),
//    .inst(inst_ifid_out),
//    .Rd(RD),
//    .stall(stall)
//  );
  
//  Program_Counter PC(clk, reset, stall, PC_In, PC_Out);
//  Instruction_Memory IM(PC_Out, Instruction);
//  Adder A1(PC_Out, 64'd4, Adder1Out);

//  IFID ifid(clk, reset, flush, stall, PC_Out, Instruction, IFID_Out, IFIDIns_Out);

//  InsParser IP(IFIDIns_Out, opcode, rd, funct3, rs1, rs2, funct7);
//  Control_Unit CU(opcode, stall, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp);

//  ImmGen IG(IFIDIns_Out, imm_data);
//  registerFile RF(WriteData, rs1, rs2, MEMWEBrd, MEMWEBRegWrite, clk, reset, ReadData1, ReadData2,R8, R19, R20,
//R21,
// R22);

//  IDEX idex (clk, reset, flush, IFID_Out, ReadData1, ReadData2, imm_data, rs1, rs2, rd, {IFIDIns_Out[30],IFIDIns_Out[14:12]},
//    Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc, ALUOp,
//    IDEX_Out,IDEXReadData1,IDEXReadData2, IDEXimm_data,
//    IDEXrs1, IDEXrs2, IDEXrd,
//    IDEXfunct3,
//    IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, IDEXALUSrc,
//    IDEXALUOp);
    
//Adder A2(IDEX_Out, IDEXimm_data*2, Adder2Out);
    
//Mux_3to1 mm(IDEXReadData1, WriteData, EXMEMALUResultOut, Forwarda, Mux_3to1Out1);
//Mux_3to1 mn(IDEXReadData2, WriteData, EXMEMALUResultOut, Forwardb, Mux_3to1Out2);

//Mux M2(Mux_3to1Out2, IDEXimm_data, IDEXALUSrc, Mux2Out);

//ALU_64_bit A(Mux_3to1Out1, Mux2Out, Operation, Result, ZERO);
//ALU_Control AC(IDEXALUOp, IDEXfunct3, Operation);

//EXMEM exmem (clk, reset, flush, Adder2Out, Result, ZERO, Mux_3to1Out2, IDEXrd, IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, 
//  branch_out, EXMEMADDOUT, EXMEMZero, EXMEMALUResultOut, EXMEMMux_3to1Out2, EXMEMRD, EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite, EXMEMbranch_out);

//Data_Memory DM(EXMEMALUResultOut, EXMEMMux_3to1Out2, clk, EXMEMMemWrite, EXMEMMemRead, val1, val2, val3, val4, Read_Data);
//Mux M1(Adder1Out, EXMEMADDOUT, ( EXMEMbranch_out && EXMEMZero), PC_In); // right pr sb se ooper wala
//MEMWEB mw(clk, reset, Read_Data, EXMEMALUResultOut, EXMEMRD, EXMEMMemtoReg, EXMEMRegWrite, 
//                           MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBrd, MEMWEBMemtoReg, MEMWEBregwrite);

//Mux M3(MEMWEBRead_DataOut, MEMWEBALUOut, MEMWEBMemtoReg, WriteData);                           
//Forwarding_Unit fu(IDEXrs1, IDEXrs2, EXMEMRD, MEMWEBrd, MEMWEBregwrite, EXMEMRegWrite, Forwarda, Forwardb);
//branching_module bu(funct3, IDEXReadData1, Mux2Out, branch_out);





































////wire [3:0] Funct;
////wire branch_out;
//////wire PC_Src = branch_out & ZERO;

//assign funct = {Instruction[30], Instruction[14:12]};

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







      wire branch;
  wire memread;
  wire memtoreg;
  wire memwrite;
  wire ALUsrc;
  wire regwrite;
  wire [1:0] ALUop;
  
  //regfile
  wire regwrite_memwb_out;
  wire [63:0] readdata1, readdata2;
  wire [63:0] r8, r19, r20, r21, r22;
  wire [63:0] write_data;
  
   //PC wires
  wire [63:0] pc_in;
  wire [63:0] pc_out;
  
  // adders
  wire [63:0] adderout1;
  wire [63:0] adderout2;
  
  // inst mem wire
  wire [31:0] instruction;
  wire[31:0] inst_ifid_out;
  
  //Parser
  wire [6:0] opcode;
  wire [4:0] rd, rs1, rs2;
  wire [2:0] funct3;
  wire [6:0] funct7;
  
  
  // Immediate Data Extractor
  wire [63:0] imm_data;
  
  //ifid wires
 
  wire [63:0] random;
  
  //id ex wires
 
  wire [63:0] a1;
  wire [4:0] RS1;
  wire [4:0] RS2;
  wire [4:0] RD;
  wire [63:0] d, M1, M2;
  wire Branch;
  wire Memread;
  wire Memtoreg;
  wire Memwrite;
  wire Regwrite;
  wire Alusrc;
  wire [1:0] aluop;
  wire [3:0] funct4_out;
  
  //mux wires
  wire [63:0] threeby1_out1;
  wire[63:0] threeby1_out2;
  wire[63:0]  alu_64_b;
  
   //ex mem wires
  wire [63:0] write_Data;
  wire [63:0] exmem_out_adder;
  wire exmem_out_zero;
  wire [63:0] exmem_out_result;
  wire [4:0] exmemrd;
  wire BRANCH,MEMREAD,MEMTOREG,MEMEWRITE,REGWRITE;   
  
   // ALU 64
  wire [63:0] AluResult;
  wire zero;
  
  
  // ALU Control
  wire [3:0] operation;
  
  // Data Memory
  wire [63:0] readdata;
 
  
  
  
  //memwb wires
  wire[63:0] muxin1,muxin2;
  wire [4:0] memwbrd;
  wire memwb_memtoreg;
  wire memwb_regwrite;
  
  //forwarding unit wires
  wire [1:0] forwardA;
  wire [1:0] forwardB;
  
  // Branch
  wire addermuxselect;
  wire branch_final;
  
  
  pipeline_flush p_flush
  (
    (branch_final & BRANCH),
    flush
  );
  
  
  hazard_detection_unit hu
  (
    Memread,
    inst_ifid_out,
    R,
    stall
  );

  
  program_counter pc 
  (
    pc_in,
    stall,
    clk,
    reset,
    pc_out
  );
  
  instruction_memory im
  (
    pc_out,
    instruction
  );
  
  
  adder adder1
  (
    pc_out,
    64'd4,
    adderout1
  );
  
   IFID i1 
  (
    clk,
    reset,
    stall,
    instruction,
    pc_out,
    inst_ifid_out,
    random,
    flush
  );
  
  Parser ip
  (
    inst_ifid_out,
    opcode,
    rd,
    funct3,
    rs1,
    rs2,
    funct7
  );
  
  CU cu
  (
    opcode,
    branch,
    memread,
    memtoreg,
    memwrite,
    ALUsrc,
    regwrite,
    ALUop,
    stall
  );
  
  data_extractor immextr
  (
    inst_ifid_out,
   imm_data
  );
  
  
  registerFile regfile 
  (
    (clk),
    (reset),
    (rs1),
    (rs2),
    (memwbrd),
    (write_data),
    (memwb_regwrite),
    (readdata1),
    (readdata2),
    (r8),
    (r19),
    (r20),
    (r21),
    (r22)
  );
  
  IDEX i2
  (
    (clk),
    (flush),
    (reset),
    ({inst_ifid_out[30],inst_ifid_out[14:12]}),
    (random),
    (readdata1),
    (readdata2),
    (imm_data),
    (rs1),(rs2),(rd),
    (branch),(memread),(memtoreg),
    (memwrite),(ALUsrc),(regwrite),(ALUop),
    (a1),(RS1),(RS2),(RD),(d),(M1),(M2),
    (funct4_out),(Branch),(Memread),(Memtoreg),
    (Memwrite),(Regwrite),(Alusrc),(aluop)
  );
  adder adder2
  (
    (a1),
    (d << 1),
    (adderout2)
  );
  
  
  ThreebyOneMux m1
  (
    (M1),(write_data),(exmem_out_result),(forwardA),(threeby1_out1)
  );
  
  ThreebyOneMux m2
  (
    (M2),(write_data),(exmem_out_result),(forwardB),(threeby1_out2)
  );
  
  twox1Mux mux1
  (
    (threeby1_out2),(d),(Alusrc),(alu_64_b)
  );
  
  Alu64 alu
  (
    (threeby1_out1),
    (alu_64_b),
    (operation),
    (AluResult),
    (zero)
  );
  
   alu_control ac
  (
    (aluop),
    (funct4_out),
    (operation)
  );
  
 
  
  EXMEM i3
  (
    (clk),(reset),(adderout2),(AluResult),(zero),(flush),
    (threeby1_out2),(RD), (addermuxselect),
    (Branch),(Memread),(Memtoreg),(Memwrite),(Regwrite),
    ( exmem_out_adder),(exmem_out_zero),(exmem_out_result),(write_Data),
    (exmemrd),(BRANCH),(MEMREAD),(MEMTOREG),(MEMEWRITE),(REGWRITE), (branch_final)
  );
    
  data_memory datamem
  (
    (write_Data),
    (exmem_out_result),
    (MEMEWRITE),
    (clk),
    (MEMREAD),
    (readdata),
    (element1),
    (element2),
    (element3),
    (element4)
  );
  
  
  twox1Mux mux2
  (
    (adderout1),(exmem_out_adder),(BRANCH & branch_final),.Y(pc_in) // ??
  );

 
  MEMWB i4
  
  (
    .clk(clk),.reset(reset),.read_data_in(readdata),
    .result_alu_in(exmem_out_result),.Rd_in(exmemrd),.memtoreg_in(MEMTOREG),.regwrite_in(REGWRITE),
    .readdata(muxin1),.result_alu_out(muxin2),.rd(memwbrd),.Memtoreg(memwb_memtoreg),.Regwrite(memwb_regwrite)
  );
  
   twox1Mux mux3
  (
    .A(muxin2),.B(muxin1),.SEL(memwb_memtoreg),.Y(write_data)
  );
  
  
   ForwardingUnit f1
  (
    .RS_1(RS1),.RS_2(RS2),.rdMem(exmemrd),
    .rdWb(memwbrd),.regWrite_Wb(memwb_regwrite),
    .regWrite_Mem(REGWRITE),
    .Forward_A(forwardA),.Forward_B(forwardB)
  );
  
  
  branching_unit branc
  (
    .funct3(funct4_out[2:0]),.readData1(M1),.b(alu_64_b),.addermuxselect(addermuxselect)
  );
endmodule
