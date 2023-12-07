`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  [575:0] initial_seed;
   logic  reset;
   logic run;
 
   
   logic  [575:0] grid;
   logic  [575:0] grid_evolve;

   logic [23:0] grid0;
   logic [23:0] grid1;
   logic [23:0] grid2;
   logic [23:0] grid3;
   logic [23:0] grid4;
   logic [23:0] grid5;
   logic [23:0] grid6;
   logic [23:0] grid7;
   logic [23:0] grid8;
   logic [23:0] grid9;
   logic [23:0] grid10;
   logic [23:0] grid11;
   logic [23:0] grid12;
   logic [23:0] grid13;
   logic [23:0] grid14;
   logic [23:0] grid15;
   logic [23:0] grid16;
   logic [23:0] grid17;
   logic [23:0] grid18;
   logic [23:0] grid19;
   logic [23:0] grid20;
   logic [23:0] grid21;
   logic [23:0] grid22;
   logic [23:0] grid23;

   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   datapath dut (clk, grid_evolve, initial_seed, run, reset);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("datapath.out");
	// Tells when to finish simulation		
     end

   always 
     begin
	desc3 = handle3;
	#10 $fdisplay(desc3, " %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b  \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b\n\n", 
     grid_evolve[23:0], grid_evolve[47:24], grid_evolve[71:48], grid_evolve[95:72], grid_evolve[119:96], grid_evolve[143:120], grid_evolve[167:144], grid_evolve[191:168],
      grid_evolve[215:192], grid_evolve[239:216], grid_evolve[263:240], grid_evolve[287:264], grid_evolve[311:288], grid_evolve[335:312], grid_evolve[359:336], grid_evolve[383:360],
       grid_evolve[407:384], grid_evolve[431:408], grid_evolve[455:432], grid_evolve[479:456], grid_evolve[503:480], grid_evolve[527:504], grid_evolve[551:528], grid_evolve[575:552]);
     end   
   

   assign grid0 = grid_evolve[23:0];
   assign grid1 = grid_evolve[47:24];
   assign grid2 = grid_evolve[71:48];
   assign grid3 = grid_evolve[95:72];
   assign grid4 = grid_evolve[119:96];
   assign grid5 = grid_evolve[143:120];
   assign grid6 = grid_evolve[167:144];
   assign grid7 = grid_evolve[191:168];
   assign grid8 = grid_evolve[215:192];
   assign grid9 = grid_evolve[239:216];
   assign grid10 = grid_evolve[263:240];
   assign grid11 = grid_evolve[287:264];
   assign grid12 = grid_evolve[311:288];
   assign grid13 = grid_evolve[335:312];
   assign grid14 = grid_evolve[359:336];
   assign grid15 = grid_evolve[383:360];
   assign grid16 = grid_evolve[407:384];
   assign grid17 = grid_evolve[431:408];
   assign grid18 = grid_evolve[455:432];
   assign grid19 = grid_evolve[479:456];
   assign grid20 = grid_evolve[503:480];
   assign grid21 = grid_evolve[527:504];
   assign grid22 = grid_evolve[551:528];
   assign grid23 = grid_evolve[575:552];

   initial 
     begin
     //#0 initial_seed = 256'h0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28;
     //#0 initial_seed = 576'h70000000000000000000000;
     #0 initial_seed = 576'b100100011000000001110010111111110100111111001001000000100111010110000010001111011010010101000000000001111000111110010010011010000110000011110100101100010001111001110101001101011100011010001100001001111110010011010101101010110000100010011000000001011011011101000001110011110001000111010111101101111001011010011110001111001110000000111111000001101001000000001111100010111010011101111001011100110001101110100001110011101101011110111100000101000111001001010110011001010110100001011111000001011001001101110101000111010010100011011000100011100100101010111110100110010000110100000110;
     #0 reset = 1'b1;
     #0 run = 1'b0;
     #40 reset = 1'b0;
     #40 run = 1'b1;
     #100 run = 1'b0;
     #40 run = 1'b1;
     #100 reset = 1'b1;
      //assign initial_seed = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;        
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

