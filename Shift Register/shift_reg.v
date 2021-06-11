
`timescale 1ns / 1ps
module shift_reg(input [1:0] select, input [3:0] parallel_in, input serial_in, clk, reset, output reg [3:0] out);
    
  always @(posedge clk or posedge reset)
    begin
            if (reset == 1)
                out <= 4'b0000;
            else 
              case(select)
                2'b00: begin //right shift
                  	out[0] <= serial_in;
                    out[3:1] <= out[2:0];
            		end
                2'b01: begin //left shift
                	out[3] <= serial_in;
                    out[2:0] <= out[3:1];
            		end
                2'b10: out <= parallel_in; // parallel in
            	default: out <= out; //Hold the previous value of output
              endcase
    end
endmodule