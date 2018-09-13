`timescale 1ns / 1ps

module subbyte(in,out);

input wire [7:0] in;
output  reg [7:0] out;
 always@(in[7:0])
 begin
 case(in[7:0])
 8'd0:out<=8'h63;
 8'd1:out<=8'h7c;
 8'd2:out<=8'h77;
 8'd3:out<=8'h7b;
 8'd4:out<=8'hf2;
 8'd5:out<=8'h6b;
 8'd6:out<=8'h6f;
 8'd7:out<=8'hc5;
 8'd8:out<=8'h30;
 8'd9:out<=8'h01;
 8'd10:out<=8'h67;
 8'd11:out<=8'h2b;
 8'd12:out<=8'hfe;
 8'd13:out<=8'hd7;
 8'd14:out<=8'hab;
 8'd15:out<=8'h76;
 8'd16:out<=8'hca;
 8'd17:out<=8'h82;
 8'd18:out<=8'hc9;
 8'd19:out<=8'h7d;
 8'd20:out<=8'hfa;
 8'd21:out<=8'h59;
 8'd22:out<=8'h47;
 8'd23:out<=8'hf0;
 8'd24:out<=8'had;
 8'd25:out<=8'hd4;
 8'd26:out<=8'ha2;
 8'd27:out<=8'haf;
 8'd28:out<=8'h9c;
 8'd29:out<=8'ha4;
 8'd30:out<=8'h72;
 8'd31:out<=8'hc0;
 8'd32:out<=8'hb7;
 8'd33:out<=8'hfd;
 8'd34:out<=8'h93;
 8'd35:out<=8'h26;
 8'd36:out<=8'h36;
 8'd37:out<=8'h3f;
 8'd38:out<=8'hf7;
 8'd39:out<=8'hcc;
 8'd40:out<=8'h34;
 8'd41:out<=8'ha5;
 8'd42:out<=8'he5;
 8'd43:out<=8'hf1;
 8'd44:out<=8'h71;
 8'd45:out<=8'hd8;
 8'd46:out<=8'h31;
 8'd47:out<=8'h15;
 8'd48:out<=8'h04;
 8'd49:out<=8'hc7;
 8'd50:out<=8'h23;
 8'd51:out<=8'hc3;
 8'd52:out<=8'h18;
 8'd53:out<=8'h96;
 8'd54:out<=8'h05;
 8'd55:out<=8'h9a;
 8'd56:out<=8'h07;
 8'd57:out<=8'h12;
 8'd58:out<=8'h80;
 8'd59:out<=8'he2;
 8'd60:out<=8'heb;
 8'd61:out<=8'h27;
 8'd62:out<=8'hb2;
 8'd63:out<=8'h75;
 8'd64:out<=8'h09;
 8'd65:out<=8'h83;
 8'd66:out<=8'h2c;
 8'd67:out<=8'h1a;
 8'd68:out<=8'h1b;
 8'd69:out<=8'h6e;
 8'd70:out<=8'h5a;
 8'd71:out<=8'ha0;
 8'd72:out<=8'h52;
 8'd73:out<=8'h3b;
 8'd74:out<=8'hd6;
 8'd75:out<=8'hb3;
 8'd76:out<=8'h29;
 8'd77:out<=8'he3;
 8'd78:out<=8'h2f;
 8'd79:out<=8'h84;
 8'd80:out<=8'h53;
 8'd81:out<=8'hd1;
 8'd82:out<=8'h00;
 8'd83:out<=8'hed;
 8'd84:out<=8'h20;
 8'd85:out<=8'hfc;
 8'd86:out<=8'hb1;
 8'd87:out<=8'h5b;
 8'd88:out<=8'h6a;
 8'd89:out<=8'hcb;
 8'd90:out<=8'hbe;
 8'd91:out<=8'h39;
 8'd92:out<=8'h4a;
 8'd93:out<=8'h4c;
 8'd94:out<=8'h58;
 8'd95:out<=8'hcf;
 8'd96:out<=8'hd0;
 8'd97:out<=8'hef;
 8'd98:out<=8'haa;
 8'd99:out<=8'hfb;
 8'd100:out<=8'h43;
 8'd101:out<=8'h4d;
 8'd102:out<=8'h33;
 8'd103:out<=8'h85;
 8'd104:out<=8'h45;
 8'd105:out<=8'hf9;
 8'd106:out<=8'h02;
 8'd107:out<=8'h7f;
 8'd108:out<=8'h50;
 8'd109:out<=8'h3c;
 8'd110:out<=8'h9f;
 8'd111:out<=8'ha8;
 8'd112:out<=8'h51;
 8'd113:out<=8'ha3;
 8'd114:out<=8'h40;
 8'd115:out<=8'h8f;
 8'd116:out<=8'h92;
 8'd117:out<=8'h9d;
 8'd118:out<=8'h38;
 8'd119:out<=8'hf5;
 8'd120:out<=8'hbc;
 8'd121:out<=8'hb6;
 8'd122:out<=8'hda;
 8'd123:out<=8'h21;
 8'd124:out<=8'h10;
 8'd125:out<=8'hff;
 8'd126:out<=8'hf3;
 8'd127:out<=8'hd2;
 8'd128:out<=8'hcd;
 8'd129:out<=8'h0c;
 8'd130:out<=8'h13;
 8'd131:out<=8'hec;
 8'd132:out<=8'h5f;
 8'd133:out<=8'h97;
 8'd134:out<=8'h44;
 8'd135:out<=8'h17;
 8'd136:out<=8'hc4;
 8'd137:out<=8'ha7;
 8'd138:out<=8'h7e;
 8'd139:out<=8'h3d;
 8'd140:out<=8'h64;
 8'd141:out<=8'h5d;
 8'd142:out<=8'h19;
 8'd143:out<=8'h73;
 8'd144:out<=8'h60;
 8'd145:out<=8'h81;
 8'd146:out<=8'h4f;
 8'd147:out<=8'hdc;
 8'd148:out<=8'h22;
 8'd149:out<=8'h2a;
 8'd150:out<=8'h90;
 8'd151:out<=8'h88;
 8'd152:out<=8'h46;
 8'd153:out<=8'hee;
 8'd154:out<=8'hb8;
 8'd155:out<=8'h14;
 8'd156:out<=8'hde;
 8'd157:out<=8'h5e;
 8'd158:out<=8'h0b;
 8'd159:out<=8'hdb;
 8'd160:out<=8'he0;
 8'd161:out<=8'h32;
 8'd162:out<=8'h3a;
 8'd163:out<=8'h0a;
 8'd164:out<=8'h49;
 8'd165:out<=8'h06;
 8'd166:out<=8'h24;
 8'd167:out<=8'h5c;
 8'd168:out<=8'hc2;
 8'd169:out<=8'hd3;
 8'd170:out<=8'hac;
 8'd171:out<=8'h62;
 8'd172:out<=8'h91;
 8'd173:out<=8'h95;
 8'd174:out<=8'he4;
 8'd175:out<=8'h79;
 8'd176:out<=8'he7;
 8'd177:out<=8'hc8;
 8'd178:out<=8'h37;
 8'd179:out<=8'h6d;
 8'd180:out<=8'h8d;
 8'd181:out<=8'hd5;
 8'd182:out<=8'h4e;
 8'd183:out<=8'ha9;
 8'd184:out<=8'h6c;
 8'd185:out<=8'h56;
 8'd186:out<=8'hf4;
 8'd187:out<=8'hea;
 8'd188:out<=8'h65;
 8'd189:out<=8'h7a;
 8'd190:out<=8'hae;
 8'd191:out<=8'h0a;
 8'd192:out<=8'hba;
 8'd193:out<=8'h78;
 8'd194:out<=8'h25;
 8'd195:out<=8'h2e;
 8'd196:out<=8'h1c;
 8'd197:out<=8'ha6;
 8'd198:out<=8'hb4;
 8'd199:out<=8'hc6;
 8'd200:out<=8'he8;
 8'd201:out<=8'hdd;
 8'd202:out<=8'h74;
 8'd203:out<=8'h1f;
 8'd204:out<=8'h4b;
 8'd205:out<=8'hbd;
 8'd206:out<=8'h8b;
 8'd207:out<=8'h8a;
 8'd208:out<=8'h70;
 8'd209:out<=8'h3e;
 8'd210:out<=8'hb5;
 8'd211:out<=8'h66;
 8'd212:out<=8'h48;
 8'd213:out<=8'h03;
 8'd214:out<=8'hf6;
 8'd215:out<=8'h0e;
 8'd216:out<=8'h61;
 8'd217:out<=8'h35;
 8'd218:out<=8'h57;
 8'd219:out<=8'hb9;
 8'd220:out<=8'h86;
 8'd221:out<=8'hc1;
 8'd222:out<=8'h1d;
 8'd223:out<=8'h9e;
 8'd224:out<=8'he1;
 8'd225:out<=8'hf8;
 8'd226:out<=8'h98;
 8'd227:out<=8'h11;
 8'd228:out<=8'h69;
 8'd229:out<=8'hd9;
 8'd230:out<=8'h8e;
 8'd231:out<=8'h94;
 8'd232:out<=8'h9b;
 8'd233:out<=8'h1e;
 8'd234:out<=8'h87;
 8'd235:out<=8'he9;
 8'd236:out<=8'hce;
 8'd237:out<=8'h55;
 8'd238:out<=8'h28;
 8'd239:out<=8'hdf;
 8'd240:out<=8'h8c;
 8'd241:out<=8'ha1;
 8'd242:out<=8'h89;
 8'd243:out<=8'h0d;
 8'd244:out<=8'hbf;
 8'd245:out<=8'he6;
 8'd246:out<=8'h42;
 8'd247:out<=8'h68;
 8'd248:out<=8'h41;
 8'd249:out<=8'h99;
 8'd250:out<=8'h2d;
 8'd251:out<=8'h0f;
 8'd252:out<=8'hb0;
 8'd253:out<=8'h54;
 8'd254:out<=8'hbb;
 8'd255:out<=8'h16;
 endcase
 end
 
	
 
  
 
 
 
 
 
 

 
 
 
  


endmodule
