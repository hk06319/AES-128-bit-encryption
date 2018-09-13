`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:11:42 09/24/2013 
// Design Name: 
// Module Name:    mixcolum 
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
module mixcolum(
    input [31:0] in,
    output [31:0] out
    );

parameter enb1=2'b10;
parameter enb2=2'b11;
parameter enb3=2'b01;
parameter enb4=2'b01;

parameter enb5=2'b01;
parameter enb6=2'b10;
parameter enb7=2'b11;
parameter enb8=2'b01;

parameter enb9=2'b01;
parameter enb10=2'b01;
parameter enb11=2'b10;
parameter enb12=2'b11;

parameter enb13=2'b11;
parameter enb14=2'b01;
parameter enb15=2'b01;
parameter enb16=2'b10;

wire [7:0] w1,w2,w3,w4, w5,w6,w7,w8, w9,w10,w11,w12, w13,w14,w15,w16;

mult m1(.out(w1),.in(in[31:24]),.select(enb1));
mult m2(.out(w2),.in(in[23:16]),.select(enb2));
mult m3(.out(w3),.in(in[15:8]),.select(enb3));
mult m4(.out(w4),.in(in[7:0]),.select(enb4));

mult m5(.out(w5),.in(in[31:24]),.select(enb5));
mult m6(.out(w6),.in(in[23:16]),.select(enb6));
mult m7(.out(w7),.in(in[15:8]),.select(enb7));
mult m8(.out(w8),.in(in[7:0]),.select(enb8));

mult m9(.out(w9),.in(in[31:24]),.select(enb9));
mult m10(.out(w10),.in(in[23:16]),.select(enb10));
mult m11(.out(w11),.in(in[15:8]),.select(enb11));
mult m12(.out(w12),.in(in[7:0]),.select(enb12));

mult m13(.out(w13),.in(in[31:24]),.select(enb13));
mult m14(.out(w14),.in(in[23:16]),.select(enb14));
mult m15(.out(w15),.in(in[15:8]),.select(enb15));
mult m16(.out(w16),.in(in[7:0]),.select(enb16));

assign out[31:24]=w1^w2^w3^w4;
assign out[23:16]=w5^w6^w7^w8;
assign out[15:8]=w9^w10^w11^w12;
assign out[7:0]=w13^w14^w15^w16;



endmodule
