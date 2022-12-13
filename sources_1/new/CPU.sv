`timescale 1ns / 1ps

module CPU(
    input logic clk, reset,
    input logic [7:0] memRD, 
    output logic memEnable,
    output logic [7:0] memAdr, memWD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2,
    output logic pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite,
    output logic [2:0] aluControl
);

    logic [3:0] opcode;
    logic regSelect, wd3Select, aluOutEn;

    MainDecoder decoder(
        reset, clk, opcode, aluoutM,
        pcSelect, pcEnable, adrSelect,
        memEnable, ir1En, ir2En,
        regSelect, wd3Select, regWrite,
        op1Sel, op2Sel, aluOutEn,
        aluControl
    );

    Datapath dp(
        clk, reset, pcSelect, pcEnable, adrSelect, 
        ir1En, ir2En, regSelect, wd3Select, regWrite, 
        op1Sel, op2Sel, aluOutEn, aluControl, memRD,
        opcode, memAdr, memWD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2
    );

endmodule
