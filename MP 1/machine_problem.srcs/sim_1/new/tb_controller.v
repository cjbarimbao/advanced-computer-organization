`timescale 1ns / 1ps

module tb_controller();
    
    reg             clk;
    reg             nrst;
    reg  [31:0]     inst;
    reg             ALUZero;
    wire [1:0]      PCsrc;
    wire [1:0]      InstType;
    wire            RegWrite;
    wire            ALUsrc;
    wire [2:0]      ALUop;
    wire            MemWrite;
    wire [1:0]      MemtoReg;
    
    controller uut (
        .clk(clk),
        .nrst(nrst),
        .inst(inst),
        .ALUZero(ALUZero),
        .PCsrc(PCsrc),
        .InstType(InstType),
        .RegWrite(RegWrite),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg)        
    );
    
    always begin #50; clk <= ~clk; end
    
    initial begin
        clk = 0;
        nrst = 0;
        //inst = 32'h53483; // ld
        //inst = 32'he953823; // sd
        //inst = 32'h9a84b3; // add
        //inst = 32'h403100b3; // sub
        //inst = 32'h3170b3;  // and
        //inst = 32'h3160b3; // or
        //inst = 32'h4033; // xor
        //inst = 32'h2033; // slt
        //inst = 32'h3e810093; // addi
        //inst = 32'hfe0006e3; // beq
        //inst = 32'h1849663; // bne
        //inst = 32'h7d00006f; // jal
        inst = 32'h67;// jalr
        ALUZero = 1;
        #100
        nrst = 1;
        #150;
        nrst = 0;
        #50;
        $finish;
    end 
    
endmodule
