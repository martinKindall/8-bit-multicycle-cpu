# Minimalist 8-bit multicycle RISC CPU

This work is based on the following [implementation](https://www.impulsmittelschule.ch/download/pictures/66/hrqlabj8v1012ahyxg72kczftahd5a/1_unger_benjamin-1552318104.pdf) from Benjamin Unger: _8-Bit Multicycle Processor Design and Implementation in Verilog_. 

I made my own SystemVerilog code based on the instruction set and diagrams exposed in the mentioned reference.

## Instruction Set

Instruction Opcode
- lw          0000
- sw          0001
- add         0100
- sub         0101
- j           1000
- jcz         1001
- jco         1010
- hlt         1011

## Top Module

The top module is __CPUTopIO.sv__. Check the constraint file to understand how are the leds, switches and displays wired to the CPU.

## Program

The demo program is called __program.asm__ which is also compiled to binary in __program.dat__. This code will be automatically added to the RAM on synthesis, thanks to Vivado, so no need to manually feed the binary. Check the file _Mem.sv_ and you will see the program is initialized in the __initial__ block. Normally this block is considered only during simulation, but Vivado also allows to add data in some cases.

## Slow clock

The cpu runs with a slow clock (1Hz) which allows to follow the fetch-decode-execute process with the eye. Anyways you can manually debug using the switch to enable/disable the clock at each step.