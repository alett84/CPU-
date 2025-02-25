Simple CPU Design (CPE 271)
This repository contains a simple Central Processing Unit (CPU) design implemented in VHDL for use on the Terasic DE10-Lite FPGA board. This project demonstrates the fundamental components of a CPU—Arithmetic Logic Unit (ALU), Control Unit, Registers, Memory, and Program Counter—and shows how they interact to execute instructions.

Table of Contents
Project Overview
Hardware
Software
Key Components
How to Build and Run

Project Overview
A CPU (Central Processing Unit) is often referred to as the “brain” of a computer, responsible for processing instructions, executing operations, and managing data flow. In this project, we built a simple CPU capable of:

Storing data in RAM (8-bit values, 32 addresses).
Performing arithmetic and logic operations (addition, subtraction, AND, OR, pass-through).
Executing load, add, and store instructions.
Using a finite state machine (FSM) to move through different instruction stages.
This project was completed as part of the CPE 271 course, focusing on digital logic, CPU architecture, and VHDL design.

Hardware
Terasic DE10-Lite FPGA Board
FPGA: Intel/Altera MAX 10
On-board features: 7-segment displays, switches, push-buttons, LEDs
50 MHz clock for driving the CPU operations
Multiple digital I/O pins for external interfaces
The DE10-Lite is well-suited for educational purposes because of its balance between cost and functionality. However, the board has limited memory and I/O resources compared to larger FPGA development kits, so design constraints and optimization are sometimes necessary.

Software
Intel Quartus Prime
Used for synthesis, fitting, and compiling VHDL code onto the FPGA.
Offers Waveform simulation for debugging.
Provides a graphical editor for visualizing logic circuits (helpful for first-time FPGA users).
Note: Quartus Prime does not run natively on macOS without additional setup. If you are using a Mac, consider using a virtual machine or a Windows/Linux environment.

Key Components
ALU (Arithmetic Logic Unit)
Inputs: Two 8-bit operands, a 3-bit opcode
Operations: Add, Subtract, AND, OR, Pass-through
Output: 8-bit result based on opcode
Implementation Detail: Uses conditional statements (if-else) to decide which operation to perform.
Control Unit
FSM (Finite State Machine):
Manages the sequence of operations for load, add, store instructions.
Controls when to load registers, perform arithmetic, and store results.
Increments the program counter once an instruction is complete.
Memory (8-bit by 32)
Address space: 32 addresses (5-bit address).
Data width: 8 bits.
Operation: Can read and write 8-bit data based on the control signals from the Control Unit.
Program Counter
Function: Keeps track of the current instruction address.
Increment: Uses an internal counter to move to the next instruction after each operation completes.
Registers
Function: Temporarily stores intermediate values (e.g., instruction operands, ALU outputs).
Load Signals: Controlled by the Control Unit to capture and hold data until needed.
TwoToOneMux
Purpose: Selects between two data sources based on a control signal, feeding the correct input to downstream components (e.g., ALU, Memory).

How to Build and Run
Open Quartus Prime

Create a new Quartus project and specify your target device (Intel MAX 10).
Add VHDL Files
Add all VHDL source files (.vhd) to your project.
Make sure the top-level entity is set as the project's top module.

Pin Assignments
Assign the appropriate signals (clock, LEDs, switches, buttons, etc.) to the DE10-Lite’s pin constraints.
Use the Pin Planner in Quartus to map signals to physical pins.
Compile the Project

Run Analysis & Synthesis and then Full Compilation.
Resolve any errors or warnings that appear in the Messages window.

Simulation (Optional)
Set up a Waveform (.vwf) file in Quartus to test the CPU logic before deployment.
Confirm that the instructions execute as expected (load → add → store, etc.).
Program the FPGA

Connect the DE10-Lite board via USB-Blaster.
Select Tools → Programmer in Quartus.
Choose your .sof file and click Start.
When programming is complete, the CPU design should be running on the board.

A full report is located in the repository under the name "Final Project Report - CPE 271.docs" 
