`timescale 1ns / 1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg seq_in;
    wire moore_seq_out;
    wire mealy_seq_out;

    // Instantiate Moore FSM
    moore_sequence_detector moore_uut (
        .clk(clk),
        .reset(reset),
        .seq_in(seq_in),
        .seq_out(moore_seq_out)
    );

    // Instantiate Mealy FSM
    mealy_sequence_detector mealy_uut (
        .clk(clk),
        .reset(reset),
        .seq_in(seq_in),
        .seq_out(mealy_seq_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        seq_in = 0;

        #10 reset = 0; // De-assert reset

        // Test sequence: 1011 (should detect)
        // Time: 0   10  20  30  40  50  60  70  80  90  100 110 120 130 140
        // clk: ^   _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_ _^_
        // seq_in: 0   0   1   0   1   1   0   1   1   1   0   1   1   0
        // Moore:  0   0   0   0   0   1   0   0   1   0   0   0   1   0
        // Mealy:  0   0   0   0   0   1   0   0   1   0   0   0   1   0

        $display("Time | clk | reset | seq_in | Moore_out | Mealy_out");
        $monitor("%0t | %b   | %b     | %b      | %b         | %b", $time, clk, reset, seq_in, moore_seq_out, mealy_seq_out);

        // Input sequence: 1 0 1 1
        #10 seq_in = 1; // S0 -> S1
        #10 seq_in = 0; // S1 -> S2
        #10 seq_in = 1; // S2 -> S3
        #10 seq_in = 1; // S3 -> S1 (Moore output 1, Mealy output 1)

        // Input sequence: 0 1 1 (should not detect 1011)
        #10 seq_in = 0; // S1 -> S0
        #10 seq_in = 1; // S0 -> S1
        #10 seq_in = 1; // S1 -> S1
        #10 seq_in = 1; // S1 -> S1

        // Input sequence: 1 0 1 1
        #10 seq_in = 1; // S1 -> S1
        #10 seq_in = 0; // S1 -> S2
        #10 seq_in = 1; // S2 -> S3
        #10 seq_in = 1; // S3 -> S1 (Moore output 1, Mealy output 1)

        #50 $stop;
    end

endmodule