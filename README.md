# Verilog HDL Design & Simulation Portfolio

This repository contains a collection of digital logic designs implemented in Verilog HDL. These projects demonstrate various hardware description techniques including Gate-level, Dataflow, and Behavioral modeling, as well as the use of Finite State Machines (FSMs), Tasks, and Functions.

## Tools & Environment
*   **Xilinx Vivado 2023.1**: Used for RTL analysis, synthesis, and behavioral simulation.
*   **Cadence nclaunch**: Used for advanced verification and simulation workflows.
*   **Verilog HDL**: Primary language for hardware description.

## Project Highlights

### 1. Arithmetic & Logic Units
*   **4-bit Ripple Carry Adder**: Implemented using a reusable `task` for full-adder logic.
*   **4-bit Ripple Counter**: Designed using a `function` to determine next-state transitions.
*   **4:1 Multiplexer**: Explored across four modeling styles (Gate, Dataflow, Behavioral, Structural).

### 2. Memory & Sequential Circuits
*   **4KB ROM Memory**: Modeled with read and write operations, featuring a 12-bit address width.
*   **Sequence Detector**: Implementation of Moore and Mealy FSMs to detect specific bit patterns (e.g., 1011).
*   **Traffic Light Controller**: A state-machine based controller managing Red, Yellow, and Green transitions.

### 3. Utility & Interface Modules
*   **Seven Segment Display**: Logic mapping for binary-to-decimal display conversion.
*   **Number Swapper**: A module for swapping three variables without the use of temporary registers.

## How to Run
1.  **Vivado**:
    *   Create a new project in Vivado.
    *   Add the source files (`.v`) and testbench files (`_tb.v`) from the specific project folder.
    *   Run **Behavioral Simulation** to observe waveforms.
2.  **Cadence nclaunch**:
    *   Initialize the environment and map the design library.
    *   Compile the source files and elaborate the snapshot.
    *   Simulate using the `ncsim` tool.

## Repository Structure
Each folder contains:
*   `README.md`: Detailed documentation and aim of the specific project.
*   Source files: Verilog logic implementation.
*   Testbench files: Stimulus generation for verification.

---
*This portfolio showcases digital design proficiency and a deep understanding of RTL verification methodologies.*