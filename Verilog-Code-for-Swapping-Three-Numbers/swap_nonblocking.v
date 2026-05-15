`timescale 1ns/1ps
module swap_nonblocking(input [3:0] a, b, c, input clk, output reg [3:0] aout, bout, cout);

// Implementation using non-blocking assignments
always @(posedge clk) begin
  aout <= b;
  bout <= c;
  cout <= a;
end

endmodule