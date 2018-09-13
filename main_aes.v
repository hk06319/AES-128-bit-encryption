`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:31 10/06/2013 
// Design Name: 
// Module Name:    main_aes 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main_aes(
     input [127:0] data_in,key_in,
    output reg  [127:0] data_out,
	 output wire [127:0] key_out,
    input clk,reset,en_aes,
	 output [127:0] test1,test2,test3,
	 //output [127:0] test4,
	 output [4:0] test_state,
	 output reg [1:0] rw=2'b0
    );
reg [4:0] count;
reg [127:0] reg1 ,reg2=0;
 wire  [127:0] temp1,temp2,round_key1,round_key2;
 wire [127:0] data,key1,key2;
 reg tick;
// wire [5:0] test_state;
//reg data_out;
wire x;
assign key_out=round_key1;
row2column R1(.in(data_in/*128'h3243f6a8885a308d313198a2e0370734*/),.out(data));
row2column R2(.in(key1/*128'h2b7e151628aed2a6abf7158809cf4f3c*/),.out(round_key1));
row2column R3(.in(key2/*128'h2b7e151628aed2a6abf7158809cf4f3c*/),.out(round_key2));

//keyexpansion k1(.clk(clk),.in(key_in/*128'h2b7e151628aed2a6abf7158809cf4f3c*/),.round_key(key),.reset(reset),.x(x));
keyexpansion_new k1(.clk(clk),.in(key_in/*128'h2b7e151628aed2a6abf7158809cf4f3c*/),.round_key1(key1),.round_key2(key2),.reset(reset),.x(x),.en_aes(en_aes));
subbyteShiftRow SR1(.in(reg1),.out(temp1));

mixcolum M1(.in({reg2[127:120],reg2[95:88],reg2[63:56],reg2[31:24]}),
           .out({temp2[127:120],temp2[95:88],temp2[63:56],temp2[31:24]}));

mixcolum M2(.in({reg2[119:112],reg2[87:80],reg2[55:48],reg2[23:16]}),
           .out({temp2[119:112],temp2[87:80],temp2[55:48],temp2[23:16]}));

mixcolum M3(.in({reg2[111:104],reg2[79:72],reg2[47:40],reg2[15:8]}),
           .out({temp2[111:104],temp2[79:72],temp2[47:40],temp2[15:8]}));

mixcolum M4(.in({reg2[103:96],reg2[71:64],reg2[39:32],reg2[7:0]}),
           .out({temp2[103:96],temp2[71:64],temp2[39:32],temp2[7:0]}));	

initial count=5'd0;

always@(posedge clk or posedge reset)
begin
if(reset)
tick<=1'b0;
else if(x==1'b1)
tick<=~tick;
else
tick<=tick;
end

always@(posedge tick or posedge reset)
begin
 if(reset)
 begin
 count<=5'b00000;
 rw<=2'b10;
 end
 else if(count==5'b00010 && x==1'b1 && en_aes==1'b1)
 begin rw<=2'b00; count<=count+1; end
 else if(count==5'b10110 && x==1'b1 && en_aes==1'b1)
 begin rw<=2'b01; count<=count+1; end
 else if(count!=5'b11000 && x==1'b1 && en_aes==1'b1)
 begin
 count<=count+1; 
 end
 else
 begin
 count<=count+0;
 rw<=2'b00;
 end
end 



always@(/*count*/posedge tick)
begin
 case(count[4:0])
 5'd0: begin/* reg2<=data;*/ reg2<=128'b0; end
 5'd1: begin reg2<=data;
        //reg1<=reg2^round_key; 
		  end
 5'd2: begin 
       reg1<=reg2^round_key1/*128'h2b7e151628aed2a6abf7158809cf4f3c*/;
       //reg2<=/*reg1*/temp1;
       reg2<=data;		 
		 end
 5'd3: begin 
       reg1<=reg2^round_key1/*128'h2b7e151628aed2a6abf7158809cf4f3c*/;
       reg2<=/*reg1*/temp1; 
		 end
 5'd4: begin 
       reg1<=temp2^round_key2/*128'ha0fafe1788542cb123a339392a6c7605*/;
       reg2<=temp1; 
		 end
 5'd5: begin 
       reg1<=temp2^round_key2/*128'ha0fafe1788542cb123a339392a6c7605*/;
       reg2<=temp1; 
		 end
 5'd6: begin 
       reg1<=temp2^round_key1/*128'hf2c295f27a96b9435935807a7359f67f*/;
       reg2<=temp1; 
		 end
 5'd7: begin 
       reg1<=temp2^round_key1/*128'hf2c295f27a96b9435935807a7359f67f*/;
       reg2<=temp1; 
		 end
 5'd8: begin 
       reg1<=temp2^round_key2/*128'h3d80477d4716fe3e1e237e446d7a883b*/;
       reg2<=temp1; 
		 end
 5'd9: begin 
       reg1<=temp2^round_key2/*128'h3d80477d4716fe3e1e237e446d7a883b*/;
       reg2<=temp1; 
		 end
 5'd10: begin 
       reg1<=temp2^round_key1/*128'hef44a541a8525b7fb671253bdb0bad00*/;
       reg2<=temp1; 
		 end
 5'd11: begin 
       reg1<=temp2^round_key1/*128'hef44a541a8525b7fb671253bdb0bad00*/;
       reg2<=temp1; 
		 end
 5'd12: begin 
       reg1<=temp2^round_key2/*128'hd4d1c6f87c839d87caf2b8bc11f915bc*/;
       reg2<=temp1; 
		 end
 5'd13: begin 
       reg1<=temp2^round_key2/*128'hd4d1c6f87c839d87caf2b8bc11f915bc*/;
       reg2<=temp1; 
		 end
 5'd14: begin 
       reg1<=temp2^round_key1/*128'h6d88a37a110b3efddbf98641ca0093fd*/;
       reg2<=temp1; 
		 end
 5'd15: begin 
       reg1<=temp2^round_key1/*128'h6d88a37a110b3efddbf98641ca0093fd*/;
       reg2<=temp1; 
		 end
 5'd16: begin 
       reg1<=temp2^round_key2/*128'h4e54f70e5f5fc9f384a64fb24ea6dc4f*/;
       reg2<=temp1; 
		 end
 5'd17: begin 
       reg1<=temp2^round_key2/*128'h4e54f70e5f5fc9f384a64fb24ea6dc4f*/;
       reg2<=temp1; 
		 end
 5'd18: begin 
       reg1<=temp2^round_key1/*128'head27321b58dbad2312bf5607f8d292f*/;
       reg2<=temp1; 
		 end
 5'd19: begin 
       reg1<=temp2^round_key1/*128'head27321b58dbad2312bf5607f8d292f*/;
       reg2<=temp1; 
		 end
 5'd20: begin 
       reg1<=temp2^round_key2/*128'hac7766f319fadc2128d12941575c006e*/;
       reg2<=temp1; 
		 end
	 
 5'd21: begin
        //data_out<=temp1^round_key;
	     reg1<=temp2^round_key2/*128'hac7766f319fadc2128d12941575c006e*/;
        reg2<=temp1; 
	     end
 5'd22: 
  begin 
   data_out<=reg2^round_key1/*128'hd014f9a8c9ee2589e13f0cc8b6630ca6*/; 
	reg1<=temp2^round_key1/*128'hd014f9a8c9ee2589e13f0cc8b6630ca6*/;
   reg2<=temp1;
	end
	
 5'd23:begin
 data_out<=reg2^round_key1/*128'hd014f9a8c9ee2589e13f0cc8b6630ca6*/;
 reg1<=temp2^round_key1/*128'hd014f9a8c9ee2589e13f0cc8b6630ca6*/;
 reg2<=temp1;
 
     end
 
 default:  begin 
    reg2<=128'b0;
	 reg1<=128'b0;
	 data_out<=data_out^128'b0;
   //data_out<=reg2^round_key/*128'hd014f9a8c9ee2589e13f0cc8b6630ca6*/; 
	//reg1<=temp2^round_key;
   //reg2<=temp1;
 end	
	
 endcase	
end	  
		  
assign test1=round_key1;

assign test3=round_key2;
assign test2=reg2;
//assign test4=reg2; 
assign test_state=count;

endmodule
