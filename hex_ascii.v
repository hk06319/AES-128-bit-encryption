`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:02 11/08/2013 
// Design Name: 
// Module Name:    hex_ascii 
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
module hex_ascii(
    input [3:0] in,
    output reg [7:0] out
    );
	 
	always@(in)
   begin
   case(in)
                   4'd0:out<=8'b00110000;	
	4'd1:out<=8'b00110001;
	4'd2:out<=8'b00110010;
	4'd3:out<=8'b00110011;
	4'd4:out<=8'b00110100;
	4'd5:out<=8'b00110101;
	4'd6:out<=8'b00110110;
	4'd7:out<=8'b00110111;
	4'd8:out<=8'b00111000;
	4'd9:out<=8'b00111001;
	4'd10:out<=8'b01000001;
	4'd11:out<=8'b01000010;
	4'd12:out<=8'b01000011;
	4'd13:out<=8'b01000100;
	4'd14:out<=8'b01000101;
	4'd15:out<=8'b01000110;
	endcase
  end	


endmodule
