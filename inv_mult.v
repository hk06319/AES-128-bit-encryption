`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:18 11/20/2013 
// Design Name: 
// Module Name:    inv_mult 
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
module inv_mult(out, in,select
    );
input [7:0] in;
input [1:0] select;
output reg [7:0] out;
wire [7:0] w1,w2,w3;
xtime x1(.in(in),.out(w1));
xtime x2(.in(w1),.out(w2));
xtime x3(.in(w2),.out(w3));

always@(in or select or w1 or w2 or w3)
begin
case(select)
2'b00:out=in^w3^w1;
2'b01:out=w3^w2^in;
2'b10:out=w3^in;
2'b11:out=w1^w2^w3;
endcase
end
endmodule
