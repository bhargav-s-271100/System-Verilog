class base;

    int N = 3;

    function int get_N();
        return N;
    endfunction

endclass


class ext extends base;
    
    int N = 4;
    
    function int get_N();
        return N;
    endfunction
    
    function int get_N1();
        return super.N;
    endfunction

endclass


program main;

    initial begin
        ext e = new();
        base b = e; // Note same object!

        $display(b.get_N()); // "3"
        $display(e.get_N()); // "4"
        $display(e.get_N1()); // "3" - super.N
    end

endprogram
