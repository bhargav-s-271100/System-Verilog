`timescale 1ns / 1ps
module DFF_tb(DFF_inter.test1 t1);
    initial begin
        t1.reset=0;t1.set=0;
        t1.d=0;
        #10
        t1.reset=1;t1.set=1;
        t1.d=0;
        #10
        t1.reset=0;
        t1.d=0;
        #10
        t1.d=1;t1.set=0;
        #10
        t1.d=0;
        #10
        t1.d=1;
        #10
        t1.d=0;
        #100
    $finish;
    end
endmodule