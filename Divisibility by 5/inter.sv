
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
    
    sequence s1;
        (reset==0) ##[0:$](q==1'b1);
    endsequence
    
    property p1;
        @(posedge clk) s1;
    endproperty:p1
    
    a1:assert property (p1)
        $display("output q=1 and input bitstream is divisible by 5, P1 passed");
        else $display("P1 failed");
        
    property p2;
        @(posedge clk) (reset==1)|-> (q==1'b0);
    endproperty:p2
    
    a2: assert property(p2) 
    $display("fsm reset,P2 passed");
    else $display("P2 failed");
    
endinterface

