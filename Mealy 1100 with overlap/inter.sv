
interface inter (input bit clk);
    bit in, reset;
    bit [1:0] ns,ps;
    bit q;
    clocking cbi @(posedge clk);
        default input #2ns output #3ns;
        input q;
        input ns,ps;
    endclocking
    modport mod_test(clocking cbi, input clk, output reset, in);
endinterface

