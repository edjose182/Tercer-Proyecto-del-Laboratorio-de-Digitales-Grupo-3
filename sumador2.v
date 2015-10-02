`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:05:19 09/16/2015 
// Design Name: 
// Module Name:    sumador2 
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
module sumador2
(  input wire signed [`dobleancho-1:0] operando1,operando2,
   output reg signed [`dobleancho-1:0] resultado_suma
    );
wire signo_op1,signo_op2,signo_suma;
wire signed [`dobleancho-1:0] resultado_parcial,over_positivo,over_negativo;
assign signo_op1=operando1[`dobleancho-1];
assign signo_op2=operando2[`dobleancho-1];

localparam [`dobleancho-3:0]
		  CEROS=0,
		  UNOS=~CEROS;
assign over_positivo={2'b00,UNOS};
assign over_negativo={2'b11,CEROS};

assign resultado_parcial=operando1+operando2;

assign signo_suma=resultado_parcial[`dobleancho-1];

always@*
begin
if (signo_op1==0 & signo_op2==0 )
    begin
	 if(signo_suma==0)
	 resultado_suma=resultado_parcial;
	 else
	 resultado_suma=over_positivo;
	 end
else if (signo_op1==1 & signo_op2==1 )
    begin
	 if(signo_suma==1)
	 resultado_suma=resultado_parcial;
	 else
	 resultado_suma=over_negativo;
	 end
else 
    resultado_suma=resultado_parcial;

end

endmodule
