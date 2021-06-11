class parent;

    task printf();
        $display(" THIS IS PARENT CLASS ");
    endtask

endclass

class subclass extends parent;

    task printf();
        $display(" THIS IS SUBCLASS ");
    endtask

endclass

program main4;

    initial begin
        parent p;
        subclass s;

        p = new();
        s = new();

        p.printf();
        s.printf();
    end

endprogram