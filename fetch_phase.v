`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 16:41:27
// Design Name: 
// Module Name: fetch_phase
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


module fetch_phase(
input clk, rst,
input [7:0] data_write,data_in,
input [7:0] port_in_00, port_in_01, port_in_02, port_in_03,    
input [7:0] port_in_04, port_in_05, port_in_06, port_in_07, port_in_08,
input [7:0] port_in_09,port_in_10,port_in_11,port_in_12,port_in_13,port_in_14,port_in_15, 
output [7:0] data_out
    );
    wire [7:0] fetch_wire_1;
    wire [7:0] ram_out;
    wire [7:0] fetch_wire_2;
    PC counter(.clk(clk), .rst(rst),. PC(fetch_wire_1));
    Instruction_Memory IM(.clk(clk),.address(fetch_wire_1),.readdata(fetch_wire_2),
    .data_in_rom(data_in)
    );
    ROM_MACHINE rom_machine(
    .address(fetch_wire_1),.rom_out(fetch_wire_2),.ram_out(ram_out),.data_out(data_out),
    .port_in_00(port_in_00), .port_in_01(port_in_01), .port_in_02(port_in_02), .port_in_03(port_in_03),                              
    .port_in_04(port_in_04), .port_in_05(port_in_05), .port_in_06(port_in_06), .port_in_07(port_in_07), .port_in_08(port_in_08),                  
    .port_in_09(port_in_09), .port_in_10(port_in_10), .port_in_11(port_in_11), .port_in_12(port_in_12), .port_in_13(port_in_13),
    .port_in_14(port_in_14),.port_in_15(port_in_15)  
    );
    data_memory data_mem(.clk(clk),.address(fetch_wire_1),.ram_out(ram_out),.data_write(data_write));
endmodule
module PC (
input clk, rst,
output reg [7:0] PC
);
always@(posedge clk) begin
if(rst == 1'b1) begin
PC <= 8'b00000000;
end
else
begin
PC <= PC + 1'b1;
if(PC > 8'b11111111) begin
PC <= 8'b00000000;
end 
end
end
endmodule

module Instruction_Memory(clk,address,readdata,data_in_rom

);
  input clk;
  input [7:0]address, data_in_rom;
   reg enable;
  output reg [7:0]readdata;
     
     reg [7:0] ROM [255:0];
     
     parameter YUKLE_A_SBT = 8'h86;
     parameter YUKLE_A     = 8'h87;
     parameter YUKLE_B_SBT = 8'h88;
     parameter YUKLE_B     = 8'h89;
     parameter KAYDET_A    = 8'h96;
     parameter KAYDET_B    = 8'h97;
     
     parameter TOPLA_AB    = 8'h42;
     parameter CIKAR_AB    = 8'h43;
     parameter AND_AB      = 8'h44;
     parameter OR_AB       = 8'h45;
     parameter ARTTIR_A    = 8'h46;
     parameter ARTTIR_B    = 8'h47;
     parameter DUSUR_A     = 8'h48;
     parameter DUSUR_B     = 8'h49;
     
     parameter ATLA                 = 8'h20;   
     parameter ATLA_NEGATIFSE       = 8'h21;
     parameter ATLA_POZITIFSE       = 8'h22;
     parameter ATLA_ESITSE_SIFIR    = 8'h23;
     parameter ATLA_DEGILSE_SIFIR   = 8'h24;
     parameter ATLA_OVERFLOW_VARSA  = 8'h25;
     parameter ATLA_OVERFLOW_YOKSA  = 8'h26;
     parameter ATLA_ELDE_VARSA      = 8'h27;
     parameter ATLA_ELDE_YOKSA      = 8'h28;

     
     always@(*)
begin
	if(address >= 8'h00 & address <= 8'h7F) begin // 0 ile 127 araliginda ise
		enable <= 1;
		end
	else begin
		enable <= 0;
	end
end 


always@(posedge clk)
begin
	
	if(enable == 1'b1) begin
	readdata <= ROM[address];
	end
	else begin
	ROM[address] <= data_in_rom;
	end
end
endmodule
module data_memory(
input clk,
input [7:0] address,
input [7:0] data_write,
output reg [7:0] ram_out
);

reg write_enable;
reg [7:0] RAM [255:0];

always@(address)
begin
	if(address >= 8'h80 & address <= 8'hDF) begin // 128 ile 223 araliginda ise
		write_enable <= 1'b1;
		end
	else begin
		write_enable <= 1'b0;
	end 
end 

always@(posedge clk) begin
if(write_enable == 1'b1) begin
RAM[address] <= data_write;
end
else begin
ram_out <= RAM[address];
end
end
endmodule
// ROM State Machine
module ROM_MACHINE(
input [7:0] address,rom_out,ram_out,
input [7:0] port_in_00, port_in_01, port_in_02, port_in_03,  
input [7:0] port_in_04, port_in_05, port_in_06, port_in_07, port_in_08,
input [7:0] port_in_09,port_in_10,port_in_11,port_in_12,port_in_13,port_in_14,port_in_15,
output reg [7:0]data_out
);
always@(address, rom_out, data_out,
			port_in_00, port_in_01, port_in_02, port_in_03,
			port_in_04, port_in_05, port_in_06, port_in_07,
			port_in_07, port_in_08, port_in_09, port_in_10,
			port_in_11, port_in_12, port_in_13, port_in_14, port_in_15)
	begin
		if(address >= 8'h00 & address <= 8'h7F) begin
			data_out <= rom_out;
			end
		else if(address >= 8'h80 & address <= 8'hDF) begin
			data_out <= ram_out;
			end
		// Input Routing
		else if(address == 8'hF0) begin
			data_out <= port_in_00;
			end
		else if(address == 8'hF1) begin
			data_out <= port_in_01;
			end
		else if(address == 8'hF2) begin
			data_out <= port_in_02;
			end
		else if(address == 8'hF3) begin
			data_out <= port_in_03;
			end
		else if(address == 8'hF4) begin
			data_out <= port_in_04;
			end
		else if(address == 8'hF5) begin
			data_out <= port_in_05;
			end
		else if(address == 8'hF6) begin
			data_out <= port_in_06;
			end
		else if(address == 8'hF7) begin
			data_out <= port_in_07;
			end
		else if(address == 8'hF8) begin
			data_out <= port_in_08;
			end
		else if(address == 8'hF9) begin
			data_out <= port_in_09;
			end
		else if(address == 8'hFA) begin
			data_out <= port_in_10;
			end
		else if(address == 8'hFB) begin
			data_out <= port_in_11;
			end
		else if(address == 8'hFC) begin
			data_out <= port_in_12;
			end
		else if(address == 8'hFD) begin
			data_out <= port_in_13;
			end
		else if(address == 8'hFE) begin
			data_out <= port_in_14;
			end
		else if(address == 8'hFF) begin
			data_out <= port_in_15;
			end
		else begin
			data_out <= 8'h00;
		end 
	end 
endmodule
