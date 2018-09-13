`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:25:09 11/20/2013
// Design Name:   invshiftRow
// Module Name:   F:/PROJECTS/final_year_project/test_invshiftRow.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: invshiftRow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_invshiftRow;

	// Inputs
	reg [127:0] in;

	// Outputs
	wire [127:0] out;

	// Instantiate the Unit Under Test (UUT)
	invshiftRow uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100 in =128'h5a2c6d7e0b15b39fa8f5c6d5a6c9d4a1;
        
		// Add stimulus here

	end
	initial $monitor($time,"input=%h\n               output=%h",in,out);
      
endmodule

