`timescale 1ns / 1ps

module tb_alu;
    
    reg [63:0] op1, op2;
    reg [2:0] ALUop;
    wire [63:0] ALUresult;
    wire ALUZero;
    
    alu i_alu (
        .op1(op1),
        .op2(op2),
        .ALUop(ALUop),
        .ALUresult(ALUresult),
        .ALUZero(ALUZero)
    );
    
    always begin #10; ALUop <= ALUop + 1 ;end
    initial begin
        op1 = 64'h0;
        op2 = 64'h0;
        ALUop = 3'b000;
        #5;
        op1 = 64'h0;
        op2 = -64'h1;
        #10;
        op1 = -64'h1;
        op2 = 64'h0;
        #10;
        op1 = -64'h1;
        op2 = 64'h1;
        #10;
        op1 = -64'h1;
        op2 = -64'h1;
        #10;
        op1 = 64'h123456789ABCDEF0;
        op2 = 64'h0;
        #50;
        op1 = 64'h0;
        op2 = 64'h123456789ABCDEF0;
        #100;
        $finish;
    end
    
endmodule
