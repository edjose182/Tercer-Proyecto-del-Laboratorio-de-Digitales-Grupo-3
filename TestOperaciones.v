
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:01:16 09/27/2015
// Design Name:   OPERACIONES
// Module Name:   C:/Users/WIN8/Desktop/Modulo de operaciones/ModulodeOperaciones/TestOperaciones.v
// Project Name:  ModulodeOperaciones
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OPERACIONES
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestOperaciones;

	// Inputs
	reg [5:0] operando1;
	reg [5:0] operando2;
	reg [5:0] operando3;
	reg clk;
	reg iniciar;

	// Outputs
	wire [5:0] resultado_operacion;
	wire salidawar1;
	wire [2:0] salidawar2;

	// Instantiate the Unit Under Test (UUT)
	OPERACIONES uut (
		.operando1(operando1), 
		.operando2(operando2), 
		.operando3(operando3), 
		.resultado_operacion(resultado_operacion), 
		.salidawar1(salidawar1), 
		.salidawar2(salidawar2)
	);

	integer archivo,j;
reg [5:0] Mem3 [0:9];
reg [5:0] Mem2 [0:9];//Datos guardados en un archivo txt
reg [5:0] Mem1 [0:9];//Datos guardados en un archivo txt	
initial begin
		// Initialize Inputs
		operando1 = 0;
		operando2 = 0;
		operando3 = 0;
		clk=0;
		iniciar = 1;
		archivo=$fopen("resul.txt", "w");
		$readmemb("Datos_op3.txt",Mem3);
		$readmemb("Datos_op2.txt",Mem2);
		$readmemb("Datos_op1.txt",Mem1);
	   repeat(5) @(posedge clk)
		iniciar=0;
	end
	
	
	initial begin
		@(negedge iniciar)// cuando el reset se hace 0
			for(j=0;j<10;j=j+1)
				begin
				operando1=Mem1[j];
				operando2=Mem2[j];
				operando3=Mem3[j];
				repeat(1) @(posedge clk)
				$fwrite(archivo, "%b\n", resultado_operacion);
				end
				$fclose(archivo);
				$stop;
		end
	initial forever begin 
		#5 clk= ~clk;
		end
       
endmodule

