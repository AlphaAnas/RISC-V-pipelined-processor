`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 04:41:29 PM
// Design Name: 
// Module Name: IDEX
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


module IDEX(
    input clk,
    input reset,
    input [63:0] IFID_Out, 
    input [63:0] ReadData1,
    input [63:0] ReadData2, 
    input [63:0] imm_data, 
    input  [4:0] rs1, rs2, rd,
    input  [3:0] funct3,
    input  Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc,
    input  [1:0] ALUOp,
    
    output reg [63:0] IDEX_Out,IDEXReadData1,IDEXReadData2, IDEXimm_data,
    output reg [4:0] IDEXrs1, IDEXrs2, IDEXrd,
    output reg [3:0] IDEXfunct3,
    output reg IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, IDEXALUSrc,
    output reg [1:0] IDEXALUOp

    );
    
always @(posedge clk) begin
    if (reset == 1'b1)begin
        IDEX_Out = 0;
        IDEXReadData1 = 0;
        IDEXReadData2 = 0;
        IDEXimm_data = 0;
        IDEXrs1 = 0;
        IDEXrs2 = 0;
        IDEXrd = 0;
        IDEXfunct3 = 0;
        IDEXMemRead = 0;
        IDEXMemtoReg = 0;
        IDEXMemWrite = 0; 
        IDEXRegWrite = 0; 
        IDEXALUSrc = 0;
        IDEXALUOp = 0;
        end
    else begin
        IDEX_Out = IFID_Out;
        IDEXReadData1 = ReadData1;
        IDEXReadData2 = ReadData2;
        IDEXimm_data = imm_data;
        IDEXrs1 = rs1;
        IDEXrs2 = rs2;
        IDEXrd = rd;
        IDEXfunct3 = funct3;
        IDEXMemRead = MemRead;
        IDEXMemtoReg = MemtoReg;
        IDEXMemWrite = MemWrite; 
        IDEXRegWrite = RegWrite; 
        IDEXALUSrc = ALUSrc;
        IDEXALUOp = ALUOp;
        end
        
    end
endmodule
