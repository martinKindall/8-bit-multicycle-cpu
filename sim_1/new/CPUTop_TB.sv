`timescale 1ns / 1ps

module CPUTop_TB();

    logic clk, reset, memEnable;
    logic [7:0] memAdr, memWD, memRD;

    CPUTop dut(clk, reset, memEnable, memAdr, memWD, memRD);

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
                if (memWD === 4) begin 
                    $display("Simulation succeeded");
                    $stop;
                end else begin
                    $display("Simulation failed");
                    $stop;
                end
            end
        end

endmodule
