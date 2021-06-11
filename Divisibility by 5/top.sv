
`timescale 1ns / 1ps
module top();
    bit clk;
    always #5 clk=~clk;
    inter intf(clk);
    Divisibility_by_5 f1(.clk(clk), .reset(intf.reset), .in(intf.in), .next_state(intf.ns), .present_state(intf.ps), .q(intf.q));
    tb tb(intf);
    initial begin
        $dumpfile("top.vcd");
        $dumpvars;
        $monitor($time,"clk=%b, reset=%b, in=%b, ns=%b, ps=%b, q=%b",clk, intf.reset, intf.in, intf.ns, intf.ps, intf.q);
    end 
endmodule
