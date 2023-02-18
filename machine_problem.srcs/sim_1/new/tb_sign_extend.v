`timescale 1ns / 1ps

module tb_sign_extend;
    reg [1:0] ImmSelect;
    reg [31:7] inst;
    wire [63:0] immediate;
    
    sign_extend i_sign_extend (
        .ImmSelect(ImmSelect),
        .inst(inst),
        .immediate(immediate)
    );
    
    always begin #10; ImmSelect = ImmSelect + 1; end
    
    initial begin
    ImmSelect = 2'b00;
    inst = {12'd240,5'd10,3'd3,5'd9};
    #10;
    ImmSelect = 2'b01;
    inst = {7'd7,5'd9,5'd10,3'd3,5'd16};
    #10;
    ImmSelect = 2'b10;
    inst = {1'b0,6'b111110,5'b01011,5'b01010,3'b001,4'b1000,1'b0};
    #10;
    ImmSelect = 2'b11;
    inst = {1'b0,10'b1111101000,1'b0,8'b0,5'b0};
    #10;
    $finish;
    end
endmodule
