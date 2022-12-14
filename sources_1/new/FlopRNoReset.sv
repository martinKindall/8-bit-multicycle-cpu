`timescale 1ns / 1ps

module FlopRNoReset #(parameter WIDTH=8)(
    input logic clk, enable,
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q);
    
    always_ff @(posedge clk)
        if (enable) q <= d;
    
endmodule