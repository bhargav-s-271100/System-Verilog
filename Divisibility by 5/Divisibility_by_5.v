
`timescale 1ns / 1ps
module Divisibility_by_5(output reg q, output reg [2:0]present_state, next_state, input clk, reset, in);
  
  parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
  
  //present state block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	present_state <= s0;
      else
        present_state <= next_state;
    end
  
  //next state and output block
  always @(*)
    begin 
      case(present_state)
        s0: next_state <= in ? s1 : s0;
        s1: next_state <= in ? s3 : s2;
        s2: next_state <= in ? s0 : s4;
        s3: next_state <= in ? s2 : s1;
        s4: next_state <= in ? s4 : s3;
        default: next_state <= s0;
      endcase
    end
  
  //output block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	q <= 1'b0;
      else
        q <= (~in && (present_state == s0)) || (in && (present_state == s2));
    end  
endmodule       
