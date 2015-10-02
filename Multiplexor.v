`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:26 10/02/2015 
// Design Name: 
// Module Name:    Multiplexor 
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
module Multiplexor(
input  wire [2:0] bar1,
input wire  [1:0] bar2,bar3,
input wire  [`ancho-1:0] fk,fk1,fk2,acum,Uk, 
output wire [`ancho-1:0] operando1,operando2,operando3         
    );
parameter F=16;
parameter N=`ancho-F;
localparam [`ancho-1:0]
		  auno={{N{1'b0}},16'sd32112},
		  ados={{N{1'b1}},-16'sd15736},
		  bcero={{N{1'b0}},16'sd3},
		  buno={{N{1'b0}},16'sd6},
		  bdos={{N{1'b0}},16'sd3},
		  cero={{N{1'b0}},16'sd0};
		  
assign operando1 = (bar1==0) ?   auno : 
                   (bar1==1) ?   ados : 
						 (bar1==2) ?   bcero : 
						 (bar1==3) ?   buno : 
						 (bar1==4) ?   bdos: 					 
                      cero ;
assign operando2 = (bar2==0) ?   fk : 
                   (bar2==1) ?   fk1 : 
						 (bar2==2) ?   fk2  : 					 
                      cero ;
assign operando3 = (bar3==0) ?   Uk : 
                   (bar3==1) ?   acum : 
						 (bar3==2) ?   cero : 						 
                      cero ;

endmodule
