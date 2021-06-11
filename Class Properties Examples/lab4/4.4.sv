//Randomize function
program main1;

    initial begin
        int a;

        repeat(50) begin
        #10
        if(randomize(a))
            $display("a=%2b\n", a);
        else
            $display("error");
        end
    end

endprogram
