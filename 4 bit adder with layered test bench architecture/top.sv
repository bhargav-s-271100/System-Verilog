
//top module
module top;
  bit clk;
  always #5 clk=~clk;
  inter i1(clk);
  test Test_b(i1);
  adder_4bit A1(clk, i1.reset, i1.valid,i1.cin, i1.a, i1.b, i1.c);
  initial
    begin
      $dumpfile("top.vcd");
      $dumpvars();
      $monitor($time, "clk=%d, reset=%d, valid=%d,a=%d,b=%d, cin=%d, c=%d",
                    clk,i1.reset,i1.valid, i1.a,i1.b,i1.cin,i1.c);
      #500 $finish;
    end
endmodule

