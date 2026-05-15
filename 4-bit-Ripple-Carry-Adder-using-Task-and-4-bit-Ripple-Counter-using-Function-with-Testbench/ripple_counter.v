module ripple_counter_4bit ( input clk, input reset, output reg [3:0] Q );
function [3:0] next_state;
    input [3:0] curr_state;
    begin
        next_state = curr_state + 1;
    end
endfunction
always @(posedge clk )
begin
    if (reset)
        Q <= 4'b0000;       
    else
        Q <= next_state(Q); 
 end
endmodule