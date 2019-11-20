/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_game_whetherstart;
  wire [8-1:0] M_game_display;
  wire [1-1:0] M_game_out;
  reg [56-1:0] M_game_counter2;
  reg [1-1:0] M_game_start;
  reg [1-1:0] M_game_button1;
  reg [1-1:0] M_game_button2;
  reg [1-1:0] M_game_button3;
  reg [1-1:0] M_game_button4;
  reg [1-1:0] M_game_button5;
  reg [1-1:0] M_game_button6;
  reg [1-1:0] M_game_button7;
  reg [1-1:0] M_game_button8;
  reg [1-1:0] M_game_button9;
  reg [1-1:0] M_game_button10;
  game_fsm_2 game (
    .clk(clk),
    .rst(rst),
    .counter2(M_game_counter2),
    .start(M_game_start),
    .button1(M_game_button1),
    .button2(M_game_button2),
    .button3(M_game_button3),
    .button4(M_game_button4),
    .button5(M_game_button5),
    .button6(M_game_button6),
    .button7(M_game_button7),
    .button8(M_game_button8),
    .button9(M_game_button9),
    .button10(M_game_button10),
    .whetherstart(M_game_whetherstart),
    .display(M_game_display),
    .out(M_game_out)
  );
  reg [55:0] M_counter2_d, M_counter2_q = 1'h0;
  
  always @* begin
    M_counter2_d = M_counter2_q;
    
    M_game_button1 = 1'h0;
    M_game_button2 = 1'h0;
    M_game_button3 = 1'h0;
    M_game_button4 = 1'h0;
    M_game_button5 = 1'h0;
    M_game_button6 = 1'h0;
    M_game_button7 = 1'h0;
    M_game_button8 = 1'h0;
    M_game_button9 = 1'h0;
    M_game_button10 = 1'h0;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_game_counter2 = M_counter2_q;
    if (io_dip[0+0+0-:1]) begin
      M_game_start = 1'h1;
    end else begin
      M_game_start = 1'h0;
    end
    M_counter2_d = M_counter2_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter2_q <= 1'h0;
    end else begin
      M_counter2_q <= M_counter2_d;
    end
  end
  
endmodule
