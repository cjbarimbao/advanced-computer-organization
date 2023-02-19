`timescale 1ns / 1ps

module top_module
    (
        input clk,
        input nrst
    );
    
    wire [31:0] inst, pc, addr;
    wire [63:0] rdata, wdata;
    wire [7:0]  wmask;
    wire        wr_en;
    
    processor i_processor (
        .clk(clk),
        .nrst(nrst),
        .inst(inst),
        .rdata(rdata),
        .wr_en(wr_en),
        .wdata(wdata),
        .pc(pc),
        .addr(addr),
        .wmask(wmask)
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
