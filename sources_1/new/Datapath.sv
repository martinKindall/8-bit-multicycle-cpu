`timescale 1ns / 1ps

module Datapath(
    input logic clk, reset,
    input logic pcSelect, pcEnable, adrSelect, 
    input logic ir1En, ir2En, 
    input logic regSelect, wd3Select, regWrite, 
    input logic op1Sel, op2Sel, aluOutEn,
    input logic [2:0] aluControl, 
    input logic [7:0] memRD,
    output logic [3:0] opcode,
    output logic [7:0] memAdr, memWD, aluOutM
);
    logic [3:0] a1;
    logic [7:0] ir1, ir2, pcNext, pc, wd3, rd1, rd2, aluout;

    FlopR ir1Reg(clk, 0, ir1En, memRD, ir1);
    FlopR ir2Reg(clk, 0, ir2En, memRD, ir2);

    FlopR pcReg(clk, reset, pcEnable, pcNext, pc);
    Mux2 muxPCSel(aluout, ir2, pcSelect, pcNext);
    Mux2 adrSel(pc, ir2, adrSelect, memAdr);

    FlopR aluOutReg(clk, 0, aluOutEn, aluout, aluOutM);

    Alu #(8) alu(aluIn1, aluIn2, aluControl, aluOut);
    Mux2 muxOp1Sel(pc, rd1, op1Sel, aluIn1);
    Mux2 muxOp2Sel(rd2, 1, op2Sel, aluIn2);

    RegFile regfile(clk, regWrite, a1, ir2[3:0], ir1[3:0], wd3, rd1, rd2);
    Mux2 #(4) muxA1Sel(ir1[3:0], ir2[7:4], regSelect, a1);
    Mux2 muxWD3Sel(memRD, aluOut, wd3Select, wd3);

    assign opcode = ir1[7:4];
    assign memWD = rd1;

endmodule
