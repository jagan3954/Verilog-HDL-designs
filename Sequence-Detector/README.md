# Sequence Detector (Moore and Mealy FSM)

## Aim
To design and simulate a sequence detector using both Moore and Mealy Finite State Machine (FSM) architectures in Verilog HDL. The objective is to detect a specific bit pattern (e.g., "1011") and understand the differences in output behavior between Moore and Mealy models through a testbench in the Vivado 2023.1 simulation environment.

## Apparatus Required
*   Vivado 2023.1 or equivalent Verilog simulation tool.

## Procedure
1.  **Launch Vivado**: Open Vivado and create a new project.
2.  **Add Verilog Files**: Add the design modules (`.v`) for both Moore and Mealy FSMs, along with the testbench file (`_tb.v`), to the Vivado project.
3.  **Run Simulation**: Run the behavioral simulation to observe the output and check if the sequence is detected correctly by both FSMs.
4.  **Observe Waveforms**: Analyze the waveform to ensure both the Moore and Mealy machines detect the sequence as expected, paying attention to the timing of the output.
5.  **Document Results**: Capture the waveforms and include the results in the final report.

## Source Files
*   **Moore FSM**: `moore_detector.v`
    *   Implements a Moore FSM to detect the sequence "1011".
    *   The output `seq_out` depends solely on the current state.
*   **Mealy FSM**: `mealy_detector.v`
    *   Implements a Mealy FSM to detect the sequence "1011".
    *   The output `seq_out` depends on both the current state and the current input.
*   **Testbench**: `sequence_detector_tb.v`
    *   Provides a stimulus sequence to both Moore and Mealy detectors.
    *   Allows for comparison of their output behaviors.

## Expected Behavior (for sequence "1011")
*   **Moore FSM**: The output `seq_out` will go high *one clock cycle after* the final '1' of "1011" is received and the FSM transitions to the detection state.
*   **Mealy FSM**: The output `seq_out` will go high *in the same clock cycle* as the final '1' of "1011" is received, provided the FSM is in the correct preceding state.

## Conclusion
The sequence detector was successfully designed and simulated using both Moore and Mealy FSM architectures. The experiment clearly demonstrated the fundamental differences in output timing between the two FSM types, with the Mealy machine producing an output one clock cycle earlier than the Moore machine for the same input sequence. This understanding is crucial for selecting the appropriate FSM model in digital design.