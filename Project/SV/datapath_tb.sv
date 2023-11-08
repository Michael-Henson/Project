`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  [255:0] initialState;
   logic  reset;
   
   logic  [255:0] grid;
   logic  [255:0] grid_evolve;

   logic [15:0] grid0;
   logic [15:0] grid1;
   logic [15:0] grid2;
   logic [15:0] grid3;
   logic [15:0] grid4;
   logic [15:0] grid5;
   logic [15:0] grid6;
   logic [15:0] grid7;
   logic [15:0] grid8;
   logic [15:0] grid9;
   logic [15:0] grid10;
   logic [15:0] grid11;
   logic [15:0] grid12;
   logic [15:0] grid13;
   logic [15:0] grid14;
   logic [15:0] grid15;

   
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

   assign grid0 = grid[15:0];
   assign grid1 = grid[31:16];
   assign grid2 = grid[47:32];
   assign grid3 = grid[63:48];
   assign grid4 = grid[79:64];
   assign grid5 = grid[95:80];
   assign grid6 = grid[111:96];
   assign grid7 = grid[127:112];
   assign grid8 = grid[143:128];
   assign grid9 = grid[159:144];
   assign grid10 = grid[175:160];
   assign grid11 = grid[191:176];
   assign grid12 = grid[207:192];
   assign grid13 = grid[223:208];
   assign grid14 = grid[239:224];
   assign grid15 = grid[255:240];

   initial 
     begin
      //assign initialState = 64'h0412_6424_0034_3C28;
      assign initialState = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;       
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

