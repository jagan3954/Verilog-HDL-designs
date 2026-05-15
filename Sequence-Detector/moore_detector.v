`timescale 1ns / 1ps

module moore_sequence_detector (
    input clk,
    input reset,
    input seq_in,
    output reg seq_out // Output is based on current state (Moore)
);

// Define states
parameter S0 = 2'b00; // Initial state
parameter S1 = 2'b01; // Detected '1'
parameter S2 = 2'b10; // Detected '10'
parameter S3 = 2'b11; // Detected '101'

reg [1:0] current_state, next_state;

// State register
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    next_state = current_state; // Default to staying in current state
    case (current_state)
        S0: begin
            if (seq_in == 1'b1) next_state = S1;
            else next_state = S0;
        end
        S1: begin
            if (seq_in == 1'b0) next_state = S2;
            else next_state = S1; // Stay in S1 if another '1' comes
        end
        S2: begin
            if (seq_in == 1'b1) next_state = S3;
            else next_state = S0; // Reset if '0' comes
        end
        S3: begin
            if (seq_in == 1'b1) next_state = S1; // Detected '1011', restart for '1'
            else next_state = S0; // Reset if '0' comes after '101'
        end
        default: next_state = S0;
    endcase
end

// Output logic (Moore FSM: output depends only on current state)
always @(current_state) begin
    if (current_state == S3) // Sequence "1011" detected, output high on S3
        seq_out = 1'b1;
    else
        seq_out = 1'b0;
end

endmodule