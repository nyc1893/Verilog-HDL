
`timescale 1ns/1ns

module cc_400tb;





reg clk;
reg rst_n;

reg  read_out;
reg start;
wire [7:0]num;
wire [7:0]num_random;
wire [7:0] o_selectable1;
wire [7:0] o_selectable2;
wire state;

wire [7:0]wren;

always 
begin
#6 clk=~clk;
end

initial
begin
clk=0;
rst_n=1;

read_out=0;
start=0;
#55 rst_n=0;
#25 rst_n=1;
#55 start=1;

#250
repeat(100)
begin
#800 read_out=1;
#200 read_out=0;

end
end

cc_400 u1(
clk,
rst_n,
num_random,//test port
num,//num out
start,
read_out,
state,
o_selectable1,
o_selectable2,
wren
);
endmodule
