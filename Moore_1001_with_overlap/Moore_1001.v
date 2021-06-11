
`timescale 1ns / 1ps
module Moore_1001(in,clk,reset,q,ps,ns); //module declaration
    input in,clk,reset;
    output q; //i/o port declaration
    reg q;
    output reg [2:0]ps,ns; // present and next state declaration
    
parameter [1:0] a=3'b000, b=3'b001, c=3'b010, d=3'b011, e=3'b100; //declaring the parameters

// behavioural logic to implement the present state logic
always @(posedge clk, posedge reset) 
    begin
        if(reset)
            ps<=a;
        else
            ps<=ns;
    end
    
// behavioural logic to implement the combinational next state logic and detect the 1100 sequence
always @(in or ps) 
    begin
        case(ps)
            a:  ns = in ? b : a;
            b:  ns = in ? b : c;
            c:  ns = in ? b : d;
            d:  ns = in ? e : a;
            e:  ns = in ? b : c;
            default:    ns = a;
        endcase
    end
    
//behavioural logic for output block
always@(ps,in)
    q <= ps==e;
 
endmodule
