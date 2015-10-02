`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:06:49 09/16/2015 
// Design Name: 
// Module Name:    OPERACIONES 
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
module OPERACIONES
(  input wire [`ancho-1:0] operando1,operando2,operando3,
   output wire [`ancho-1:0] resultado_operacion,
	output wire salidawar1,
	output wire[`resolucion-1:0] salidawar2
	
	
    );
	 
wire [`dobleancho-1:0]resultado_multiplicacion,operando_3_concatenado,resultado_suma;

multiplicacion_con_signo multiplicador (
    .operando1(operando1), 
    .operando2(operando2), 
    .resultado_multiplicacion(resultado_multiplicacion)
    );
concatenador2 concatenar3 (
    .operando1(operando3), 
    .operando_concatenado(operando_3_concatenado)
    );
sumador2 sumador (
    .operando1(resultado_multiplicacion), 
    .operando2(operando_3_concatenado), 
    .resultado_suma(resultado_suma)
    );
Truncador2 truncador (
    .operando1(resultado_suma), 
    .operando_truncado(resultado_operacion), 
    .salidawar1(salidawar2), 
    .salidawar2(salidawar1)
    );

endmodule
