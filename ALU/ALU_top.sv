`timescale 1ns / 1ps
module ALU_top;
    bit clk;
    ALU_inter i1(clk);
    ALU Dut( .clk(clk), .reset(i1.reset), .a(i1.a), .b(i1.b), .c(i1.c), .opcode(i1.opcode));
    ALU_tb T1(i1);
    always #5 clk=~clk;
    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars;
        $monitor("time=%d, clk=%b, reset=%b, a=%b,b=%b,opcode=%b, c=%b", $time, clk, i1.reset,i1.a,i1.b,i1.opcode,
        i1.c);
        #500
        $finish; 
    end 
endmodule
