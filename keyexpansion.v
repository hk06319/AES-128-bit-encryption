`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:52 09/26/2013 
// Design Name: 
// Module Name:    keyexpansion 
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
module keyexpansion(
    input clk,
    input [127:0] in,
    output [127:0] round_key,
    input reset ,
	 output reg x
    );

wire [31:0] temp;
 reg [127:0] out;
reg [4:0] count;


/*subbyte s0(.out(temp[103:96]),.in(in[127:120]));        ///transformation sbbyte() and rotword()
subbyte s1(.out(temp[127:120]),.in(in[119:112]));
subbyte s2(.out(temp[119:112]),.in(in[111:104]));
subbyte s3(.out(temp[111:104]),.in(in[103:96]));

subbyte s4(.out(temp[71:64]),.in(in[95:88]));
subbyte s5(.out(temp[95:88]),.in(in[87:80]));
subbyte s6(.out(temp[87:80]),.in(in[79:72]));
subbyte s7(.out(temp[79:72]),.in(in[71:64]));

subbyte s8(.out(temp[39:32]),.in(in[63:56]));
subbyte s9(.out(temp[63:56]),.in(in[55:48]));
subbyte s10(.out(temp[55:48]),.in(in[47:40]));
subbyte s11(.out(temp[47:40]),.in(in[39:32]));*/

subbyte s12(.out(temp[7:0]),.in(out[31:24]));
subbyte s13(.out(temp[31:24]),.in(out[23:16]));
subbyte s14(.out(temp[23:16]),.in(out[15:8]));
subbyte s15(.out(temp[15:8]),.in(out[7:0]));

initial x=1'b0;

always@(negedge clk or posedge reset)
begin
   if(reset )
   begin
   count<=5'b00000;
	x=1'b0;
   end
   else if(count!=5'b10111)
	begin
   count<=count+1;
	x=1'b1;
	end
	else
   begin	
	count<=count+0;
	x=1'b1;
	end
end


always@(negedge count[0])
begin
/*case(count)
5'd0: out=in;
5'd4:*/

 if(count[4:1]==4'd0)
  out=in;
 else if(count[4:1]==4'd1)
 out=in;
 else if( count[4:1]==4'd2) begin

      out[127:96]=(temp[31:0]^out[127:96]^32'h01000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end
 else if( count[4:1]==4'd3) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h02000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end
else if( count[4:1]==4'd4) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h04000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd5) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h08000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd6) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h10000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd7) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h20000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd8)begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h40000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd9) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h80000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end	
else if( count[4:1]==4'd10) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h1b000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		end
else if( count[4:1]==4'd11) begin
      out[127:96]=(temp[31:0]^out[127:96]^32'h36000000);
		out[95:64]=(out[127:96]^out[95:64]);
		out[63:32]=(out[95:64]^out[63:32]);
		out[31:0]=(out[63:32]^out[31:0]);
		
		end
else out=128'b0; 
 // endcase
end

   assign round_key=out;

endmodule
