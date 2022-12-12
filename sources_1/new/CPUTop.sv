
module CPUTop(
    input logic clk, reset,
    output logic [7:0] memAdr, memWD 
);
    logic memEnable;
    logic [7:0] memRD;

    CPU cpu(clk, reset, memRD, memEnable, memAdr, memWD);

    Mem mem(clk, memEnable, memAdr, memWD, memRD);

endmodule