`timescale 1ns / 1ps
module top;
    bit clk;
    DFF_inter i1(clk);
    DFF Dut(.clk(clk),.d(i1.d),.reset(i1.reset),.set(i1.set),.q(i1.q));
    DFF_tb T1(i1);
    always #5 clk=~clk;
    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars;
        $monitor("time=%d, clk=%b, reset=%b,set=%b, d=%b, q=%b", $time, clk, i1.reset, i1.set,
        i1.d, i1.q);
    end
endmodule