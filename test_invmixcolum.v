`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:44:37 11/20/2013
// Design Name:   inv_mixcolum
// Module Name:   F:/PROJECTS/final_year_project/test_invmixcolum.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inv_mixcolum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_invmixcolum;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	inv_mixcolum uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
	   #100 in=32'h046681e5;
        
		// Add stimulus here

	end
   initial
	$monitor($time," input=%h output=%h",in,out);   
		
endmodule

