class A;

    static int i;

endclass


program main;

    A obj_1;

    initial begin
        obj_1 = new();
        obj_1.i = 123;
        $display(A::i);
    end
    
endprogram