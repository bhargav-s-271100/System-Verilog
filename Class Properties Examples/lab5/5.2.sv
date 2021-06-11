class parent;

    task printf();
        $display(" THIS IS PARENT CLASS ");
    endtask

endclass


class subclass extends parent;

    task printf();
        super.printf();
    endtask

endclass


program main;
    initial begin
        subclass s;
        s = new();
        s.printf();
    end
endprogram
