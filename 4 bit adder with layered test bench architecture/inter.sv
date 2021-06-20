
interface inter (input bit clk);
  bit valid,reset,cin;
  bit [3:0]a,b;
  bit [4:0]c;
  
  clocking cb@(posedge clk);
    default input #2 output #2;
    output valid, a, b,cin;
    input c;
  endclocking
  
  modport tb(output reset, clocking cb);
endinterface

