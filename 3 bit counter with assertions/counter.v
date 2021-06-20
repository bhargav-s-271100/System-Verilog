
`timescale 1ns / 1ps
module counter(input clk,reset, output reg [2:0] c);

    always@(posedge clk, posedge reset) begin
        if(reset)
            c<=3'b000;
        else
            c <= c+1;
    end

endmodule

