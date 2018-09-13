`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:09 09/24/2013 
// Design Name: 
// Module Name:    xtime 
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
module xtime(
    input [7:0] in,
    output [7:0] out
    );
   assign out[0] = in[7];
	assign out[1] = in[0] ^ in[7];
	assign out[2] = in[1];
	assign out[3] = in[2] ^ in[7];
	assign out[4] = in[3] ^ in[7];
	assign out[5] = in[4];
	assign out[6] = in[5];
	assign out[7] = in[6];

endmodule
