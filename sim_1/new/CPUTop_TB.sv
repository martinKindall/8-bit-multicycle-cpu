`timescale 1ns / 1ps

module CPUTop_TB();

    logic clk, reset, memEnable, pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite;
    logic [7:0] memAdr, memWD, memRD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2;
    logic [2:0] aluControl;

    CPUTop dut(clk, reset, memEnable, memAdr, memWD, memRD, aluoutM, aluout, pcNext, pc, aluIn1, aluIn2, pcSelect, pcEnable, adrSelect, ir1En, ir2En, op1Sel, op2Sel, regWrite, aluControl);

    initial
        begin
            reset <= 1; #82; reset <= 0;
        end

    always
        begin
            clk <= 1; #5;
            clk <= 0; #5;
        end

    always @(negedge clk)
        begin
            if (memEnable) begin
                if (memWD === 8'hF4) begin 
                    $display("Simulation succeeded");
                    $stop;
                end else begin
                    $display("Simulation failed");
                    $stop;
                end
            end
        end

endmodule
