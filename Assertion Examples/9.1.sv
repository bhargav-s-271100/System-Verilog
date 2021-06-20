module test;

    bit a, b;
    bit clk;

    always #5 clk = ~clk;

    initial begin
        repeat(20) @(posedge clk) begin
            {a, b} = $random;
            $display($time, " a=%b, b=%b", a, b);
        end

        #50 $finish;
    end

    initial begin
        $dumpfile("top.vcd");
        $dumpvars;
    end

    sequence s1;
        a ##1 b;
    endsequence

    property p1;
        @(posedge clk) s1;
    endproperty

    assert property (p1)
        $display("P1 passed at", $time);
    else
        $error("P1 failed at ", $time);

endmodule
