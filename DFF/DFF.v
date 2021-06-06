`timescale 1ns / 1ps
module DFF(input clk, d, reset,set, output reg q);
always@(posedge clk, posedge reset)
begin
if(reset)
q<=0;
else if (set)
q<=1;
else
q<=d;
end
endmodule