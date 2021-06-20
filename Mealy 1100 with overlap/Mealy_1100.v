
`timescale 1ns / 1ps
module Mealy_1100(in,clk,reset,q,ps,ns); //module declaration
    input in,clk,reset;
    output q; //i/o port declaration
    reg q;
    output reg [1:0]ps,ns; // present and next state declaration
    //declaring the parameters
    parameter [1:0] a=2'b00, b=2'b01, c=2'b10, d=2'b11; 
    
    // behavioural logic to implement the present state logic
    always @(posedge clk, posedge reset) 
        begin
            if(reset)
                ps<=a;
            else
                ps<=ns;
        end
        
    // behavioural logic to implement the combinational 
    //next state logic and detect the 1100 sequence
    always @(in or ps) 
        begin
            case(ps)
                a:  ns = in ? b : a;
                b:  ns = in ? c : a;
                c:  ns = in ? c : d;
                d:  ns = in ? b : a;
                default:    ns=a;
            endcase
        end
        
    //behavioural logic for output block
    always@(ps,in)
        q <= (ps==d)&&(in==1'b0);
     
endmodule

