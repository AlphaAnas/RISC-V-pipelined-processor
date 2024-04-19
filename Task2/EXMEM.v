module EXMEM(
  input clk,reset,
  input [63:0] Adder2Out, //adder output
  input [63:0] Result,//64bit alu output
  input Zero,//64bit alu output
  input [63:0] Mux_3to1Out2, //3 bit mux2by1 output 2
  input [4:0] IDEXrd, //IDEX output
  input  IDEXBranch, IDEXMemRead, IDEXMemtoReg, IDEXMemWrite, IDEXRegWrite, //IDEX outputs 
  input branch_out, // branching unit out
  output reg [63:0] EXMEMADDOUT,
  output reg EXMEMZero,
  output reg [63:0] EXMEMALUResultOut,
  output reg [63:0] EXMEMMux_3to1Out2,
  output reg [4:0] EXMEMRD,
  output reg EXMEMBranch, EXMEMMemRead, EXMEMMemtoReg, EXMEMMemWrite, EXMEMRegWrite,
  output reg EXMEMbranch_out
);


 always @(posedge clk)
    begin
      if (reset == 1'b1)
        begin
          EXMEMADDOUT = 64'b0;
          EXMEMZero = 1'b0;
          EXMEMALUResultOut = 64'b0;
          EXMEMMux_3to1Out2 = 64'b0;
          EXMEMRD = 5'b0;
          EXMEMBranch = 1'b0;
          EXMEMMemRead = 1'b0;
          EXMEMMemtoReg =1'b0;
          EXMEMMemWrite = 1'b0;
          EXMEMRegWrite = 1'b0;
          EXMEMbranch_out = 1'b0;
        end
      else
        begin
        
          EXMEMADDOUT = Adder2Out;
          EXMEMZero = Zero;
          EXMEMALUResultOut = Result;
          EXMEMMux_3to1Out2 = Mux_3to1Out2;
          EXMEMRD = IDEXrd;
          EXMEMBranch = IDEXBranch;
          EXMEMMemRead = IDEXMemRead;
          EXMEMMemtoReg = IDEXMemtoReg;
          EXMEMMemWrite = IDEXMemWrite;
          EXMEMRegWrite = IDEXRegWrite;
          EXMEMbranch_out = EXMEMbranch_out;
        end
    end   
endmodule