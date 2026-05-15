`timescale 1ns / 1ps

module seven_segment_decoder (
    input wire [3:0] bcd_in, // 4-bit BCD input (0-9)
    output wire [6:0] seg_out // 7-segment output (a-g)
);

// Segment mapping for common anode display (active low)
//   --a--
//  |     |
//  f     b
//  |     |
//   --g--
//  |     |
//  e     c
//  |     |
//   --d--

// seg_out[6:0] corresponds to {g, f, e, d, c, b, a}
// For common anode, 0 means segment is ON, 1 means OFF.

reg [6:0] seg_display;

always @(*) begin
    case (bcd_in)
        4'b0000: seg_display = 7'b0000001; // 0 (a,b,c,d,e,f ON, g OFF)
        4'b0001: seg_display = 7'b1001111; // 1 (b,c ON, a,d,e,f,g OFF)
        4'b0010: seg_display = 7'b0010010; // 2
        4'b0011: seg_display = 7'b0000110; // 3
        4'b0100: seg_display = 7'b1001100; // 4
        4'b0101: seg_display = 7'b0100100; // 5
        4'b0110: seg_display = 7'b0100000; // 6
        4'b0111: seg_display = 7'b0001111; // 7
        4'b1000: seg_display = 7'b0000000; // 8
        4'b1001: seg_display = 7'b0000100; // 9
        default: seg_display = 7'b1111111; // All segments off for invalid BCD
    endcase
end

assign seg_out = seg_display;

endmodule