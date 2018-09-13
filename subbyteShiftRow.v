`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:41 10/06/2013 
// Design Name: 
// Module Name:    subbyteShiftRow 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module subbyteShiftRow(
    input [127:0] in,
    output [127:0] out
    );
wire [127:0] temp;

subbyte s0(.out(temp[127:120]),.in(in[127:120]));        
subbyte s1(.out(temp[119:112]),.in(in[119:112]));
subbyte s2(.out(temp[111:104]),.in(in[111:104]));
subbyte s3(.out(temp[103:96]),.in(in[103:96]));

subbyte s4(.out(temp[95:88]),.in(in[95:88]));
subbyte s5(.out(temp[87:80]),.in(in[87:80]));
subbyte s6(.out(temp[79:72]),.in(in[79:72]));
subbyte s7(.out(temp[71:64]),.in(in[71:64]));

subbyte s8(.out(temp[63:56]),.in(in[63:56]));
subbyte s9(.out(temp[55:48]),.in(in[55:48]));
subbyte s10(.out(temp[47:40]),.in(in[47:40]));
subbyte s11(.out(temp[39:32]),.in(in[39:32]));

subbyte s12(.out(temp[31:24]),.in(in[31:24]));
subbyte s13(.out(temp[23:16]),.in(in[23:16]));
subbyte s14(.out(temp[15:8]),.in(in[15:8]));
subbyte s15(.out(temp[7:0]),.in(in[7:0]));

shiftRow R1(.in(temp),.out(out));

endmodule
