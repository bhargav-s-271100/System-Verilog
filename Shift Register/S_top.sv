
`timescale 1ns / 1ps
module top;
bit clk;
S_inter Ia (clk);
shift_reg DUT(.clk(clk), .reset(Ia.reset), .serial_in(Ia.serial_in), .parallel_in(Ia.parallel_in), .select(Ia.select), .out(Ia.out));
S_tb TB1 (Ia.TB);
always #5 clk=~clk;
initial begin
    $dumpfile("top.vcd");
    $dumpvars;
    $monitor("time=%d, clk=%b, reset=%b, serial_in=%b, parallel_in=%b, select=%b, out=%b", $time, clk, Ia.reset, Ia.serial_in,
    Ia.parallel_in, Ia.select, Ia.out);
    #200 $finish;
end
endmodule