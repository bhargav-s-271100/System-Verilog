
interface inter (input bit clk);

    logic reset;
    logic [2:0] c;
    modport tb(output reset);

    sequence s1;
        (reset==0) ##[0:$](c==3'd5);
    endsequence

    property p1;
        @(posedge clk) s1;
    endproperty:p1

    a1:assert property (p1)
        $display("count=5,P1 passed");
    else 
        $display("P1 failed");

    property p2;
        @(posedge clk) (reset==1)|-> (c==3'b000);
    endproperty:p2

    a2: assert property(p2) 
        $display("counter reset,P2 passed");
    else 
        $display("P2 failed");

endinterface

