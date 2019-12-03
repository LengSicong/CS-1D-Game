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
    input [7:0] button,
    output reg [13:0] target,
    output reg [6:0] display_seg,
    output reg opr_display_add,
    output reg opr_display_sub
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [128-1:0] M_beta_s_seg_display;
  wire [16-1:0] M_beta_target_display;
  wire [1-1:0] M_beta_opr_display_add;
  wire [1-1:0] M_beta_opr_display_sub;
  reg [8-1:0] M_beta_button;
  miniBeta_2 beta (
    .clk(clk),
    .rst(rst),
    .button(M_beta_button),
    .s_seg_display(M_beta_s_seg_display),
    .target_display(M_beta_target_display),
    .opr_display_add(M_beta_opr_display_add),
    .opr_display_sub(M_beta_opr_display_sub)
  );
  wire [7-1:0] M_numbersDisplay_seg;
  wire [3-1:0] M_numbersDisplay_sel;
  reg [128-1:0] M_numbersDisplay_values;
  multi_seven_seg_3 numbersDisplay (
    .clk(clk),
    .rst(rst),
    .values(M_numbersDisplay_values),
    .seg(M_numbersDisplay_seg),
    .sel(M_numbersDisplay_sel)
  );
  
  wire [7-1:0] M_seven_seg1_segs;
  reg [16-1:0] M_seven_seg1_char;
  seven_seg_4 seven_seg1 (
    .char(M_seven_seg1_char),
    .segs(M_seven_seg1_segs)
  );
  
  wire [7-1:0] M_seven_seg2_segs;
  reg [16-1:0] M_seven_seg2_char;
  seven_seg_4 seven_seg2 (
    .char(M_seven_seg2_char),
    .segs(M_seven_seg2_segs)
  );
  
  integer i;
  
  always @* begin
    for (i = 1'h0; i < 4'h8; i = i + 1) begin
      M_beta_button[(i)*1+0-:1] = button[(i)*1+0-:1];
    end
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    for (i = 1'h0; i < 4'h8; i = i + 1) begin
      M_numbersDisplay_values[(i)*16+15-:16] = M_beta_s_seg_display[(i)*16+15-:16];
    end
    display_seg = ~M_numbersDisplay_seg;
    led[0+2-:3] = ~M_numbersDisplay_sel;
    opr_display_add = M_beta_opr_display_add;
    opr_display_sub = M_beta_opr_display_sub;
    if (M_beta_target_display > 4'h9) begin
      M_seven_seg1_char = M_beta_target_display - 4'ha;
      target[0+6-:7] = ~M_seven_seg1_segs;
      M_seven_seg2_char = 1'h1;
      target[7+6-:7] = ~M_seven_seg2_segs;
    end else begin
      M_seven_seg1_char = M_beta_target_display;
      target[0+6-:7] = ~M_seven_seg1_segs;
      M_seven_seg2_char = 1'h0;
      target[7+6-:7] = ~M_seven_seg2_segs;
    end
  end
endmodule
