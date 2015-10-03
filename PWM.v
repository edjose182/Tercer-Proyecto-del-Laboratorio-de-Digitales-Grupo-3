`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Iron Pirate
// Engineer: Edgar Campos Duarte
// 
// Create Date:    08:41:21 10/03/2015 
// Design Name: 
// Module Name:    PWMVersion2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PWMVersion2(clk,dato,pwm,counter);

input clk;
input [21:0] dato;

output reg pwm=1;

output reg [21:0] counter = 0;

always @(posedge clk)
	begin
		if(counter<dato)

			pwm<=1;
		else

			pwm<=0;

			counter<=counter+1'd1;

	end 



endmodule
