`timescale 1ns / 1ps
interface J_inter(input bit clk);
    logic j,k,reset,set, clk_=clk;
    logic q;
    modport test1(input q,output clk_, j, k, reset,set);
endinterface: J_inter