`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:18:24 09/21/2013
// Design Name:   subbytes
// Module Name:   F:/PROJECTS/final_year_project/test_subbytes.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subbytes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_subbyte;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	subbyte uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#20 in=8'hcf;
      #20 in=8'h4f;
      #20 in=8'h3c;
      #20 in=8'h09;		
		// Add stimulus here

	end
	initial
	$monitor($time,"input=%h output=%h",in,out);
      
endmodule

