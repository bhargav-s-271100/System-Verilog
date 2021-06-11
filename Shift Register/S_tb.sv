class transactor;
    rand bit serial_in;
    rand bit [3:0] parallel_in;
    rand bit [1:0] select;
    constraint C1 {select inside {[0:3]};}
    constraint C2 {parallel_in inside {[0:15]};}
    constraint C3 {serial_in inside {0,1};}
endclass

class driver;
    transactor tx;
    virtual S_inter.TB i1;
    function new(virtual S_inter.TB i1_new);
        this.i1=i1_new;
        this.tx=new();
        $display ("%d : Driver: new method created", $time);
    endfunction
    task drive_data();
        begin
        repeat(20) @( i1.cb)
        begin
        if((tx.randomize()))
        begin
            i1.cb.serial_in <= tx.serial_in;
            i1.cb.parallel_in <= tx.parallel_in;
            i1.cb.select <= tx.select;
//            $display("%d : driver: sent A=%b, B=%b and opcode=%b",
//            $time, i1.cb.a,i1.cb.b,i1.cb.opcode);
        end
        else
            $display("%d : Randomization error", $time);
        end
        end
    endtask
endclass

program S_tb(S_inter.TB itb);
    driver drv=new(itb);
    initial begin
        itb.reset<=1;
        #10 itb.reset<=0;
    end
    initial begin
        drv.drive_data();
    end
endprogram
