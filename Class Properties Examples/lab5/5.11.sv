class A;

    task static incr();
        int i; //static variable
        $display(" i is %d ",i);
        i++;
    endtask

endclass


program main;

    A a;
    A b;

    initial begin
        $display("Static lifetime - non static task with static variables");
        a = new();
        b = new();
        a.incr();
        b.incr();
        a.incr();
        b.incr();
        a.incr();
        $display("Static lifetime - Each call to task will use a single value of ‘i' and increment it");
    end

endprogram
