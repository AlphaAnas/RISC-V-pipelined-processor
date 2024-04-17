`timescale 1ns / 1ps



module Data_Memory
(
input [63:0] Mem_Addr,
input [63:0] Write_Data,
input clk, MemWrite, MemRead,
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
