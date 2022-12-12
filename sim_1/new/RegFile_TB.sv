`timescale 1ns / 1ps

module RegFile_TB;

    logic clk, we3;
    logic [3:0] a1, a2, a3;
    logic [7:0] wd3, rd1, rd2, rd1Test, rd2Test;
    
    logic [36:0] testvectors[1000:0];
    logic [31:0] vectornum, errors;
    
    RegFile dut(clk, we3, a1, a2, a3, wd3, rd1, rd2);
    
    initial begin
        $readmemh("RegFile.tv", testvectors);
        vectornum = 0; errors = 0;
        we3 <= 0; a1 <= 0; a2 <= 0; a3 <= 0; wd3 <= 0; #2;
    end
    
    always begin
        clk <= 1; #5;     
        clk <= 0; #5;     
    end
    
    always @(posedge clk) begin
        #1; {we3, a1, a2, a3, wd3, rd1Test, rd2Test} = testvectors[vectornum];
    end
    
    always @(negedge clk)
        begin
            if ({rd1, rd2} !== {rd1Test, rd2Test}) begin
                $display("Error: output = %b (%b expected)", {rd1, rd2}, {rd1Test, rd2Test});
                $display("vectornum %b", vectornum);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 'x) begin 
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end

endmodule
