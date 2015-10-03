`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:05:46 10/03/2015
// Design Name:   PWM_MarkI
// Module Name:   C:/Users/WIN8/Desktop/Pruebas_Tercer_proyecto_Digitales/Pruebas_Tercer_Proyecto/Test_PWM.v
// Project Name:  Pruebas_Tercer_Proyecto
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWM_MarkI
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PWM;

	// Inputs
	reg clk;
	reg [21:0] Dato;
	reg iniciar;

	// Outputs
	wire pwm;
	wire [21:0] contador;

	// Instantiate the Unit Under Test (UUT)
	PWM_MarkI uut (
		.clk(clk), 
		.Dato(Dato), 
		.pwm(pwm),
		.contador
	);

	integer archivo,j;

	reg [21:0] Mem [0:1000];

	initial begin

	Dato=0;

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

					Dato=Mem[j];

					repeat(22) @(posedge clk)

					$fwrite(archivo, "%\n", pwm);

					end

					$fclose(archivo);

					$stop;

				end


				initial forever begin

				#5 clk = ~clk;
      
      			end
endmodule

