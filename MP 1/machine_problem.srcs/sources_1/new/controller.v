`timescale 1ns / 1ps

module controller
    #(
        parameter opcode_ld     = 7'b0000011,
        parameter opcode_sd     = 7'b0100011,
        parameter opcode_reg    = 7'b0110011,
        parameter opcode_addi   = 7'b0010011,
        parameter opcode_branch = 7'b1100011,
        parameter opcode_jal    = 7'b1101111,
        parameter opcode_jalr   = 7'b1100111,
        parameter funct7_add    = 7'b0000000,
        parameter funct7_sub    = 7'b0100000,
        parameter funct7_and    = 7'b0000000,
        parameter funct7_or     = 7'b0000000,
        parameter funct7_xor    = 7'b0000000,
        parameter funct7_slt    = 7'b0000000,
        parameter funct3_ld     = 3'b011,
        parameter funct3_sd     = 3'b011,
        parameter funct3_add    = 3'b000,
        parameter funct3_sub    = 3'b000,
        parameter funct3_and    = 3'b111,
        parameter funct3_or     = 3'b110,
        parameter funct3_xor    = 3'b100,
        parameter funct3_slt    = 3'b010,
        parameter funct3_addi   = 3'b000,
        parameter funct3_beq    = 3'b000,
        parameter funct3_bne    = 3'b001,
        parameter funct3_jalr   = 3'b000,
        parameter i_type        = 2'b00,
        parameter s_type        = 2'b01,
        parameter b_type        = 2'b10,
        parameter j_type        = 2'b11
    )
    (
        input               clk,
        input               nrst,
        input [31:0]        inst,
        input               ALUZero,
        output reg   [1:0]  PCsrc,
        output reg   [1:0]  InstType,
        output reg          RegWrite,
        output reg          ALUsrc,
        output reg   [2:0]  ALUop,
        output reg          MemWrite,
        output reg   [1:0]  MemtoReg
    );
    
    reg en;
    
    always@(nrst) begin
        if (!nrst) begin
            en <= 0;
        end else begin
            en <= 1;
        end
    end
    
    always@(*) begin
        PCsrc       = 0;
        InstType    = 0;
        RegWrite    = 0;
        ALUsrc      = 0;
        ALUop       = 0;
        MemWrite    = 0;
        MemtoReg    = 0;
        if (en) begin
            case (inst[6:0])
                opcode_ld: begin
                    InstType = i_type;
                    RegWrite = 1;
                    ALUsrc   = 1;
                    ALUop    = 3'b000;
                end 
                opcode_sd: begin
                    InstType = s_type;
                    ALUsrc   = 1;
                    ALUop    = 3'b000; 
                    MemWrite = 1;
                end 
                opcode_reg: begin
                    RegWrite = 1;
                    case ({inst[31:25],inst[14:12]})
                        {funct7_add, funct3_add}:   ALUop = 3'b000;
                        {funct7_sub, funct3_sub}:   ALUop = 3'b001;
                        {funct7_and, funct3_and}:   ALUop = 3'b010;
                        {funct7_or,  funct3_or} :   ALUop = 3'b011;
                        {funct7_xor, funct3_xor}:   ALUop = 3'b100;
                        {funct7_slt, funct3_slt}:   ALUop = 3'b101;
                    endcase 
                    MemtoReg = 2'b01;
                end 
                opcode_addi: begin
                    InstType = i_type;
                    RegWrite = 1;
                    ALUsrc   = 1;
                    ALUop    = 3'b000; 
                    MemtoReg = 2'b01;
                end 
                opcode_branch: begin
                    PCsrc    = (inst[14:12] == funct3_beq) ? ({1'b0, ALUZero}) : ({1'b0, ~ALUZero});
                    InstType = b_type;
                    ALUop    = 3'b001; 
                end 
                opcode_jal: begin
                    PCsrc    = 2'b01;
                    InstType = j_type;
                    RegWrite = 1; 
                    MemtoReg = 2'b10;
                end 
                opcode_jalr: begin
                    PCsrc    = 2'b10;
                    InstType = i_type;
                    RegWrite = 1;
                    ALUsrc   = 1;
                    ALUop    = 3'b000;
                    MemtoReg = 2'b10;
                end 
            endcase
        end
    end
    
endmodule