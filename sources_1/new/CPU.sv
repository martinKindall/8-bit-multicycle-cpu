
module CPU(
    input logic clk, reset,
    input logic [7:0] memRD, 
    output logic memEnable,
    output logic [7:0] memAdr, memWD 
);

    logic [7:0] aluout;
    logic [3:0] opcode;
    logic [2:0] aluControl;
    logic pcSelect, pcEnable, adrSelect, ir1En, ir2En;
    logic regSelect, wd3Select, regWrite, op1Sel, op2Sel, aluOutEn;

    MainDecoder decoder(
        reset, clk, opcode, aluout,
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
        opcode, memAdr, memWD, aluout
    );

endmodule
