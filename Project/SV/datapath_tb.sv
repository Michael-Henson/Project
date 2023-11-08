`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  [63:0] initialState;
   logic  reset;
   
   logic  [63:0] grid;
   logic  [63:0] grid_evolve;

   logic [7:0] grid0;
   logic [7:0] grid1;
   logic [7:0] grid2;
   logic [7:0] grid3;
   logic [7:0] grid4;
   logic [7:0] grid5;
   logic [7:0] grid6;
   logic [7:0] grid7;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   datapath dut (grid, grid_evolve);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end
/*
   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     reset, a, y);
     end   
   */

   assign grid0 = grid[7:0];
   assign grid1 = grid[15:8];
   assign grid2 = grid[23:16];
   assign grid3 = grid[31:24];
   assign grid4 = grid[39:32];
   assign grid5 = grid[47:40];
   assign grid6 = grid[55:48];
   assign grid7 = grid[63:56];

   initial 
     begin
      //assign initialState = 64'h0412_6424_0034_3C28;
      assign initialState = 64'h0000_0000_0111_000;       
      #0 grid = initialState;
	   #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
      #41  grid = grid_evolve;
     end

endmodule // FSM_tb

