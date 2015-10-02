`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:15 09/30/2015
// Design Name:   ADC3
// Module Name:   C:/Users/WIN8/Desktop/Pruebas del ADC/Pruebas_ADC/Test_ADC3.v
// Project Name:  Pruebas_ADC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ADC3;

	// Inputs
	reg SDATA;
	reg reset;
	reg CS;
	reg SCLK;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_Out;

	// Instantiate the Unit Under Test (UUT)
	ADC3 uut (
		.SDATA(SDATA), 
		.reset(reset), 
		.CS(CS), 
		.SCLK(SCLK), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_Out(data_Out)
	);
	integer i,j;
	reg [15:0] datos_txt;
	reg [15:0] Memoria [0:15];
	initial begin
	
	SCLK=1;
	CS=0;
	reset=1;
	datos_txt=Memoria[0];
	SDATA= datos_txt[15];
	$readmemb("Datos_MarkV",Memoria);
	
	repeat(5) @(negedge SCLK)
	
		reset=0;
		
	end
	
	initial begin
		@(negedge reset, negedge SCLK)
			for(j=0;j<16;j=j+1)
				begin
				datos_txt=Memoria[j];

			for (i=0;i<16;i=i+1)
				begin

				@(negedge SCLK)
				SDATA = datos_txt[15-i];
				end
		SDATA=1;
		
			end
			
	end

initial forever begin

#515 SCLK =~SCLK;

end	

initial forever begin

#22700 CS =~CS;

end	
	
      
endmodule

