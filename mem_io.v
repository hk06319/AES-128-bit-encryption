`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:41 11/04/2013 
// Design Name: 
// Module Name:    mem_io 
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
   module mem_io( input clk,clk1,clk2,clk3,reset,
               input [1:0] rw,rw2,
               output reg [127:0] key_in,key_in2,data_in,data_in2,
					//output [127:0] test1,test2,test3,test4,
					input [127:0] data_out,data_out2,key_out,
					output reg [4:0] count2,
					output reg [2:0] count1,
					output reg sf_e,e,rs,r_w,d,c,b,a,
					input [3:0] data_out1   ///input from key board
    );
	 
	 reg [2:0] count=3'b0,count_inv=3'b0;
	 
	 reg tick,x_enb=0;    //x=1 run the lcd
	 reg [127:0]mem[0:7];
	 wire [7:0]temp[0:31];/*,temp1*/
	 wire [127:0] mem1;
	  
	  
	 
	 reg [27:0] lcd_count =28'b0;
	 reg [5:0]code;
	 reg refresh;
	 
	/* assign test1=mem[0];
	 assign test2=mem[1];
	 assign test3=key_in;
	 assign test4=data_in;*/
	 
	 
	 initial
	 begin
	 mem[0]=128'h19a09ae93df4c6f8e3e28d48be2b2a08;
	 mem[1]=128'b0;
	 mem[2]=128'b0;
	 mem[3]=128'b0;
	 mem[4]=128'b0;
	 end

assign mem1[127:0]=(count1==3'b000)?mem[0][127:0]:
            (count1==3'b001)?mem[1][127:0]:
            (count1==3'b010)?mem[2][127:0]:
				(count1==3'b011)?mem[3][127:0]:
				(count1==3'b100)?mem[4][127:0]:
				(count1==3'b101)?mem[5][127:0]:
				(count1==3'b110)?mem[6][127:0]: mem[7][127:0];
 
 
   hex_ascii  a1(mem1[3:0],temp[0][7:0]),a9(mem1[35:32],temp[8][7:0]),a17(mem1[67:64],temp[16][7:0]),a25(mem1[99:96],temp[24][7:0]),
	           a2(mem1[7:4],temp[1][7:0]),a10(mem1[39:36],temp[9][7:0]),a18(mem1[71:68],temp[17][7:0]),a26(mem1[103:100],temp[25][7:0]),
				  a3(mem1[11:8],temp[2][7:0]),a11(mem1[43:40],temp[10][7:0]),a19(mem1[75:72],temp[18][7:0]),a27(mem1[107:104],temp[26][7:0]),
				  a4(mem1[15:12],temp[3][7:0]),a12(mem1[47:44],temp[11][7:0]),a20(mem1[79:76],temp[19][7:0]),a28(mem1[111:108],temp[27][7:0]),
				  a5(mem1[19:16],temp[4][7:0]),a13(mem1[51:48],temp[12][7:0]),a21(mem1[83:80],temp[20][7:0]),a29(mem1[115:112],temp[28][7:0]),
				  a6(mem1[23:20],temp[5][7:0]),a14(mem1[55:52],temp[13][7:0]),a122(mem1[87:84],temp[21][7:0]),a30(mem1[119:116],temp[29][7:0]),
				  a7(mem1[27:24],temp[6][7:0]),a15(mem1[59:56],temp[14][7:0]),a23(mem1[91:88],temp[22][7:0]),a31(mem1[123:120],temp[30][7:0]),
				  a8(mem1[31:28],temp[7][7:0]),a16(mem1[63:60],temp[15][7:0]),a24(mem1[95:92],temp[23][7:0]),a32(mem1[127:124],temp[31][7:0]);
  	
/*	hex_ascii  b1(mem[1][3:0],temp1[3:0]),b9(mem[1][35:32],temp1[3:0]),b17(mem[1][67:64],temp1[67:64]),b25(mem[1][99:96],temp1[99:96]),
	           b2(mem[1][7:4],temp1[7:4]),b10(mem[1][39:36],temp1[3:0]),b18(mem[1][71:68],temp1[71:68]),b26(mem[1][103:100],temp1[103:100]),
				  b3(mem[1][11:8],temp1[11:8]),b11(mem[1][43:40],temp1[3:0]),b19(mem[1][75:72],temp1[75:72]),b27(mem[1][107:104],temp1[107:104]),
				  b4(mem[1][15:12],temp1[15:12]),b12(mem[1][47:44],temp1[3:0]),b20(mem[1][79:76],temp1[79:76]),b28(mem[1][111:108],temp1[111:108]),
				  b5(mem[1][19:16],temp1[19:16]),b13(mem[1][51:48],temp1[3:0]),b21(mem[1][83:80],temp1[83:80]),b29(mem[1][115:112],temp1[115:112]),
				  b6(mem[1][23:20],temp1[23:20]),b14(mem[1][55:52],temp1[3:0]),b122(mem[1][87:84],temp1[87:84]),b30(mem[1][119:116],temp1[119:116]),
				  b7(mem[1][27:24],temp1[27:24]),b15(mem[1][59:56],temp1[3:0]),b23(mem[1][91:88],temp1[91:88]),b31(mem[1][123:120],temp1[123:120]),
				  b8(mem[1][31:28],temp1[31:28]),b16(mem[1][63:60],temp1[3:0]),b24(mem[1][95:92],temp1[95:92]),b32(mem[1][127:124],temp1[127:124]);
              */
				  
				  
				  
  /// for memory location				  
   always@(posedge clk1 or posedge reset)
   begin
	if(reset)
   count1<=3'b0;
   else 
   count1<=count1+1;
   end
   ////for entering the data 	
   always@(posedge clk2 or posedge clk3 or posedge reset)
	begin
	if(reset)
	count2<=5'b0;
	else if(clk3)
	count2<=count2-1;
	else if(clk2)
	count2<=count2+1;
	else
	 count2<=count2+0;
	end
	
	
	
	
	
	always@(negedge clk or posedge reset)
   begin
   if(reset)
   tick<=1'b0;
   else
   tick<=~tick;
   end	
	

	
	 
	always@(negedge tick or posedge reset)
	begin
	  if(reset)
	  begin
	  count<=3'b0;
	  //lcd_count<=27'b0;	  
	  x_enb<=0;
	  end
	  else if(rw==2'b10 && count!=3'b100)
	  count<=count+1;
	  else if(rw==2'b01 && count!=3'b100)
	 begin count<=count+1;  end
	  else if(count==3'b100)
	  x_enb<=1;
	  else
	  count<=count+0;
	end
	
   always@(posedge tick)
	begin
	  case(count)
	   3'd0:begin 
		      key_in<=128'h2b7e151628aed2a6abf7158809cf4f3c/*mem[0]*/;
			  
			  end
	   3'd1:begin 
			   data_in<=128'h3243f6a8885a308d313198a2e0370734/*mem[1]*/;
			  end
	   3'd2:begin
		     
			   data_in<=128'h3243f6a8885a308d313198a2e0370735/*mem[2]*/;
			  end
		3'd3:begin
		      mem[3]<=data_out;
				//mem[5]<=key_out;
		     end
		3'd4:begin 
		           mem[4]<=data_out;	
		          
			  end
		default: 
		     begin
		     
           end
	  endcase		
	end 
	
	
/////for inv encryption
always@(negedge tick or posedge reset)
	begin
	  if(reset)
	  begin
	  count_inv<=3'b0;
	  //lcd_count<=27'b0;	  
	  //x_enb<=0;
	  end
	  else if(rw2==2'b10 && count_inv!=3'b100)
	  count_inv<=count_inv+1;
	  else if(rw2==2'b01 && count_inv!=3'b100)
	 begin count_inv<=count_inv+1;  end
	  /*else if(count_inv==3'b100)
	  //x_enb<=1;*/
	  else
	  count_inv<=count_inv+0;
	end
	
   always@(posedge tick)
	begin
	  case(count_inv)
	   3'd0:begin 
		      key_in2<=/*128'h2b7e151628aed2a6abf7158809cf4f3c*/mem[5];
			  
			  end
	   3'd1:begin 
			   data_in2<=/*128'h3243f6a8885a308d313198a2e0370734*/mem[3];
			  end
	   3'd2:begin
		     
			   data_in2<=/*128'h3243f6a8885a308d313198a2e0370735*/mem[4];
			  end
		3'd3:begin
		      mem[6]<=data_out2;
		     end
		3'd4: mem[7]<=data_out2;	  
		default: 
		     begin
		     
           end
	  endcase		
	end 	
	
	
 always @(posedge clk ) begin
      
		if(reset)
		lcd_count<=0;
		/*else if(x_enb==0)
		lcd_count <=lcd_count + 0;*/
		else
		lcd_count <=lcd_count + 1;
		
		case ( lcd_count[27:21])
		
		7'd0:code <=6'h03; 
		7'd1:code <=6'h03;
		7'd2:code <=6'h03;
		7'd3:code <=6'h02;  ///initializing the lcd   
		
		7'd4:code <=6'h02;  
		7'd5:code <=6'h08;  ///function mode  set 
		
		7'd6:code <=6'h00;
		7'd7:code <=6'h06;  //// entry mode set
		
		7'd8:code <=6'h00;
		7'd9:code <=6'h0C;   ///disply on/off set command
		
		7'd10:code <=6'h00;
	   7'd11:code <=6'h01;  ///clear the lcd
		
		7'd12:code <={2'b10, temp[31][7:4]};
		7'd13:code <={2'b10, temp[31][3:0]};   ///for character 'H'
		
		7'd14:code <={2'b10, temp[30][7:4]};
		7'd15:code <={2'b10, temp[30][3:0]};   ///for character 'e'
		
		7'd16:code <={2'b10, temp[29][7:4]};
		7'd17:code <={2'b10,temp[29][3:0]};   ///for character 'l'
		
		7'd18:code <={2'b10, temp[28][7:4]};
		7'd19:code <={2'b10,temp[28][3:0]};  ///for character 'l'
		
		7'd20:code <={2'b10, temp[27][7:4]};   ///for character 'o'
		7'd21:code <={2'b10,temp[27][3:0]};
		
		7'd22:code <={2'b10, temp[26][7:4]};
		7'd23:code <={2'b10,temp[26][3:0]};   ///for character ','
		
      7'd24:code <={2'b10, temp[25][7:4]};/*6'b001100;*/
		7'd25:code <={2'b10,temp[25][3:0]};/*6'b000000;*/ ////set DDRAM address for next line 0x40
		
		7'd26:code <={2'b10, temp[24][7:4]};
		7'd27:code <={2'b10,temp[24][3:0]};  ///command for "world !"
	
		7'd28:code <={2'b10, temp[23][7:4]};
		7'd29:code <={2'b10,temp[23][3:0]};
		
		7'd30:code <={2'b10, temp[22][7:4]};
		7'd31:code <={2'b10,temp[22][3:0]};
		
		7'd32:code <={2'b10, temp[21][7:4]};
		7'd33:code <={2'b10,temp[21][3:0]};
		
		7'd34:code <={2'b10, temp[20][7:4]};
		7'd35:code <={2'b10,temp[20][3:0]};
		
		7'd36:code <={2'b10, temp[19][7:4]};
		7'd37:code <={2'b10,temp[19][3:0]};
		
		7'd38:code <={2'b10, temp[18][7:4]};
		7'd39:code <={2'b10,temp[18][3:0]};
		
		7'd40:code <={2'b10, temp[17][7:4]};
		7'd41:code <={2'b10, temp[17][3:0]};
		
		7'd42:code <={2'b10, temp[16][7:4]};
		7'd43:code <={2'b10, temp[16][3:0]};
		
		7'd44:code <=6'b001100;
		7'd45:code <=6'b000000;
		
	   7'd46:code <={2'b10, temp[15][7:4]};
		7'd47:code <={2'b10, temp[15][3:0]};
		
		7'd48:code <={2'b10, temp[14][7:4]};
		7'd49:code <={2'b10, temp[14][3:0]};
		
		7'd50:code <={2'b10, temp[13][7:4]};
		7'd51:code <={2'b10, temp[13][3:0]};
		
		7'd52:code <={2'b10, temp[12][7:4]};
		7'd53:code <={2'b10, temp[12][3:0]};
		
		7'd54:code <={2'b10, temp[11][7:4]};
		7'd55:code <={2'b10, temp[11][3:0]};
		
		7'd56:code <={2'b10, temp[10][7:4]};
		7'd57:code <={2'b10, temp[10][3:0]};
		
		7'd58:code <={2'b10, temp[9][7:4]};
		7'd59:code <={2'b10, temp[9][3:0]};
		
		7'd60:code <={2'b10, temp[8][7:4]};
		7'd61:code <={2'b10, temp[8][3:0]};
		
		7'd62:code <={2'b10, temp[7][7:4]};
		7'd63:code <={2'b10, temp[7][3:0]};
		
		7'd64:code <={2'b10, temp[6][7:4]};
		7'd65:code <={2'b10, temp[6][3:0]};
		
		7'd66:code <={2'b10, temp[5][7:4]};
		7'd67:code <={2'b10, temp[5][3:0]};
		
		7'd68:code <={2'b10, temp[4][7:4]};
		7'd69:code <={2'b10, temp[4][3:0]};
		
		7'd70:code <={2'b10, temp[3][7:4]};
		7'd71:code <={2'b10, temp[3][3:0]};
		
		7'd72:code <={2'b10, temp[2][7:4]};
		7'd73:code <={2'b10, temp[2][3:0]};
		
		7'd74:code <={2'b10, temp[1][7:4]};
		7'd75:code <={2'b10, temp[1][3:0]};
		
		7'd76:code <={2'b10, temp[0][7:4]};
		7'd77:code <={2'b10, temp[0][3:0]};
		
		default : code <=6'h10;   ///busy flag
		endcase
		
		refresh <=lcd_count[20];  /// for enabling the lcd 
		sf_e <=1;      ///pin  "D16" of the fpga 1 for accessing the lcd
		
		{e,rs,r_w,d,c,b,a} <= {refresh,code};
		end

  always@(negedge clk2)
  begin		
  case(count2)
  
  5'd0: begin
        if(count1==3'b000)
	     mem[0][127:124]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][127:124]<=data_out1;
		  else 
		  mem[2][127:124]<=data_out1;
		  end
  5'd1: begin
        if(count1==3'b000)
	     mem[0][123:120]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][123:120]<=data_out1;
		  else 
		  mem[2][123:120]<=data_out1;
		  end
  5'd2: begin
        if(count1==3'b000)
	     mem[0][119:116]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][119:116]<=data_out1;
		  else 
		  mem[2][119:116]<=data_out1;
		  end
5'd3: begin
        if(count1==3'b000)
	     mem[0][115:112]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][115:112]<=data_out1;
		  else 
		  mem[2][115:112]<=data_out1;
		  end
5'd4: begin
        if(count1==3'b000)
	     mem[0][111:108]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][111:108]<=data_out1;
		  else 
		  mem[2][111:108]<=data_out1;
		  end
5'd5: begin
        if(count1==3'b000)
	     mem[0][107:104]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][107:104]<=data_out1;
		  else 
		  mem[2][107:104]<=data_out1;
		  end
5'd6: begin
        if(count1==3'b000)
	     mem[0][103:100]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][103:100]<=data_out1;
		  else 
		  mem[2][103:100]<=data_out1;
		  end
5'd7: begin
        if(count1==3'b000)
	     mem[0][99:96]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][99:96]<=data_out1;
		  else 
		  mem[2][99:96]<=data_out1;
		  end
5'd8: begin
        if(count1==3'b000)
	     mem[0][95:92]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][95:92]<=data_out1;
		  else 
		  mem[2][95:92]<=data_out1;
		  end
5'd9: begin
        if(count1==3'b000)
	     mem[0][91:88]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][91:88]<=data_out1;
		  else 
		  mem[2][91:88]<=data_out1;
		  end
5'd10: begin
        if(count1==3'b000)
	     mem[0][87:84]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][87:84]<=data_out1;
		  else 
		  mem[2][87:84]<=data_out1;
		  end
5'd11: begin
        if(count1==3'b000)
	     mem[0][83:80]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][83:80]<=data_out1;
		  else 
		  mem[2][83:80]<=data_out1;
		  end
5'd12: begin
        if(count1==3'b000)
	     mem[0][79:76]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][79:76]<=data_out1;
		  else 
		  mem[2][79:76]<=data_out1;
		  end
5'd13: begin
        if(count1==3'b000)
	     mem[0][75:72]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][75:72]<=data_out1;
		  else 
		  mem[2][75:72]<=data_out1;
		  end
5'd14: begin
        if(count1==3'b000)
	     mem[0][71:68]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][71:68]<=data_out1;
		  else 
		  mem[2][71:68]<=data_out1;
		  end
5'd15: begin
        if(count1==3'b000)
	     mem[0][67:64]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][67:64]<=data_out1;
		  else 
		  mem[2][67:64]<=data_out1;
		  end
5'd16: begin
        if(count1==3'b000)
	     mem[0][63:60]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][63:60]<=data_out1;
		  else 
		  mem[2][63:60]<=data_out1;
		  end
5'd17: begin
        if(count1==3'b000)
	     mem[0][59:56]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][59:56]<=data_out1;
		  else 
		  mem[2][59:56]<=data_out1;
		  end
5'd18: begin
        if(count1==3'b000)
	     mem[0][55:52]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][55:52]<=data_out1;
		  else 
		  mem[2][55:52]<=data_out1;
		  end
5'd19: begin
        if(count1==3'b000)
	     mem[0][51:48]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][51:48]<=data_out1;
		  else 
		  mem[2][51:48]<=data_out1;
		  end
5'd20: begin
        if(count1==3'b000)
	     mem[0][47:44]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][47:44]<=data_out1;
		  else 
		  mem[2][47:44]<=data_out1;
		  end
5'd21: begin
        if(count1==3'b000)
	     mem[0][43:40]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][43:40]<=data_out1;
		  else 
		  mem[2][43:40]<=data_out1;
		  end
5'd22: begin
        if(count1==3'b000)
	     mem[0][39:36]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][39:36]<=data_out1;
		  else 
		  mem[2][39:36]<=data_out1;
		  end	
5'd23: begin
        if(count1==3'b000)
	     mem[0][35:32]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][35:32]<=data_out1;
		  else 
		  mem[2][35:32]<=data_out1;
		  end
5'd24: begin
        if(count1==3'b000)
	     mem[0][31:28]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][31:28]<=data_out1;
		  else 
		  mem[2][31:28]<=data_out1;
		  end
5'd25: begin
        if(count1==3'b000)
	     mem[0][27:24]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][27:24]<=data_out1;
		  else 
		  mem[2][27:24]<=data_out1;
		  end
5'd26: begin
        if(count1==3'b000)
	     mem[0][23:20]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][23:20]<=data_out1;
		  else 
		  mem[2][23:20]<=data_out1;
		  end
5'd27: begin
        if(count1==3'b000)
	     mem[0][19:16]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][19:16]<=data_out1;
		  else 
		  mem[2][19:16]<=data_out1;
		  end
5'd28: begin
        if(count1==3'b000)
	     mem[0][15:12]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][15:12]<=data_out1;
		  else 
		  mem[2][15:12]<=data_out1;
		  end
5'd29: begin
        if(count1==3'b000)
	     mem[0][11:8]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][11:8]<=data_out1;
		  else 
		  mem[2][11:8]<=data_out1;
		  end
5'd30: begin
        if(count1==3'b000)
	     mem[0][7:4]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][7:4]<=data_out1;
		  else 
		  mem[2][7:4]<=data_out1;
		  end
5'd31: begin
        if(count1==3'b000)
	     mem[0][3:0]<=data_out1;
		  else if(count1==3'b001)
		  mem[1][3:0]<=data_out1;
		  else 
		  mem[2][3:0]<=data_out1;
		  end		  
  endcase	
end	  
	 
endmodule
