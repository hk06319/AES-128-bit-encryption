`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:41 09/24/2013 
// Design Name: 
// Module Name:    mult 
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
module mult(out, in,select);

input [7:0] in;
input [1:0] select;
output reg [7:0] out;
wire [7:0] w1;
xtime x1(.in(in),.out(w1));

always@(in or select or w1)
begin
case(select)
2'b00:out=in;
2'b01:out=in;
2'b10:out=w1;
2'b11:out=w1^in;
endcase
end

endmodule
