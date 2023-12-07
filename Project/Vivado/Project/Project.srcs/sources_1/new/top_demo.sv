`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_demo
(
  // input
  input  logic [7:0] sw,
  input  logic [3:0] btn,
  input  logic       sysclk_125mhz,
  input  logic       rst,
  
  // output  
  output logic [7:0] led,
  output logic       sseg_ca,
  output logic       sseg_cb,
  output logic       sseg_cc,
  output logic       sseg_cd,
  output logic       sseg_ce,
  output logic       sseg_cf,
  output logic       sseg_cg,
  output logic       sseg_dp,
  output logic [3:0] sseg_an,
  output logic [2:0] hdmi_d_p,  
  output logic [2:0] hdmi_d_n,   
  output logic       hdmi_clk_p,   
  output logic	     hdmi_clk_n,
   
  inout logic	     hdmi_cec,  
  inout logic	     hdmi_sda,   
  inout logic	     hdmi_scl,   
  input logic	     hdmi_hpd
);

  logic [16:0] CURRENT_COUNT;
  logic [16:0] NEXT_COUNT;
  logic        smol_clk;
   
  // Place Conway Game of Life instantiation here
  //logic [255:0] initialState;
  //logic [255:0] grid;
  //logic [255:0] grid_evolve;
  //logic reset;
  //assign initialState = 256'h0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28_0412_6424_0034_3C28;
  //assign reset = btn[0];
  //if(reset == 1){
  
  logic clk;
  logic [575:0] ffout, initial_seed;
  logic run, reset;
  logic [23:0] alive, dead;
  
  //want to do switch case for initial_seed, but for now:
  //assign initial_seed = 256'h0000e00000;
  assign run = sw[7];
  assign reset = btn[0];
   
  always @(*) begin
  case (sw[1:0])
    //2'b00 : initial_seed = 576'b100100011000000001110010111111110100111111001001000000100111010110000010001111011010010101000000000001111000111110010010011010000110000011110100101100010001111001110101001101011100011010001100001001111110010011010101101010110000100010011000000001011011011101000001110011110001000111010111101101111001011010011110001111001110000000111111000001101001000000001111100010111010011101111001011100110001101110100001110011101101011110111100000101000111001001010110011001010110100001011111000001011001001101110101000111010010100011011000100011100100101010111110100110010000110100000110;
    2'b00 : initial_seed = 576'h000000_00e000_000000;
    2'b01 : initial_seed = 576'b011110100101111111111000111111110111001001000000100100011011001111111111011101100111110000101100100011011011111110001011000100011000000101010111100001010110011000100011111110100100100000101111011010010101110110110011111101000100000011000001100010011010001011011011101100100010011010101001000000111011111111010100001001101010000101010001111101111111100001101001101011111001100100101100000101100011110001111101000011000110110001010001100010110110101011000010110111001011111000011111100101000101110000010100110000010100110110111011011000101000101000101010000101010110000111000011;
    2'b10 : initial_seed = 576'b110111110000010111011001000000111101100000111010000111101101111011111000001101100101001100010001100010110000101101101101010001010010010010000001110010111000010101111010101101101100001110101001001110101001101001110111001110110011001111100100101010000100110010111011100010011100011100101110011000000000011001001001100100111001111111111110011011011111100111011110110111011010001110010111100111100011001100111100111000101010100111011100101101110011001100000100001001001100110011111110100100100100001001010001010111010000001001001010110100011000000101101001010011010101101100001101;
    2'b11 : initial_seed = 576'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000100000000000000000000001100000000000000000000011100000000000000000000011110000000000000000000111111000000000000000001001110100000000000000000011100000000000000000000111110000000000000000001111111000000000000000010011110100000000000000001111111000000000000000011111111100000000000000110111110110000000000001000001100001000000000000000001100000000000000000000001100000000000111111111111111111111111;
  endcase
  end
  
  always @(*) begin
  case (sw[3:2])
    //blue & teal
    2'b00 : begin alive = {8'h74, 8'hF8, 8'hFF};
            dead = {8'h74, 8'hFF, 8'hB3}; end
    //red & green
    2'b01 : begin alive = {8'h56, 8'h99, 8'h4D};
            dead = {8'hCD, 8'h30, 8'h19}; end
    //orange & blue
    2'b10 : begin alive = {8'hFF, 8'hA9, 8'h0D};
            dead = {8'h0D, 8'h48, 8'hFF}; end
    //green & pink
    2'b11 : begin alive = {8'hFF, 8'h45, 8'hD4};
            dead = {8'h37, 8'hFF, 8'h0B}; end
  endcase
  end
   
  clk_div clock(sysclk_125mhz, reset, clk);
  datapath data(clk, ffout, initial_seed, run, reset);

  // HDMI
  // logic hdmi_out_en;
  //assign hdmi_out_en = 1'b0;
  hdmi_top test (alive, dead, ffout, sysclk_125mhz, hdmi_d_p, hdmi_d_n, hdmi_clk_p, 
		         hdmi_clk_n, hdmi_cec, hdmi_sda, hdmi_scl, hdmi_hpd);
  
  // 7-segment display
  segment_driver driver(
  .clk(smol_clk),
  .rst(btn[3]),
  .digit0(sw[3:0]),
  .digit1(4'b0111),
  .digit2(sw[7:4]),
  .digit3(4'b1111),
  .decimals({1'b0, btn[2:0]}),
  .segment_cathodes({sseg_dp, sseg_cg, sseg_cf, sseg_ce, sseg_cd, sseg_cc, sseg_cb, sseg_ca}),
  .digit_anodes(sseg_an)
  );

// Register logic storing clock counts
  always@(posedge sysclk_125mhz)
  begin
    if(btn[3])
      CURRENT_COUNT = 17'h00000;
    else
      CURRENT_COUNT = NEXT_COUNT;
  end
  
  // Increment logic
  assign NEXT_COUNT = CURRENT_COUNT == 17'd100000 ? 17'h00000 : CURRENT_COUNT + 1;

  // Creation of smaller clock signal from counters
  assign smol_clk = CURRENT_COUNT == 17'd100000 ? 1'b1 : 1'b0;

endmodule
//clock divider
module clk_div (input logic clk, input logic rst, output logic clk_en);
logic [23:0] clk_count;
always_ff @(posedge clk)
//posedge defines a rising edge (transition from 0 to 1)
begin
if (rst)
clk_count <= 24'h0;
else
clk_count <= clk_count + 1;
end
assign clk_en = clk_count[23];
endmodule

