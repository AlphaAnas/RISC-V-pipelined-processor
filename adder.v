`timescale 1ns / 1ps


module Adder
(
input [63:0] a,b,
output reg [63:0] out
);
always @ (a or b)
out=a+b;
endmodule

