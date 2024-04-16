`timescale 1ns / 1ps



module ALU_64_bit
(
input [63:0]a, b,
input [3:0] ALUOp,
output reg [63:0] Result,
output ZERO
);
localparam [3:0]
AND = 4'b0000,
OR = 4'b0001,
ADD = 4'b0010,
Sub = 4'b0110,
NOR = 4'b1100;
assign ZERO = (Result == 0);
always @ (ALUOp, a, b)
begin
case (ALUOp)
AND: Result = a & b;
OR: Result = a | b;
ADD: Result = a + b;
Sub: Result = a - b;
NOR: Result = ~(a | b);
default: Result = 0;
endcase
end
endmodule
