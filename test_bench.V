// test bench verilog code on ISE
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:24:20 06/08/2019
// Design Name:   microblaze_top
// Module Name:   D:/verilog/microblaze_tut/tb.v
// Project Name:  microblaze_tut
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: microblaze_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg Clk;
	reg Reset;
	reg UART_Rx;
	reg [31:0] GPI1;
	reg [31:0] GPI2;
	reg [31:0] GPI3;
	reg [31:0] GPI4;

	// Outputs
	wire UART_Tx;
	wire [31:0] GPO1;
	wire [31:0] GPO2;
	wire [31:0] GPO3;
	wire [31:0] GPO4;

	// Instantiate the Unit Under Test (UUT)
	microblaze_top uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.UART_Rx(UART_Rx), 
		.UART_Tx(UART_Tx), 
		.GPO1(GPO1), 
		.GPO2(GPO2), 
		.GPO3(GPO3), 
		.GPO4(GPO4), 
		.GPI1(GPI1), 
		.GPI2(GPI2), 
		.GPI3(GPI3), 
		.GPI4(GPI4)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;
		UART_Rx = 0;
		GPI1 = 0;
		GPI2 = 0;
		GPI3 = 0;
		GPI4 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		//for zero delta
		/*GPI1 = 32'b1;
		GPI2 = 32'b11;
		GPI3 = 32'b10;
		GPI4 = 32'b0;*/
		
		//for zero delta
		GPI1 = 32'b1;
		GPI2 = 32'b11;
		GPI3 = 32'b0;
		GPI4 = 32'b0;
		
		//for posetive delta
		/*GPI1 = 32'b1;
		GPI2 = 32'b1001;
		GPI3 = 32'b11100;
		GPI4 = 32'b0;*/
		
		//case 2 for posetive dalta
		/*GPI1 = 32'b1;
		GPI2 = 32'b101;
		GPI3 = 32'b110;
		GPI4 = 32'b111;*/
		
		
		//for nagative delta
		/*GPI1 = 32'b1;
		GPI2 = 32'b11;
		GPI3 = 32'b11;
		GPI4 = 32'b1;*/
		
		
		//for negative dalta bad test case
		/*GPI1 = 32'b1;
		GPI2 = 32'b11111111111111111111111111100101;
		GPI3 = 32'b11111111111111111111111111111010;
		GPI4 = 32'b101;*/
		
		
        
		// Add stimulus here

	end


always #50 Clk = ~Clk;


      
endmodule
