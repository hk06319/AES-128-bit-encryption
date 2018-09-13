`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:14:36 11/14/2013
// Design Name:   keyexpansion_new
// Module Name:   F:/PROJECTS/final_year_project/test_keyexpansion_new.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keyexpansion_new
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_keyexpansion_new;

	// Inputs
	reg reset;
	reg clk;
	reg [127:0] in;

	// Outputs
	wire [127:0] round_key1;
	wire [127:0] round_key2;
	wire x;

	// Instantiate the Unit Under Test (UUT)
	keyexpansion_new uut (
		.reset(reset), 
		.clk(clk), 
		.in(in), 
		.round_key1(round_key1), 
		.round_key2(round_key2),
		.x(x)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		in = 128'h2b7e151628aed2a6abf7158809cf4f3c;

		// Wait 100 ns or global reset to finish
		#40 reset = 1;
		#20 reset = 0;
        
		// Add stimulus here

	end
always #10 clk<=~clk;

initial $monitor($time,"key_in=%h data[0]=%h data[1]=%h",in,round_key1,round_key2); 	
	
      
endmodule

