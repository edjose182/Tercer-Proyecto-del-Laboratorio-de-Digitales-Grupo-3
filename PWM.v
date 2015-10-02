`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:01:35 09/25/2015 
// Design Name: 
// Module Name:    PWM_MarkI 
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
module PWM_MarkI(
input wire clk,
input wire [11:0]Dato,
output wire pwm
    );
	 
reg pwm_aux;

reg [11:0]contador;

always @(posedge clk)
	begin
		contador = contador+1'd1;
		if(contador <=Dato)
			pwm_aux<=1;
		else
			pwm_aux<=0;
		////contador = contador+1'd1;
	end
	
assign pwm = pwm_aux;
	
endmodule
