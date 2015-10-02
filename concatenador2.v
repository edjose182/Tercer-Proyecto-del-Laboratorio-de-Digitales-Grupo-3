`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:05:49 09/16/2015 
// Design Name: 
// Module Name:    concatenador2 
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
module concatenador2
(  input wire [`ancho-1:0] operando1,
   output reg [`dobleancho-1:0] operando_concatenado
    );
parameter ENTERA = `ancho - `resolucion - 1 ;
localparam [`resolucion-1:0]
		  CEROSF=0;
localparam [ENTERA-1:0]
		  CEROS=0,
		  UNOS=~CEROS;
wire signo;
wire [ENTERA-1:0] parte_entera;
wire [`resolucion-1:0] parte_fraccionada;

assign signo=operando1[`ancho-1];
assign parte_entera=operando1[`ancho-2:`resolucion];
assign parte_fraccionada=operando1[`resolucion-1:0];
always@*
begin
if(signo==1)
operando_concatenado={signo,signo,UNOS,parte_entera,parte_fraccionada,CEROSF};
else
operando_concatenado={signo,signo,CEROS,parte_entera,parte_fraccionada,CEROSF};
end
endmodule
