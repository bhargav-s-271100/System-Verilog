
module top();

    bit clk;

    always #5 clk=~clk;

    inter intf(clk);
    counter f1(.clk(clk),.reset(intf.reset),.c(intf.c));
    test tb(intf);

    initial begin
        // dump *everything*
        $dumpfile("top.vcd");
        $dumpvars;
        $shm_open( "top.shm",,,0);
        $shm_probe( "AC", top );
    end

endmodule

