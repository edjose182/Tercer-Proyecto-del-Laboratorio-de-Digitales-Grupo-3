`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:13:37 09/16/2015 
// Design Name: 
// Module Name:    Truncador2 
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
module Truncador2
(  input wire [`dobleancho-1:0] operando1,
   output reg [`ancho-1:0] operando_truncado,
	output wire [`resolucion-1:0] salidawar1,
	output wire salidawar2
    );
wire [`ancho-1:0] over_positivo,over_negativo;
parameter ENTERA = `ancho - `resolucion - 1 ;
parameter senaldelta1= `resolucion + `resolucion +ENTERA;
localparam [ENTERA-1:0]
		  CEROS=0,
		  UNOS=~CEROS;
localparam [`ancho-2:0]
		  CEROS2=0,
		  UNOS2=~CEROS2;
assign over_positivo={1'b0,UNOS2};
assign over_negativo={1'b1,CEROS2};

wire signo2;
wire [ENTERA-1:0] parte_entera,parte_entera2;
wire [`resolucion-1:0] parte_fraccionada;

assign signo2=operando1[`dobleancho-2];
assign parte_entera=operando1[`dobleancho-3:senaldelta1];
assign parte_entera2=operando1[senaldelta1-1:`resolucion + `resolucion];
assign parte_fraccionada=operando1[`resolucion+ `resolucion -1:`resolucion];

always@*
begin
if (signo2==0 )
    begin
	 if(parte_entera==CEROS)
	 operando_truncado={signo2,parte_entera2,parte_fraccionada};
	 else
	 operando_truncado=over_positivo;
	 end
else 
    begin
	 if(parte_entera==UNOS)
	 operando_truncado={signo2,parte_entera2,parte_fraccionada};
	 else
	 operando_truncado=over_negativo;
	 end
end
assign salidawar1=operando1[`resolucion-1:0];
assign salidawar2=operando1[`dobleancho-1];
endmodule
