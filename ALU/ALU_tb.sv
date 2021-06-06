`timescale 1ns / 1ps
program ALU_tb(ALU_inter.TB T1);
    class random;
    rand bit [3:0] a, b;
    rand bit [2:0] opcode;
    constraint C1 {opcode inside {[5:7],3};}
    constraint C2 {a inside {[1:10],15};}
    constraint C3 {b>0;b<14;}
endclass
random input_data=new();
    initial
    begin
        T1.reset<=0;
        #10 T1.reset<=1;
        #10 T1.reset<=0;
        #10 T1.cb.opcode<=3'd3;
        #10 T1.cb.b<=4'd0;
        #10 T1.cb.a<=4'd8;end
        initial begin
            repeat(100)
            begin
            if(input_data.randomize())
            begin
            #60 T1.cb.a<= input_data.a;
            T1.cb.b<= input_data.b;
            T1.cb.opcode<= input_data.opcode;
        end
    else
        $display("Data not randomized");
    end
    end
endprogram