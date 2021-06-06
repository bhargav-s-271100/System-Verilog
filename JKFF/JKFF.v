`timescale 1ns / 1ps
module JKFF(input clk, j, k, reset,set, output reg q);
always@(posedge clk, posedge reset)
    begin
        if(reset)
            q<=0;
        else if (set)
            q<=1;
        else
            case ({j,k})  
                 2'b00 :  q <= q;  
                 2'b01 :  q <= 0;  
                 2'b10 :  q <= 1;  
                 2'b11 :  q <= ~q;  
              endcase  
    end
endmodule