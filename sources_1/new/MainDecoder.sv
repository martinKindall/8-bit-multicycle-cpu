
module MainDecoder(
    input logic reset, clk,
    input logic [3:0] opcode,
    input logic [7:0] aluout,
    output logic pcSelect, pcEnable, adrSelect,
    output logic memEnable, ir1En, ir2En,
    output logic regSelect, wd3Select, regWrite,
    output logic op1Sel, op2Sel, aluOutEn,
    output logic [2:0] aluControl
);

    typedef enum logic [2:0] { S0, S1, S2, S3, S4, S5 } statetype;
    statetype [2:0] state, nextstate;

    always_ff @(posedge clk)
        if (reset) state <= S0;
        else state <= nextstate;

    always_comb 
        case (state)
            S0: nextstate <= S1;
            S1: 
                case (opcode[3:2])
                    2'b00: nextstate <= S2;  
                    2'b01: nextstate <= S3;
                    2'b10: 
                        if (opcode[1:0] == 2'b11) nextstate <= S5;
                        else nextstate <= S4;
                endcase
            S2: nextstate <= S0;
            S3: nextstate <= S0;
            S4: nextstate <= S0;
            S5: nextstate <= S5;
            default: nextstate <= S0;
        endcase

    assign pcSelect = (state == S4 && (opcode[1:0] == 0 || (opcode[1:0] == 2'b01 && ~| aluout))) ? 1 : 0;
    assign pcEnable = (state == S0 || state == S1 || state == S4) ? 1 : 0;
    assign adrSelect = (state == S2) ? 1 : 0;
    assign memEnable = (state == S2 && opcode[1:0] == 2'b01) ? 1 : 0;
    assign ir1En = (state == S0) ? 1 : 0;
    assign ir2En = (state == S1) ? 1 : 0;
    assign regSelect = (state == S3) ? 1 : 0;
    assign wd3Select = (state == S3) ? 1 : 0;
    assign regWrite = (state == S3) ? 1 : 0;
    assign op1Sel = (state == S0 || state == S1) ? 0 : 1;
    assign op2Sel = (state == S0 || state == S1) ? 1 : 0;
    assign aluControl = (state == S3 && opcode[1:0] == 2'b01) ? 3'b110 : 3'b010;
    assign aluOutEn = (state == S3) ? 1 : 0;

endmodule
