`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:53 10/02/2015 
// Design Name: 
// Module Name:    Filtro 
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
module Filtro(

input wire clk,reset,en1,en2,en3,en4,
input wire [`ancho-1:0] Uk,
input wire [2:0] bar1,
input wire [1:0] bar2,bar3,
output wire listo,
output wire [`ancho-1:0] yk,
output wire salidawar1,
output wire [`resolucion-1:0] salidawar2
    );

wire [`ancho-1:0] fk_fk1,fk1_fk2,out_fk2;

wire [`ancho-1:0] operando1,operando2,operando3;

wire [`ancho-1:0] resultado_operacion;


Multiplexor MUX (
    .bar1(bar1), 
    .bar2(bar2), 
    .bar3(bar3), 
    .fk(fk_fk1), 
    .fk1(fk1_fk2), 
    .fk2(out_fk2), 
    .acum(yk), 
    .Uk(Uk), 
    .operando1(operando1), 
    .operando2(operando2), 
    .operando3(operando3)
    );



OPERACIONES ModuloAritmetico (
    .operando1(operando1), 
    .operando2(operando2), 
    .operando3(operando3), 
    .resultado_operacion(resultado_operacion), 
    .salidawar1(salidawar1), 
    .salidawar2(salidawar2)
    );

	 
	 
FF_D_Sincrono acumulador(
    .clk(clk), 
    .reset(reset), 
    .datos(resultado_operacion), 
    .enable(en1), 
    .Q_out(yk)
    );



FF_D_Sincrono fk(
    .clk(clk), 
    .reset(reset), 
    .datos(resultado_operacion), 
    .enable(en2), 
    .Q_out(fk_fk1)
    );



FF_D_Sincrono fk1 (
    .clk(clk), 
    .reset(reset), 
    .datos(fk_fk1), 
    .enable(en3), 
    .Q_out(fk1_fk2)
    );



FF_D_Sincrono fk2 (
    .clk(clk), 
    .reset(reset), 
    .datos(fk1_fk2), 
    .enable(en4), 
    .Q_out(out_fk2)
    );


	 



endmodule
