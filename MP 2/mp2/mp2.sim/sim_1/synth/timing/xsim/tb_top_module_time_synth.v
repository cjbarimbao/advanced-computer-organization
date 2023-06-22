// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Jun 23 01:49:52 2023
// Host        : ALIMUOM-VIP running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               {C:/Users/CJ/Desktop/advanced-computer-organization/MP
//               2/mp2/mp2.sim/sim_1/synth/timing/xsim/tb_top_module_time_synth.v}
// Design      : top_module
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module RAM256X1S_UNIQ_BASE_
   (O,
    A,
    D,
    WCLK,
    WE);
  output O;
  input [7:0]A;
  input D;
  input WCLK;
  input WE;

  wire A0;
  wire A1;
  wire A2;
  wire A3;
  wire A4;
  wire A5;
  wire A6;
  wire A7;
  wire D;
  wire O;
  wire O0;
  wire O1;
  wire OA;
  wire OB;
  wire OC;
  wire OD;
  wire WCLK;
  wire WE;

  assign A0 = A[0];
  assign A1 = A[1];
  assign A2 = A[2];
  assign A3 = A[3];
  assign A4 = A[4];
  assign A5 = A[5];
  assign A6 = A[6];
  assign A7 = A[7];
  MUXF7 \F7.A 
       (.I0(OB),
        .I1(OA),
        .O(O1),
        .S(A6));
  MUXF7 \F7.B 
       (.I0(OD),
        .I1(OC),
        .O(O0),
        .S(A6));
  MUXF8 F8
       (.I0(O0),
        .I1(O1),
        .O(O),
        .S(A7));
  RAMS64E #(
    .INIT(64'h0000000000000000),
    .IS_CLK_INVERTED(1'b0),
    .RAM_ADDRESS_MASK(2'b00),
    .RAM_ADDRESS_SPACE(2'b11)) 
    RAMS64E_A
       (.ADR0(A0),
        .ADR1(A1),
        .ADR2(A2),
        .ADR3(A3),
        .ADR4(A4),
        .ADR5(A5),
        .CLK(WCLK),
        .I(D),
        .O(OA),
        .WADR6(A6),
        .WADR7(A7),
        .WE(WE));
  RAMS64E #(
    .INIT(64'h0000000000000000),
    .IS_CLK_INVERTED(1'b0),
    .RAM_ADDRESS_MASK(2'b00),
    .RAM_ADDRESS_SPACE(2'b10)) 
    RAMS64E_B
       (.ADR0(A0),
        .ADR1(A1),
        .ADR2(A2),
        .ADR3(A3),
        .ADR4(A4),
        .ADR5(A5),
        .CLK(WCLK),
        .I(D),
        .O(OB),
        .WADR6(A6),
        .WADR7(A7),
        .WE(WE));
  RAMS64E #(
    .INIT(64'h0000000000000000),
    .IS_CLK_INVERTED(1'b0),
    .RAM_ADDRESS_MASK(2'b00),
    .RAM_ADDRESS_SPACE(2'b01)) 
    RAMS64E_C
       (.ADR0(A0),
        .ADR1(A1),
        .ADR2(A2),
        .ADR3(A3),
        .ADR4(A4),
        .ADR5(A5),
        .CLK(WCLK),
        .I(D),
        .O(OC),
        .WADR6(A6),
        .WADR7(A7),
        .WE(WE));
  RAMS64E #(
    .INIT(64'h0000000000000000),
    .IS_CLK_INVERTED(1'b0),
    .RAM_ADDRESS_MASK(2'b00),
    .RAM_ADDRESS_SPACE(2'b00)) 
    RAMS64E_D
       (.ADR0(A0),
        .ADR1(A1),
        .ADR2(A2),
        .ADR3(A3),
        .ADR4(A4),
        .ADR5(A5),
        .CLK(WCLK),
        .I(D),
        .O(OD),
        .WADR6(A6),
        .WADR7(A7),
        .WE(WE));
endmodule

module mem_model
   (rdata_OBUF,
    CLK);
  output [0:0]rdata_OBUF;
  input CLK;

  wire CLK;
  wire [0:0]rdata_OBUF;

  (* INIT = "256'h0000000000000000000000000000000000000000000000000000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "i_mem_model/memdata" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "63" *) 
  RAM256X1S_UNIQ_BASE_ memdata_reg_0_255_63_63
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(1'b0),
        .O(rdata_OBUF),
        .WCLK(CLK),
        .WE(1'b0));
endmodule

module pc
   (nrst,
    Q,
    nrst_IBUF,
    NextPC0,
    CLK);
  output nrst;
  output [30:0]Q;
  input nrst_IBUF;
  input [30:0]NextPC0;
  input CLK;

  wire CLK;
  wire [30:0]NextPC0;
  wire [30:0]Q;
  wire nrst;
  wire nrst_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    \CurrentPC[31]_i_2 
       (.I0(nrst_IBUF),
        .O(nrst));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[9]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[30]),
        .Q(Q[30]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \CurrentPC_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(nrst),
        .D(NextPC0[8]),
        .Q(Q[8]));
endmodule

module processor
   (Q,
    RFwrdata,
    CLK,
    rdata_OBUF,
    nrst_IBUF);
  output [30:0]Q;
  output [0:0]RFwrdata;
  input CLK;
  input [0:0]rdata_OBUF;
  input nrst_IBUF;

  wire CLK;
  wire \CurrentPC[4]_i_2_n_0 ;
  wire \CurrentPC_reg[12]_i_1_n_0 ;
  wire \CurrentPC_reg[12]_i_1_n_1 ;
  wire \CurrentPC_reg[12]_i_1_n_2 ;
  wire \CurrentPC_reg[12]_i_1_n_3 ;
  wire \CurrentPC_reg[16]_i_1_n_0 ;
  wire \CurrentPC_reg[16]_i_1_n_1 ;
  wire \CurrentPC_reg[16]_i_1_n_2 ;
  wire \CurrentPC_reg[16]_i_1_n_3 ;
  wire \CurrentPC_reg[20]_i_1_n_0 ;
  wire \CurrentPC_reg[20]_i_1_n_1 ;
  wire \CurrentPC_reg[20]_i_1_n_2 ;
  wire \CurrentPC_reg[20]_i_1_n_3 ;
  wire \CurrentPC_reg[24]_i_1_n_0 ;
  wire \CurrentPC_reg[24]_i_1_n_1 ;
  wire \CurrentPC_reg[24]_i_1_n_2 ;
  wire \CurrentPC_reg[24]_i_1_n_3 ;
  wire \CurrentPC_reg[28]_i_1_n_0 ;
  wire \CurrentPC_reg[28]_i_1_n_1 ;
  wire \CurrentPC_reg[28]_i_1_n_2 ;
  wire \CurrentPC_reg[28]_i_1_n_3 ;
  wire \CurrentPC_reg[31]_i_1_n_2 ;
  wire \CurrentPC_reg[31]_i_1_n_3 ;
  wire \CurrentPC_reg[4]_i_1_n_0 ;
  wire \CurrentPC_reg[4]_i_1_n_1 ;
  wire \CurrentPC_reg[4]_i_1_n_2 ;
  wire \CurrentPC_reg[4]_i_1_n_3 ;
  wire \CurrentPC_reg[8]_i_1_n_0 ;
  wire \CurrentPC_reg[8]_i_1_n_1 ;
  wire \CurrentPC_reg[8]_i_1_n_2 ;
  wire \CurrentPC_reg[8]_i_1_n_3 ;
  wire [31:1]NextPC0;
  wire [30:0]Q;
  wire [0:0]RFwrdata;
  wire i_pc_n_0;
  wire nrst_IBUF;
  wire [0:0]rdata_OBUF;
  wire [3:2]\NLW_CurrentPC_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_CurrentPC_reg[31]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \CurrentPC[4]_i_2 
       (.I0(Q[1]),
        .O(\CurrentPC[4]_i_2_n_0 ));
  CARRY4 \CurrentPC_reg[12]_i_1 
       (.CI(\CurrentPC_reg[8]_i_1_n_0 ),
        .CO({\CurrentPC_reg[12]_i_1_n_0 ,\CurrentPC_reg[12]_i_1_n_1 ,\CurrentPC_reg[12]_i_1_n_2 ,\CurrentPC_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[12:9]),
        .S(Q[11:8]));
  CARRY4 \CurrentPC_reg[16]_i_1 
       (.CI(\CurrentPC_reg[12]_i_1_n_0 ),
        .CO({\CurrentPC_reg[16]_i_1_n_0 ,\CurrentPC_reg[16]_i_1_n_1 ,\CurrentPC_reg[16]_i_1_n_2 ,\CurrentPC_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[16:13]),
        .S(Q[15:12]));
  CARRY4 \CurrentPC_reg[20]_i_1 
       (.CI(\CurrentPC_reg[16]_i_1_n_0 ),
        .CO({\CurrentPC_reg[20]_i_1_n_0 ,\CurrentPC_reg[20]_i_1_n_1 ,\CurrentPC_reg[20]_i_1_n_2 ,\CurrentPC_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[20:17]),
        .S(Q[19:16]));
  CARRY4 \CurrentPC_reg[24]_i_1 
       (.CI(\CurrentPC_reg[20]_i_1_n_0 ),
        .CO({\CurrentPC_reg[24]_i_1_n_0 ,\CurrentPC_reg[24]_i_1_n_1 ,\CurrentPC_reg[24]_i_1_n_2 ,\CurrentPC_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[24:21]),
        .S(Q[23:20]));
  CARRY4 \CurrentPC_reg[28]_i_1 
       (.CI(\CurrentPC_reg[24]_i_1_n_0 ),
        .CO({\CurrentPC_reg[28]_i_1_n_0 ,\CurrentPC_reg[28]_i_1_n_1 ,\CurrentPC_reg[28]_i_1_n_2 ,\CurrentPC_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[28:25]),
        .S(Q[27:24]));
  CARRY4 \CurrentPC_reg[31]_i_1 
       (.CI(\CurrentPC_reg[28]_i_1_n_0 ),
        .CO({\NLW_CurrentPC_reg[31]_i_1_CO_UNCONNECTED [3:2],\CurrentPC_reg[31]_i_1_n_2 ,\CurrentPC_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_CurrentPC_reg[31]_i_1_O_UNCONNECTED [3],NextPC0[31:29]}),
        .S({1'b0,Q[30:28]}));
  CARRY4 \CurrentPC_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\CurrentPC_reg[4]_i_1_n_0 ,\CurrentPC_reg[4]_i_1_n_1 ,\CurrentPC_reg[4]_i_1_n_2 ,\CurrentPC_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[1],1'b0}),
        .O(NextPC0[4:1]),
        .S({Q[3:2],\CurrentPC[4]_i_2_n_0 ,Q[0]}));
  CARRY4 \CurrentPC_reg[8]_i_1 
       (.CI(\CurrentPC_reg[4]_i_1_n_0 ),
        .CO({\CurrentPC_reg[8]_i_1_n_0 ,\CurrentPC_reg[8]_i_1_n_1 ,\CurrentPC_reg[8]_i_1_n_2 ,\CurrentPC_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NextPC0[8:5]),
        .S(Q[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \MEM_WB_WriteData_reg[63] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(i_pc_n_0),
        .D(rdata_OBUF),
        .Q(RFwrdata));
  pc i_pc
       (.CLK(CLK),
        .NextPC0(NextPC0),
        .Q(Q),
        .nrst(i_pc_n_0),
        .nrst_IBUF(nrst_IBUF));
endmodule

(* NotValidForBitStream *)
module top_module
   (clk,
    nrst,
    pc,
    inst,
    addr,
    rdata,
    wdata,
    wmask,
    wr_en,
    ALUop1,
    ALUop2,
    ALUres,
    RFwrdata,
    RFwren);
  input clk;
  input nrst;
  output [31:0]pc;
  output [31:0]inst;
  output [31:0]addr;
  output [63:0]rdata;
  output [63:0]wdata;
  output [7:0]wmask;
  output wr_en;
  output [63:0]ALUop1;
  output [63:0]ALUop2;
  output [63:0]ALUres;
  output [63:0]RFwrdata;
  output RFwren;

  wire [63:0]ALUop1;
  wire [63:0]ALUop2;
  wire [63:0]ALUres;
  wire [63:0]RFwrdata;
  wire [0:0]RFwrdata_OBUF;
  wire RFwren;
  wire [31:0]addr;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]inst;
  wire nrst;
  wire nrst_IBUF;
  wire [31:0]pc;
  wire [31:1]pc_OBUF;
  wire [63:0]rdata;
  wire [0:0]rdata_OBUF;
  wire [63:0]wdata;
  wire [7:0]wmask;
  wire wr_en;

initial begin
 $sdf_annotate("tb_top_module_time_synth.sdf",,,,"tool_control");
end
  OBUF \ALUop1_OBUF[0]_inst 
       (.I(1'b0),
        .O(ALUop1[0]));
  OBUF \ALUop1_OBUF[10]_inst 
       (.I(1'b0),
        .O(ALUop1[10]));
  OBUF \ALUop1_OBUF[11]_inst 
       (.I(1'b0),
        .O(ALUop1[11]));
  OBUF \ALUop1_OBUF[12]_inst 
       (.I(1'b0),
        .O(ALUop1[12]));
  OBUF \ALUop1_OBUF[13]_inst 
       (.I(1'b0),
        .O(ALUop1[13]));
  OBUF \ALUop1_OBUF[14]_inst 
       (.I(1'b0),
        .O(ALUop1[14]));
  OBUF \ALUop1_OBUF[15]_inst 
       (.I(1'b0),
        .O(ALUop1[15]));
  OBUF \ALUop1_OBUF[16]_inst 
       (.I(1'b0),
        .O(ALUop1[16]));
  OBUF \ALUop1_OBUF[17]_inst 
       (.I(1'b0),
        .O(ALUop1[17]));
  OBUF \ALUop1_OBUF[18]_inst 
       (.I(1'b0),
        .O(ALUop1[18]));
  OBUF \ALUop1_OBUF[19]_inst 
       (.I(1'b0),
        .O(ALUop1[19]));
  OBUF \ALUop1_OBUF[1]_inst 
       (.I(1'b0),
        .O(ALUop1[1]));
  OBUF \ALUop1_OBUF[20]_inst 
       (.I(1'b0),
        .O(ALUop1[20]));
  OBUF \ALUop1_OBUF[21]_inst 
       (.I(1'b0),
        .O(ALUop1[21]));
  OBUF \ALUop1_OBUF[22]_inst 
       (.I(1'b0),
        .O(ALUop1[22]));
  OBUF \ALUop1_OBUF[23]_inst 
       (.I(1'b0),
        .O(ALUop1[23]));
  OBUF \ALUop1_OBUF[24]_inst 
       (.I(1'b0),
        .O(ALUop1[24]));
  OBUF \ALUop1_OBUF[25]_inst 
       (.I(1'b0),
        .O(ALUop1[25]));
  OBUF \ALUop1_OBUF[26]_inst 
       (.I(1'b0),
        .O(ALUop1[26]));
  OBUF \ALUop1_OBUF[27]_inst 
       (.I(1'b0),
        .O(ALUop1[27]));
  OBUF \ALUop1_OBUF[28]_inst 
       (.I(1'b0),
        .O(ALUop1[28]));
  OBUF \ALUop1_OBUF[29]_inst 
       (.I(1'b0),
        .O(ALUop1[29]));
  OBUF \ALUop1_OBUF[2]_inst 
       (.I(1'b0),
        .O(ALUop1[2]));
  OBUF \ALUop1_OBUF[30]_inst 
       (.I(1'b0),
        .O(ALUop1[30]));
  OBUF \ALUop1_OBUF[31]_inst 
       (.I(1'b0),
        .O(ALUop1[31]));
  OBUF \ALUop1_OBUF[32]_inst 
       (.I(1'b0),
        .O(ALUop1[32]));
  OBUF \ALUop1_OBUF[33]_inst 
       (.I(1'b0),
        .O(ALUop1[33]));
  OBUF \ALUop1_OBUF[34]_inst 
       (.I(1'b0),
        .O(ALUop1[34]));
  OBUF \ALUop1_OBUF[35]_inst 
       (.I(1'b0),
        .O(ALUop1[35]));
  OBUF \ALUop1_OBUF[36]_inst 
       (.I(1'b0),
        .O(ALUop1[36]));
  OBUF \ALUop1_OBUF[37]_inst 
       (.I(1'b0),
        .O(ALUop1[37]));
  OBUF \ALUop1_OBUF[38]_inst 
       (.I(1'b0),
        .O(ALUop1[38]));
  OBUF \ALUop1_OBUF[39]_inst 
       (.I(1'b0),
        .O(ALUop1[39]));
  OBUF \ALUop1_OBUF[3]_inst 
       (.I(1'b0),
        .O(ALUop1[3]));
  OBUF \ALUop1_OBUF[40]_inst 
       (.I(1'b0),
        .O(ALUop1[40]));
  OBUF \ALUop1_OBUF[41]_inst 
       (.I(1'b0),
        .O(ALUop1[41]));
  OBUF \ALUop1_OBUF[42]_inst 
       (.I(1'b0),
        .O(ALUop1[42]));
  OBUF \ALUop1_OBUF[43]_inst 
       (.I(1'b0),
        .O(ALUop1[43]));
  OBUF \ALUop1_OBUF[44]_inst 
       (.I(1'b0),
        .O(ALUop1[44]));
  OBUF \ALUop1_OBUF[45]_inst 
       (.I(1'b0),
        .O(ALUop1[45]));
  OBUF \ALUop1_OBUF[46]_inst 
       (.I(1'b0),
        .O(ALUop1[46]));
  OBUF \ALUop1_OBUF[47]_inst 
       (.I(1'b0),
        .O(ALUop1[47]));
  OBUF \ALUop1_OBUF[48]_inst 
       (.I(1'b0),
        .O(ALUop1[48]));
  OBUF \ALUop1_OBUF[49]_inst 
       (.I(1'b0),
        .O(ALUop1[49]));
  OBUF \ALUop1_OBUF[4]_inst 
       (.I(1'b0),
        .O(ALUop1[4]));
  OBUF \ALUop1_OBUF[50]_inst 
       (.I(1'b0),
        .O(ALUop1[50]));
  OBUF \ALUop1_OBUF[51]_inst 
       (.I(1'b0),
        .O(ALUop1[51]));
  OBUF \ALUop1_OBUF[52]_inst 
       (.I(1'b0),
        .O(ALUop1[52]));
  OBUF \ALUop1_OBUF[53]_inst 
       (.I(1'b0),
        .O(ALUop1[53]));
  OBUF \ALUop1_OBUF[54]_inst 
       (.I(1'b0),
        .O(ALUop1[54]));
  OBUF \ALUop1_OBUF[55]_inst 
       (.I(1'b0),
        .O(ALUop1[55]));
  OBUF \ALUop1_OBUF[56]_inst 
       (.I(1'b0),
        .O(ALUop1[56]));
  OBUF \ALUop1_OBUF[57]_inst 
       (.I(1'b0),
        .O(ALUop1[57]));
  OBUF \ALUop1_OBUF[58]_inst 
       (.I(1'b0),
        .O(ALUop1[58]));
  OBUF \ALUop1_OBUF[59]_inst 
       (.I(1'b0),
        .O(ALUop1[59]));
  OBUF \ALUop1_OBUF[5]_inst 
       (.I(1'b0),
        .O(ALUop1[5]));
  OBUF \ALUop1_OBUF[60]_inst 
       (.I(1'b0),
        .O(ALUop1[60]));
  OBUF \ALUop1_OBUF[61]_inst 
       (.I(1'b0),
        .O(ALUop1[61]));
  OBUF \ALUop1_OBUF[62]_inst 
       (.I(1'b0),
        .O(ALUop1[62]));
  OBUF \ALUop1_OBUF[63]_inst 
       (.I(1'b0),
        .O(ALUop1[63]));
  OBUF \ALUop1_OBUF[6]_inst 
       (.I(1'b0),
        .O(ALUop1[6]));
  OBUF \ALUop1_OBUF[7]_inst 
       (.I(1'b0),
        .O(ALUop1[7]));
  OBUF \ALUop1_OBUF[8]_inst 
       (.I(1'b0),
        .O(ALUop1[8]));
  OBUF \ALUop1_OBUF[9]_inst 
       (.I(1'b0),
        .O(ALUop1[9]));
  OBUF \ALUop2_OBUF[0]_inst 
       (.I(1'b0),
        .O(ALUop2[0]));
  OBUF \ALUop2_OBUF[10]_inst 
       (.I(1'b0),
        .O(ALUop2[10]));
  OBUF \ALUop2_OBUF[11]_inst 
       (.I(1'b0),
        .O(ALUop2[11]));
  OBUF \ALUop2_OBUF[12]_inst 
       (.I(1'b0),
        .O(ALUop2[12]));
  OBUF \ALUop2_OBUF[13]_inst 
       (.I(1'b0),
        .O(ALUop2[13]));
  OBUF \ALUop2_OBUF[14]_inst 
       (.I(1'b0),
        .O(ALUop2[14]));
  OBUF \ALUop2_OBUF[15]_inst 
       (.I(1'b0),
        .O(ALUop2[15]));
  OBUF \ALUop2_OBUF[16]_inst 
       (.I(1'b0),
        .O(ALUop2[16]));
  OBUF \ALUop2_OBUF[17]_inst 
       (.I(1'b0),
        .O(ALUop2[17]));
  OBUF \ALUop2_OBUF[18]_inst 
       (.I(1'b0),
        .O(ALUop2[18]));
  OBUF \ALUop2_OBUF[19]_inst 
       (.I(1'b0),
        .O(ALUop2[19]));
  OBUF \ALUop2_OBUF[1]_inst 
       (.I(1'b0),
        .O(ALUop2[1]));
  OBUF \ALUop2_OBUF[20]_inst 
       (.I(1'b0),
        .O(ALUop2[20]));
  OBUF \ALUop2_OBUF[21]_inst 
       (.I(1'b0),
        .O(ALUop2[21]));
  OBUF \ALUop2_OBUF[22]_inst 
       (.I(1'b0),
        .O(ALUop2[22]));
  OBUF \ALUop2_OBUF[23]_inst 
       (.I(1'b0),
        .O(ALUop2[23]));
  OBUF \ALUop2_OBUF[24]_inst 
       (.I(1'b0),
        .O(ALUop2[24]));
  OBUF \ALUop2_OBUF[25]_inst 
       (.I(1'b0),
        .O(ALUop2[25]));
  OBUF \ALUop2_OBUF[26]_inst 
       (.I(1'b0),
        .O(ALUop2[26]));
  OBUF \ALUop2_OBUF[27]_inst 
       (.I(1'b0),
        .O(ALUop2[27]));
  OBUF \ALUop2_OBUF[28]_inst 
       (.I(1'b0),
        .O(ALUop2[28]));
  OBUF \ALUop2_OBUF[29]_inst 
       (.I(1'b0),
        .O(ALUop2[29]));
  OBUF \ALUop2_OBUF[2]_inst 
       (.I(1'b0),
        .O(ALUop2[2]));
  OBUF \ALUop2_OBUF[30]_inst 
       (.I(1'b0),
        .O(ALUop2[30]));
  OBUF \ALUop2_OBUF[31]_inst 
       (.I(1'b0),
        .O(ALUop2[31]));
  OBUF \ALUop2_OBUF[32]_inst 
       (.I(1'b0),
        .O(ALUop2[32]));
  OBUF \ALUop2_OBUF[33]_inst 
       (.I(1'b0),
        .O(ALUop2[33]));
  OBUF \ALUop2_OBUF[34]_inst 
       (.I(1'b0),
        .O(ALUop2[34]));
  OBUF \ALUop2_OBUF[35]_inst 
       (.I(1'b0),
        .O(ALUop2[35]));
  OBUF \ALUop2_OBUF[36]_inst 
       (.I(1'b0),
        .O(ALUop2[36]));
  OBUF \ALUop2_OBUF[37]_inst 
       (.I(1'b0),
        .O(ALUop2[37]));
  OBUF \ALUop2_OBUF[38]_inst 
       (.I(1'b0),
        .O(ALUop2[38]));
  OBUF \ALUop2_OBUF[39]_inst 
       (.I(1'b0),
        .O(ALUop2[39]));
  OBUF \ALUop2_OBUF[3]_inst 
       (.I(1'b0),
        .O(ALUop2[3]));
  OBUF \ALUop2_OBUF[40]_inst 
       (.I(1'b0),
        .O(ALUop2[40]));
  OBUF \ALUop2_OBUF[41]_inst 
       (.I(1'b0),
        .O(ALUop2[41]));
  OBUF \ALUop2_OBUF[42]_inst 
       (.I(1'b0),
        .O(ALUop2[42]));
  OBUF \ALUop2_OBUF[43]_inst 
       (.I(1'b0),
        .O(ALUop2[43]));
  OBUF \ALUop2_OBUF[44]_inst 
       (.I(1'b0),
        .O(ALUop2[44]));
  OBUF \ALUop2_OBUF[45]_inst 
       (.I(1'b0),
        .O(ALUop2[45]));
  OBUF \ALUop2_OBUF[46]_inst 
       (.I(1'b0),
        .O(ALUop2[46]));
  OBUF \ALUop2_OBUF[47]_inst 
       (.I(1'b0),
        .O(ALUop2[47]));
  OBUF \ALUop2_OBUF[48]_inst 
       (.I(1'b0),
        .O(ALUop2[48]));
  OBUF \ALUop2_OBUF[49]_inst 
       (.I(1'b0),
        .O(ALUop2[49]));
  OBUF \ALUop2_OBUF[4]_inst 
       (.I(1'b0),
        .O(ALUop2[4]));
  OBUF \ALUop2_OBUF[50]_inst 
       (.I(1'b0),
        .O(ALUop2[50]));
  OBUF \ALUop2_OBUF[51]_inst 
       (.I(1'b0),
        .O(ALUop2[51]));
  OBUF \ALUop2_OBUF[52]_inst 
       (.I(1'b0),
        .O(ALUop2[52]));
  OBUF \ALUop2_OBUF[53]_inst 
       (.I(1'b0),
        .O(ALUop2[53]));
  OBUF \ALUop2_OBUF[54]_inst 
       (.I(1'b0),
        .O(ALUop2[54]));
  OBUF \ALUop2_OBUF[55]_inst 
       (.I(1'b0),
        .O(ALUop2[55]));
  OBUF \ALUop2_OBUF[56]_inst 
       (.I(1'b0),
        .O(ALUop2[56]));
  OBUF \ALUop2_OBUF[57]_inst 
       (.I(1'b0),
        .O(ALUop2[57]));
  OBUF \ALUop2_OBUF[58]_inst 
       (.I(1'b0),
        .O(ALUop2[58]));
  OBUF \ALUop2_OBUF[59]_inst 
       (.I(1'b0),
        .O(ALUop2[59]));
  OBUF \ALUop2_OBUF[5]_inst 
       (.I(1'b0),
        .O(ALUop2[5]));
  OBUF \ALUop2_OBUF[60]_inst 
       (.I(1'b0),
        .O(ALUop2[60]));
  OBUF \ALUop2_OBUF[61]_inst 
       (.I(1'b0),
        .O(ALUop2[61]));
  OBUF \ALUop2_OBUF[62]_inst 
       (.I(1'b0),
        .O(ALUop2[62]));
  OBUF \ALUop2_OBUF[63]_inst 
       (.I(1'b0),
        .O(ALUop2[63]));
  OBUF \ALUop2_OBUF[6]_inst 
       (.I(1'b0),
        .O(ALUop2[6]));
  OBUF \ALUop2_OBUF[7]_inst 
       (.I(1'b0),
        .O(ALUop2[7]));
  OBUF \ALUop2_OBUF[8]_inst 
       (.I(1'b0),
        .O(ALUop2[8]));
  OBUF \ALUop2_OBUF[9]_inst 
       (.I(1'b0),
        .O(ALUop2[9]));
  OBUF \ALUres_OBUF[0]_inst 
       (.I(1'b0),
        .O(ALUres[0]));
  OBUF \ALUres_OBUF[10]_inst 
       (.I(1'b0),
        .O(ALUres[10]));
  OBUF \ALUres_OBUF[11]_inst 
       (.I(1'b0),
        .O(ALUres[11]));
  OBUF \ALUres_OBUF[12]_inst 
       (.I(1'b0),
        .O(ALUres[12]));
  OBUF \ALUres_OBUF[13]_inst 
       (.I(1'b0),
        .O(ALUres[13]));
  OBUF \ALUres_OBUF[14]_inst 
       (.I(1'b0),
        .O(ALUres[14]));
  OBUF \ALUres_OBUF[15]_inst 
       (.I(1'b0),
        .O(ALUres[15]));
  OBUF \ALUres_OBUF[16]_inst 
       (.I(1'b0),
        .O(ALUres[16]));
  OBUF \ALUres_OBUF[17]_inst 
       (.I(1'b0),
        .O(ALUres[17]));
  OBUF \ALUres_OBUF[18]_inst 
       (.I(1'b0),
        .O(ALUres[18]));
  OBUF \ALUres_OBUF[19]_inst 
       (.I(1'b0),
        .O(ALUres[19]));
  OBUF \ALUres_OBUF[1]_inst 
       (.I(1'b0),
        .O(ALUres[1]));
  OBUF \ALUres_OBUF[20]_inst 
       (.I(1'b0),
        .O(ALUres[20]));
  OBUF \ALUres_OBUF[21]_inst 
       (.I(1'b0),
        .O(ALUres[21]));
  OBUF \ALUres_OBUF[22]_inst 
       (.I(1'b0),
        .O(ALUres[22]));
  OBUF \ALUres_OBUF[23]_inst 
       (.I(1'b0),
        .O(ALUres[23]));
  OBUF \ALUres_OBUF[24]_inst 
       (.I(1'b0),
        .O(ALUres[24]));
  OBUF \ALUres_OBUF[25]_inst 
       (.I(1'b0),
        .O(ALUres[25]));
  OBUF \ALUres_OBUF[26]_inst 
       (.I(1'b0),
        .O(ALUres[26]));
  OBUF \ALUres_OBUF[27]_inst 
       (.I(1'b0),
        .O(ALUres[27]));
  OBUF \ALUres_OBUF[28]_inst 
       (.I(1'b0),
        .O(ALUres[28]));
  OBUF \ALUres_OBUF[29]_inst 
       (.I(1'b0),
        .O(ALUres[29]));
  OBUF \ALUres_OBUF[2]_inst 
       (.I(1'b0),
        .O(ALUres[2]));
  OBUF \ALUres_OBUF[30]_inst 
       (.I(1'b0),
        .O(ALUres[30]));
  OBUF \ALUres_OBUF[31]_inst 
       (.I(1'b0),
        .O(ALUres[31]));
  OBUF \ALUres_OBUF[32]_inst 
       (.I(1'b0),
        .O(ALUres[32]));
  OBUF \ALUres_OBUF[33]_inst 
       (.I(1'b0),
        .O(ALUres[33]));
  OBUF \ALUres_OBUF[34]_inst 
       (.I(1'b0),
        .O(ALUres[34]));
  OBUF \ALUres_OBUF[35]_inst 
       (.I(1'b0),
        .O(ALUres[35]));
  OBUF \ALUres_OBUF[36]_inst 
       (.I(1'b0),
        .O(ALUres[36]));
  OBUF \ALUres_OBUF[37]_inst 
       (.I(1'b0),
        .O(ALUres[37]));
  OBUF \ALUres_OBUF[38]_inst 
       (.I(1'b0),
        .O(ALUres[38]));
  OBUF \ALUres_OBUF[39]_inst 
       (.I(1'b0),
        .O(ALUres[39]));
  OBUF \ALUres_OBUF[3]_inst 
       (.I(1'b0),
        .O(ALUres[3]));
  OBUF \ALUres_OBUF[40]_inst 
       (.I(1'b0),
        .O(ALUres[40]));
  OBUF \ALUres_OBUF[41]_inst 
       (.I(1'b0),
        .O(ALUres[41]));
  OBUF \ALUres_OBUF[42]_inst 
       (.I(1'b0),
        .O(ALUres[42]));
  OBUF \ALUres_OBUF[43]_inst 
       (.I(1'b0),
        .O(ALUres[43]));
  OBUF \ALUres_OBUF[44]_inst 
       (.I(1'b0),
        .O(ALUres[44]));
  OBUF \ALUres_OBUF[45]_inst 
       (.I(1'b0),
        .O(ALUres[45]));
  OBUF \ALUres_OBUF[46]_inst 
       (.I(1'b0),
        .O(ALUres[46]));
  OBUF \ALUres_OBUF[47]_inst 
       (.I(1'b0),
        .O(ALUres[47]));
  OBUF \ALUres_OBUF[48]_inst 
       (.I(1'b0),
        .O(ALUres[48]));
  OBUF \ALUres_OBUF[49]_inst 
       (.I(1'b0),
        .O(ALUres[49]));
  OBUF \ALUres_OBUF[4]_inst 
       (.I(1'b0),
        .O(ALUres[4]));
  OBUF \ALUres_OBUF[50]_inst 
       (.I(1'b0),
        .O(ALUres[50]));
  OBUF \ALUres_OBUF[51]_inst 
       (.I(1'b0),
        .O(ALUres[51]));
  OBUF \ALUres_OBUF[52]_inst 
       (.I(1'b0),
        .O(ALUres[52]));
  OBUF \ALUres_OBUF[53]_inst 
       (.I(1'b0),
        .O(ALUres[53]));
  OBUF \ALUres_OBUF[54]_inst 
       (.I(1'b0),
        .O(ALUres[54]));
  OBUF \ALUres_OBUF[55]_inst 
       (.I(1'b0),
        .O(ALUres[55]));
  OBUF \ALUres_OBUF[56]_inst 
       (.I(1'b0),
        .O(ALUres[56]));
  OBUF \ALUres_OBUF[57]_inst 
       (.I(1'b0),
        .O(ALUres[57]));
  OBUF \ALUres_OBUF[58]_inst 
       (.I(1'b0),
        .O(ALUres[58]));
  OBUF \ALUres_OBUF[59]_inst 
       (.I(1'b0),
        .O(ALUres[59]));
  OBUF \ALUres_OBUF[5]_inst 
       (.I(1'b0),
        .O(ALUres[5]));
  OBUF \ALUres_OBUF[60]_inst 
       (.I(1'b0),
        .O(ALUres[60]));
  OBUF \ALUres_OBUF[61]_inst 
       (.I(1'b0),
        .O(ALUres[61]));
  OBUF \ALUres_OBUF[62]_inst 
       (.I(1'b0),
        .O(ALUres[62]));
  OBUF \ALUres_OBUF[63]_inst 
       (.I(1'b0),
        .O(ALUres[63]));
  OBUF \ALUres_OBUF[6]_inst 
       (.I(1'b0),
        .O(ALUres[6]));
  OBUF \ALUres_OBUF[7]_inst 
       (.I(1'b0),
        .O(ALUres[7]));
  OBUF \ALUres_OBUF[8]_inst 
       (.I(1'b0),
        .O(ALUres[8]));
  OBUF \ALUres_OBUF[9]_inst 
       (.I(1'b0),
        .O(ALUres[9]));
  OBUF \RFwrdata_OBUF[0]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[0]));
  OBUF \RFwrdata_OBUF[10]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[10]));
  OBUF \RFwrdata_OBUF[11]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[11]));
  OBUF \RFwrdata_OBUF[12]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[12]));
  OBUF \RFwrdata_OBUF[13]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[13]));
  OBUF \RFwrdata_OBUF[14]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[14]));
  OBUF \RFwrdata_OBUF[15]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[15]));
  OBUF \RFwrdata_OBUF[16]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[16]));
  OBUF \RFwrdata_OBUF[17]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[17]));
  OBUF \RFwrdata_OBUF[18]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[18]));
  OBUF \RFwrdata_OBUF[19]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[19]));
  OBUF \RFwrdata_OBUF[1]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[1]));
  OBUF \RFwrdata_OBUF[20]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[20]));
  OBUF \RFwrdata_OBUF[21]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[21]));
  OBUF \RFwrdata_OBUF[22]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[22]));
  OBUF \RFwrdata_OBUF[23]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[23]));
  OBUF \RFwrdata_OBUF[24]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[24]));
  OBUF \RFwrdata_OBUF[25]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[25]));
  OBUF \RFwrdata_OBUF[26]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[26]));
  OBUF \RFwrdata_OBUF[27]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[27]));
  OBUF \RFwrdata_OBUF[28]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[28]));
  OBUF \RFwrdata_OBUF[29]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[29]));
  OBUF \RFwrdata_OBUF[2]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[2]));
  OBUF \RFwrdata_OBUF[30]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[30]));
  OBUF \RFwrdata_OBUF[31]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[31]));
  OBUF \RFwrdata_OBUF[32]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[32]));
  OBUF \RFwrdata_OBUF[33]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[33]));
  OBUF \RFwrdata_OBUF[34]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[34]));
  OBUF \RFwrdata_OBUF[35]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[35]));
  OBUF \RFwrdata_OBUF[36]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[36]));
  OBUF \RFwrdata_OBUF[37]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[37]));
  OBUF \RFwrdata_OBUF[38]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[38]));
  OBUF \RFwrdata_OBUF[39]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[39]));
  OBUF \RFwrdata_OBUF[3]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[3]));
  OBUF \RFwrdata_OBUF[40]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[40]));
  OBUF \RFwrdata_OBUF[41]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[41]));
  OBUF \RFwrdata_OBUF[42]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[42]));
  OBUF \RFwrdata_OBUF[43]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[43]));
  OBUF \RFwrdata_OBUF[44]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[44]));
  OBUF \RFwrdata_OBUF[45]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[45]));
  OBUF \RFwrdata_OBUF[46]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[46]));
  OBUF \RFwrdata_OBUF[47]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[47]));
  OBUF \RFwrdata_OBUF[48]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[48]));
  OBUF \RFwrdata_OBUF[49]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[49]));
  OBUF \RFwrdata_OBUF[4]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[4]));
  OBUF \RFwrdata_OBUF[50]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[50]));
  OBUF \RFwrdata_OBUF[51]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[51]));
  OBUF \RFwrdata_OBUF[52]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[52]));
  OBUF \RFwrdata_OBUF[53]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[53]));
  OBUF \RFwrdata_OBUF[54]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[54]));
  OBUF \RFwrdata_OBUF[55]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[55]));
  OBUF \RFwrdata_OBUF[56]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[56]));
  OBUF \RFwrdata_OBUF[57]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[57]));
  OBUF \RFwrdata_OBUF[58]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[58]));
  OBUF \RFwrdata_OBUF[59]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[59]));
  OBUF \RFwrdata_OBUF[5]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[5]));
  OBUF \RFwrdata_OBUF[60]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[60]));
  OBUF \RFwrdata_OBUF[61]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[61]));
  OBUF \RFwrdata_OBUF[62]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[62]));
  OBUF \RFwrdata_OBUF[63]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[63]));
  OBUF \RFwrdata_OBUF[6]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[6]));
  OBUF \RFwrdata_OBUF[7]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[7]));
  OBUF \RFwrdata_OBUF[8]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[8]));
  OBUF \RFwrdata_OBUF[9]_inst 
       (.I(RFwrdata_OBUF),
        .O(RFwrdata[9]));
  OBUF RFwren_OBUF_inst
       (.I(1'b0),
        .O(RFwren));
  OBUF \addr_OBUF[0]_inst 
       (.I(1'b0),
        .O(addr[0]));
  OBUF \addr_OBUF[10]_inst 
       (.I(1'b0),
        .O(addr[10]));
  OBUF \addr_OBUF[11]_inst 
       (.I(1'b0),
        .O(addr[11]));
  OBUF \addr_OBUF[12]_inst 
       (.I(1'b0),
        .O(addr[12]));
  OBUF \addr_OBUF[13]_inst 
       (.I(1'b0),
        .O(addr[13]));
  OBUF \addr_OBUF[14]_inst 
       (.I(1'b0),
        .O(addr[14]));
  OBUF \addr_OBUF[15]_inst 
       (.I(1'b0),
        .O(addr[15]));
  OBUF \addr_OBUF[16]_inst 
       (.I(1'b0),
        .O(addr[16]));
  OBUF \addr_OBUF[17]_inst 
       (.I(1'b0),
        .O(addr[17]));
  OBUF \addr_OBUF[18]_inst 
       (.I(1'b0),
        .O(addr[18]));
  OBUF \addr_OBUF[19]_inst 
       (.I(1'b0),
        .O(addr[19]));
  OBUF \addr_OBUF[1]_inst 
       (.I(1'b0),
        .O(addr[1]));
  OBUF \addr_OBUF[20]_inst 
       (.I(1'b0),
        .O(addr[20]));
  OBUF \addr_OBUF[21]_inst 
       (.I(1'b0),
        .O(addr[21]));
  OBUF \addr_OBUF[22]_inst 
       (.I(1'b0),
        .O(addr[22]));
  OBUF \addr_OBUF[23]_inst 
       (.I(1'b0),
        .O(addr[23]));
  OBUF \addr_OBUF[24]_inst 
       (.I(1'b0),
        .O(addr[24]));
  OBUF \addr_OBUF[25]_inst 
       (.I(1'b0),
        .O(addr[25]));
  OBUF \addr_OBUF[26]_inst 
       (.I(1'b0),
        .O(addr[26]));
  OBUF \addr_OBUF[27]_inst 
       (.I(1'b0),
        .O(addr[27]));
  OBUF \addr_OBUF[28]_inst 
       (.I(1'b0),
        .O(addr[28]));
  OBUF \addr_OBUF[29]_inst 
       (.I(1'b0),
        .O(addr[29]));
  OBUF \addr_OBUF[2]_inst 
       (.I(1'b0),
        .O(addr[2]));
  OBUF \addr_OBUF[30]_inst 
       (.I(1'b0),
        .O(addr[30]));
  OBUF \addr_OBUF[31]_inst 
       (.I(1'b0),
        .O(addr[31]));
  OBUF \addr_OBUF[3]_inst 
       (.I(1'b0),
        .O(addr[3]));
  OBUF \addr_OBUF[4]_inst 
       (.I(1'b0),
        .O(addr[4]));
  OBUF \addr_OBUF[5]_inst 
       (.I(1'b0),
        .O(addr[5]));
  OBUF \addr_OBUF[6]_inst 
       (.I(1'b0),
        .O(addr[6]));
  OBUF \addr_OBUF[7]_inst 
       (.I(1'b0),
        .O(addr[7]));
  OBUF \addr_OBUF[8]_inst 
       (.I(1'b0),
        .O(addr[8]));
  OBUF \addr_OBUF[9]_inst 
       (.I(1'b0),
        .O(addr[9]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  mem_model i_mem_model
       (.CLK(clk_IBUF_BUFG),
        .rdata_OBUF(rdata_OBUF));
  processor i_processor
       (.CLK(clk_IBUF_BUFG),
        .Q(pc_OBUF),
        .RFwrdata(RFwrdata_OBUF),
        .nrst_IBUF(nrst_IBUF),
        .rdata_OBUF(rdata_OBUF));
  OBUF \inst_OBUF[0]_inst 
       (.I(1'b0),
        .O(inst[0]));
  OBUF \inst_OBUF[10]_inst 
       (.I(1'b0),
        .O(inst[10]));
  OBUF \inst_OBUF[11]_inst 
       (.I(1'b0),
        .O(inst[11]));
  OBUF \inst_OBUF[12]_inst 
       (.I(1'b0),
        .O(inst[12]));
  OBUF \inst_OBUF[13]_inst 
       (.I(1'b0),
        .O(inst[13]));
  OBUF \inst_OBUF[14]_inst 
       (.I(1'b0),
        .O(inst[14]));
  OBUF \inst_OBUF[15]_inst 
       (.I(1'b0),
        .O(inst[15]));
  OBUF \inst_OBUF[16]_inst 
       (.I(1'b0),
        .O(inst[16]));
  OBUF \inst_OBUF[17]_inst 
       (.I(1'b0),
        .O(inst[17]));
  OBUF \inst_OBUF[18]_inst 
       (.I(1'b0),
        .O(inst[18]));
  OBUF \inst_OBUF[19]_inst 
       (.I(1'b0),
        .O(inst[19]));
  OBUF \inst_OBUF[1]_inst 
       (.I(1'b0),
        .O(inst[1]));
  OBUF \inst_OBUF[20]_inst 
       (.I(1'b0),
        .O(inst[20]));
  OBUF \inst_OBUF[21]_inst 
       (.I(1'b0),
        .O(inst[21]));
  OBUF \inst_OBUF[22]_inst 
       (.I(1'b0),
        .O(inst[22]));
  OBUF \inst_OBUF[23]_inst 
       (.I(1'b0),
        .O(inst[23]));
  OBUF \inst_OBUF[24]_inst 
       (.I(1'b0),
        .O(inst[24]));
  OBUF \inst_OBUF[25]_inst 
       (.I(1'b0),
        .O(inst[25]));
  OBUF \inst_OBUF[26]_inst 
       (.I(1'b0),
        .O(inst[26]));
  OBUF \inst_OBUF[27]_inst 
       (.I(1'b0),
        .O(inst[27]));
  OBUF \inst_OBUF[28]_inst 
       (.I(1'b0),
        .O(inst[28]));
  OBUF \inst_OBUF[29]_inst 
       (.I(1'b0),
        .O(inst[29]));
  OBUF \inst_OBUF[2]_inst 
       (.I(1'b0),
        .O(inst[2]));
  OBUF \inst_OBUF[30]_inst 
       (.I(1'b0),
        .O(inst[30]));
  OBUF \inst_OBUF[31]_inst 
       (.I(1'b0),
        .O(inst[31]));
  OBUF \inst_OBUF[3]_inst 
       (.I(1'b0),
        .O(inst[3]));
  OBUF \inst_OBUF[4]_inst 
       (.I(1'b0),
        .O(inst[4]));
  OBUF \inst_OBUF[5]_inst 
       (.I(1'b0),
        .O(inst[5]));
  OBUF \inst_OBUF[6]_inst 
       (.I(1'b0),
        .O(inst[6]));
  OBUF \inst_OBUF[7]_inst 
       (.I(1'b0),
        .O(inst[7]));
  OBUF \inst_OBUF[8]_inst 
       (.I(1'b0),
        .O(inst[8]));
  OBUF \inst_OBUF[9]_inst 
       (.I(1'b0),
        .O(inst[9]));
  IBUF nrst_IBUF_inst
       (.I(nrst),
        .O(nrst_IBUF));
  OBUF \pc_OBUF[0]_inst 
       (.I(1'b0),
        .O(pc[0]));
  OBUF \pc_OBUF[10]_inst 
       (.I(pc_OBUF[10]),
        .O(pc[10]));
  OBUF \pc_OBUF[11]_inst 
       (.I(pc_OBUF[11]),
        .O(pc[11]));
  OBUF \pc_OBUF[12]_inst 
       (.I(pc_OBUF[12]),
        .O(pc[12]));
  OBUF \pc_OBUF[13]_inst 
       (.I(pc_OBUF[13]),
        .O(pc[13]));
  OBUF \pc_OBUF[14]_inst 
       (.I(pc_OBUF[14]),
        .O(pc[14]));
  OBUF \pc_OBUF[15]_inst 
       (.I(pc_OBUF[15]),
        .O(pc[15]));
  OBUF \pc_OBUF[16]_inst 
       (.I(pc_OBUF[16]),
        .O(pc[16]));
  OBUF \pc_OBUF[17]_inst 
       (.I(pc_OBUF[17]),
        .O(pc[17]));
  OBUF \pc_OBUF[18]_inst 
       (.I(pc_OBUF[18]),
        .O(pc[18]));
  OBUF \pc_OBUF[19]_inst 
       (.I(pc_OBUF[19]),
        .O(pc[19]));
  OBUF \pc_OBUF[1]_inst 
       (.I(pc_OBUF[1]),
        .O(pc[1]));
  OBUF \pc_OBUF[20]_inst 
       (.I(pc_OBUF[20]),
        .O(pc[20]));
  OBUF \pc_OBUF[21]_inst 
       (.I(pc_OBUF[21]),
        .O(pc[21]));
  OBUF \pc_OBUF[22]_inst 
       (.I(pc_OBUF[22]),
        .O(pc[22]));
  OBUF \pc_OBUF[23]_inst 
       (.I(pc_OBUF[23]),
        .O(pc[23]));
  OBUF \pc_OBUF[24]_inst 
       (.I(pc_OBUF[24]),
        .O(pc[24]));
  OBUF \pc_OBUF[25]_inst 
       (.I(pc_OBUF[25]),
        .O(pc[25]));
  OBUF \pc_OBUF[26]_inst 
       (.I(pc_OBUF[26]),
        .O(pc[26]));
  OBUF \pc_OBUF[27]_inst 
       (.I(pc_OBUF[27]),
        .O(pc[27]));
  OBUF \pc_OBUF[28]_inst 
       (.I(pc_OBUF[28]),
        .O(pc[28]));
  OBUF \pc_OBUF[29]_inst 
       (.I(pc_OBUF[29]),
        .O(pc[29]));
  OBUF \pc_OBUF[2]_inst 
       (.I(pc_OBUF[2]),
        .O(pc[2]));
  OBUF \pc_OBUF[30]_inst 
       (.I(pc_OBUF[30]),
        .O(pc[30]));
  OBUF \pc_OBUF[31]_inst 
       (.I(pc_OBUF[31]),
        .O(pc[31]));
  OBUF \pc_OBUF[3]_inst 
       (.I(pc_OBUF[3]),
        .O(pc[3]));
  OBUF \pc_OBUF[4]_inst 
       (.I(pc_OBUF[4]),
        .O(pc[4]));
  OBUF \pc_OBUF[5]_inst 
       (.I(pc_OBUF[5]),
        .O(pc[5]));
  OBUF \pc_OBUF[6]_inst 
       (.I(pc_OBUF[6]),
        .O(pc[6]));
  OBUF \pc_OBUF[7]_inst 
       (.I(pc_OBUF[7]),
        .O(pc[7]));
  OBUF \pc_OBUF[8]_inst 
       (.I(pc_OBUF[8]),
        .O(pc[8]));
  OBUF \pc_OBUF[9]_inst 
       (.I(pc_OBUF[9]),
        .O(pc[9]));
  OBUF \rdata_OBUF[0]_inst 
       (.I(rdata_OBUF),
        .O(rdata[0]));
  OBUF \rdata_OBUF[10]_inst 
       (.I(rdata_OBUF),
        .O(rdata[10]));
  OBUF \rdata_OBUF[11]_inst 
       (.I(rdata_OBUF),
        .O(rdata[11]));
  OBUF \rdata_OBUF[12]_inst 
       (.I(rdata_OBUF),
        .O(rdata[12]));
  OBUF \rdata_OBUF[13]_inst 
       (.I(rdata_OBUF),
        .O(rdata[13]));
  OBUF \rdata_OBUF[14]_inst 
       (.I(rdata_OBUF),
        .O(rdata[14]));
  OBUF \rdata_OBUF[15]_inst 
       (.I(rdata_OBUF),
        .O(rdata[15]));
  OBUF \rdata_OBUF[16]_inst 
       (.I(rdata_OBUF),
        .O(rdata[16]));
  OBUF \rdata_OBUF[17]_inst 
       (.I(rdata_OBUF),
        .O(rdata[17]));
  OBUF \rdata_OBUF[18]_inst 
       (.I(rdata_OBUF),
        .O(rdata[18]));
  OBUF \rdata_OBUF[19]_inst 
       (.I(rdata_OBUF),
        .O(rdata[19]));
  OBUF \rdata_OBUF[1]_inst 
       (.I(rdata_OBUF),
        .O(rdata[1]));
  OBUF \rdata_OBUF[20]_inst 
       (.I(rdata_OBUF),
        .O(rdata[20]));
  OBUF \rdata_OBUF[21]_inst 
       (.I(rdata_OBUF),
        .O(rdata[21]));
  OBUF \rdata_OBUF[22]_inst 
       (.I(rdata_OBUF),
        .O(rdata[22]));
  OBUF \rdata_OBUF[23]_inst 
       (.I(rdata_OBUF),
        .O(rdata[23]));
  OBUF \rdata_OBUF[24]_inst 
       (.I(rdata_OBUF),
        .O(rdata[24]));
  OBUF \rdata_OBUF[25]_inst 
       (.I(rdata_OBUF),
        .O(rdata[25]));
  OBUF \rdata_OBUF[26]_inst 
       (.I(rdata_OBUF),
        .O(rdata[26]));
  OBUF \rdata_OBUF[27]_inst 
       (.I(rdata_OBUF),
        .O(rdata[27]));
  OBUF \rdata_OBUF[28]_inst 
       (.I(rdata_OBUF),
        .O(rdata[28]));
  OBUF \rdata_OBUF[29]_inst 
       (.I(rdata_OBUF),
        .O(rdata[29]));
  OBUF \rdata_OBUF[2]_inst 
       (.I(rdata_OBUF),
        .O(rdata[2]));
  OBUF \rdata_OBUF[30]_inst 
       (.I(rdata_OBUF),
        .O(rdata[30]));
  OBUF \rdata_OBUF[31]_inst 
       (.I(rdata_OBUF),
        .O(rdata[31]));
  OBUF \rdata_OBUF[32]_inst 
       (.I(rdata_OBUF),
        .O(rdata[32]));
  OBUF \rdata_OBUF[33]_inst 
       (.I(rdata_OBUF),
        .O(rdata[33]));
  OBUF \rdata_OBUF[34]_inst 
       (.I(rdata_OBUF),
        .O(rdata[34]));
  OBUF \rdata_OBUF[35]_inst 
       (.I(rdata_OBUF),
        .O(rdata[35]));
  OBUF \rdata_OBUF[36]_inst 
       (.I(rdata_OBUF),
        .O(rdata[36]));
  OBUF \rdata_OBUF[37]_inst 
       (.I(rdata_OBUF),
        .O(rdata[37]));
  OBUF \rdata_OBUF[38]_inst 
       (.I(rdata_OBUF),
        .O(rdata[38]));
  OBUF \rdata_OBUF[39]_inst 
       (.I(rdata_OBUF),
        .O(rdata[39]));
  OBUF \rdata_OBUF[3]_inst 
       (.I(rdata_OBUF),
        .O(rdata[3]));
  OBUF \rdata_OBUF[40]_inst 
       (.I(rdata_OBUF),
        .O(rdata[40]));
  OBUF \rdata_OBUF[41]_inst 
       (.I(rdata_OBUF),
        .O(rdata[41]));
  OBUF \rdata_OBUF[42]_inst 
       (.I(rdata_OBUF),
        .O(rdata[42]));
  OBUF \rdata_OBUF[43]_inst 
       (.I(rdata_OBUF),
        .O(rdata[43]));
  OBUF \rdata_OBUF[44]_inst 
       (.I(rdata_OBUF),
        .O(rdata[44]));
  OBUF \rdata_OBUF[45]_inst 
       (.I(rdata_OBUF),
        .O(rdata[45]));
  OBUF \rdata_OBUF[46]_inst 
       (.I(rdata_OBUF),
        .O(rdata[46]));
  OBUF \rdata_OBUF[47]_inst 
       (.I(rdata_OBUF),
        .O(rdata[47]));
  OBUF \rdata_OBUF[48]_inst 
       (.I(rdata_OBUF),
        .O(rdata[48]));
  OBUF \rdata_OBUF[49]_inst 
       (.I(rdata_OBUF),
        .O(rdata[49]));
  OBUF \rdata_OBUF[4]_inst 
       (.I(rdata_OBUF),
        .O(rdata[4]));
  OBUF \rdata_OBUF[50]_inst 
       (.I(rdata_OBUF),
        .O(rdata[50]));
  OBUF \rdata_OBUF[51]_inst 
       (.I(rdata_OBUF),
        .O(rdata[51]));
  OBUF \rdata_OBUF[52]_inst 
       (.I(rdata_OBUF),
        .O(rdata[52]));
  OBUF \rdata_OBUF[53]_inst 
       (.I(rdata_OBUF),
        .O(rdata[53]));
  OBUF \rdata_OBUF[54]_inst 
       (.I(rdata_OBUF),
        .O(rdata[54]));
  OBUF \rdata_OBUF[55]_inst 
       (.I(rdata_OBUF),
        .O(rdata[55]));
  OBUF \rdata_OBUF[56]_inst 
       (.I(rdata_OBUF),
        .O(rdata[56]));
  OBUF \rdata_OBUF[57]_inst 
       (.I(rdata_OBUF),
        .O(rdata[57]));
  OBUF \rdata_OBUF[58]_inst 
       (.I(rdata_OBUF),
        .O(rdata[58]));
  OBUF \rdata_OBUF[59]_inst 
       (.I(rdata_OBUF),
        .O(rdata[59]));
  OBUF \rdata_OBUF[5]_inst 
       (.I(rdata_OBUF),
        .O(rdata[5]));
  OBUF \rdata_OBUF[60]_inst 
       (.I(rdata_OBUF),
        .O(rdata[60]));
  OBUF \rdata_OBUF[61]_inst 
       (.I(rdata_OBUF),
        .O(rdata[61]));
  OBUF \rdata_OBUF[62]_inst 
       (.I(rdata_OBUF),
        .O(rdata[62]));
  OBUF \rdata_OBUF[63]_inst 
       (.I(rdata_OBUF),
        .O(rdata[63]));
  OBUF \rdata_OBUF[6]_inst 
       (.I(rdata_OBUF),
        .O(rdata[6]));
  OBUF \rdata_OBUF[7]_inst 
       (.I(rdata_OBUF),
        .O(rdata[7]));
  OBUF \rdata_OBUF[8]_inst 
       (.I(rdata_OBUF),
        .O(rdata[8]));
  OBUF \rdata_OBUF[9]_inst 
       (.I(rdata_OBUF),
        .O(rdata[9]));
  OBUF \wdata_OBUF[0]_inst 
       (.I(1'b0),
        .O(wdata[0]));
  OBUF \wdata_OBUF[10]_inst 
       (.I(1'b0),
        .O(wdata[10]));
  OBUF \wdata_OBUF[11]_inst 
       (.I(1'b0),
        .O(wdata[11]));
  OBUF \wdata_OBUF[12]_inst 
       (.I(1'b0),
        .O(wdata[12]));
  OBUF \wdata_OBUF[13]_inst 
       (.I(1'b0),
        .O(wdata[13]));
  OBUF \wdata_OBUF[14]_inst 
       (.I(1'b0),
        .O(wdata[14]));
  OBUF \wdata_OBUF[15]_inst 
       (.I(1'b0),
        .O(wdata[15]));
  OBUF \wdata_OBUF[16]_inst 
       (.I(1'b0),
        .O(wdata[16]));
  OBUF \wdata_OBUF[17]_inst 
       (.I(1'b0),
        .O(wdata[17]));
  OBUF \wdata_OBUF[18]_inst 
       (.I(1'b0),
        .O(wdata[18]));
  OBUF \wdata_OBUF[19]_inst 
       (.I(1'b0),
        .O(wdata[19]));
  OBUF \wdata_OBUF[1]_inst 
       (.I(1'b0),
        .O(wdata[1]));
  OBUF \wdata_OBUF[20]_inst 
       (.I(1'b0),
        .O(wdata[20]));
  OBUF \wdata_OBUF[21]_inst 
       (.I(1'b0),
        .O(wdata[21]));
  OBUF \wdata_OBUF[22]_inst 
       (.I(1'b0),
        .O(wdata[22]));
  OBUF \wdata_OBUF[23]_inst 
       (.I(1'b0),
        .O(wdata[23]));
  OBUF \wdata_OBUF[24]_inst 
       (.I(1'b0),
        .O(wdata[24]));
  OBUF \wdata_OBUF[25]_inst 
       (.I(1'b0),
        .O(wdata[25]));
  OBUF \wdata_OBUF[26]_inst 
       (.I(1'b0),
        .O(wdata[26]));
  OBUF \wdata_OBUF[27]_inst 
       (.I(1'b0),
        .O(wdata[27]));
  OBUF \wdata_OBUF[28]_inst 
       (.I(1'b0),
        .O(wdata[28]));
  OBUF \wdata_OBUF[29]_inst 
       (.I(1'b0),
        .O(wdata[29]));
  OBUF \wdata_OBUF[2]_inst 
       (.I(1'b0),
        .O(wdata[2]));
  OBUF \wdata_OBUF[30]_inst 
       (.I(1'b0),
        .O(wdata[30]));
  OBUF \wdata_OBUF[31]_inst 
       (.I(1'b0),
        .O(wdata[31]));
  OBUF \wdata_OBUF[32]_inst 
       (.I(1'b0),
        .O(wdata[32]));
  OBUF \wdata_OBUF[33]_inst 
       (.I(1'b0),
        .O(wdata[33]));
  OBUF \wdata_OBUF[34]_inst 
       (.I(1'b0),
        .O(wdata[34]));
  OBUF \wdata_OBUF[35]_inst 
       (.I(1'b0),
        .O(wdata[35]));
  OBUF \wdata_OBUF[36]_inst 
       (.I(1'b0),
        .O(wdata[36]));
  OBUF \wdata_OBUF[37]_inst 
       (.I(1'b0),
        .O(wdata[37]));
  OBUF \wdata_OBUF[38]_inst 
       (.I(1'b0),
        .O(wdata[38]));
  OBUF \wdata_OBUF[39]_inst 
       (.I(1'b0),
        .O(wdata[39]));
  OBUF \wdata_OBUF[3]_inst 
       (.I(1'b0),
        .O(wdata[3]));
  OBUF \wdata_OBUF[40]_inst 
       (.I(1'b0),
        .O(wdata[40]));
  OBUF \wdata_OBUF[41]_inst 
       (.I(1'b0),
        .O(wdata[41]));
  OBUF \wdata_OBUF[42]_inst 
       (.I(1'b0),
        .O(wdata[42]));
  OBUF \wdata_OBUF[43]_inst 
       (.I(1'b0),
        .O(wdata[43]));
  OBUF \wdata_OBUF[44]_inst 
       (.I(1'b0),
        .O(wdata[44]));
  OBUF \wdata_OBUF[45]_inst 
       (.I(1'b0),
        .O(wdata[45]));
  OBUF \wdata_OBUF[46]_inst 
       (.I(1'b0),
        .O(wdata[46]));
  OBUF \wdata_OBUF[47]_inst 
       (.I(1'b0),
        .O(wdata[47]));
  OBUF \wdata_OBUF[48]_inst 
       (.I(1'b0),
        .O(wdata[48]));
  OBUF \wdata_OBUF[49]_inst 
       (.I(1'b0),
        .O(wdata[49]));
  OBUF \wdata_OBUF[4]_inst 
       (.I(1'b0),
        .O(wdata[4]));
  OBUF \wdata_OBUF[50]_inst 
       (.I(1'b0),
        .O(wdata[50]));
  OBUF \wdata_OBUF[51]_inst 
       (.I(1'b0),
        .O(wdata[51]));
  OBUF \wdata_OBUF[52]_inst 
       (.I(1'b0),
        .O(wdata[52]));
  OBUF \wdata_OBUF[53]_inst 
       (.I(1'b0),
        .O(wdata[53]));
  OBUF \wdata_OBUF[54]_inst 
       (.I(1'b0),
        .O(wdata[54]));
  OBUF \wdata_OBUF[55]_inst 
       (.I(1'b0),
        .O(wdata[55]));
  OBUF \wdata_OBUF[56]_inst 
       (.I(1'b0),
        .O(wdata[56]));
  OBUF \wdata_OBUF[57]_inst 
       (.I(1'b0),
        .O(wdata[57]));
  OBUF \wdata_OBUF[58]_inst 
       (.I(1'b0),
        .O(wdata[58]));
  OBUF \wdata_OBUF[59]_inst 
       (.I(1'b0),
        .O(wdata[59]));
  OBUF \wdata_OBUF[5]_inst 
       (.I(1'b0),
        .O(wdata[5]));
  OBUF \wdata_OBUF[60]_inst 
       (.I(1'b0),
        .O(wdata[60]));
  OBUF \wdata_OBUF[61]_inst 
       (.I(1'b0),
        .O(wdata[61]));
  OBUF \wdata_OBUF[62]_inst 
       (.I(1'b0),
        .O(wdata[62]));
  OBUF \wdata_OBUF[63]_inst 
       (.I(1'b0),
        .O(wdata[63]));
  OBUF \wdata_OBUF[6]_inst 
       (.I(1'b0),
        .O(wdata[6]));
  OBUF \wdata_OBUF[7]_inst 
       (.I(1'b0),
        .O(wdata[7]));
  OBUF \wdata_OBUF[8]_inst 
       (.I(1'b0),
        .O(wdata[8]));
  OBUF \wdata_OBUF[9]_inst 
       (.I(1'b0),
        .O(wdata[9]));
  OBUF \wmask_OBUF[0]_inst 
       (.I(1'b1),
        .O(wmask[0]));
  OBUF \wmask_OBUF[1]_inst 
       (.I(1'b1),
        .O(wmask[1]));
  OBUF \wmask_OBUF[2]_inst 
       (.I(1'b1),
        .O(wmask[2]));
  OBUF \wmask_OBUF[3]_inst 
       (.I(1'b1),
        .O(wmask[3]));
  OBUF \wmask_OBUF[4]_inst 
       (.I(1'b1),
        .O(wmask[4]));
  OBUF \wmask_OBUF[5]_inst 
       (.I(1'b1),
        .O(wmask[5]));
  OBUF \wmask_OBUF[6]_inst 
       (.I(1'b1),
        .O(wmask[6]));
  OBUF \wmask_OBUF[7]_inst 
       (.I(1'b1),
        .O(wmask[7]));
  OBUF wr_en_OBUF_inst
       (.I(1'b0),
        .O(wr_en));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
