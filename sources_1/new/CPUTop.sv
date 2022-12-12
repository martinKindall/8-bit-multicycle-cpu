
module CPUTop(
    input logic clk, reset,
    output logic memEnable,
    output logic [7:0] memAdr, memWD, memRD
);
    CPU cpu(clk, reset, memRD, memEnable, memAdr, memWD);

    Mem mem(clk, memEnable, memAdr, memWD, memRD);

endmodule