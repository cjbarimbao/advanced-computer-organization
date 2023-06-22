`timescale 1ns / 1ps

module pc 
    (
        input               clk,
        input               nrst,
        input       [31:0]  NextPC,
        output reg  [31:0]  CurrentPC
    );
    
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            CurrentPC <= 0;
        end else begin
            CurrentPC <= NextPC;
        end
    end
       
endmodule