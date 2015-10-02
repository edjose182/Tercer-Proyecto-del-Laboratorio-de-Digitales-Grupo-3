`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:23:50 10/01/2015
// Design Name:   MaquinadeEstadosFiltroVersion1
// Module Name:   C:/Users/WIN8/Desktop/Filtro/Filtro/TestMaquinaFiltro.v
// Project Name:  Filtro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MaquinadeEstadosFiltroVersion1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestMaquinaFiltro;

	// Inputs
	reg rx_done_tick;
	reg clk;
	reg reset;

	// Outputs
	wire en1;
	wire en2;
	wire en3;
	wire en4;
	wire listo;
	wire [2:0] bar1;
	wire [1:0] bar2;
	wire [1:0] bar3;

	// Instantiate the Unit Under Test (UUT)
	MaquinadeEstadosFiltroVersion1 uut (
		.rx_done_tick(rx_done_tick), 
		.clk(clk), 
		.reset(reset), 
		.en1(en1), 
		.en2(en2), 
		.en3(en3), 
		.en4(en4), 
		.listo(listo), 
		.bar1(bar1), 
		.bar2(bar2), 
		.bar3(bar3)
	);

	initial begin
		// Initialize Inputs
		rx_done_tick = 0;
		clk = 0;
		reset = 1;
		
		forever #10 clk=~clk;
	end
	
	initial begin
	
	
	reset=0;
	rx_done_tick=1;
	
	#150
	
	
	
#10
	
	$stop;
	
	

	
	end
	
	
      
endmodule

