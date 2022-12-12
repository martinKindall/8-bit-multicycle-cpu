
module CPUTop(
    input logic clk, reset,
    output logic memEnable,
    output logic [7:0] memAdr, memWD, memRD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2,
    output logic pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite,
    output logic [2:0] aluControl
);
    CPU cpu(clk, reset, memRD, memEnable, memAdr, memWD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2, pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite, aluControl);

    Mem mem(clk, memEnable, memAdr, memWD, memRD);

endmodule