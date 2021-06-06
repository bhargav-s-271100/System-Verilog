`timescale 1ns / 1ps
module ALU(input clk, reset, input [3:0]
a,b , input [2:0] opcode, output reg [7:0]
c);
    always@(posedge clk, posedge reset)
    begin
    if(reset)
        c<=8'd0;
    else
        case(opcode)
            3'd0: c<=a+b;
            3'd1: c<=a-b;
            3'd2: c<=a*b;
            3'd3: begin 
                if (b!=0) c<=a/b; 
                else c<=8'dx; end
            3'd4: c<=a&b;
            3'd5: c<=a|b;
            3'd6: c<=a^b;
            3'd7: c<=~a;
            default: c<=8'dx;
        endcase
    end
endmodule
