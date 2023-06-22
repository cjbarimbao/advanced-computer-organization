`timescale 1ns / 1ps

module top_module
    (
        input           clk,
        input           nrst,
        output  [31:0]  pc,
        output  [31:0]  inst,
        output  [31:0]  addr,
        output  [63:0]  rdata,
        output  [63:0]  wdata,
        output  [7:0]   wmask,
        output          wr_en,
        output  [63:0]  ALUop1,
        output  [63:0]  ALUop2,
        output  [63:0]  ALUres,
        output  [63:0]  RFwrdata,
        output          RFwren
    );
     
    processor i_processor (
        .clk(clk),
        .nrst(nrst),
        .inst(inst),
        .rdata(rdata),
        .wr_en(wr_en),
        .wdata(wdata),
        .pc(pc),
        .addr(addr),
        .wmask(wmask),
        .ALUop1(ALUop1),
        .ALUop2(ALUop2),
        .ALUres(ALUres),
        .RFwrdata(RFwrdata),
        .RFwren(RFwren)
    );
    
    mem_prog i_mem_prog (
        .addr(pc[31:2]),
        .rdata(inst)
    );
    
    mem_model i_mem_model (
        .clk(clk),
        .addr(addr[31:3]),
        .rdata(rdata),
        .wr_en(wr_en),
        .wdata(wdata),
        .wmask(wmask)
    );
    
endmodule
