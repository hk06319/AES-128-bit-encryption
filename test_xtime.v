`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:00 09/24/2013
// Design Name:   xtime
// Module Name:   F:/PROJECTS/final_year_project/test_xtime.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xtime
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_xtime;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	xtime uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100 in=8'h57;
		#100 in=8'hae;
		#100 in=8'h47;
        
		// Add stimulus here

	end
	initial
	$monitor($time, "input=%h output=%h\n",in,out);
      
endmodule

