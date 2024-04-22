`timescale 1ns / 1ps

module immgen
(
input [31:0] ins,
output reg [63:0] imm_data
);
reg [11:0] ld_imm;
reg [11:0] sd_imm;
reg [11:0] br_imm;
wire [1:0] sel;
assign sel = ins [6:5];
localparam [1:0]
ld_ins = 2'b00,
sd_ins = 2'b01,
br_ins = 2'b11;
always @ (ins)
begin
    case (sel)
    ld_ins:
    begin
        ld_imm = ins [31:20];
        imm_data = {{52{ins[31]}}, ld_imm};
    end
    sd_ins:
        begin
        sd_imm = {ins [31:25], ins[11:7]};
        imm_data = {{52{ins[31]}}, sd_imm};
    end
        br_ins:
    begin
        br_imm = {ins [31], ins [7], ins [30:25], ins [11:8]};
        imm_data = {{52{ins[31]}}, br_imm};
    end
    default: imm_data = 64'h0000000000000000;
endcase
end
endmodule
