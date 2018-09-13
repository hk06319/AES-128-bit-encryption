`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:28:00 10/07/2013
// Design Name:   main_aes
// Module Name:   F:/PROJECTS/final_year_project/test_aes.v
// Project Name:  final_year_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_aes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_aes;

	// Inputs
	reg [127:0] data_in;
	reg [127:0] key_in;
	reg clk;
	reg reset,en_aes;

	// Outputs
	wire [127:0] data_out,test1,test2,test3;
	wire [4:0] test_state;
	wire [1:0] rw;
	wire x;

	// Instantiate the Unit Under Test (UUT)
	main_aes uut (.en_aes(en_aes),
		.data_in(data_in), 
		.key_in(key_in), 
		.data_out(data_out),
		.clk(clk), 
		.reset(reset),.test1(test1),.test2(test2),.test3(test3),.test_state(test_state),
		.rw(rw)
      		
	);

	initial begin 
	  en_aes=1;
		// Initialize Inputs
		//data_in =128'h3243f6a8885a308d313198a2e0370734;/*19a09ae93df4c6f8e3e28d48be2b2a08;*/
		key_in = 128'h2b7e151628aed2a6abf7158809cf4f3c;
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
	#60 data_in =128'h3243f6a8885a308d313198a2e0370734;
	#40 data_in =128'h3243f6a8885a308d313198a2e0370735;
	end
	
	always
   #10 clk<=~clk;
	
	initial $monitor($time,"state=%d key=%h reg1=%h reg2=%h dataout=%h",test_state,test1,test3,test2,data_out);
      
endmodule

