`timescale 1ns / 1ps

module register_file
    (
        input               clk,
        input               nrst,
        input               RegWrite,
        input [4:0]         ReadReg1,
        input [4:0]         ReadReg2,
        input [4:0]         WriteReg,
        input [63:0]        WriteData,
        output reg [63:0]   ReadData1,
        output reg [63:0]   ReadData2
    );
    
    reg [63:0] RegFile [31:0];
    integer i;
    
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            for (i = 0; i < 32; i = i+1) begin
                RegFile[i] <= 0;
            end
        end else begin
            if (RegWrite && WriteReg) begin
                RegFile[WriteReg] <= WriteData;
            end
        end
    end
    
    always@(*) begin
        if (!nrst) begin
            ReadData1 = 0;
        end else begin
            ReadData1 = RegFile[ReadReg1];
        end
    end
    
    always@(*) begin
        if (!nrst) begin
            ReadData2 = 0;
        end else begin
            ReadData2 = RegFile[ReadReg2];
        end
    end
    
endmodule