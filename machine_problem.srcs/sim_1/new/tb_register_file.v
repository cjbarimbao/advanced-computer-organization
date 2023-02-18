`timescale 1ns / 1ps

module tb_register_file;
    
    reg clk, nrst, RegWrite;
    reg [4:0] ReadReg1, ReadReg2, WriteReg;
    reg [63:0] WriteData;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    
    register_file i_reg_file (
        .clk(clk),
        .nrst(nrst),
        .RegWrite(RegWrite),
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    always begin #50; clk <= ~clk; end
    
    always@(negedge clk or negedge nrst) begin
        if (!nrst) begin
            WriteReg <= 0;
        end else begin
            WriteReg <= WriteReg + 1;
        end
    end
    
    always@(WriteReg) begin
        if (WriteReg) begin
            ReadReg1 <= WriteReg - 1;
        end
        ReadReg2 <= WriteReg;
    end
    
    initial begin
        clk = 0;
        nrst = 0;
        RegWrite = 1;
        ReadReg1 = 0;
        ReadReg2 = 0;
        WriteData = -64'h1;
        #100;
        nrst = 1;
        wait(WriteReg == 5'd31);
        #100;
        nrst = 0;
        #100;
        $finish;
    end

endmodule