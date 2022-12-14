`timescale 1ns / 1ps

module RegFile(
    input logic clk, we,
    input logic [3:0] a1, a2, a3, 
    input logic [7:0] wd3,
    output logic [7:0] rd1, rd2);

    logic [7:0] rf[15:0];

    always_ff @( posedge clk )
        if (we) rf[a3] <= wd3;

    assign rd1 = (a1 != 0) ? rf[a1] : 0;
    assign rd2 = (a2 != 0) ? rf[a2] : 0;

endmodule
