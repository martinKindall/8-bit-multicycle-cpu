`timescale 1ns / 1ps

module Mem(
    input logic clk, memEnable,
    input logic [7:0] memAdr, memWD,
    output logic [7:0] memRD);

    logic [7:0] RAM[63:0];

    initial
        $readmemb("program.dat", RAM);

    assign memRD = RAM[memAdr];

    always_ff @(posedge clk)
        if (memEnable) RAM[memAdr] <= memWD;        

endmodule
