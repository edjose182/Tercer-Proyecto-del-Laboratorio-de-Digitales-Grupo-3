`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:48 10/04/2015 
// Design Name: 
// Module Name:    Truncador_PrevioPWM 
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
module Truncador_PrevioPWM(

input wire [`ancho-1:0] dato,

output wire [`resolucion-1:0] dato_truncado,

output wire [7:0] salida_g
    );
	 
 
	 
reg [13:0]dato_reg;

wire [`resolucion-1:0] over_positivo,over_negativo;

parameter entera = `ancho - `resolucion -1 ;

parameter senldelta1= `resolucion + `resolucion + entera;

localparam[`resolucion-2:0]

 
 	CEROS=0,
 	UNOS=~CEROS;


 assign over_positivo={1'b0,UNOS};

 assign over_negativo= {1'b1,CEROS};

 wire signo;

 wire msb_fraccionada;

 wire [`ancho-1:`resolucion+1] parte_entera;

 wire[`resolucion-1:0] parte_fraccionada;


 assign msb_fraccionada= dato[13];
 
 assign parte_entera=dato[`ancho-1:`resolucion+1]; 


 always @*

 begin

 if(parte_entera==7'b0 | parte_entera==7'b1)

 	 dato_reg={~{msb_fraccionada},dato[12:0]};

 else

 	begin

 	if(parte_entera|7'b0 !=0)

 	 dato_reg=over_positivo;

 	else

 	 dato_reg=over_negativo;

 	end 

 end
 
 assign dato_truncado=dato_reg;
 
 assign salida_g=dato[`ancho-1:15];

 endmodule










