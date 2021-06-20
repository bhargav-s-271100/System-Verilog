interface inter (input bit clk);
    bit in, reset;
    bit [2:0] ns,ps;
    bit q;
    clocking cbi @(posedge clk);
        default input #2ns output #3ns;
        input q;
        input ns,ps;
        output in;
    endclocking
    modport mod_test(clocking cbi, input clk, output reset);
endinterface