`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:47:58 09/23/2013
// Design Name:   shiftRow
// Module Name:   F:/PROJECTS/final_year_project/test_shiftrow.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftRow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shiftrow;

	// Inputs
	reg [127:0] in;

	// Outputs
	wire [127:0] out;

	// Instantiate the Unit Under Test (UUT)
	shiftRow uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100; in=128'h5a2c6d7e9f0b15b3c6d5a8f5c9d4a1a6;
		#100; in=128'h5a2c6d7e9f0b15b3c6d5a8f5c9d4a1a5;
		#100; in=128'h5a2c6d7e9f0b15b3c6d5a8f5c9d4a1a4;
		#100; in=128'h5a2c6d7e9f0b15b3c6d5a8f5c9d4a1a3;
        
		// Add stimulus here

	end
	initial $monitor($time,"input=%h\n               output=%h",in,out);
      
endmodule

