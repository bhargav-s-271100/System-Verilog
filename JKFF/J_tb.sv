`timescale 1ns / 1ps
module J_tb(J_inter.test1 t1);
    initial begin
        t1.reset=0;t1.set=0;
        t1.j=0;t1.k=0;
        #10
        t1.reset=1;t1.set=1;
        t1.j=0;t1.k=0;
        #10
        t1.reset=0;
        t1.j=0;t1.k=0;
        #10
        t1.j=0;t1.k=0;t1.set=0;
        #20
        t1.j=0;t1.k=1;
        #20
        t1.j=1;t1.k=0;
        #20
        t1.j=1;t1.k=1;
        #60
    $finish;
    end
endmodule
