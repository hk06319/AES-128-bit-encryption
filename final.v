`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:45 11/07/2013 
// Design Name: 
// Module Name:    final 
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
module final( input clk,clk1,clk2,clk3,reset,
              input wire ps2d, ps2c,en_aes,en_inv_aes,
              //output [127:0] test1,test2,test3,test4,test5,
				  //output [4:0] test_state,
				  output [4:0] count2,
				  output [2:0] count1,
				  output sf_e,e,rs,r_w,d,c,b,a
    );
wire [1:0] rw,rw2;
wire [127:0] key_in,key_in2,data_in,data_in2,data_out,data_out2,key_out;
wire [3:0] data_out1;

 mem_io a1(  .clk(clk),.clk1(clk1),.clk2(clk2),.clk3(clk3),.reset(reset),
          .rw(rw),.rw2(rw2),
          .key_in(key_in),.data_in(data_in),
			 .key_in2(key_in2),.data_in2(data_in2),
			 .data_out(data_out),.data_out1(data_out1),
			 .data_out2(data_out2),.key_out(key_out),
			 .count1(count1),.count2(count2),
          //.test1(test1),.test2(test2),.test3(test3),.test4(test4),
		    .sf_e(sf_e),.e(e),.rs(rs),.r_w(r_w),.d(d),.c(c),.b(b),.a(a)		    
          );
	 
main_aes a2(
          .clk(clk),.reset(reset),
           .rw(rw),
           .key_in(key_in),.data_in(data_in),
			  .data_out(data_out),.key_out(key_out),//,.test_state(test_state),.test4(test5)
			  .en_aes(en_aes)
    );
	 
ps2_rx  a3(
             .clk(clk), .reset(reset),
             .ps2d(ps2d), .ps2c(ps2c),.rx_en(1),
             //output reg rx_done_tick,
             .data_out1(data_out1)//,.count2(count2)
             );
inv_AES a4(
          .data_in(data_in2),.key_in(/*key_in2*/128'hd014f9a8c9ee2589e13f0cc8b6630ca6),
          .data_out(data_out2),
          .clk(clk),.reset(reset),.en_inv_aes(en_inv_aes),
	       .rw(rw2)
          );				 

endmodule
