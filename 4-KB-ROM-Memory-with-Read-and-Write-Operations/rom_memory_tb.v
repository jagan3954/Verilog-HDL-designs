`timescale 1ns / 1ps

module rom_memory_tb;

    reg clk;
    reg write_enable;
    reg [11:0] address;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    rom_memory uut (
        .clk(clk),
        .write_enable(write_enable),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        write_enable = 0; // Start with read mode
        address = 12'h000;
        data_in = 8'h00;

        // Test Case 1: Read pre-programmed data
        #10;
        $display("Time=%0t, Address=0x%h, Data_out=0x%h (Expected: 0xAA)", $time, address, data_out); // Should be 0xAA

        #10;
        address = 12'h001;
        $display("Time=%0t, Address=0x%h, Data_out=0x%h (Expected: 0x55)", $time, address, data_out); // Should be 0x55

        // Test Case 2: Write data (simulated)
        #10;
        write_enable = 1;
        address = 12'h010;
        data_in = 8'hC3;
        $display("Time=%0t, Writing 0x%h to Address 0x%h", $time, data_in, address);

        #10;
        write_enable = 0; // Switch back to read mode
        address = 12'h010;
        $display("Time=%0t, Reading from Address 0x%h, Data_out=0x%h (Expected: 0xC3)", $time, address, data_out); // Should be 0xC3

        // Test Case 3: Read another pre-programmed location
        #10;
        address = 12'h002;
        $display("Time=%0t, Address=0x%h, Data_out=0x%h (Expected: 0xF0)", $time, address, data_out); // Should be 0xF0

        #20;
        $stop;
    end

endmodule