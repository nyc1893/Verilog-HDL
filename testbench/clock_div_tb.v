`timescale 1ns/1ns

module clock_div_tb;

reg clk;
reg rst_n;
wire CTRL_CLK,CTRL_CLK2;
always begin
  #10 clk=~clk;
end

initial 
begin

   clk=0;
   rst_n=0;
  #50 rst_n=1;


end





clock_div  hh2(
.clk      (clk),
.rst_n    (rst_n),
.CTRL_CLK (CTRL_CLK)

);

clock_div  hh3(
.clk      (CTRL_CLK),
.rst_n    (rst_n),
.CTRL_CLK (CTRL_CLK2)

);

endmodule 
