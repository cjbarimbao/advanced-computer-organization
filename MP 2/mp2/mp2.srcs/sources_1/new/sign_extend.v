`timescale 1ns / 1ps

module sign_extend
    (
        input       [1:0]   ImmSelect,
        input       [31:7]  inst,
        output reg  [63:0]  immediate
    );
    
    always@(*) begin
        immediate = 0;
        case (ImmSelect)
            2'b00: immediate = {{ 53{inst[31]} }, inst[30:20]};
            2'b01: immediate = {{ 53{inst[31]} }, inst[30:25], inst[11:7]};
            2'b10: immediate = {{ 53{inst[31]} }, inst[7], inst[30:25], inst[11:8]};
            2'b11: immediate = {{ 45{inst[31]} }, inst[19:12], inst[20], inst[30:21]};
        endcase
    end
    
endmodule
