`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:57 11/07/2013
// Design Name:   final
// Module Name:   F:/PROJECTS/final_year_project/test_final.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: final
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_final;

	// Inputs
	reg clk;
	reg reset;
	wire [127:0] test1,test2,test3,test4,test5;
	wire [4:0] test_state;
	wire sf_e,e,rs,r_w,d,c,b,a;

	// Instantiate the Unit Under Test (UUT)
	final uut (
		.clk(clk), 
		.reset(reset),
		.test1(test1),.test2(test2),.test3(test3),.test4(test4),.test_state(test_state),.test5(test5),
		.sf_e(sf_e),.e(e),.rs(rs),.r_w(r_w),.d(d),.c(c),.b(b),.a(a)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#20 reset=1;
		#5 reset=0;

		// Wait 100 ns for global reset to finish
		#420 reset=1;
		#40 reset=0;
        
		// Add stimulus here

	end
	always #10 clk<=~clk;
   
initial $monitor($time,"state=%d dataout1=%h dataout2=%h key=%h data_in=%h reg2=%h",test_state,test1,test2,test3,test4,test5);
        //$monitor($time,"lcd=%b",{sf_e,e,rs,r_w,d,c,b,a});
endmodule

