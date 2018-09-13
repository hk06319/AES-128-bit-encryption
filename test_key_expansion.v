`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:21 09/27/2013
// Design Name:   keyexpansion
// Module Name:   F:/PROJECTS/final_year_project/test_key_expansion.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keyexpansion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_key_expansion;

	// Inputs
	reg clk;
	reg [127:0] in;
	reg reset;

	// Outputs
	wire [127:0] round_key;
   wire x;
	// Instantiate the Unit Under Test (UUT)
	keyexpansion uut (
		.clk(clk), 
		.in(in), 
		.round_key(round_key), 
		.reset(reset),
		.x(x)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 128'h2b7e151628aed2a6abf7158809cf4f3c;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#20 reset=0;
		  
		  
		//#460 $stop;
		
      
		// Add stimulus here

	end
always
#10 clk<=~clk;

initial 
     $monitor($time,"expanded key=%h\n",round_key);	
      
endmodule

