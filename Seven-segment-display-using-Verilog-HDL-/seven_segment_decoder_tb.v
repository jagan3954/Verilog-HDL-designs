`timescale 1ns / 1ps

module seven_segment_decoder_tb;

    reg [3:0] bcd_in;
    wire [6:0] seg_out;

    // Instantiate the Unit Under Test (UUT)
    seven_segment_decoder uut (
        .bcd_in(bcd_in),
        .seg_out(seg_out)
    );

    initial begin
        $display("Time | BCD_in | Seg_out (gfedcba)");
        $monitor("%0t | %b     | %b", $time, bcd_in, seg_out);

        // Test all BCD inputs from 0 to 9
        bcd_in = 4'b0000; #10; // Display 0
        bcd_in = 4'b0001; #10; // Display 1
        bcd_in = 4'b0010; #10; // Display 2
        bcd_in = 4'b0011; #10; // Display 3
        bcd_in = 4'b0100; #10; // Display 4
        bcd_in = 4'b0101; #10; // Display 5
        bcd_in = 4'b0110; #10; // Display 6
        bcd_in = 4'b0111; #10; // Display 7
        bcd_in = 4'b1000; #10; // Display 8
        bcd_in = 4'b1001; #10; // Display 9

        // Test invalid BCD input (should turn all segments off for common anode)
        bcd_in = 4'b1010; #10;
        bcd_in = 4'b1111; #10;

        $stop;
    end

endmodule