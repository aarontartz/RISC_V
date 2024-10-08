`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aaron Tartz
// 
// Create Date: 09/28/2024 05:14:34 PM
// Module Name: alu
//
// Description: add, subtract, and, or, less than comparison
//
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input wire [31:0] op_a,  // operand a
    input wire [31:0] op_b,
    input wire [2:0] sel,
    output wire is_zero,
    output wire [31:0] result
    );
    
    reg is_zero_reg;
    reg [31:0] result_reg;
    assign is_zero = is_zero_reg;
    assign result = result_reg;
    
    always @(*) begin
        is_zero_reg = 0;  // default to zero
        case (sel)
            3'b000:
                result_reg = op_a + op_b;  // addition
            3'b001: begin
                result_reg = op_a - op_b;  // subtraction
                if (result_reg == 0)
                    is_zero_reg = 1;
            end
            3'b010:
                result_reg = op_a & op_b;  // logical AND
            3'b011:
                result_reg = op_a | op_b;  // logical OR
            3'b101:
                result_reg = (op_a < op_b) ? 1 : 0;  // less than comparison
            default:
                result_reg = 32'bxxxx_xxxx_xxxx_xxxx;
        endcase
    end
    
endmodule
