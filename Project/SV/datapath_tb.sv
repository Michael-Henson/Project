`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  [255:0] initial_state;
   logic  reset;
   logic run;
   
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
   datapath dut (clk, grid_evolve, initial_state, run, reset);   
   
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
     end
/*
   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b || %b", 
		     reset, a, y);
     end   
   */

   assign grid0 = grid_evolve[15:0];
   assign grid1 = grid_evolve[31:16];
   assign grid2 = grid_evolve[47:32];
   assign grid3 = grid_evolve[63:48];
   assign grid4 = grid_evolve[79:64];
   assign grid5 = grid_evolve[95:80];
   assign grid6 = grid_evolve[111:96];
   assign grid7 = grid_evolve[127:112];
   assign grid8 = grid_evolve[143:128];
   assign grid9 = grid_evolve[159:144];
   assign grid10 = grid_evolve[175:160];
   assign grid11 = grid_evolve[191:176];
   assign grid12 = grid_evolve[207:192];
   assign grid13 = grid_evolve[223:208];
   assign grid14 = grid_evolve[239:224];
   assign grid15 = grid_evolve[255:240];

   initial 
     begin
     #0 initial_state = 256'h0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28;
     #0 reset = 1'b1;
     #0 run = 1'b0;
     #40 reset = 1'b0;
     #40 run = 1'b1;
      //assign initial_state = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;        
      /*
      #0   in = 2;
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
      */
      #500 $finish;
     end

endmodule // FSM_tb

