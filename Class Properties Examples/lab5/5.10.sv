class A;

    static task incr();
        int j; //automatic variable
        j++;
        $display("J is %d",j);
    endtask

endclass


program main;

    A obj_1;
    A obj_2;

    initial begin
        $display("Static task - static task with automatic variables");
        obj_1 = new();
        obj_2 = new();
        obj_1.incr();
        obj_2.incr();
        obj_1.incr();
        obj_2.incr();
        obj_1.incr();
        $display("Static task - Each call to task will create a separate copy of 'j' and increment it");
    end

endprogram
