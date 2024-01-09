`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2024 18:00:30
// Design Name: 
// Module Name: decode_ff
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


module decode_ff(
input clk, rst, [7:0] rdA_in,rdB_in,
output reg [7:0] rdA, rdB
    );
    always@(posedge clk) begin
    if(rst) begin
    rdA <= 8'b00000000;
    rdB <= 8'b00000000;
    end 
    else begin
    rdA <= rdA_in;
    rdB <= rdB_in;
    end
    end
endmodule
