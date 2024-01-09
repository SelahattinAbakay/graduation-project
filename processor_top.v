`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 16:40:19
// Design Name: 
// Module Name: processor_top
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


module data_path(
input clk, rst,
input [7:0] data_write,data_in,
input [7:0] port_in_00, port_in_01, port_in_02, port_in_03,    
input [7:0] port_in_04, port_in_05, port_in_06, port_in_07, port_in_08,
input [7:0] port_in_09,port_in_10,port_in_11,port_in_12,port_in_13,port_in_14,port_in_15, 
output [7:0] ALU_src,          
output [7:0] carry_out,Sum_out 
    );
    wire [7:0] fetch_wire_1;
    wire [7:0] rdA,rdB,rdA_out,rdB_out;
    reg [7:0] data_out_ff;
    wire [7:0] data_out;
    decode_ff ff_decode(.clk(clk),.rst(rst),.rdA_in(rdA),.rdB_in(rdB),.rdA(rdA_out),.rdB(rdB_out));
fetch_phase FETCH(.clk(clk), .rst(rst),.data_write(data_write),.data_out(data_out),.data_in(data_in),
.port_in_00(port_in_00), .port_in_01(port_in_01), .port_in_02(port_in_02), .port_in_03(port_in_03),                              
    .port_in_04(port_in_04), .port_in_05(port_in_05), .port_in_06(port_in_06), .port_in_07(port_in_07), .port_in_08(port_in_08),                  
    .port_in_09(port_in_09), .port_in_10(port_in_10), .port_in_11(port_in_11), .port_in_12(port_in_12), .port_in_13(port_in_13),
    .port_in_14(port_in_14),.port_in_15(port_in_15) 
);
decode_cycle decode(
.clk(clk),                     
.address_from_data_out_ff(data_out_ff),
.result_rdA(rdA),.result_rdB(rdB)    
);
EXECUTE execute_cycle(
.clk(clk),                          
.rdA(rdA_out), .rdB(rdB_out),               
.ALU_src(ALU_src),           
.carry_out(carry_out),.Sum_out(Sum_out)  
);
always@(posedge clk) begin
if(rst) begin
data_out_ff <= 8'b00000000;
end
else begin
data_out_ff <= data_out;
end
end
endmodule