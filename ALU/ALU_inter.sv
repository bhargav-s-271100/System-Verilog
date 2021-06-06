`timescale 1ns / 1ps
interface ALU_inter( input bit clk);
    logic reset;
    logic [3:0] a,b;
    logic [2:0] opcode;
    logic [7:0] c;
    clocking cb@(posedge clk);
        default input #2ns output #3ns;
        output a, b, opcode;
    endclocking
    modport TB(clocking cb, output reset);
endinterface