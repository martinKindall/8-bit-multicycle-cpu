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
    output logic [7:0] memAdr, memWD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2
);
    logic [3:0] a1Reg;
    logic [7:0] ir1, ir2, wd3, rd2;

    FlopRNoReset ir1Reg(clk, ir1En, memRD, ir1);
    FlopRNoReset ir2Reg(clk, ir2En, memRD, ir2);
    
    RegFile regfile(clk, regWrite, a1Reg, ir2[3:0], ir1[3:0], wd3, memWD, rd2);

    FlopR pcReg(clk, reset, pcEnable, pcNext, pc);
    Mux2 muxPCSel(aluout, ir2, pcSelect, pcNext);
    Mux2 adrSel(pc, ir2, adrSelect, memAdr);

    FlopRNoReset aluOutReg(clk, aluOutEn, aluout, aluoutM);

    Alu #(8) alu(aluIn1, aluIn2, aluControl, aluout);
    Mux2 muxOp1Sel(pc, memWD, op1Sel, aluIn1);
    Mux2 muxOp2Sel(rd2, 8'b1, op2Sel, aluIn2);

    Mux2 #(4) muxA1Sel(ir1[3:0], ir2[7:4], regSelect, a1Reg);
    Mux2 muxWD3Sel(memRD, aluout, wd3Select, wd3);

    assign opcode = ir1[7:4];

endmodule
