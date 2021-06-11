class A;

    static int i;

endclass


program main ;

    A obj_1;
    A obj_2;

    initial begin
        obj_1 = new();
        obj_2 = new();
        obj_1.i = 123;
        $display(obj_2.i);
    end

endprogram