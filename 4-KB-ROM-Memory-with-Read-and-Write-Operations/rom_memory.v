`timescale 1ns / 1ps

module rom_memory (
    input wire clk,
    input wire write_enable, // This signal is typically not present in a true ROM, but included for simulation of "writable" behavior.
    input wire [11:0] address,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] rom[0:4095]; // 4KB = 4096 bytes, each 8-bit wide

// Initialize ROM content (optional, for simulation)
initial begin
    integer i;
    for (i = 0; i < 4096; i = i + 1) begin
        rom[i] = 8'h00; // Initialize all locations to 0
    end
    // Example pre-programmed data (can be loaded from a file in real scenarios)
    rom[12'h000] = 8'hAA;
    rom[12'h001] = 8'h55;
    rom[12'h002] = 8'hF0;
end

always @(posedge clk) begin
    data_out <= rom[address]; // Read operation (always active)
    if (write_enable) begin
        rom[address] <= data_in; // Write operation (for simulating writable ROM behavior, not typical for actual ROM hardware)
    end
end

endmodule