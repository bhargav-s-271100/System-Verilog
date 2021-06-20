
program test(inter.tb T1);

    initial begin
        T1.reset<=0;
        #20
        T1.reset<=1;
        #20
        T1.reset<=0;
        #500
        $finish;
    end

endprogram: test

