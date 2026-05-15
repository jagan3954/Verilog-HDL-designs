`timescale 1ns / 1ps

module swap_tb;

    reg [3:0] a, b, c;
    reg clk;
    wire [3:0] a_out, b_out, c_out;

    // Instantiate Non-blocking module for verification
    swap_nonblocking uut (
        .a(a),
        .b(b),
        .c(c),
        .clk(clk),
        .aout(a_out),
        .bout(b_out),
        .cout(c_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        a = 4'd10; b = 4'd5; c = 4'd8;

        #10;
        $display("Initial: a=%d, b=%d, c=%d", a, b, c);
        
        @(posedge clk);
        #1;
        $display("After Swap: a=%d, b=%d, c=%d", a_out, b_out, c_out);
        
        #20;
        $stop;
    end

endmodule