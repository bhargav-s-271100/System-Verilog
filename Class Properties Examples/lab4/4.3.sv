program main1;

    initial begin
        int a;

        repeat(50) begin
            #10 a=$random; //or #10 a=$urandom_range(0,70);
            $display("a=%d\n", a);
        end
    end

endprogram