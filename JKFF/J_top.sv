`timescale 1ns / 1ps

module J_top;
    bit clk;
    J_inter i1(clk);
    JKFF Dut(.clk(clk),.j(i1.j),.k(i1.k),.reset(i1.reset),.set(i1.set),.q(i1.q));
    J_tb T1(i1);
    always #5 clk=~clk;
    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars;
        $monitor("time=%d, clk=%b, reset=%b,set=%b, j=%b, k=%b, q=%b", $time, clk, i1.reset, i1.set,
        i1.j, i1.k, i1.q);
    end
endmodule
