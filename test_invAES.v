`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:29:57 11/21/2013
// Design Name:   inv_AES
// Module Name:   F:/PROJECTS/final_year_project/test_invAES.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inv_AES
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_invAES;

	// Inputs
	reg [127:0] data_in;
	reg [127:0] key_in;
	reg clk,en_inv_aes;
	reg reset;

	// Outputs
	wire [127:0] data_out;
	wire [127:0] test1;
	wire [127:0] test2;
	wire [127:0] test3;
	wire [4:0] test_state;
	wire [1:0] rw;

	// Instantiate the Unit Under Test (UUT)
	inv_AES uut (.en_inv_aes(en_inv_aes),
		.data_in(data_in), 
		.key_in(key_in), 
		.data_out(data_out), 
		.clk(clk), 
		.reset(reset), 
		.test1(test1), 
		.test2(test2), 
		.test3(test3), 
		.test_state(test_state), 
		.rw(rw)
	);

	initial begin 
	   en_inv_aes=1;
		// Initialize Inputs
		//data_in =128'h3243f6a8885a308d313198a2e0370734;/*19a09ae93df4c6f8e3e28d48be2b2a08;*/
		key_in = 128'hd014f9a8c9ee2589e13f0cc8b6630ca6;
		clk = 0;
		reset = 0;
		 	#20	reset = 1;
		 	#5	reset = 0;
      
     // #460 $stop;
		// Wait 100 ns for global reset to finish
		//#200 reset = 1;
		//#20 reset = 0;
		
        
		// Add stimulus here

	end
	
	initial begin
	#60 data_in =128'h3902dc1925dc116a8409850b1dfb9732/*3243f6a8885a308d313198a2e0370734*/;
	#40 data_in =128'h39f564ed0510c34e2af334ae0cce501c/*3902dc1925dc116a8409850b1dfb9732*//*3243f6a8885a308d313198a2e0370735*/;
	end
	
	always
   #10 clk<=~clk;
	
	initial $monitor($time,"state=%d key=%h reg1=%h reg2=%h dataout=%h",test_state,test1,test3,test2,data_out);
      
endmodule