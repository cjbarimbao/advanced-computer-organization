`timescale 1ns / 1ps

module tb_top_module;
    reg clk, nrst;
    
    top_module uut (
        .clk(clk),
        .nrst(nrst)
    );
    
    always begin #50; clk <= ~clk; end
    
    initial begin
    clk = 0;
    nrst = 0;
    #100;
    nrst = 1;
    #1500;
    $finish;
    end
endmodule
