
class transactor;
    rand bit in;
    constraint c1 {in inside {0,1};}
endclass: transactor

class driver;
    transactor tx;
    virtual inter.mod_test intf_o;
    covergroup cg;
        in: coverpoint intf_o.in{
        bins t0={0};
        bins t1={1};}
        reset: coverpoint intf_o.reset{
        bins r1={0};}
        ns: coverpoint intf_o.cbi.ns{
        bins t2[]={0,1};
        bins t3[]={2,3};}
        ps: coverpoint intf_o.cbi.ps{
        bins t4[]={0,1};
        bins t5[]={2,3};}
        q: coverpoint intf_o.cbi.q;
    endgroup
    function new(virtual inter.mod_test intf_o_new);
        this.intf_o=intf_o_new;
        this.cg=new();
    endfunction: new
    task drive_data();
        tx=new();
        if(!(tx.randomize()))
            $display("%0d : Randomization Error", $time);
        else
        begin
            intf_o.in<=tx.in;
            cg.sample();
        end
    endtask: drive_data
endclass: driver

program test(inter.mod_test intf_o);
    driver drv;
    initial begin
        #5 intf_o.reset<=1;
        #10 intf_o.reset<=0;
    end
    initial begin
        drv=new(intf_o);
        repeat(100)@(intf_o.cbi)
            drv.drive_data(); 
    end
endprogram: test

