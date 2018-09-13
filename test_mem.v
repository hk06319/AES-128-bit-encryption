`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:19:24 11/07/2013
// Design Name:   mem_io
// Module Name:   F:/PROJECTS/final_year_project/test_mem.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mem_io
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mem;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] rw;
	reg [127:0] data_out;

	// Outputs
	wire [127:0] key_in;
	wire [127:0] data_in;
   wire sf_e,e,rs,r_w,d,c,b,a;
	// Instantiate the Unit Under Test (UUT)
	mem_io uut (
		.clk(clk), 
		.reset(reset), 
		.rw(rw), 
		.key_in(key_in), 
		.data_in(data_in), 
		.data_out(data_out),
		.sf_e(sf_e),.e(e),.rs(rs),.r_w(r_w),.d(d),.c(c),.b(b),.a(a)
		
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		rw = 0;
		data_out = 0;

		// Wait 100 ns for global reset to finish
		#10 reset=1;
		#10 reset=0;
		rw=2'b10;
		#40 rw=2'b00;
		#40  rw=2'b01;
		//#40  rw=2'b00;
		#20 data_out=128'h19a09ae93df4c6f8e3e28d48be2b2a08;
      #20 data_out=128'h19a09ae93df4c6f8e3e28d48be2b2a09;  
		// Add stimulus here
      #545259790 reset=1;
		#10 reset=0;
	end
	always #10 clk<=~clk;
	
	initial $monitor($time,"key=%h data_in=%h data_out=%h lcd=%b%b%b%b%b%b%b%b",key_in,data_in,data_out,sf_e,e,rs,r_w,d,c,b,a);
      
endmodule

