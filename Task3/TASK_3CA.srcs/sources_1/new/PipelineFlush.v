`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 09:14:30 AM
// Design Name: 
// Module Name: PipelineFlush
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


module PipelineFlush
  (
    input branch,
    output reg flush
  );
  
  initial
    begin
      flush = 1'b0;
    end
  
  always @(*)
    begin
      if (branch == 1'b1)
        flush = 1'b1;
      else
        flush = 1'b0;
    end
  
endmodule