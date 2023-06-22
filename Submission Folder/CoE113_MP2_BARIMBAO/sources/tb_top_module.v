`timescale 1ns / 1ps

module tb_top_module;
    reg clk, nrst;
    wire [31:0]  pc;
    wire [31:0]  inst;
    wire [31:0]  addr;
    wire [63:0]  rdata;
    wire [63:0]  wdata;
    wire [7:0]   wmask;
    wire         wr_en;
    wire [63:0]  ALUop1;
    wire [63:0]  ALUop2;
    wire [63:0]  ALUres;
    wire [63:0]  RFwrdata;
    wire         RFwren;
    
    top_module uut (
        .clk(clk),
        .nrst(nrst),
        .pc(pc),
        .inst(inst),
        .addr(addr),
        .rdata(rdata),
        .wdata(wdata),
        .wmask(wmask),
        .wr_en(wr_en),
        .ALUop1(ALUop1),
        .ALUop2(ALUop2),
        .ALUres(ALUres),
        .RFwrdata(RFwrdata),
        .RFwren(RFwren)
    );
    
    always begin #50; clk <= ~clk; end
    
    initial begin
    clk = 0;
    nrst = 0;
    #100;
    nrst = 1;
    #4000;
    $finish;
    end
endmodule
