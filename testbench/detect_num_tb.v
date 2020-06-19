`timescale 1ns/1ns

module detect_num_tb;


reg [31:0]din;
wire [31:0]dout_1;
wire [31:0]dout_0;


initial 
begin
		din=0;
	
		repeat(50)
		begin
		#100 din={$random}%4294967290;
		end
		
		
end
	
	detect_num  u1(
din,
dout_1,
dout_0
);
endmodule
