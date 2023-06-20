`timescale 1ns / 1ps

module alu
    (
        input       [63:0] op1,
        input       [63:0] op2,
        input       [2:0]  ALUop,
        output reg  [63:0] ALUresult,
        output reg         ALUZero
    );
    
    always@(*) begin
        ALUresult = 0;
        case (ALUop)
            3'b000: ALUresult = op1 + op2;
            3'b001: ALUresult = op1 - op2;
            3'b010: ALUresult = op1 & op2;
            3'b011: ALUresult = op1 | op2;
            3'b100: ALUresult = op1 ^ op2;
            3'b101: begin
                    if (op1[63] != op2[63]) begin
                        if (op1[63] > op2[63]) begin
                            ALUresult = 1;
                        end else begin
                            ALUresult = 0;
                        end
                    end else begin
                        if (op1 < op2) begin
                            ALUresult = 1;
                        end else begin
                            ALUresult = 0;
                        end
                    end
                end
        endcase
        ALUZero    = ~|(ALUresult);
    end
            
endmodule
