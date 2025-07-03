//-----------------------------------------------------------------------------  
//  Complex MAC with internal rescale to Q4.5 (to reduce overflow)  
//-----------------------------------------------------------------------------  
//  Inputs:  
//    a_real, a_imag        → odd part in Q3.5 (8 bits)  
//    even_real_in, even_imag_in → even part in Q2.6 (8 bits)  
//    b_real, b_imag        → twiddle in Q3.5 (8 bits)  
//  Computes:  
//    full multiply-add/subtract in Q4.12, then rescales to Q4.5  
//    with rounding and saturation, reducing overflow risk.  
//-----------------------------------------------------------------------------  
module complex_mac #(
    parameter DATA_WIDTH    = 8,    // Q3.5 input width
    parameter OUT_WIDTH     = 11,
    parameter TW_WIDTH      = 8     // Q3.5 twiddle width
)(
    input  wire                          clk,
    input  wire                          rst_n,
    input  wire                          in_valid,
    input  wire signed [DATA_WIDTH-1:0]  a_real,
    input  wire signed [DATA_WIDTH-1:0]  a_imag,
    input  wire signed [TW_WIDTH-1:0]    b_real,
    input  wire signed [TW_WIDTH-1:0]    b_imag,
    input  wire signed [DATA_WIDTH-1:0]  even_real_in,
    input  wire signed [DATA_WIDTH-1:0]  even_imag_in,

    output reg  signed [OUT_WIDTH-1:0]   add_real_q,
    output reg  signed [OUT_WIDTH-1:0]   add_imag_q,
    output reg  signed [OUT_WIDTH-1:0]   sub_real_q,
    output reg  signed [OUT_WIDTH-1:0]   sub_imag_q,
    output reg                           out_valid
);

  localparam PROD_WIDTH = DATA_WIDTH + TW_WIDTH; // Q4.12 intermediate width
  localparam FRAC_OUT = 6;  // Q4.12 → Q4.5 shift amount
  localparam signed [PROD_WIDTH-1:0] ROUND_FACTOR = 1 <<< (FRAC_OUT - 1);

  localparam signed [OUT_WIDTH-1:0] MAX_Q45 =  (1 <<< (OUT_WIDTH - 1)) - 1;
  localparam signed [OUT_WIDTH-1:0] MIN_Q45 = -(1 <<< (OUT_WIDTH - 1));
  localparam signed [OUT_WIDTH + FRAC_OUT:0] MAX_FULL = MAX_Q45 <<< FRAC_OUT;
  localparam signed [OUT_WIDTH + FRAC_OUT:0] MIN_FULL = MIN_Q45 <<< FRAC_OUT;

  // Combinational intermediate signals
  wire signed [PROD_WIDTH-1:0] p0 = a_real * b_real;
  wire signed [PROD_WIDTH-1:0] p1 = a_imag * b_imag;
  wire signed [PROD_WIDTH-1:0] p2 = a_real * b_imag;
  wire signed [PROD_WIDTH-1:0] p3 = a_imag * b_real;

  wire signed [PROD_WIDTH-1:0] T_real_full = p0 - p1;
  wire signed [PROD_WIDTH-1:0] T_imag_full = p2 + p3;

  wire signed [PROD_WIDTH-1:0] er_ext = $signed(even_real_in) <<< FRAC_OUT;
  wire signed [PROD_WIDTH-1:0] ei_ext = $signed(even_imag_in) <<< FRAC_OUT;

  wire signed [PROD_WIDTH-1:0] sum_r  = er_ext + T_real_full;
  wire signed [PROD_WIDTH-1:0] sum_i  = ei_ext + T_imag_full;
  wire signed [PROD_WIDTH-1:0] diff_r = er_ext - T_real_full;
  wire signed [PROD_WIDTH-1:0] diff_i = ei_ext - T_imag_full;

  // Output stage: rounding, saturation, and register update
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      add_real_q <= 0;
      add_imag_q <= 0;
      sub_real_q <= 0;
      sub_imag_q <= 0;
      out_valid  <= 1'b0;
    end else begin
      if (in_valid) begin
        // Add real
        if      (sum_r > MAX_FULL)  add_real_q <= MAX_Q45;
        else if (sum_r < MIN_FULL)  add_real_q <= MIN_Q45;
        else                        add_real_q <= (sum_r + ROUND_FACTOR) >>> FRAC_OUT;

        // Add imag
        if      (sum_i > MAX_FULL)  add_imag_q <= MAX_Q45;
        else if (sum_i < MIN_FULL)  add_imag_q <= MIN_Q45;
        else                        add_imag_q <= (sum_i + ROUND_FACTOR) >>> FRAC_OUT;

        // Sub real
        if      (diff_r > MAX_FULL) sub_real_q <= MAX_Q45;
        else if (diff_r < MIN_FULL) sub_real_q <= MIN_Q45;
        else                        sub_real_q <= (diff_r + ROUND_FACTOR) >>> FRAC_OUT;

        // Sub imag
        if      (diff_i > MAX_FULL) sub_imag_q <= MAX_Q45;
        else if (diff_i < MIN_FULL) sub_imag_q <= MIN_Q45;
        else                        sub_imag_q <= (diff_i + ROUND_FACTOR) >>> FRAC_OUT;

        out_valid <= 1'b1;
      end else begin
        add_real_q <= add_real_q;
        add_imag_q <= add_imag_q;
        sub_real_q <= sub_real_q;
        sub_imag_q <= sub_imag_q;
        out_valid  <= out_valid;
      end
    end
  end

endmodule

