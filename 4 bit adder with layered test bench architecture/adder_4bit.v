
module adder_4bit(input clk, reset, valid,cin, 
                    input [3:0]a, b, output reg [4:0]c);
  always@(posedge clk, posedge reset)
    begin
      if(reset)
        c<=5'd0;
      else
        begin
          if(valid)
            c<=a+b+cin;
          else
            c<=5'bzzzzz;
        end
    end
endmodule


