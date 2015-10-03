`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:54:17 10/03/2015
// Design Name:   PWMVersion2
// Module Name:   C:/Users/WIN8/Desktop/Pruebas_Tercer_proyecto_Digitales/Pruebas_Tercer_Proyecto/Test_PWMVersion2.v
// Project Name:  Pruebas_Tercer_Proyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWMVersion2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PWMVersion2;

	// Inputs
	reg clk;
	reg [21:0] dato;
	reg iniciar;

	// Outputs
	wire pwm;
	wire [21:0] counter;

	// Instantiate the Unit Under Test (UUT)
	PWMVersion2 uut (
		.clk(clk), 
		.dato(dato), 
		.pwm(pwm),
		.counter(counter)
	);

	integer archivo,j;

	reg [21:0] Mem [0:1000];


	initial begin

	dato=0;

	clk=0;

	iniciar=1;

	archivo=$fopen("Resultado.txt", "w");

	$readmemb("datospwm.txt",Mem);

	repeat(5) @(posedge clk)

	iniciar=0;

	end


	initial begin

	@(negedge iniciar)
			for (j=0;j<1000;j=j+1)

				begin

				dato=Mem[j];

				repeat(1) @(posedge clk)

				$fwrite(archivo, "%\n", pwm);

				end

				$fclose(archivo);

				$stop;

				end


				initial forever begin

				#5 clk = ~clk;
      
      			end
endmodule
