`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:42:37 09/24/2013
// Design Name:   mult
// Module Name:   F:/PROJECTS/final_year_project/test_mult.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mult;

	// Inputs
	reg [7:0] in;
	reg [1:0] select;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	mult uut (
		.out(out), 
		.in(in), 
		.select(select)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100 in=8'ha7; select=00;
		#100 in=8'ha7; select=01;
		#100 in=8'ha7; select=10;
		#100 in=8'ha7; select=11;
		
        
		// Add stimulus here

	end
	initial $monitor($time,"select=%b input=%h output=%h\n",select,in,out);
      
endmodule

