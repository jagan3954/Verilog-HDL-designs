module ripple_counter_4bit_tb;
    reg clk;
    reg reset;
    wire [3:0] Q;
    ripple_counter_4bit uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        #20 reset = 0;
    end
endmodule