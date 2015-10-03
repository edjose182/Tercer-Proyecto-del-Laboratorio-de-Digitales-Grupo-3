`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:24 10/02/2015 
// Design Name: 
// Module Name:    Filtro_con_FSM 
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
module Filtro_con_FSM(
input wire rx_done_tick,clk,reset, ///
input wire [`ancho-1:0] Uk,
output wire listo,
output wire [`ancho-1:0] yk,
output wire salidawar1,
output wire [`resolucion-1:0] salidawar2

    );


wire en1,en2,en3,en4;

wire [2:0] bar1;

wire [1:0] bar2,bar3;


	 
	 MaquinadeEstadosFiltroVersion1 FSM(
    .rx_done_tick(rx_done_tick), 
    .clk(clk), 
    .reset(reset), 
    .en1(en1), 
    .en2(en2), 
    .en3(en3), 
    .en4(en4), 
    .listo(listo), 
    .bar1(bar1), 
    .bar2(bar2), 
    .bar3(bar3)
    );

	 
	
	 Filtro Arquitectura_del_filtro (
    .clka(clk), 
    .reset(reset), 
    .en1(en1), 
    .en2(en2), 
    .en3(en3), 
    .en4(en4), 
    .Uk(Uk), 
    .bar1(bar1), 
    .bar2(bar2), 
    .bar3(bar3), 
    .listo(listo), 
    .yk(yk), 
    .salidawar1(salidawar1), 
    .salidawar2(salidawar2)
    );
	 


endmodule
