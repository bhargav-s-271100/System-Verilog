
`timescale 1ns / 1ps
module top();
    bit clk;
    always #5 clk=~clk;
    inter intf(clk);
    Moore_1001 f1(.clk(clk), .reset(intf.reset), .in(intf.in), .ns(intf.ns), .ps(intf.ps), .q(intf.q));
    test tb(intf);
    initial begin
        $dumpfile("top.vcd");
        $dumpvars;
        $monitor($time,"clk=%b, reset=%b, in=%b, ns=%b, ps=%b, q=%b",clk, intf.reset, intf.in, intf.ns, intf.ps, intf.q);
    end 
endmodule
