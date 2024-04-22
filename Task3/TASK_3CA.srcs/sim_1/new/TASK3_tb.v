`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 09:41:31 AM
// Design Name: 
// Module Name: TASK3_tb
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


module TASK3_tb();
  reg clk, reset;
  wire [63:0] val1;
  wire [63:0] val2;
  wire [63:0] val3;
  wire [63:0] val4;
 
  wire flush;
  wire stall;
  
  RISC_V_Processor r1
  (
    .clk(clk),
    .reset(reset),
    .val1(val1),
    .val2(val2),
    .val3(val3),
    .val4(val4),
    
    .flush(flush),
    .stall(stall)
  );
  
  initial 
    begin
		
      clk = 1'b0;
      reset = 1'b1;
      
      #7 
      reset = 1'b0;

      
    end
  
  always
    begin
      #5
      clk = ~clk;
    end
endmodule

