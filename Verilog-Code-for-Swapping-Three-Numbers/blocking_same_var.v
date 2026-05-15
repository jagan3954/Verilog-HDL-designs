`timescale 1ns/1ps
module blocking_same_var;
  reg clk;
  reg [3:0] a, b, c;

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    a = 4'd8;
    b = 4'd7;
    c = 4'd6;
  end

  always @(posedge clk) begin
    a = b; // a gets value of b
    b = c; // b gets value of c
    c = a; // c gets value of the *new* a (which was b)
  end
endmodule