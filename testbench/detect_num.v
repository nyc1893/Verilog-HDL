module detect_num(

din,
dout_1,
dout_0
);


input [31:0]din;
output [31:0]dout_1;
output [31:0]dout_0;
assign dout_1=din[31]+din[30]+din[29]+din[28]+din[27]+din[26]+din[25]+din[24]+din[23]+din[22]
+din[21]+din[20]+din[19]+din[18]+din[17]+din[16]+din[15]+din[14]+din[13]+din[12]+din[11]
+din[10]+din[9]+din[8]+din[7]+din[6]+din[5]+din[4]+din[3]+din[2]+din[1]+din[0];

assign dout_0=32-dout_1;

endmodule
