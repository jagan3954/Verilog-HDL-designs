`timescale 1ns / 1ps

module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] lights  // 3-bit output: [2]=Red, [1]=Yellow, [0]=Green
);

// Define states for the traffic light
parameter RED_STATE    = 2'b00;
parameter YELLOW_STATE = 2'b01;
parameter GREEN_STATE  = 2'b10;

reg [1:0] current_state, next_state;
reg [3:0] timer; // A simple timer for state transitions (e.g., counts 0 to 9 for 10 cycles)

// State register and Timer
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= RED_STATE;
        timer <= 4'b0000;
    end else begin
        current_state <= next_state;
        if (timer == 4'd9) begin // If timer reaches its max count (e.g., 9 for 10 cycles)
            timer <= 4'b0000; // Reset timer
        end else begin
            timer <= timer + 1; // Increment timer
        end
    end
end

// Next state logic
always @(*) begin
    next_state = current_state; // Default to staying in current state
    case (current_state)
        RED_STATE: begin
            if (timer == 4'd9) // After 10 clock cycles in RED
                next_state = GREEN_STATE;
        end
        GREEN_STATE: begin
            if (timer == 4'd9) // After 10 clock cycles in GREEN
                next_state = YELLOW_STATE;
        end
        YELLOW_STATE: begin
            if (timer == 4'd9) // After 10 clock cycles in YELLOW
                next_state = RED_STATE;
        end
        default: next_state = RED_STATE; // Should not happen, but good for safety
    endcase
end

// Output logic
always @(*) begin
    case (current_state)
        RED_STATE:    lights = 3'b100; // Red light ON (R=1, Y=0, G=0)
        YELLOW_STATE: lights = 3'b010; // Yellow light ON (R=0, Y=1, G=0)
        GREEN_STATE:  lights = 3'b001; // Green light ON (R=0, Y=0, G=1)
        default:      lights = 3'b100; // Default to Red
    endcase
end

endmodule