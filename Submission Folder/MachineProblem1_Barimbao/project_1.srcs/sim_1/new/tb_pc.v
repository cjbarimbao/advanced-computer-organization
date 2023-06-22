`timescale 1ns / 1ps

module tb_pc;
    
    reg clk, nrst;
    reg [31:0] NextPC;
    wire [31:0] CurrentPC;
    
    pc i_pc (
        .clk(clk),
        .nrst(nrst),
        .NextPC(NextPC),
        .CurrentPC(CurrentPC)
    );
    
    always begin #50; clk = ~clk; end
    
    always begin #100; NextPC <= NextPC + 4; end
    
    initial begin
        clk = 0;
        nrst = 0;
        NextPC = 0;
        #100;
        nrst = 1;
        #1000;
        #100;
        $finish;
    end 
    
endmodule