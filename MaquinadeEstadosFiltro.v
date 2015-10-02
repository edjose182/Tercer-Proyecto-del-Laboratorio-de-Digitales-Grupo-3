`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:08 10/01/2015 
// Design Name: 
// Module Name:    MaquinadeEstadosFiltroVersion1 
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
module MaquinadeEstadosFiltroVersion1(
	input wire rx_done_tick,clk,reset, ////Entradas
	output reg en1,en2,en3,en4,listo,  ///Hablitadores de los registros
	output reg [2:0]bar1,    ///Seleccion del primer mux
	output reg [1:0]bar2,    ///Seleccion del segundo mux
	output reg [1:0]bar3	///Seleccion de tercer mux	

    );

localparam [2:0]

	inicio = 3'd0,
	op1= 3'd1,
	op2= 3'd2,		////Estados de la maquina
	op3= 3'd3,
	op4= 3'd4,
	op5= 3'd5;

///Delcaracion de señales

reg [2:0] state_reg, state_next; ///Variables de estado

///Parte secuencial

always @(posedge reset, posedge clk)
	
	if(reset)
		begin
			state_reg<=inicio;
		end 

	else
		begin
			state_reg<= state_next;
		end

////Parte combinacional

always @*
	begin
	 state_next = state_reg;

	 en1=1'b0;
	 en2=1'b0;
	 en3=1'b0;
	 en4=1'b0;

	 bar1= 3'd0;
	 bar2= 2'd0;
	 bar3= 2'd0;
	 
	 listo=1'b0;


	 case(state_reg)

	 inicio:

	 if(rx_done_tick)

	 state_next=op1;

	 else

	 	state_next=inicio;


	 op1:

	 begin

	 state_next=op2;

	 bar1=3'd0;
	 bar2=2'd2;
	 bar3=2'd0;
	 en1=1;
	 end


	
	 op2:


	 begin

	 state_next=op3;

	  bar1=3'd1;
	 bar2=2'd2;
	 bar3=2'd1;
	 en2=1;
	 en3=1;
	 en4=1;
	 end
	

	 op3:

	 begin

state_next=op4;

     bar1=3'd2;
	 bar2=2'd0;
	 bar3=2'd2;
	 en1=1;

    end

	 op4:

    begin

    state_next=op5;

	 bar1=3'd3;
	 bar2=2'd1;
	 bar3=2'd1;
	 en1=1;

	 end
	 op5:

	 begin

	 state_next=inicio;

 	 bar1=3'd4;
	 bar2=2'd2;
	 bar3=2'd1;
	 en1=1;
	 listo=1;
	 end
 
	 default
	 	state_next=inicio;

	endcase

end

endmodule













	


