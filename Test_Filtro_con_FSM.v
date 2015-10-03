`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:34 10/02/2015
// Design Name:   Filtro_con_FSM
// Module Name:   C:/Users/WIN8/Desktop/Filtro/Filtro/Test_Filtro_con_FSM.v
// Project Name:  Filtro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Filtro_con_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Filtro_con_FSM;

	// Inputs
	reg rx_done_tick;
	reg clk;
	reg reset;
	reg [21:0] Uk;

	// Outputs
	wire listo;
	wire [21:0] yk;
	wire salidawar1;
	wire [13:0] salidawar2;

	// Instantiate the Unit Under Test (UUT)
	Filtro_con_FSM uut (
		.rx_done_tick(rx_done_tick), 
		.clk(clk), 
		.reset(reset), 
		.Uk(Uk), 
		.listo(listo), 
		.yk(yk), 
		.salidawar1(salidawar1), 
		.salidawar2(salidawar2)
	);
integer archivo,j;

reg [21:0] Mem [0:1000];

	initial begin
		Uk=0;
		clk=0;
		rx_done_tick=0;
		reset=1;
		archivo=$fopen("resultado.txt","w");
		$readmemb("datos_puntofijo.txt",Mem);
		repeat(5) @(posedge clk);
		reset=0;

	end

	initial begin

	@(negedge reset);
	repeat(10) @(posedge clk);
		for(j=0;j<100;j=j+1)

			begin
			@(posedge clk);
			Uk=Mem[j];
			rx_done_tick=1;

			@(posedge clk)
			$fwrite(archivo, "%b\n",yk);
			rx_done_tick=0;
			repeat(15)@(posedge clk);
			end
			$fclose(archivo);
			$stop;

	end
      
	initial forever begin 
		#500 clk= ~clk;
		end


endmodule

