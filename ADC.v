`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: One Piece
// Engineer: Edgar Jose Campos Duarte
// 
// Create Date:    20:34:07 09/11/2015 
// Design Name: 
// Module Name:    ADC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Este modulo utiliza el cogido del PS2 utiliza en el proyecto #2 del laboratorio de diseño lógico
//esto con el fin de poder pasar los datos seriales a datos en paralelo. De forma que se adacte al protocolo del ADC.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ADC(
input wire clk_Nexys,reset,  ///Clock de la nexys y reset

input wire ADCdata,ADCclk,rx_en,/// Datos que provienen del ADC, Clock del Adc y habilitador de recibimiento de datos

output reg rx_done_tick, ///Bandera que indica que ya todos los datos fueren recibidos

output reg [15:0] b_reg, ///Variable donde se almacenan los 16 datos provenientes del ADC

output wire [11:0] data_out///Datos que realmente necesito del ADC

    );


//Symbolic state declaration

localparam [1:0]
	idle = 2'b00,
	dps= 2'b01,   ///Estado de la maquina
	load= 2'b10;

///Declaracion de las señales

reg [1:0] state_reg,state_next; ///Variables para cambiar de  estado

reg [7:0] filter_reg; //En filter_reg y en filter_next se almacenan
wire [7:0] filter_next;//Se almacenan los 8 bits que se toman de muestra


reg f_ADCclock_reg; //Esta variable toama un valor de 1 o 0 dependiendo del lugar del clock del ADC 
//De foram que cuuando hallan solo unos en la variable filter_reg quiere decir que el punto o el lugar del clk del ADC esta en el 1 del clock

wire f_ADCclock_next;

reg [3:0] n_reg,n_next;  /// Leavan la cuenta de cuatos datos se han lamacenado, deben se nueve 12 datos,
//por lo que en cada ciclo n se le ira disminuyendo un 1

reg [15:0] b_next; ///Variable donde se almacenan los datos provenientes del ADC

wire fall_edge;  //Señal de flanco negativo

//Detector de flancos

always @(posedge clk_Nexys, posedge reset) //Ciclo que se lleva acabo cada vez que hay un ciclo reloj de la nexys o un reset

if (reset)
	begin
		filter_reg<=0;  ///Cuando hay un reset todos los datos de la variable  de que adqueiere los datos del clock del ADC se envian a 0
		f_ADCclock_reg<=0;
	end 

else
	begin
		filter_reg<=filter_next;  ///Aui se actualizan los valores del recolector de dtaos del clock del ADC
		f_ADCclock_reg<=f_ADCclock_next;

	end

assign filter_next= {ADCclk,filter_reg[0:6]};//Aqui es donde se iran metiendo los datos de la variable 
//recolectora de valoroes, esto se realizara en el bit mas siginificativo de forma que se hara un corrimiento hacia la derecha

assign f_ADCclock_next= (filter_reg==8'b11111111) ? 1'b1: //Aqui es donde se asignara el valor de 1 o 0 a la variable reg_f_ADCclock_next
					(filter_reg==8'b00000000) ? 1'b0: //De forma que se pueda saber en que lugar esta la variable tomando los datos
					f_ADCclock_reg; //Aqui la variable tomara el valor anterior, esto pasa cuando la variable que recolecta los valroes se encuentra en 
					//Por ejemplo en 00001111

assign fall_edge = f_ADCclock_reg & ~f_ADCclock_next; //Aqui es donde se activa la bandera que indica que hay un flanco negativo, esto se logra mediante un AND

////Parte secuencial de la maquina de estado (FSM) y datos de los registros

always @(posedge clk_Nexys, posedge reset)    /////Aqui se inicializan los estados y se actualizan las variables
	if (reset)
		begin
		state_reg <= idle;
		n_reg <= 4'b0000;
		b_reg <= 4'b0000;
		end
	else
		begin
			state_reg <= state_next;
			n_reg <= n_next;
			b_reg <= b_next;

		end

///Parte combinacional

always @*
begin
	state_next<= state_reg; //Se actualiza la variable de estado
	rx_done_tick=1'b0;  //Se incializa la bandera
	n_next=n_reg; //Se actualiza la variable que lleva la cuenta de las variables que son empaquetadas
	b_next=b_reg; /// Aqui se almacenan los datos que son enviados del ADC

	case(state_reg)

		idle:
			if(fall_edge & rx_en)

				begin

				//Shift in star bit

				b_next = {ADCdata,b_reg[15:1]};//Se mete el primer cero en el paquete de datos

				n_next=4'b1101; //Se pone el valor 13 en la variable para luego ser decrementado, de forma que se tenga un control de los datos que son
				//empaquetados

				state_next<=dps;  //Se pasa al estado dps

				end

		dps: //3 ceros + 12 data 

			if(fall_edge)

				begin
					b_next= {ADCdata,b_reg[15:1]}; //Se empaquetan los 3 ceros y los 12 datos que se desean toamr del ADC

					if(n_reg==0)

						state_next<=load;

					else
						n_next = n_reg-4'b0001;

				end

		load: // extra clock to complete the last shift

			begin
				state_next<=idle;
				rx_done_tick='b1;

			end

		endcase

	end

	assign data_out = b_reg[15:4]; //Aqui se asigan los 12 datos que se necesitan del ADC



endmodule
