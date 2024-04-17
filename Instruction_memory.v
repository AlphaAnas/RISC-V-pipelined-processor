`timescale 1ns / 1ps

module Instruction_Memory
(
input [63:0] Inst_Address,
output reg [31:0] Instruction
);
reg [7:0] inst_mem [15:0]; // we will make it bigger as per the memory required
initial
begin
//li x10, 0x100 #base address
{inst_mem[3],inst_mem[2],inst_mem[1],inst_mem[0]} =   32'h10000513;//1
//li x5, 5 #length
{inst_mem[7],inst_mem[6],inst_mem[5],inst_mem[4]} =   32'h00500293;
//li x22, 0 #i
{inst_mem[11],inst_mem[10],inst_mem[9],inst_mem[8]} = 32'h00000b13;

//jal x1, sort(8)
{inst_mem[19],inst_mem[18],inst_mem[17],inst_mem[16]} = 32'h008000ef;

//j exit
{inst_mem[23],inst_mem[22],inst_mem[21],inst_mem[20]} = 32'h04c0006f;

//beq x22 x5 exit(72)
{inst_mem[27],inst_mem[26],inst_mem[25],inst_mem[24]} = 32'h045b0463;

//li x23, 0 #j
{inst_mem[15],inst_mem[14],inst_mem[13],inst_mem[12]} = 32'h00000b93;






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
