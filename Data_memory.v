`timescale 1ns / 1ps



module Data_Memory
(
input [63:0] Mem_Addr,
input [63:0] Write_Data,
input clk, MemWrite, MemRead,
output val1, val2, val3, val4,
output reg [63:0] Read_Data
);
reg [7:0] DataMemory [255:0];
integer i;
initial
begin
for(i =0; i<256; i=i+1)begin
    DataMemory[i] = 1'b0;  // flush the data memory first
end
DataMemory[0] = 8'd3;
DataMemory[8] = 8'd1;
DataMemory[16] = 8'd4;
DataMemory[24] = 8'd2;

end

    
  assign val1 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
  assign val2 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
  assign val3 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
  assign val4 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};


always @ (*)
begin
if (MemRead)
Read_Data =
{DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
end
always @ (posedge clk)
begin
if (MemWrite)
begin
DataMemory[Mem_Addr] = Write_Data[7:0];
DataMemory[Mem_Addr+1] = Write_Data[15:8];
DataMemory[Mem_Addr+2] = Write_Data[23:16];
DataMemory[Mem_Addr+3] = Write_Data[31:24];
DataMemory[Mem_Addr+4] = Write_Data[39:32];
DataMemory[Mem_Addr+5] = Write_Data[47:40];
DataMemory[Mem_Addr+6] = Write_Data[55:48];
DataMemory[Mem_Addr+7] = Write_Data[63:56];
end
end
endmodule
