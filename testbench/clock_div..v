module clock_div(
clk,
rst_n,
CTRL_CLK


);

input clk;
input rst_n;
output reg CTRL_CLK;
assign CLOCK=clk;
assign RESET=rst_n;
reg [10:0]CLK_DIV;
always@(posedge CLOCK or negedge RESET)
begin
	if(!RESET)
	begin
		CTRL_CLK	<=	0;
		CLK_DIV	<=	0;
		
	end
	else
	begin

		if( CLK_DIV	< (500)) //50*2=100 clock div
		CLK_DIV	<=	CLK_DIV+1;
		else
		begin
			CLK_DIV	<=	0;
			CTRL_CLK	<=	~CTRL_CLK;
		end
	end
end
endmodule 
