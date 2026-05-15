`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;
    wire [2:0] lights; // [2]=Red, [1]=Yellow, [0]=Green

    // Instantiate the Unit Under Test (UUT)
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .lights(lights)
    );

    // Clock generation: 10ns period (5ns high, 5ns low)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;

        #10; // Hold reset for a short period (2 clock cycles)
        reset = 0; // Release reset

        // Observe traffic light sequence for several cycles (e.g., 3 full cycles = 3 * 30 cycles = 90 cycles * 10ns/cycle = 900ns)
        #900;

        $stop;
    end

endmodule