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
    

    // wire declarations
         
    wire [63:0] ReadData1, ReadData2, op2, ALUresult, immediate;
        // ReadData signals are the outputs of the register file
        // op2 is the second operand for the ALU
        // immediate is the sign-extended immediate value
    wire [31:0] BranchAddr;
        // BranchAddr is the PC offset, i.e. sign-extended immediate value shifted left by 1 
    wire [2:0]  ALUop;
        // ALUop is the ALU operation code
    wire [1:0]  ImmSelect, PCsrc, MemtoReg;
        // Control signals:
            // ImmSelect is the immediate value selection code
            // PCsrc is the PC source selection code
            // MemtoReg is the memory to register selection code
    wire        RegWrite, ALUZero, ALUsrc;
        // Control signals:
            // RegWrite is the register write enable signal
            // ALUZero asserts is ALU output is equal to zero
            // ALUsrc is the ALU source selection signal

    // reg declarations
    reg  [63:0] WriteData, IF_ID_inst, ID_EX_rs1, ID_EX_rs2, EX_MEM_ALUresult, MEM_WB_ALUresult;
        // WriteData is the data to be written to the register file
        

    reg  [31:0] NextPC, IF_ID_pc, ID_EX_pc, ID_EX_immediate, EX_MEM_pc, MEM_WB_pc;
    
    assign BranchAddr = {immediate[30:0], 1'b0};
    assign op2 = ALUsrc ? immediate : ReadData2;
    assign wdata = ReadData2;
    assign addr = ALUresult[31:0];
    assign wmask = 8'hff;
    
    // Instruction Fetch Stage

    always@(*) begin
        NextPC = pc + 4;
        case (PCsrc)
            2'b01: NextPC = pc + BranchAddr;
            2'b10: NextPC = {ALUresult[31:1], 1'b0};
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
        .RegWrite(RegWrite),
        .ReadReg1(inst[19:15]),
        .ReadReg2(inst[24:20]),
        .WriteReg(inst[11:7]),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    sign_extend i_sign_extend (
        .ImmSelect(ImmSelect),
        .inst(inst[31:7]),
        .immediate(immediate)
    );  
    
    // Execution Stage

    alu i_alu (
        .op1(ReadData1),
        .op2(op2),
        .ALUop(ALUop),
        .ALUresult(ALUresult),
        .ALUZero(ALUZero)
    );
    
    // Memory Access Stage
    
    always@(*) begin
        WriteData = rdata;
        case(MemtoReg)
            2'b01:  WriteData = ALUresult;
            2'b10:  WriteData = {32'h0, pc + 4};
        endcase 
    end
    

    // Control Signals

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
    

/* -- pipeline registers -- */

    // IF/ID
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            IF_ID_inst <= 0;
            IF_ID_pc <= 0;
        end else begin
            IF_ID_inst <= inst;
            IF_ID_pc <= pc;
        end
    end
    
    // ID/EX
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            ID_EX_pc <= 0;
            ID_EX_rs1 <= 0;
            ID_EX_rs2 <= 0;
            ID_EX_rd <= 0;
            //ID_EX_inst <= 0;
            ID_EX_immediate <= 0;
            //ID_EX_ReadData1 <= 0;
            //ID_EX_ReadData2 <= 0;
            ID_EX_RegWrite <= 0;
            //ID_EX_ALUsrc <= 0;
            ID_EX_ALUop <= 0;
            ID_EX_MemWrite <= 0;
            ID_EX_MemtoReg <= 0;
            //ID_EX_PCsrc <= 0;
        end else begin
            ID_EX_pc <= IF_ID_pc;
            ID_EX_rs1 <= ReadData1;             // ReadData1
            ID_EX_rs2 <= ReadData2;                   // immediate or ReadData2
            ID_EX_rd <= IF_ID_inst[11:7];       // destination register for writes
            //ID_EX_inst <= IF_ID_inst;           
            ID_EX_immediate <= immediate;
            //ID_EX_ReadData1 <= ReadData1;     // redundant with rs1
            //ID_EX_ReadData2 <= ReadData2;       // propagate for mem writes
            ID_EX_RegWrite <= RegWrite;         // propagate for reg writes   
            //ID_EX_ALUsrc <= ALUsrc;           // not needed, since op2 is propagated             
            ID_EX_ALUop <= ALUop;               // from controller, so need to sync with ID stage
            ID_EX_MemWrite <= wr_en;            // from controller, so need to sync with ID stage
            ID_EX_MemtoReg <= MemtoReg;         // from controller, so need to sync with ID stage
            //ID_EX_PCsrc <= PCsrc;             // from controller, needs result from ALU
        end
    end

    // EX/MEM
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            //EX_MEM_pc <= 0;
            EX_MEM_rd <= 0;                     
            //EX_MEM_inst <= 0;
            EX_MEM_ALUresult <= 0;
            EX_MEM_ReadData2 <= 0;
            EX_MEM_WriteData <= 0;
            EX_MEM_RegWrite <= 0;
            EX_MEM_MemWrite <= 0;
            EX_MEM_MemtoReg <= 0;
        end else begin
            //EX_MEM_pc <= ID_EX_pc;
            EX_MEM_rd <= ID_EX_rd;              // destination register for writes
            //EX_MEM_inst <= ID_EX_inst;
            EX_MEM_ALUresult <= ALUresult;  
            EX_MEM_ReadData2 <= ReadData2;      // data to store in memory for sd instructions
            EX_MEM_WriteData <= WriteData;      // data to store in register for ld/reg instructions
            EX_MEM_RegWrite <= RegWrite;        // reg write enable
            EX_MEM_MemWrite <= wr_en;           // mem write enable
            EX_MEM_MemtoReg <= MemtoReg;        // control signal for mux in WB stage
        end
    end

    // MEM/WB
    always@(posedge clk or negedge nrst) begin
        if (!nrst) begin
            //MEM_WB_pc <= 0;
            MEM_WB_rd <= 0;
            //MEM_WB_inst <= 0;
            MEM_WB_ALUresult <= 0;
            MEM_WB_ReadData <= 0;
            MEM_WB_RegWrite <= 0;
            MEM_WB_MemtoReg <= 0;
        end else begin
            //MEM_WB_pc <= EX_MEM_pc;
            MEM_WB_rd <= EX_MEM_rd;             // destination register for writes
            //MEM_WB_inst <= EX_MEM_inst;
            MEM_WB_ALUresult <= EX_MEM_ALUresult;
            MEM_WB_ReadData <= ReadData2;       // data to store in register for ld instructions
            MEM_WB_RegWrite <= EX_MEM_RegWrite; // reg write enable
            MEM_WB_MemtoReg <= EX_MEM_MemtoReg; // control signal for mux in WB stage
        end
    end
    
endmodule

