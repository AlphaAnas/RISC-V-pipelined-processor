
//`timescale 1ns / 1ps

//module Instruction_Memory
//(
//input [63:0] Inst_Address,
//output reg [31:0] Instruction
//);
//reg [7:0] inst_mem [87:0];
//initial
//begin
//{ inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0] } = 32'h00000913;//1
//      {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]} = 32'h00000433;//2
//      {inst_mem[11], inst_mem[10], inst_mem[9], inst_mem[8]} = 32'h04b40863;//3
//      {inst_mem[15], inst_mem[14], inst_mem[13], inst_mem[12]} = 32'h00800eb3;//4
//      {inst_mem[19], inst_mem[18], inst_mem[17], inst_mem[16]} = 32'h000409b3;//5	
//      {inst_mem[23], inst_mem[22], inst_mem[21], inst_mem[20]} = 32'h013989b3;//6
//      {inst_mem[27], inst_mem[26], inst_mem[25], inst_mem[24]} = 32'h013989b3;//7
//      {inst_mem[31], inst_mem[30], inst_mem[29], inst_mem[28]} = 32'h013989b3;//8
//      {inst_mem[35], inst_mem[34], inst_mem[33], inst_mem[32]} = 32'h02be8663;//9
//      {inst_mem[39], inst_mem[38], inst_mem[37], inst_mem[36]} = 32'h001e8e93;//10	
//      {inst_mem[43], inst_mem[42], inst_mem[41], inst_mem[40]} = 32'h00898993;//11
//      {inst_mem[47], inst_mem[46], inst_mem[45], inst_mem[44]} = 32'h00093d03;//12
//      {inst_mem[51], inst_mem[50], inst_mem[49], inst_mem[48]} = 32'h0009bd83;//13
//      {inst_mem[55], inst_mem[54], inst_mem[53], inst_mem[52]} = 32'h01bd4463;//14
//      {inst_mem[59], inst_mem[58], inst_mem[57], inst_mem[56]} = 32'hfe0004e3;//15
//      {inst_mem[63], inst_mem[62], inst_mem[61], inst_mem[60]} = 32'h01a002b3;//16
//      {inst_mem[67], inst_mem[66], inst_mem[65], inst_mem[64]} = 32'h01b93023;//17
//      {inst_mem[71], inst_mem[70], inst_mem[69], inst_mem[68]} = 32'h0059b023;//18
//      {inst_mem[75], inst_mem[74], inst_mem[73], inst_mem[72]} = 32'hfc000ce3;//19
//      {inst_mem[79], inst_mem[78], inst_mem[77], inst_mem[76]} = 32'h00140413;//20
//      {inst_mem[83], inst_mem[82], inst_mem[81], inst_mem[80]} = 32'h00890913;//21
//      {inst_mem[87], inst_mem[86], inst_mem[85], inst_mem[84]} = 32'hfa000ae3;//22
//end
//always @(Inst_Address)
//begin
//Instruction[7:0] = inst_mem[Inst_Address+0];
//      Instruction[15:8] = inst_mem[Inst_Address+1];
//      Instruction[23:16] = inst_mem[Inst_Address+2];
//      Instruction[31:24] = inst_mem[Inst_Address+3];
//end
//endmodule

`timescale 1ns / 1ps

module Instruction_Memory
(
input [63:0] Inst_Address,
output reg [31:0] Instruction
);
reg [7:0] inst_mem [95:0]; // we will make it bigger as per the memory required
initial
begin
 // li x10, 0x100 #base address
    {inst_mem[3],inst_mem[2],inst_mem[1],inst_mem[0]} = 32'h10000513;//4
    // li x5, 5 #length
    {inst_mem[7],inst_mem[6],inst_mem[5],inst_mem[4]} = 32'h00500293; //8
    // li x22, 0 #i 
    {inst_mem[11],inst_mem[10],inst_mem[9],inst_mem[8]} = 32'h00000b13; //12
    // beq x22, x5, exit
    {inst_mem[15],inst_mem[14],inst_mem[13],inst_mem[12]} = 32'h045b0463; //16
    // li x23, 0 #j
    {inst_mem[19],inst_mem[18],inst_mem[17],inst_mem[16]} = 32'h00000b93; //20
    // addi x17 x17 1
    {inst_mem[23],inst_mem[22],inst_mem[21],inst_mem[20]} = 32'h00188893; //24
    // slli x31 x23 2
    {inst_mem[27],inst_mem[26],inst_mem[25],inst_mem[24]} = 32'h002b9f93; //28
    // add x31 x10 x31
    {inst_mem[31],inst_mem[30],inst_mem[29],inst_mem[28]} = 32'h01f50fb3; //32
    // ld x27 0(x31)
    {inst_mem[35],inst_mem[34],inst_mem[33],inst_mem[32]} = 32'h000fbd83; //36
    // lw x28 4(x31)
    {inst_mem[39],inst_mem[38],inst_mem[37],inst_mem[36]} = 32'h004fae03; //40
    // blt x28 x27 swap(24)
    {inst_mem[43],inst_mem[42],inst_mem[41],inst_mem[40]} = 32'h01be4c63; //44
    // addi x23 x23 1
    {inst_mem[47],inst_mem[46],inst_mem[45],inst_mem[44]} = 32'h001b8b93; //48
    // blt x23 x5 innerloop(-28)
    {inst_mem[51],inst_mem[50],inst_mem[49],inst_mem[48]} = 32'hfe5bc2e3; //52
    // addi x22 x22 1
    {inst_mem[55],inst_mem[54],inst_mem[53],inst_mem[52]} = 32'h001b0b13; //56
    // blt x22, x5, sort
    {inst_mem[59],inst_mem[58],inst_mem[57],inst_mem[56]} = 32'hfd62dae3; //60
    // beq x0, x0, exit(24)
    {inst_mem[63],inst_mem[62],inst_mem[61],inst_mem[60]} = 32'h00000c63; //64
    // lw x8, 0(x31)
    {inst_mem[67],inst_mem[66],inst_mem[65],inst_mem[64]} = 32'h000fa403; //68
    // lw x9,4(x31)
    {inst_mem[71],inst_mem[70],inst_mem[69],inst_mem[68]} = 32'h004fa483; //72
    // sw x8, 4(x31)
    {inst_mem[75],inst_mem[74],inst_mem[73],inst_mem[72]} = 32'h008fa223; //76
    // sw x9, 0(x31)
    {inst_mem[79],inst_mem[78],inst_mem[77],inst_mem[76]} = 32'h009fa023; //80
    // beq x0, x0, sort(-68)
    {inst_mem[83],inst_mem[82],inst_mem[81],inst_mem[80]} = 32'hfa000ee3; //84
end
//extract the data as per the given index
always @(Inst_Address)
begin
Instruction[7:0] = inst_mem[Inst_Address+0];
Instruction[15:8] = inst_mem[Inst_Address+1];
Instruction[23:16] = inst_mem[Inst_Address+2];
Instruction[31:24] = inst_mem[Inst_Address+3];
end
endmodule