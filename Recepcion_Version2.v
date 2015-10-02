`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:13 09/30/2015 
// Design Name: 
// Module Name:    Recepcion_Version2 
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
module Recepcion_Version2(
input wire SCLK,CS,reset,
input wire [15:0]datos,
output wire rx_done_tick,
output wire [15:0] b_reg,
output wire [11:0]data_Out

    );
	 
	 wire SDATA;
	 
	 Paralelo_Serie Paralelo_Serie (
    .clk(SCLK), 
    .reset(CS), 
    .datos(datos), 
    .salida_serie(SDATA)
    );
	 
	 
	 
ADCVersion4 ADCVersion4 (
    .SDATA(SDATA), 
    .reset(reset), 
    .CS(CS), 
    .SCLK(SCLK), 
    .rx_done_tick(rx_done_tick), 
    .b_reg(b_reg), 
    .data_Out(data_Out)
    );



endmodule
