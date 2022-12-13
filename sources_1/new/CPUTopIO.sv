
module CPUTopIO(
    input logic clk, reset,
    input logic selector, clkEnable,
    output logic dp,
    output logic [6:0] ledSegment,
    output logic [3:0] anodeActivate,
    output logic ir1En, ir2En, regWrite, memEnable, slowClock);

    logic pcSelect, pcEnable, adrSelect, op1Sel, op2Sel;
    logic [2:0] aluControl;
    logic [7:0] memAdr, aluoutM, pcNext, pc, aluIn1, aluIn2, memWD, memRD, aluout;
    logic [7:0] aluOrMemWDReg;
    logic [15:0] displayedNumber;

    SlowClock sClock(clk, clkEnable, slowClock);

    CPUTop cpuTop(slowClock, reset, memEnable,
        memAdr, memWD, memRD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2,
        pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite,
        aluControl
    );

    SevenSegmentTop sevenSegmentTop(clk, displayedNumber, ledSegment, anodeActivate, dp); 

    always_comb
        case (selector)
            0: aluOrMemWDReg <= memWD;
            1: aluOrMemWDReg <= aluout;
        endcase

    assign displayedNumber = {memRD, aluOrMemWDReg};

endmodule
