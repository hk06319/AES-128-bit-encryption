`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:36:15 09/24/2013
// Design Name:   mixcolum
// Module Name:   F:/PROJECTS/final_year_project/test_mixcolum.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mixcolum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mixcolum;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mixcolum uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100 in=32'hd4bf5d30;   // expected output=046681e5
		
        
		// Add stimulus here

	end
	initial
	$monitor($time," input=%h output=%h",in,out);
      
endmodule

