
interface S_inter( input bit clk);
    logic reset, serial_in;
    logic [3:0] parallel_in, out;
    logic [1:0] select;

    clocking cb@(posedge clk);
        default input #2ns output #3ns;
        output serial_in, parallel_in, select;
    endclocking
    modport TB(clocking cb, output reset, output out);
endinterface
