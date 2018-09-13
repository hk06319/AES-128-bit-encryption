`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:04 11/14/2013 
// Design Name: 
// Module Name:    keyexpansion_new 
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
module keyexpansion_new(
    input reset,clk,en_aes,
    input [127:0] in,
    output [127:0] round_key1,round_key2,
	 output reg x
    );

wire [31:0] temp0,temp1;
reg [127:0] out1,out0;
reg [5:0] count;


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

subbyte s12(.out(temp0[7:0]),.in(out0[31:24]));
subbyte s13(.out(temp0[31:24]),.in(out0[23:16]));
subbyte s14(.out(temp0[23:16]),.in(out0[15:8]));
subbyte s15(.out(temp0[15:8]),.in(out0[7:0]));

subbyte s16(.out(temp1[7:0]),.in(out1[31:24]));
subbyte s17(.out(temp1[31:24]),.in(out1[23:16]));
subbyte s18(.out(temp1[23:16]),.in(out1[15:8]));
subbyte s19(.out(temp1[15:8]),.in(out1[7:0]));

initial x=1'b0;

always@(negedge clk or posedge reset)
begin
   if(reset )
   begin
   count<=6'b000000;
	 x<=1'b0;
   end
	else if(en_aes)
	begin
     if(count!=6'b110000)
	  begin
     count<=count+1; x<=1'b1;
	  end
	  else 
	  begin
	  count<=count+0;
	  x<=1'b1;
	  end
  end
  else
   x<=1'b1;
  	
end


always@(negedge clk)
begin
case(count)
6'd0: out0[127:96]=in[127:96];
6'd1: out0[95:64]=in[95:64];
6'd2: out0[63:32]=in[63:32];
6'd3: out0[31:0]=in[31:0];
    
6'd4: out1[127:96]=(temp0[31:0]^out0[127:96]^32'h01000000);
6'd5: out1[95:64]=(out1[127:96]^out0[95:64]);
6'd6:	out1[63:32]=(out1[95:64]^out0[63:32]);
6'd7:	out1[31:0]=(out1[63:32]^out0[31:0]);

6'd8: out0[127:96]=(temp1[31:0]^out1[127:96]^32'h02000000);
6'd9:	out0[95:64]=(out0[127:96]^out1[95:64]);
6'd10:out0[63:32]=(out0[95:64]^out1[63:32]);
6'd11:out0[31:0]=(out0[63:32]^out1[31:0]);
		
6'd12:out1[127:96]=(temp0[31:0]^out0[127:96]^32'h04000000);
6'd13:out1[95:64]=(out1[127:96]^out0[95:64]);
6'd14:out1[63:32]=(out1[95:64]^out0[63:32]);
6'd15:out1[31:0]=(out1[63:32]^out0[31:0]);

6'd16:out0[127:96]=(temp1[31:0]^out1[127:96]^32'h08000000);
6'd17:out0[95:64]=(out0[127:96]^out1[95:64]);
6'd18:out0[63:32]=(out0[95:64]^out1[63:32]);
6'd19:out0[31:0]=(out0[63:32]^out1[31:0]);
		
6'd20:out1[127:96]=(temp0[31:0]^out0[127:96]^32'h10000000);
6'd21:out1[95:64]=(out1[127:96]^out0[95:64]);
6'd22:out1[63:32]=(out1[95:64]^out0[63:32]);
6'd23:out1[31:0]=(out1[63:32]^out0[31:0]);
		
6'd24:out0[127:96]=(temp1[31:0]^out1[127:96]^32'h20000000);
6'd25:out0[95:64]=(out0[127:96]^out1[95:64]);
6'd26:out0[63:32]=(out0[95:64]^out1[63:32]);
6'd27:out0[31:0]=(out0[63:32]^out1[31:0]);
		
      
6'd28:out1[127:96]=(temp0[31:0]^out0[127:96]^32'h40000000);
6'd29:out1[95:64]=(out1[127:96]^out0[95:64]);
6'd30:out1[63:32]=(out1[95:64]^out0[63:32]);
6'd31:out1[31:0]=(out1[63:32]^out0[31:0]);
			
6'd32:out0[127:96]=(temp1[31:0]^out1[127:96]^32'h80000000);
6'd33:out0[95:64]=(out0[127:96]^out1[95:64]);
6'd34:out0[63:32]=(out0[95:64]^out1[63:32]);
6'd35:out0[31:0]=(out0[63:32]^out1[31:0]);

6'd36:out1[127:96]=(temp0[31:0]^out0[127:96]^32'h1b000000);
6'd37:out1[95:64]=(out1[127:96]^out0[95:64]);
6'd38:out1[63:32]=(out1[95:64]^out0[63:32]);
6'd39:out1[31:0]=(out1[63:32]^out0[31:0]);

6'd40:out0[127:96]=(temp1[31:0]^out1[127:96]^32'h36000000);
6'd41:out0[95:64]=(out0[127:96]^out1[95:64]);
6'd42:out0[63:32]=(out0[95:64]^out1[63:32]);
6'd43:out0[31:0]=(out0[63:32]^out1[31:0]);

/*6'd44:out1[127:96]=(temp0[31:0]^out0[127:96]^32'h36000000);
6'd45:out1[95:64]=(out1[127:96]^out0[95:64]);
6'd46:out1[63:32]=(out1[95:64]^out0[63:32]);
6'd47:out1[31:0]=(out1[63:32]^out0[31:0]);*/
default:begin  out0=out0^128'b0;
          out1=out1^128'b0; end


endcase
end

   assign round_key1=out0;
	assign round_key2=out1;

endmodule



