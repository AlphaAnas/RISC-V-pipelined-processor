


`timescale 1ns / 1ps


module Data_Memory
(
input [63:0] Mem_Addr,
input [63:0] Write_Data,
input clk, MemWrite, MemRead,
output reg [63:0] Read_Data,
 output [63:0] val1,
  output [63:0] val2,
  output [63:0] val3,
  output [63:0] val4
//  output [63:0] element5,
//  output [63:0] element6,
//  output [63:0] element7,
//  output [63:0] element8
);
reg [7:0] DataMemory [255:0];
integer i;
initial
begin
for (i = 0;i<256;i = i + 1)begin
    DataMemory[i] = 0;
end
      DataMemory[0] = 8'd2;
      DataMemory[8] = 8'd4;
      DataMemory[16] = 8'd1;
      DataMemory[24] = 8'd3;
//      DataMemory[32] = 8'd25;
//      DataMemory[40] = 8'd16;
//      DataMemory[48] = 8'd77;
//      DataMemory[56] = 8'd58;
end

  assign val1 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
  assign val2 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
  assign val3 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
  assign val4 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};
//  assign element5 = {DataMemory[39],DataMemory[38],DataMemory[37],DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]};
//  assign element6 = {DataMemory[47],DataMemory[46],DataMemory[45],DataMemory[44],DataMemory[43],DataMemory[42],DataMemory[41],DataMemory[40]};
//  assign element7 = {DataMemory[55],DataMemory[54],DataMemory[53],DataMemory[52],DataMemory[51],DataMemory[50],DataMemory[49],DataMemory[48]};
//  assign element8 = {DataMemory[63],DataMemory[62],DataMemory[61],DataMemory[60],DataMemory[59],DataMemory[58],DataMemory[57],DataMemory[56]};


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
//DataMemory[Mem_Addr+4] = Write_Data[39:32];
//DataMemory[Mem_Addr+5] = Write_Data[47:40];
//DataMemory[Mem_Addr+6] = Write_Data[55:48];
//DataMemory[Mem_Addr+7] = Write_Data[63:56];
end
end
endmodule





//`timescale 1ns / 1ps



//module Data_Memory
//(
//input [63:0] Mem_Addr,
//input [63:0] Write_Data,
//input clk, MemWrite, MemRead,
//output [63:0] val1,
//output [63:0] val2, 
//output [63:0] val3,
//output [63:0]val4,
//output [63:0]val5,
//output [63:0]val6,
//output [63:0]val7,
//output [63:0]val8,

//output reg [63:0] Read_Data
//);
//reg [7:0] DataMemory [255:0];
//integer i;
//initial
//begin
//for(i =0; i<256; i=i+1)begin
//    DataMemory[i] = 1'b0;  // flush the data memory first
//end
//DataMemory[0] = 8'd4;
//DataMemory[8] = 8'd2;
//DataMemory[16] = 8'd3;
//DataMemory[24] = 8'd1;
//      DataMemory[32] = 8'd25;
//      DataMemory[40] = 8'd16;
//      DataMemory[48] = 8'd77;
//      DataMemory[56] = 8'd58;

//end

//    //return values that will be sorted 
//    // each value (val) is 64 bits and we are assigning 
//  assign val1 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
//  assign val2 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
//  assign val3 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
//  assign val4 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};
// assign val5 = {DataMemory[39],DataMemory[38],DataMemory[37],DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]};
//  assign val6 = {DataMemory[47],DataMemory[46],DataMemory[45],DataMemory[44],DataMemory[43],DataMemory[42],DataMemory[41],DataMemory[40]};
//  assign val7 = {DataMemory[55],DataMemory[54],DataMemory[53],DataMemory[52],DataMemory[51],DataMemory[50],DataMemory[49],DataMemory[48]};
//  assign val8 = {DataMemory[63],DataMemory[62],DataMemory[61],DataMemory[60],DataMemory[59],DataMemory[58],DataMemory[57],DataMemory[56]};


//always @ (*)
//begin
//if (MemRead)
//Read_Data =
//{DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
////{DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
//end
//always @ (posedge clk)
//begin
//if (MemWrite)
//        begin
//        DataMemory[Mem_Addr] =   Write_Data[7:0];
//        DataMemory[Mem_Addr+1] = Write_Data[15:8];
//        DataMemory[Mem_Addr+2] = Write_Data[23:16];
//        DataMemory[Mem_Addr+3] = Write_Data[31:24];
//        DataMemory[Mem_Addr+4] = Write_Data[39:32];
//        DataMemory[Mem_Addr+5] = Write_Data[47:40];
//        DataMemory[Mem_Addr+6] = Write_Data[55:48];
//        DataMemory[Mem_Addr+7] = Write_Data[63:56];
//        end
//end
//endmodule
