`timescale 1ns / 1ps


module processor
    (
        input           clk,
        input           nrst,
        input   [31:0]  inst,
        input   [63:0]  rdata,
        output          wr_en,
        output  [63:0]  wdata,
        output  [31:0]  pc,
        output  [31:0]  addr,
        output  [7:0]   wmask
    );
    
    wire [63:0] ReadData1, ReadData2, op2, ALUresult, immediate;
    wire [31:0] BranchAddr;
    wire [2:0]  ALUop;
    wire [1:0]  ImmSelect, PCsrc, MemtoReg;
    wire        RegWrite, ALUZero, ALUsrc;
    reg  [63:0] WriteData;
    reg  [31:0] NextPC;
    
    
    assign BranchAddr = {immediate[30:0], 1'b0};
    assign op2 = ALUsrc ? immediate : ReadData2;
    assign wdata = ReadData2;
    assign addr = ALUresult[31:0];
    assign wmask = 8'hff;
    
    always@(*) begin
        NextPC = pc + 4;
        case (PCsrc)
            2'b01: NextPC = pc + BranchAddr;
            2'b10: NextPC = {ALUresult[31:1], 1'b0};
        endcase
    end
    
    always@(*) begin
        WriteData = rdata;
        case(MemtoReg)
            2'b01:  WriteData = ALUresult;
            2'b10:  WriteData = {32'h0, pc + 4};
        endcase 
    end
    
    pc i_pc (
        .clk(clk),
        .nrst(nrst),
        .NextPC(NextPC),
        .CurrentPC(pc)
    );
    
    register_file i_register_file (
        .clk(clk),
        .nrst(nrst),
        .RegWrite(RegWrite),
        .ReadReg1(inst[19:15]),
        .ReadReg2(inst[24:20]),
        .WriteReg(inst[11:7]),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );  
    
    alu i_alu (
        .op1(ReadData1),
        .op2(op2),
        .ALUop(ALUop),
        .ALUresult(ALUresult),
        .ALUZero(ALUZero)
    );
    
    sign_extend i_sign_extend (
        .ImmSelect(ImmSelect),
        .inst(inst[31:7]),
        .immediate(immediate)
    );
    
    controller i_controller (
        .clk(clk),
        .nrst(nrst),
        .inst(inst),
        .ALUZero(ALUZero),
        .PCsrc(PCsrc),
        .InstType(ImmSelect),
        .RegWrite(RegWrite),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .MemWrite(wr_en),
        .MemtoReg(MemtoReg)
    );
    
endmodule

