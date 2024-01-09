`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2024 10:53:19
// Design Name: 
// Module Name: EXECUTE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EXECUTE(
input clk,
input [7:0] rdA, rdB,
output [7:0] ALU_src,          
output [7:0] carry_out,Sum_out 
    );
wire [2:0] op_select;
op_select_generator op_selection(.clk(clk),.op_select(op_select));
ALU alu(.op_select(op_select),.ALU_src(ALU_src),.rdA(rdA),.rdB(rdB),.carry_out(carry_out),.Sum_out(Sum_out));
endmodule
module op_select_generator(
input clk,
output reg [2:0] op_select
);
always@(posedge clk) begin
op_select <= op_select + 1'b1;
if(op_select > 3'b111) begin
op_select <= 3'b000;
end
else begin
op_select <= op_select + 1'b1;
end
end
endmodule 
module ALU(
input [2:0] op_select,
input [7:0] rdA,rdB,
output reg [7:0] ALU_src,
output reg [7:0] carry_out,Sum_out
);

always@(op_select) begin
carry_out <= rdA ^ rdB;
Sum_out   <= rdA | rdB;
case(op_select) 
3'b000 : ALU_src <= rdA + rdB;
3'b001 : ALU_src <= rdA << rdB;
3'b010 : begin
if(rdA < rdB) begin
ALU_src <= rdA;
end
else
ALU_src <= rdB;
end
3'b011: begin
if(rdA < rdB) begin
ALU_src <= rdA;
end
else begin
ALU_src <= rdB;
end
end
3'b100: ALU_src <= rdA ^ rdB;
3'b101: ALU_src <= rdA >> rdB;
3'b110 : ALU_src <= rdA | rdB;
3'b111: ALU_src <= rdA & rdB;
endcase
end
endmodule
