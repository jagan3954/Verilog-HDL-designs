# Verilog-Code-for-Swapping-Three-Numbers
## JAGANATHAN K
## 212223060095
## Aim
To design and simulate a Verilog HDL code for swapping the values of three numbers without using any temporary variables, and verify the correctness of the swapping operation through a testbench using the Vivado 2023.1 simulation environment.

## Apparatus Required
Vivado 2023.1 or equivalent Verilog simulation tool.

## Procedure
Launch Vivado 2023.1:

Open Vivado and create a new project.
Write the Verilog Code for Swapping:

Write the Verilog code that swaps the values of three numbers (a, b, and c) using basic arithmetic or bitwise operations without using temporary variables.
Create the Testbench:

Write a testbench to simulate the swapping operation. The testbench should initialize three numbers, trigger the swapping module, and check if the values are swapped correctly.
Add the Verilog Files:

Add the Verilog module and the testbench file to the Vivado project.
Run Simulation:

Run the behavioral simulation in Vivado to verify the swapping operation.
Observe the Waveforms:

Examine the waveform to confirm that the values of the three numbers are swapped as expected.
Save and Document Results:

Capture the waveform output and include the results in your report for verification.

## Verilog Code:
### By Blocking 
```
`timescale 1ns/1ps
module swap(a,b,c,clk,aout,bout,cout);
input [3:0]a,b,c;
output reg[3:0] aout,bout,cout;
input clk;
always @(posedge clk)
begin
aout=b;
bout=c;
cout=a;
end
endmodule
```
### By Non-Blocking
```
`timescale 1ns/1ps
module swapnonblocking(
  input [3:0] a, b, c,
  input clk,
  output reg [3:0] aout, bout, cout
);

always @(posedge clk) begin
  aout <= b;
  bout <= c;
  cout <= a;
end

endmodule
```
### By Blocking (Using same variable)
```
`timescale 1ns/1ps
module blockingusingsamevar;
  reg clk;
  reg [3:0] a, b, c;
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin
    a = 4'd8;
    b = 4'd7;
    c = 4'd6;
  end
  always @(posedge clk) begin
    a = b;
    b = c;
    c = a;
  end
endmodule
```
### By Non-Blocking (Using same variable)
```
`timescale 1ns/1ps
module nonblockingusingsamevar;
  reg clk;
  reg [3:0] a, b, c;
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin
    a = 4'd8;
    b = 4'd7;
    c = 4'd6;
  end
  always @(posedge clk) begin
    a <= b;
    b <= c;
    c <= a;
  end
endmodule
```
Testbench for Swapping Three Numbers:

// swap_three_numbers_tb.v
```
`timescale 1ns / 1ps

module swap_three_numbers_tb;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;

    // Outputs
    wire [7:0] a_out;
    wire [7:0] b_out;
    wire [7:0] c_out;

    // Instantiate the Unit Under Test (UUT)
    swap_three_numbers uut (
        .a_in(a),
        .b_in(b),
        .c_in(c),
        .a_out(a_out),
        .b_out(b_out),
        .c_out(c_out)
    );

    // Test procedure
    initial begin
        // Initialize inputs
        a = 8'd10; // Assign 10 to a
        b = 8'd20; // Assign 20 to b
        c = 8'd30; // Assign 30 to c

        // Wait for 10 ns to observe swap
        #10;

        // Display results
        $display("Before Swap: a = %d, b = %d, c = %d", a, b, c);
        #10;
        $display("After Swap: a = %d, b = %d, c = %d", a_out, b_out, c_out);
        
        // Stop the simulation
        #10 $stop;
    end
endmodule
```
## OUTPUT
### By Blocking
![WhatsApp Image 2025-04-12 at 14 30 45_6d1f1a5e](https://github.com/user-attachments/assets/b67c3850-404d-48aa-9f7f-eda50588f104)
### By Non-Blocking
![WhatsApp Image 2025-04-12 at 14 35 23_9ae2bdca](https://github.com/user-attachments/assets/49476a88-3245-431b-ba8d-101f2e28e644)

### By Blocking(Using same variable)
![image](https://github.com/user-attachments/assets/c008a671-b5ca-4b4a-bf5d-1aae4f1a171f)

### By Non Blocking(Using same variable)
![image](https://github.com/user-attachments/assets/43a42c60-dd2c-46cc-8bcb-cbab8f0887d8)

## Conclusion
In this experiment, a Verilog HDL code for swapping three numbers was designed and successfully simulated. The testbench verified the swapping operation, showing that the values of three input numbers (a, b, and c) were swapped correctly without the use of temporary variables. This experiment demonstrated the effectiveness of Verilog in implementing logical operations and control mechanisms such as swapping values. The simulation results confirm the correct functionality of the design.
