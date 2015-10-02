`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:11 09/16/2015 
// Design Name: 
// Module Name:    multiplicacion_con_signo 
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
module multiplicacion_con_signo
(  input wire signed [`ancho-1:0] operando1,operando2,
   output wire signed [`dobleancho-1:0] resultado_multiplicacion
    );
assign resultado_multiplicacion=operando1*operando2;

endmodule
