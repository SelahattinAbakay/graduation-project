`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2024 10:24:59
// Design Name: 
// Module Name: risc_cpu
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


module risc_cpu(
input clk,rst,
input [7:0] port_in_00, port_in_01, port_in_02, port_in_03,    
input [7:0] port_in_04, port_in_05, port_in_06, port_in_07, port_in_08,
input [7:0] port_in_09,port_in_10,port_in_11,port_in_12,port_in_13,port_in_14,port_in_15,
output [7:0] port_out_00,
output [7:0] port_out_01,
output [7:0] port_out_02,
output [7:0] port_out_03,
output [7:0] port_out_04,
output [7:0] port_out_05,
output [7:0] port_out_06,
output [7:0] port_out_07,
output [7:0] port_out_08,
output [7:0] port_out_09,
output [7:0] port_out_10,
output [7:0] port_out_11,
output [7:0] port_out_12,
output [7:0] port_out_13,
output [7:0] port_out_14,
output [7:0] port_out_15
    );
    reg write_en;
    reg [7:0] data_in;
    wire [7:0] Sum_out;
    reg [7:0] data_write;
    wire [7:0] ALU_src; 
     
    wire [7:0] carry_out;
    data_path dp(.clk(clk),.rst(rst),.data_in(data_in),.data_write(data_write),.ALU_src(ALU_src),
    .carry_out(carry_out),.Sum_out(Sum_out),
    .port_in_00(port_in_00), .port_in_01(port_in_01), .port_in_02(port_in_02), .port_in_03(port_in_03),                              
    .port_in_04(port_in_04), .port_in_05(port_in_05), .port_in_06(port_in_06), .port_in_07(port_in_07), .port_in_08(port_in_08),                  
    .port_in_09(port_in_09), .port_in_10(port_in_10), .port_in_11(port_in_11), .port_in_12(port_in_12), .port_in_13(port_in_13),
    .port_in_14(port_in_14),.port_in_15(port_in_15) 
    );
    
    
    outputs otput_ports(.clk(clk),.rst(rst),  .carry_out(carry_out),.Sum_out(Sum_out),      
.address		(ALU_src),        
.data_in		(data_in),        
.write_en 	    (write_en),           
.port_out_00	(port_out_00),
.port_out_01	(port_out_01),
.port_out_02	(port_out_02),
.port_out_03	(port_out_03),
.port_out_04	(port_out_04),
.port_out_05	(port_out_05),
.port_out_06	(port_out_06),
.port_out_07	(port_out_07),
.port_out_08	(port_out_08),
.port_out_09	(port_out_09),
.port_out_10	(port_out_10),
.port_out_11	(port_out_11),
.port_out_12	(port_out_12),
.port_out_13	(port_out_13),
.port_out_14	(port_out_14),
.port_out_15	(port_out_15)    
    );
    always@(posedge clk) begin
    if(rst) begin
    data_in <= 8'b00000000;
    write_en <= 1'b0;
    end
    else
    begin
    write_en <= 1'b1;
    data_in <= data_in + 1'b1;
   
    if(data_in > 8'b11111111) begin
    data_in <= 8'b00000000;
    end
    else
    begin
    data_in <= data_in + 1'b1;
    end
    end
    end
    always@(posedge clk) begin
    if(rst) begin
    data_write <= 8'b00000000;
    end
    else begin
    data_write <= data_write + 1'b1;
    if(data_write > 8'b11111111) begin
    data_write <= 8'b00000000;
    end
    else
    begin
   data_write <= data_write + 1'b1;
    end
    end
    end
endmodule
