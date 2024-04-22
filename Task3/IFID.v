`timescale 1ns / 1ps

module IFID(
input clk,
input reset,flush, stall,
input [63:0] PC_Out,
input [31:0] Instruction,
output reg [63:0] IFID_Out,
output reg [31:0] IFIDIns_Out);

always @(posedge clk) begin
    if (reset == 1'b1 || flush == 1'b1) begin
        IFID_Out = 0;
        IFIDIns_Out = 0;
        end
    else if(stall == 1'b0)
        begin
            IFID_Out = PC_Out;
            IFIDIns_Out = Instruction;
        end
end

endmodule
