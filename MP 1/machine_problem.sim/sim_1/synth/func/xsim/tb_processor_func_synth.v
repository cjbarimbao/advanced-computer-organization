// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Aug  9 15:15:18 2022
// Host        : DESKTOP-GT16D5L running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {G:/My Drive/Work Space/Academics/CoE 113/Machine Problem
//               1/machine_problem/machine_problem.sim/sim_1/synth/func/xsim/tb_processor_func_synth.v}
// Design      : mem_prog
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WID = "30" *) (* DATA_DEP = "512" *) 
(* NotValidForBitStream *)
module mem_prog
   (addr,
    rdata);
  input [29:0]addr;
  output [31:0]rdata;

  wire [31:0]rdata;

  OBUF \rdata_OBUF[0]_inst 
       (.I(1'b0),
        .O(rdata[0]));
  OBUF \rdata_OBUF[10]_inst 
       (.I(1'b0),
        .O(rdata[10]));
  OBUF \rdata_OBUF[11]_inst 
       (.I(1'b0),
        .O(rdata[11]));
  OBUF \rdata_OBUF[12]_inst 
       (.I(1'b0),
        .O(rdata[12]));
  OBUF \rdata_OBUF[13]_inst 
       (.I(1'b0),
        .O(rdata[13]));
  OBUF \rdata_OBUF[14]_inst 
       (.I(1'b0),
        .O(rdata[14]));
  OBUF \rdata_OBUF[15]_inst 
       (.I(1'b0),
        .O(rdata[15]));
  OBUF \rdata_OBUF[16]_inst 
       (.I(1'b0),
        .O(rdata[16]));
  OBUF \rdata_OBUF[17]_inst 
       (.I(1'b0),
        .O(rdata[17]));
  OBUF \rdata_OBUF[18]_inst 
       (.I(1'b0),
        .O(rdata[18]));
  OBUF \rdata_OBUF[19]_inst 
       (.I(1'b0),
        .O(rdata[19]));
  OBUF \rdata_OBUF[1]_inst 
       (.I(1'b0),
        .O(rdata[1]));
  OBUF \rdata_OBUF[20]_inst 
       (.I(1'b0),
        .O(rdata[20]));
  OBUF \rdata_OBUF[21]_inst 
       (.I(1'b0),
        .O(rdata[21]));
  OBUF \rdata_OBUF[22]_inst 
       (.I(1'b0),
        .O(rdata[22]));
  OBUF \rdata_OBUF[23]_inst 
       (.I(1'b0),
        .O(rdata[23]));
  OBUF \rdata_OBUF[24]_inst 
       (.I(1'b0),
        .O(rdata[24]));
  OBUF \rdata_OBUF[25]_inst 
       (.I(1'b0),
        .O(rdata[25]));
  OBUF \rdata_OBUF[26]_inst 
       (.I(1'b0),
        .O(rdata[26]));
  OBUF \rdata_OBUF[27]_inst 
       (.I(1'b0),
        .O(rdata[27]));
  OBUF \rdata_OBUF[28]_inst 
       (.I(1'b0),
        .O(rdata[28]));
  OBUF \rdata_OBUF[29]_inst 
       (.I(1'b0),
        .O(rdata[29]));
  OBUF \rdata_OBUF[2]_inst 
       (.I(1'b0),
        .O(rdata[2]));
  OBUF \rdata_OBUF[30]_inst 
       (.I(1'b0),
        .O(rdata[30]));
  OBUF \rdata_OBUF[31]_inst 
       (.I(1'b0),
        .O(rdata[31]));
  OBUF \rdata_OBUF[3]_inst 
       (.I(1'b0),
        .O(rdata[3]));
  OBUF \rdata_OBUF[4]_inst 
       (.I(1'b0),
        .O(rdata[4]));
  OBUF \rdata_OBUF[5]_inst 
       (.I(1'b0),
        .O(rdata[5]));
  OBUF \rdata_OBUF[6]_inst 
       (.I(1'b0),
        .O(rdata[6]));
  OBUF \rdata_OBUF[7]_inst 
       (.I(1'b0),
        .O(rdata[7]));
  OBUF \rdata_OBUF[8]_inst 
       (.I(1'b0),
        .O(rdata[8]));
  OBUF \rdata_OBUF[9]_inst 
       (.I(1'b0),
        .O(rdata[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
