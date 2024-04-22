

`timescale 1ns / 1ps

module branch_module
  (
   input [2:0] funct3,
    input [63:0] readData1,
    input [63:0] readData2,
   output reg addermuxselect
  );
  
  initial
    begin
      addermuxselect = 1'b0;
    end
  
  always @(*)
	begin
      case (funct3)   // beq
        3'b000:
          begin
            if (readData1 == readData2)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
         3'b100:  //blt
    		begin
              if (readData1 < readData2)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
        3'b101:   //bgt
          begin
            if (readData1 > readData2)
          	addermuxselect = 1'b1;
           else
              addermuxselect = 1'b0;
          end    
      endcase
     end
endmodule
