`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2024 10:23:35
// Design Name: 
// Module Name: outputs
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


module outputs
	(
	
			input clk			,
			input rst			,
			input [7:0] address		,
			input [7:0] data_in		,
			input write_en 	,
			input [7:0] carry_out,Sum_out,
			output reg [7:0] port_out_00	,
			output reg [7:0] port_out_01	,
			output reg [7:0] port_out_02	,
			output reg [7:0] port_out_03	,
			output reg [7:0] port_out_04	,
			output reg [7:0] port_out_05	,
			output reg [7:0] port_out_06	,
			output reg [7:0] port_out_07	,
			output reg [7:0] port_out_08	,
			output reg [7:0] port_out_09	,
			output reg [7:0] port_out_10	,
			output reg [7:0] port_out_11	,
			output reg [7:0] port_out_12	,
			output reg [7:0] port_out_13	,
			output reg [7:0] port_out_14	,
			output reg [7:0] port_out_15	
	);
	
	reg [7:0] sum_port_count;
	
	always@(posedge clk)
	begin
		if(rst == 1'b1) begin
			port_out_00	<= 8'b00000000;
			port_out_01 <= 8'b00000000;
			port_out_02 <= 8'b00000000;
			port_out_03 <= 8'b00000000;
			port_out_04 <= 8'b00000000;
			port_out_05 <= 8'b00000000;
			port_out_06 <= 8'b00000000;
			port_out_07 <= 8'b00000000;
			port_out_08 <= 8'b00000000;
			port_out_09 <= 8'b00000000;
			port_out_10 <= 8'b00000000;
			port_out_11 <= 8'b00000000;
			port_out_12 <= 8'b00000000;
			port_out_13 <= 8'b00000000;
			port_out_14 <= 8'b00000000;
			port_out_15 <= 8'b00000000;
			end
		else begin
			if(write_en == 1'b1) begin
				case (address) 
					8'hE0 :
					port_out_00 <= data_in;
					8'hE1 :
					port_out_01 <= data_in;
					8'hE2 :
					port_out_02 <= data_in;
					8'hE3 :
					port_out_03 <= data_in;
					8'hE4 :
					port_out_04 <= data_in;
					8'hE5 :
					port_out_05 <= data_in;
					8'hE6 :
					port_out_06 <= data_in;
					8'hE7 :
					port_out_07 <= data_in;
					8'hE8 :
					port_out_08 <= data_in;
					8'hE9 : 
					port_out_09 <= data_in;
					8'hEA :
					port_out_10 <= data_in;
					8'hEB :
					port_out_11 <= data_in;
					8'hEC :
					port_out_12 <= data_in;
					8'hED : 
					port_out_13 <= data_in;
					8'hEE :
					port_out_14 <= data_in;
					8'hEF :
					port_out_15 <= data_in;
					endcase	
					end	
						else
					begin
					if(rst) begin
					sum_port_count <= 8'b00000000;
					end
					else begin
					sum_port_count <= sum_port_count + 1'b1;
					if(sum_port_count > 8'b11111111) begin
					sum_port_count <= 8'b00000000;
					end
					else begin
					sum_port_count <= sum_port_count + 1'b1;
					end
					end
					case (carry_out) 
					8'hE0 : begin
					port_out_00 <= port_out_00 + 1'b1;
					if(port_out_00 > 8'b11111111) begin
					end
					else begin
					port_out_00 <= port_out_00 + 1'b1;
					end
					end
					8'hE1 : begin
					port_out_01 <= port_out_01 + 1'b1;
					if(port_out_01 > 8'b11111111) begin
					end
					else begin
					port_out_01 <= port_out_01 + 1'b1;
					end
					end
					
					8'hE2 : begin
					port_out_02 <= port_out_02 + 1'b1;
					if(port_out_02 > 8'b11111111) begin
					end
					else begin
					port_out_02 <= port_out_02 + 1'b1;
					end
                    end
					8'hE3 : begin
					port_out_03 <= port_out_03 + 1'b1;
					if(port_out_03 > 8'b11111111) begin
					end
					else begin
					port_out_03 <= port_out_00 + 1'b1;
					end
					end
					8'hE4 :begin
					port_out_04 <= port_out_04 + 1'b1;
					if(port_out_04 > 8'b11111111) begin
					end
					else begin
					port_out_04 <= port_out_04 + 1'b1;
					end
					end
					8'hE5 :
					begin
					port_out_05 <= port_out_05 + 1'b1;
					if(port_out_05 > 8'b11111111) begin
					end
					else begin
					port_out_05 <= port_out_05 + 1'b1;
					end
					end
					8'hE6 : begin
					port_out_06 <= port_out_06 + 1'b1;
					if(port_out_06 > 8'b11111111) begin
					end
					else begin
					port_out_06 <= port_out_06 + 1'b1;
					end
					end
					8'hE7 :
					begin
					port_out_07 <= port_out_07 + 1'b1;
					if(port_out_07 > 8'b11111111) begin
					end
					else begin
					port_out_07 <= port_out_07 + 1'b1;
					end
					end
					8'hE8 : begin
					port_out_08 <= port_out_08 + 1'b1;
					if(port_out_09 > 8'b11111111) begin
					end
					else begin
					port_out_08 <= port_out_08 + 1'b1;
					end
					end
					8'hE9 : 
					begin
					port_out_09 <= port_out_09 + 1'b1;
					if(port_out_09 > 8'b11111111) begin
					end
					else begin
					port_out_09 <= port_out_09 + 1'b1;
					end
					end
					8'hEA : begin
					port_out_10 <= port_out_10 + 1'b1;
					if(port_out_10 > 8'b11111111) begin
					end
					else begin
					port_out_10 <= port_out_10 + 1'b1;
					end
					end
					8'hEB :
					begin
					port_out_11 <= port_out_11 + 1'b1;
					if(port_out_11 > 8'b11111111) begin
					end
					else begin
					port_out_11 <= port_out_11 + 1'b1;
					end
					end
					8'hEC :
					begin
					port_out_12 <= port_out_12 + 1'b1;
					if(port_out_12 > 8'b11111111) begin
					end
					else begin
					port_out_12 <= port_out_12 + 1'b1;
					end
					end
					8'hED : 
					begin
					port_out_13 <= port_out_13 + 1'b1;
					if(port_out_13 > 8'b11111111) begin
					end
					else begin
					port_out_13 <= port_out_13 + 1'b1;
					end
					end
					8'hEE :
					begin
					port_out_14 <= port_out_14 + 1'b1;
					if(port_out_14 > 8'b11111111) begin
					end
					else begin
					port_out_14 <= port_out_14 + 1'b1;
					end
					end
					8'hEF :
					begin
					port_out_15 <= port_out_15 + 1'b1;
					if(port_out_15 > 8'b11111111) begin
					end
					else begin
					port_out_15 <= port_out_15 + 1'b1;
					end
					end
					endcase	
					
					case (Sum_out) 
				    8'hE0 :                
				    port_out_00 <= data_in | sum_port_count;
				    8'hE1 :                 
				    port_out_01 <= data_in | sum_port_count;
				    8'hE2 :                 
				    port_out_02 <= data_in | sum_port_count;
				    8'hE3 :                 
				    port_out_03 <= data_in | sum_port_count;
				    8'hE4 :                
				    port_out_04 <= data_in | sum_port_count;
				    8'hE5 :                 
				    port_out_05 <= data_in | sum_port_count;
				    8'hE6 :                 
				    port_out_06 <= data_in | sum_port_count;
				    8'hE7 :                 
				    port_out_07 <= data_in | sum_port_count;
				    8'hE8 :                 
				    port_out_08 <= data_in | sum_port_count;
				    8'hE9 :                 
				    port_out_09 <= data_in | sum_port_count;
				    8'hEA :                 
				    port_out_10 <= data_in | sum_port_count;
				    8'hEB :                 
				    port_out_11 <= data_in | sum_port_count;
				    8'hEC :                
				    port_out_12 <= data_in | sum_port_count;
				    8'hED :                 
				    port_out_13 <= data_in | sum_port_count;
				    8'hEE :                
				    port_out_14 <= data_in | sum_port_count;
				    8'hEF :   begin              
				    port_out_15 <= data_in | sum_port_count;
				    end
					endcase	
					
					end	
		end 	
	end 
endmodule
