`timescale 1ns / 1ps



module registerFile
( input [63:0]WriteData,
input [4:0]RS1,
input [4:0]RS2,
input [4:0]RD,
input RegWrite, clk, reset,
output reg [63:0]ReadData1,
output reg [63:0]ReadData2,
output [63:0] R8, R19, R20, R21, R22
);
reg[63:0] Registers [31:0]; //initialize Registers with random values (using 'initial' block)
initial
begin
Registers[0] = 64'd1;
Registers[1] = 64'd2;
Registers[2] = 64'd3;
Registers[3] = 64'd4;
Registers[4] = 64'd5;
Registers[5] = 64'd6;
Registers[6] = 64'd7;
Registers[7] = 64'd8;
Registers[8] = 64'd9;
Registers[9] = 64'd10;
Registers[10] = 64'd11;
Registers[11] = 64'd12;
Registers[12] = 64'd13;
Registers[13] = 64'd14;
Registers[14] = 64'd15;
Registers[15] = 64'd16;
Registers[16] = 64'd17;
Registers[17] = 64'd18;
Registers[18] = 64'd19;
Registers[19] = 64'd20;
Registers[20] = 64'd21;
Registers[21] = 64'd22;
Registers[22] = 64'd23;
Registers[23] = 64'd24;
Registers[24] = 64'd25;
Registers[25] = 64'd26;
Registers[26] = 64'd27;
Registers[27] = 64'd28;
Registers[28] = 64'd29;
Registers[29] = 64'd30;
Registers[30] = 64'd31;
Registers[31] = 64'd32;
end

assign r8 = Registers[8];
assign r19 = Registers[19];
assign r20 = Registers[20];
assign r21 = Registers[26];
assign r22 = Registers[27];

//operation of writing data into a Register should always be done when
//positive edge of clock and RegWrite signal is asserted (or set, i.e. High)
always @ (*)
begin
    if(reset)
        begin
        ReadData1 = 64'b0;
        ReadData2 = 64'b0;
        end
    else
        begin
            
                ReadData1 = Registers[RS1];
                ReadData2 = Registers[RS2];
            
        end
end
always @ (posedge clk)
 begin
    if (RegWrite == 1'b1)
        begin
            Registers[RD] = WriteData;
        end
 end
        


endmodule
