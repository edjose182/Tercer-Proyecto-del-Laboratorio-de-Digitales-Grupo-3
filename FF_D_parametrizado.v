`include "constantes.h" 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:40 08/20/2015 
// Design Name: 
// Module Name:    FF_D_Sincrono 
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
module FF_D_Sincrono(

input wire clk,reset,
input wire [`ancho-1:0] datos,
input wire enable,
output wire [`ancho-1:0] Q_out

 );
 
 reg [`ancho-1:0] Q_actual,Q_next;
always@(posedge clk , posedge reset)

if(reset)
	begin
	Q_actual <=`ancho'b0;


	end

else

	begin

	Q_actual<= Q_next;
	
	end

always @*

	if(enable)

		Q_next=datos;

	else

		Q_next = Q_actual;


assign Q_out = Q_next;

endmodule