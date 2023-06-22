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
        output  [7:0]   wmask,
        output  [63:0]  ALUop1,
        output  [63:0]  ALUop2,
        output  [63:0]  ALUres,
        output  [63:0]  RFwrdata,
        output          RFwren
    );
    

    /*---- wire declarations ----*/
    
    // ReadData signals are the outputs of the register file
    // op2 is the second operand for the ALU    
    // immediate is the sign-extended immediate value
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [63:0] op2;
    wire [63:0] ALUresult;
    wire [63:0] immediate;
    // BranchAddr is the PC offset, i.e. sign-extended immediate value shifted left by 1 
    wire [31:0] BranchAddr;
    // ALUop is the ALU operation code
    wire [2:0]  ALUop;
    // Control signals:
        // ImmSelect is the immediate value selection code
        // PCsrc is the PC source selection code
        // MemtoReg is the memory write back selector
    wire [1:0]  ImmSelect;
    wire [1:0]  PCsrc;
    wire [1:0]  MemtoReg;
    // Control signals:
        // RegWrite is the register write enable signal
        // ALUZero asserts is ALU output is equal to zero
        // ALUsrc is the ALU source selection signal
        // MemWrite is Data Mem write enable
    wire        RegWrite;
    wire        ALUZero;
    wire        ALUsrc;
    wire        MemWrite;
    
    /*---- reg declarations ----*/

    // WriteData is the data to be written to the register file
    reg  [63:0] WriteData;
    reg  [63:0] ID_EX_ReadData1;
    reg  [63:0] ID_EX_ReadData2;
    reg  [63:0] EX_MEM_ReadData2;
    reg  [63:0] EX_MEM_ALUresult;
    reg  [63:0] MEM_WB_WriteData;

    reg  [31:0] NextPC;
    reg  [31:0] IF_ID_inst;
    reg  [31:0] IF_ID_pc;
    reg  [31:0] ID_EX_inst;
    reg  [31:0] ID_EX_pc;
    reg  [31:0] EX_MEM_inst;
    reg  [31:0] EX_MEM_pc;
    reg  [31:0] MEM_WB_inst;

    reg  [1:0]  EX_MEM_MemtoReg;

    
    reg         EX_MEM_RegWrite;
    reg         EX_MEM_MemWrite;
    reg         MEM_WB_RegWrite;

    assign BranchAddr = {immediate[30:0], 1'b0};
    assign op2 = ALUsrc ? immediate : ID_EX_ReadData2;
    assign wdata = EX_MEM_ReadData2;
    assign addr = EX_MEM_ALUresult[31:0];
    assign wmask = 8'hff;
    assign wr_en = EX_MEM_MemWrite;
    
    
    assign  ALUop1 = ID_EX_ReadData1;
    assign  ALUop2 = ID_EX_ReadData2;
    assign  ALUres = EX_MEM_ALUresult;
    assign  RFwrdata = MEM_WB_WriteData;
    assign  RFwren = MEM_WB_RegWrite;
    
    // Instruction Fetch Stage

    /* --- PC Selector --- */
    always@(*) begin
        NextPC = pc + 4;
        case (PCsrc)
            2'b01: NextPC = ID_EX_pc + BranchAddr;      // jal / branch instructions
            2'b10: NextPC = {ALUresult[31:1], 1'b0};    // jalr instructions
        endcase
    end
    
    pc i_pc (
        .clk(clk),
        .nrst(nrst),
        .NextPC(NextPC),
        .CurrentPC(pc)
    );
    
    // Instruction Decode Stage

    register_file i_register_file (
        .clk(clk),
        .nrst(nrst),
        .RegWrite(MEM_WB_RegWrite),
        .ReadReg1(IF_ID_inst[19:15]),
        .ReadReg2(IF_ID_inst[24:20]),
        .WriteReg(MEM_WB_inst[11:7]),
        .WriteData(MEM_WB_WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    sign_extend i_sign_extend (
        .ImmSelect(ImmSelect),
        .inst(ID_EX_inst[31:7]),
        .immediate(immediate)
    );  
    
    // Execution Stage

    alu i_alu (
        .op1(ID_EX_ReadData1),
        .op2(op2),
        .ALUop(ALUop),
        .ALUresult(ALUresult),
        .ALUZero(ALUZero)
    );
    
    // Memory Access Stage
    
    always@(*) begin
        WriteData = rdata;
        case(EX_MEM_MemtoReg)
            2'b01:  WriteData = EX_MEM_ALUresult;
            2'b10:  WriteData = {32'h0, EX_MEM_pc + 4};
        endcase 
    end
    

    // Control Signals

    controller i_controller (
        .clk(clk),
        .nrst(nrst),
        .inst(ID_EX_inst),
        .ALUZero(ALUZero),
        .PCsrc(PCsrc),
        .InstType(ImmSelect),
        .RegWrite(RegWrite),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg)
    );
    

/* -- pipeline registers -- */

    // IF/ID
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            // Data Signals
            IF_ID_pc <= 0;
            IF_ID_inst <= 0;
        end else begin
            IF_ID_pc <= pc;
            IF_ID_inst <= inst;
        end
    end
    
    // ID/EX
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            // Data Signals
            ID_EX_pc <= 0;
            ID_EX_inst <= 0;
            ID_EX_ReadData1 <= 0;
            ID_EX_ReadData2 <= 0;
        end else begin
            ID_EX_pc <= IF_ID_pc;
            ID_EX_inst <= IF_ID_inst;
            ID_EX_ReadData1 <= ReadData1;             
            ID_EX_ReadData2 <= ReadData2;
        end
    end

    // EX/MEM
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            // Data Signals
            EX_MEM_pc <= 0;              
            EX_MEM_inst <= 0;
            EX_MEM_ALUresult <= 0;
            EX_MEM_ReadData2 <= 0;
            // Control Signals
            EX_MEM_RegWrite <= 0;
            EX_MEM_MemWrite <= 0;
            EX_MEM_MemtoReg <= 0;
        end else begin
            EX_MEM_pc <= ID_EX_pc;
            EX_MEM_inst <= ID_EX_inst;
            EX_MEM_ALUresult <= ALUresult;  
            EX_MEM_ReadData2 <= ID_EX_ReadData2;    // data to store in memory for sd instructions
            EX_MEM_RegWrite <= RegWrite;            // reg write enable
            EX_MEM_MemWrite <= MemWrite;            // mem write enable
            EX_MEM_MemtoReg <= MemtoReg;            // WB Selector
        end
    end

    // MEM/WB
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            // Data Signals
            MEM_WB_inst <= 0;
            MEM_WB_WriteData <= 0;
            // Control Signals
            MEM_WB_RegWrite <= 0;
        end else begin
            MEM_WB_inst <= EX_MEM_inst;
            MEM_WB_WriteData <= WriteData;          // data to write to register file
            MEM_WB_RegWrite <= EX_MEM_RegWrite;     // reg write enable
        end
    end
    
endmodule

