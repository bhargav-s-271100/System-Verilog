class A;

    task disp();
        $display(" This is class A ");
    endtask

endclass


class EA extends A;

    task disp ();
        $display(" This is Extended class A ");
    endtask

endclass


program main;

    EA my_ea;
    A my_a;
    
    initial begin
        my_a = new();
        my_a.disp();
        my_ea = new();
        my_a = my_ea;
        my_a.disp();
    end
    
endprogram
