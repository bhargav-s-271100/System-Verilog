`timescale 1ns / 1ps
interface DFF_inter(input bit clk);
    logic d,reset,set, clk_=clk;
    logic q;
    modport test1(input q,output clk_, d, reset,set);
    endinterface: DFF_inter