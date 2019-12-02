/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 8
     DIV = 25
     TOP = 0
     UP = 1
*/
module counter_20 (
    input clk,
    input rst,
    output reg [7:0] value
  );
  
  localparam SIZE = 4'h8;
  localparam DIV = 5'h19;
  localparam TOP = 1'h0;
  localparam UP = 1'h1;
  
  
  reg [32:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 26'h1ffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[25+7-:8];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h0 && M_ctr_q == 26'h1ffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h0 && M_ctr_q == 1'h0) begin
        M_ctr_d = 26'h1ffffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
