//-----------------------------------------------------------------------------
//  Top-Level FFT32 Module 
//-----------------------------------------------------------------------------
module fft32_top(
    input  wire           clk,        // 20 MHz pipeline clock
    input  wire           rst_n,
    input  wire           in_valid,
    input  wire signed [7:0] in_real_1, // Q1.7 input sample
    input  wire signed [7:0] in_real_2, // Q1.7 input sample
    input  wire signed [7:0] in_real_3, // Q1.7 input sample
    input  wire signed [7:0] in_real_4, // Q1.7 input sample
    input  wire signed [7:0] in_real_5, // Q1.7 input sample
    input  wire signed [7:0] in_real_6, // Q1.7 input sample
    input  wire signed [7:0] in_real_7, // Q1.7 input sample
    input  wire signed [7:0] in_real_8, // Q1.7 input sample
    input  wire signed [7:0] in_real_9, // Q1.7 input sample
    input  wire signed [7:0] in_real_10, // Q1.7 input sample
    input  wire signed [7:0] in_real_11, // Q1.7 input sample
    input  wire signed [7:0] in_real_12, // Q1.7 input sample
    input  wire signed [7:0] in_real_13, // Q1.7 input sample
    input  wire signed [7:0] in_real_14, // Q1.7 input sample
    input  wire signed [7:0] in_real_15, // Q1.7 input sample
    input  wire signed [7:0] in_real_16, // Q1.7 input sample
    input  wire signed [7:0] in_real_17, // Q1.7 input sample
    input  wire signed [7:0] in_real_18, // Q1.7 input sample
    input  wire signed [7:0] in_real_19, // Q1.7 input sample
    input  wire signed [7:0] in_real_20, // Q1.7 input sample
    input  wire signed [7:0] in_real_21, // Q1.7 input sample
    input  wire signed [7:0] in_real_22, // Q1.7 input sample
    input  wire signed [7:0] in_real_23, // Q1.7 input sample
    input  wire signed [7:0] in_real_24, // Q1.7 input sample
    input  wire signed [7:0] in_real_25, // Q1.7 input sample
    input  wire signed [7:0] in_real_26, // Q1.7 input sample
    input  wire signed [7:0] in_real_27, // Q1.7 input sample
    input  wire signed [7:0] in_real_28, // Q1.7 input sample
    input  wire signed [7:0] in_real_29, // Q1.7 input sample
    input  wire signed [7:0] in_real_30, // Q1.7 input sample
    input  wire signed [7:0] in_real_31, // Q1.7 input sample
    input  wire signed [7:0] in_real_32, // Q1.7 input sample
    output reg            out_valid,
    output reg signed [10:0] out_real_1,  // Q1.7
    output reg signed [10:0] out_imag_1,  // Q1.7
    output reg signed [10:0] out_real_2,  // Q1.7
    output reg signed [10:0] out_imag_2,  // Q1.7
    output reg signed [10:0] out_real_3,  // Q1.7
    output reg signed [10:0] out_imag_3,  // Q1.7
    output reg signed [10:0] out_real_4,  // Q1.7
    output reg signed [10:0] out_imag_4,  // Q1.7
    output reg signed [10:0] out_real_5,  // Q1.7
    output reg signed [10:0] out_imag_5,  // Q1.7
    output reg signed [10:0] out_real_6,  // Q1.7
    output reg signed [10:0] out_imag_6,  // Q1.7
    output reg signed [10:0] out_real_7,  // Q1.7
    output reg signed [10:0] out_imag_7,  // Q1.7
    output reg signed [10:0] out_real_8,  // Q1.7
    output reg signed [10:0] out_imag_8,  // Q1.7
    output reg signed [10:0] out_real_9,  // Q1.7
    output reg signed [10:0] out_imag_9,  // Q1.7
    output reg signed [10:0] out_real_10, // Q1.7
    output reg signed [10:0] out_imag_10, // Q1.7
    output reg signed [10:0] out_real_11, // Q1.7
    output reg signed [10:0] out_imag_11, // Q1.7
    output reg signed [10:0] out_real_12, // Q1.7
    output reg signed [10:0] out_imag_12, // Q1.7
    output reg signed [10:0] out_real_13, // Q1.7
    output reg signed [10:0] out_imag_13, // Q1.7
    output reg signed [10:0] out_real_14, // Q1.7
    output reg signed [10:0] out_imag_14, // Q1.7
    output reg signed [10:0] out_real_15, // Q1.7
    output reg signed [10:0] out_imag_15, // Q1.7
    output reg signed [10:0] out_real_16, // Q1.7
    output reg signed [10:0] out_imag_16, // Q1.7
    output reg signed [10:0] out_real_17, // Q1.7
    output reg signed [10:0] out_imag_17, // Q1.7
    output reg signed [10:0] out_real_18, // Q1.7
    output reg signed [10:0] out_imag_18, // Q1.7
    output reg signed [10:0] out_real_19, // Q1.7
    output reg signed [10:0] out_imag_19, // Q1.7
    output reg signed [10:0] out_real_20, // Q1.7
    output reg signed [10:0] out_imag_20, // Q1.7
    output reg signed [10:0] out_real_21, // Q1.7
    output reg signed [10:0] out_imag_21, // Q1.7
    output reg signed [10:0] out_real_22, // Q1.7
    output reg signed [10:0] out_imag_22, // Q1.7
    output reg signed [10:0] out_real_23, // Q1.7
    output reg signed [10:0] out_imag_23, // Q1.7
    output reg signed [10:0] out_real_24, // Q1.7
    output reg signed [10:0] out_imag_24, // Q1.7
    output reg signed [10:0] out_real_25, // Q1.7
    output reg signed [10:0] out_imag_25, // Q1.7
    output reg signed [10:0] out_real_26, // Q1.7
    output reg signed [10:0] out_imag_26, // Q1.7
    output reg signed [10:0] out_real_27, // Q1.7
    output reg signed [10:0] out_imag_27, // Q1.7
    output reg signed [10:0] out_real_28, // Q1.7
    output reg signed [10:0] out_imag_28, // Q1.7
    output reg signed [10:0] out_real_29, // Q1.7
    output reg signed [10:0] out_imag_29, // Q1.7
    output reg signed [10:0] out_real_30, // Q1.7
    output reg signed [10:0] out_imag_30, // Q1.7
    output reg signed [10:0] out_real_31, // Q1.7
    output reg signed [10:0] out_imag_31, // Q1.7
    output reg signed [10:0] out_real_32, // Q1.7
    output reg signed [10:0] out_imag_32  // Q1.7
);
integer k;
  // Input Buffer (32 samples)
  reg [4:0] write_addr;
  reg       buf_full;
  reg signed [7:0] buff[0:31];

  always @(posedge clk) begin
    if (!rst_n) begin
      buf_full <= 0;
      for (k = 0; k < 32; k = k + 1) begin
        buff[k] <= 0;
      end
    end else if (in_valid) begin  
      buf_full <= 1;
      buff[0] <= in_real_1;
      buff[1] <= in_real_2;
      buff[2] <= in_real_3;
      buff[3] <= in_real_4;
      buff[4] <= in_real_5;
      buff[5] <= in_real_6;
      buff[6] <= in_real_7;
      buff[7] <= in_real_8;
      buff[8] <= in_real_9;
      buff[9] <= in_real_10;
      buff[10] <= in_real_11;
      buff[11] <= in_real_12;
      buff[12] <= in_real_13;
      buff[13] <= in_real_14;
      buff[14] <= in_real_15;
      buff[15] <= in_real_16;
      buff[16] <= in_real_17;
      buff[17] <= in_real_18;
      buff[18] <= in_real_19;
      buff[19] <= in_real_20;
      buff[20] <= in_real_21;
      buff[21] <= in_real_22;
      buff[22] <= in_real_23;
      buff[23] <= in_real_24;
      buff[24] <= in_real_25;
      buff[25] <= in_real_26;
      buff[26] <= in_real_27;
      buff[27] <= in_real_28;
      buff[28] <= in_real_29;
      buff[29] <= in_real_30;
      buff[30] <= in_real_31;
      buff[31] <= in_real_32;
    end
  end

  //-----------------------------------------------------------------------------
  // Stage 1: complex_mac (butterfly)
  //-----------------------------------------------------------------------------
  wire signed [10:0]    mac1_r[0:31], mac1_i[0:31];
  wire signed [10:0]    mac2_r[0:31], mac2_i[0:31];
  wire signed [10:0]    mac3_r[0:31], mac3_i[0:31];
  wire signed [10:0]    mac4_r[0:31], mac4_i[0:31];
  wire signed [10:0]    mac5_r[0:31], mac5_i[0:31];
  wire signed [7:0]    tw2_r[0:31], tw2_i[0:31];

// Declare individual out_valid signals for each complex_mac instance
wire mac1_valid_0, mac1_valid_1, mac1_valid_2, mac1_valid_3;
wire mac1_valid_4, mac1_valid_5, mac1_valid_6, mac1_valid_7;
wire mac1_valid_8, mac1_valid_9, mac1_valid_10, mac1_valid_11;
wire mac1_valid_12, mac1_valid_13, mac1_valid_14, mac1_valid_15;

wire mac2_valid_0, mac2_valid_1, mac2_valid_2, mac2_valid_3;
wire mac2_valid_4, mac2_valid_5, mac2_valid_6, mac2_valid_7;
wire mac2_valid_8, mac2_valid_9, mac2_valid_10, mac2_valid_11;
wire mac2_valid_12, mac2_valid_13, mac2_valid_14, mac2_valid_15;

wire mac3_valid_0, mac3_valid_1, mac3_valid_2, mac3_valid_3;
wire mac3_valid_4, mac3_valid_5, mac3_valid_6, mac3_valid_7;
wire mac3_valid_8, mac3_valid_9, mac3_valid_10, mac3_valid_11;
wire mac3_valid_12, mac3_valid_13, mac3_valid_14, mac3_valid_15;

wire mac4_valid_0, mac4_valid_1, mac4_valid_2, mac4_valid_3;
wire mac4_valid_4, mac4_valid_5, mac4_valid_6, mac4_valid_7;
wire mac4_valid_8, mac4_valid_9, mac4_valid_10, mac4_valid_11;
wire mac4_valid_12, mac4_valid_13, mac4_valid_14, mac4_valid_15;

wire mac5_valid_0, mac5_valid_1, mac5_valid_2, mac5_valid_3;
wire mac5_valid_4, mac5_valid_5, mac5_valid_6, mac5_valid_7;
wire mac5_valid_8, mac5_valid_9, mac5_valid_10, mac5_valid_11;
wire mac5_valid_12, mac5_valid_13, mac5_valid_14, mac5_valid_15;

genvar i;

// twiddle ROM for Stage 2
  generate
    for (i = 0; i < 32; i = i + 1) begin: TW2
      twiddle_rom tw2(.clk(clk), .addr(i[5:0]), .tw_real(tw2_r[i]), .tw_imag(tw2_i[i]));
    end
  endgenerate

  // Complex MAC with twiddle index 0 => real=127 (1.0), imag=0
      complex_mac #(.DATA_WIDTH(8), .OUT_WIDTH(11), .TW_WIDTH(8)) CM1_0 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[16]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[0]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[0]), .add_imag_q(mac1_i[0]),
        .sub_real_q(mac1_r[1]), .sub_imag_q(mac1_i[1]),
        .out_valid(mac1_valid_0) // Use unique out_valid signal
      );
      complex_mac #(.DATA_WIDTH(8), .OUT_WIDTH(11), .TW_WIDTH(8)) CM1_1 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[24]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[8]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[2]), .add_imag_q(mac1_i[2]),
        .sub_real_q(mac1_r[3]), .sub_imag_q(mac1_i[3]),
        .out_valid(mac1_valid_1) // Use unique out_valid signal
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_2 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[20]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[4]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[4]), .add_imag_q(mac1_i[4]),
        .sub_real_q(mac1_r[5]), .sub_imag_q(mac1_i[5]),
        .out_valid(mac1_valid_2)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_3 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[28]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[12]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[6]), .add_imag_q(mac1_i[6]),
        .sub_real_q(mac1_r[7]), .sub_imag_q(mac1_i[7]),
        .out_valid(mac1_valid_3)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_4 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[18]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[2]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[8]), .add_imag_q(mac1_i[8]),
        .sub_real_q(mac1_r[9]), .sub_imag_q(mac1_i[9]),
        .out_valid(mac1_valid_4)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_5 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[26]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[10]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[10]), .add_imag_q(mac1_i[10]),
        .sub_real_q(mac1_r[11]), .sub_imag_q(mac1_i[11]),
        .out_valid(mac1_valid_5)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_6 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[22]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[6]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[12]), .add_imag_q(mac1_i[12]),
        .sub_real_q(mac1_r[13]), .sub_imag_q(mac1_i[13]),
        .out_valid(mac1_valid_6)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_7 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[30]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[14]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[14]), .add_imag_q(mac1_i[14]),
        .sub_real_q(mac1_r[15]), .sub_imag_q(mac1_i[15]),
        .out_valid(mac1_valid_7)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_8 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[17]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[1]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[16]), .add_imag_q(mac1_i[16]),
        .sub_real_q(mac1_r[17]), .sub_imag_q(mac1_i[17]),
        .out_valid(mac1_valid_8)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_9 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[25]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[9]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[18]), .add_imag_q(mac1_i[18]),
        .sub_real_q(mac1_r[19]), .sub_imag_q(mac1_i[19]),
        .out_valid(mac1_valid_9)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_10 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[21]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[5]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[20]), .add_imag_q(mac1_i[20]),
        .sub_real_q(mac1_r[21]), .sub_imag_q(mac1_i[21]),
        .out_valid(mac1_valid_10)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_11 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[29]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[13]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[22]), .add_imag_q(mac1_i[22]),
        .sub_real_q(mac1_r[23]), .sub_imag_q(mac1_i[23]),
        .out_valid(mac1_valid_11)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_12 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[19]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[3]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[24]), .add_imag_q(mac1_i[24]),
        .sub_real_q(mac1_r[25]), .sub_imag_q(mac1_i[25]),
        .out_valid(mac1_valid_12)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_13 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[27]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[11]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[26]), .add_imag_q(mac1_i[26]),
        .sub_real_q(mac1_r[27]), .sub_imag_q(mac1_i[27]),
        .out_valid(mac1_valid_13)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_14 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[23]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[7]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[28]), .add_imag_q(mac1_i[28]),
        .sub_real_q(mac1_r[29]), .sub_imag_q(mac1_i[29]),
        .out_valid(mac1_valid_14)
      );
      complex_mac #(.DATA_WIDTH(8),.OUT_WIDTH(11),.TW_WIDTH(8)) CM1_15 (
        .clk(clk), .rst_n(rst_n), .in_valid(buf_full),
        .a_real(buff[31]), .a_imag(8'b0),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(buff[15]), .even_imag_in(8'b0),
        .add_real_q(mac1_r[30]), .add_imag_q(mac1_i[30]),
        .sub_real_q(mac1_r[31]), .sub_imag_q(mac1_i[31]),
        .out_valid(mac1_valid_15)
      );
  //-----------------------------------------------------------------------------
  // Stages 2: (stride=2)
  //-----------------------------------------------------------------------------
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_0 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[2]), .a_imag(mac1_i[2]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[0]), .even_imag_in(mac1_i[0]),
        .add_real_q(mac2_r[0]), .add_imag_q(mac2_i[0]),
        .sub_real_q(mac2_r[2]), .sub_imag_q(mac2_i[2]),
        .out_valid(mac2_valid_0)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_1 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[3]), .a_imag(mac1_i[3]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[1]), .even_imag_in(mac1_i[1]),
        .add_real_q(mac2_r[1]), .add_imag_q(mac2_i[1]),
        .sub_real_q(mac2_r[3]), .sub_imag_q(mac2_i[3]),
        .out_valid(mac2_valid_1)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_2 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[6]), .a_imag(mac1_i[6]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[4]), .even_imag_in(mac1_i[4]),
        .add_real_q(mac2_r[4]), .add_imag_q(mac2_i[4]),
        .sub_real_q(mac2_r[6]), .sub_imag_q(mac2_i[6]),
        .out_valid(mac2_valid_2)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_3 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[7]), .a_imag(mac1_i[7]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[5]), .even_imag_in(mac1_i[5]),
        .add_real_q(mac2_r[5]), .add_imag_q(mac2_i[5]),
        .sub_real_q(mac2_r[7]), .sub_imag_q(mac2_i[7]),
        .out_valid(mac2_valid_3)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_4 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[10]), .a_imag(mac1_i[10]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[8]), .even_imag_in(mac1_i[8]),
        .add_real_q(mac2_r[8]), .add_imag_q(mac2_i[8]),
        .sub_real_q(mac2_r[10]), .sub_imag_q(mac2_i[10]),
        .out_valid(mac2_valid_4)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_5 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[11]), .a_imag(mac1_i[11]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[9]), .even_imag_in(mac1_i[9]),
        .add_real_q(mac2_r[9]), .add_imag_q(mac2_i[9]),
        .sub_real_q(mac2_r[11]), .sub_imag_q(mac2_i[11]),
        .out_valid(mac2_valid_5)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_6 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[14]), .a_imag(mac1_i[14]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[12]), .even_imag_in(mac1_i[12]),
        .add_real_q(mac2_r[12]), .add_imag_q(mac2_i[12]),
        .sub_real_q(mac2_r[14]), .sub_imag_q(mac2_i[14]),
        .out_valid(mac2_valid_6)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_7 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[15]), .a_imag(mac1_i[15]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[13]), .even_imag_in(mac1_i[13]),
        .add_real_q(mac2_r[13]), .add_imag_q(mac2_i[13]),
        .sub_real_q(mac2_r[15]), .sub_imag_q(mac2_i[15]),
        .out_valid(mac2_valid_7)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_8 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[18]), .a_imag(mac1_i[18]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[16]), .even_imag_in(mac1_i[16]),
        .add_real_q(mac2_r[16]), .add_imag_q(mac2_i[16]),
        .sub_real_q(mac2_r[18]), .sub_imag_q(mac2_i[18]),
        .out_valid(mac2_valid_8)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_9 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[19]), .a_imag(mac1_i[19]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[17]), .even_imag_in(mac1_i[17]),
        .add_real_q(mac2_r[17]), .add_imag_q(mac2_i[17]),
        .sub_real_q(mac2_r[19]), .sub_imag_q(mac2_i[19]),
        .out_valid(mac2_valid_9)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_10 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[22]), .a_imag(mac1_i[22]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[20]), .even_imag_in(mac1_i[20]),
        .add_real_q(mac2_r[20]), .add_imag_q(mac2_i[20]),
        .sub_real_q(mac2_r[22]), .sub_imag_q(mac2_i[22]),
        .out_valid(mac2_valid_10)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_11 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[23]), .a_imag(mac1_i[23]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[21]), .even_imag_in(mac1_i[21]),
        .add_real_q(mac2_r[21]), .add_imag_q(mac2_i[21]),
        .sub_real_q(mac2_r[23]), .sub_imag_q(mac2_i[23]),
        .out_valid(mac2_valid_11)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_12 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[26]), .a_imag(mac1_i[26]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[24]), .even_imag_in(mac1_i[24]),
        .add_real_q(mac2_r[24]), .add_imag_q(mac2_i[24]),
        .sub_real_q(mac2_r[26]), .sub_imag_q(mac2_i[26]),
        .out_valid(mac2_valid_12)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_13 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[27]), .a_imag(mac1_i[27]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[25]), .even_imag_in(mac1_i[25]),
        .add_real_q(mac2_r[25]), .add_imag_q(mac2_i[25]),
        .sub_real_q(mac2_r[27]), .sub_imag_q(mac2_i[27]),
        .out_valid(mac2_valid_13)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_14 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[30]), .a_imag(mac1_i[30]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac1_r[28]), .even_imag_in(mac1_i[28]),
        .add_real_q(mac2_r[28]), .add_imag_q(mac2_i[28]),
        .sub_real_q(mac2_r[30]), .sub_imag_q(mac2_i[30]),
        .out_valid(mac2_valid_14)
      );
      complex_mac #(.DATA_WIDTH(11),.OUT_WIDTH(11),.TW_WIDTH(8)) CM2_15 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac1_valid_15),
        .a_real(mac1_r[31]), .a_imag(mac1_i[31]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac1_r[29]), .even_imag_in(mac1_i[29]),
        .add_real_q(mac2_r[29]), .add_imag_q(mac2_i[29]),
        .sub_real_q(mac2_r[31]), .sub_imag_q(mac2_i[31]),
        .out_valid(mac2_valid_15)
      );
  //-----------------------------------------------------------------------------
  // Stages 3: (stride=4)
  //-----------------------------------------------------------------------------

      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_0 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[4]), .a_imag(mac2_i[4]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac2_r[0]), .even_imag_in(mac2_i[0]),
        .add_real_q(mac3_r[0]), .add_imag_q(mac3_i[0]),
        .sub_real_q(mac3_r[4]), .sub_imag_q(mac3_i[4]),
        .out_valid(mac3_valid_0)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_1 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[5]), .a_imag(mac2_i[5]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac2_r[1]), .even_imag_in(mac2_i[1]),
        .add_real_q(mac3_r[1]), .add_imag_q(mac3_i[1]),
        .sub_real_q(mac3_r[5]), .sub_imag_q(mac3_i[5]),
        .out_valid(mac3_valid_1)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_2 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[6]), .a_imag(mac2_i[6]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac2_r[2]), .even_imag_in(mac2_i[2]),
        .add_real_q(mac3_r[2]), .add_imag_q(mac3_i[2]),
        .sub_real_q(mac3_r[6]), .sub_imag_q(mac3_i[6]),
        .out_valid(mac3_valid_2)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_3 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[7]), .a_imag(mac2_i[7]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac2_r[3]), .even_imag_in(mac2_i[3]),
        .add_real_q(mac3_r[3]), .add_imag_q(mac3_i[3]),
        .sub_real_q(mac3_r[7]), .sub_imag_q(mac3_i[7]),
        .out_valid(mac3_valid_3)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_4 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[12]), .a_imag(mac2_i[12]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac2_r[8]), .even_imag_in(mac2_i[8]),
        .add_real_q(mac3_r[8]), .add_imag_q(mac3_i[8]),
        .sub_real_q(mac3_r[12]), .sub_imag_q(mac3_i[12]),
        .out_valid(mac3_valid_4)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_5 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[13]), .a_imag(mac2_i[13]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac2_r[9]), .even_imag_in(mac2_i[9]),
        .add_real_q(mac3_r[9]), .add_imag_q(mac3_i[9]),
        .sub_real_q(mac3_r[13]), .sub_imag_q(mac3_i[13]),
        .out_valid(mac3_valid_5)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_6 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[14]), .a_imag(mac2_i[14]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac2_r[10]), .even_imag_in(mac2_i[10]),
        .add_real_q(mac3_r[10]), .add_imag_q(mac3_i[10]),
        .sub_real_q(mac3_r[14]), .sub_imag_q(mac3_i[14]),
        .out_valid(mac3_valid_6)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_7 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[15]), .a_imag(mac2_i[15]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac2_r[11]), .even_imag_in(mac2_i[11]),
        .add_real_q(mac3_r[11]), .add_imag_q(mac3_i[11]),
        .sub_real_q(mac3_r[15]), .sub_imag_q(mac3_i[15]),
        .out_valid(mac3_valid_7)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_8 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[20]), .a_imag(mac2_i[20]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac2_r[16]), .even_imag_in(mac2_i[16]),
        .add_real_q(mac3_r[16]), .add_imag_q(mac3_i[16]),
        .sub_real_q(mac3_r[20]), .sub_imag_q(mac3_i[20]),
        .out_valid(mac3_valid_8)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_9 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[21]), .a_imag(mac2_i[21]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac2_r[17]), .even_imag_in(mac2_i[17]),
        .add_real_q(mac3_r[17]), .add_imag_q(mac3_i[17]),
        .sub_real_q(mac3_r[21]), .sub_imag_q(mac3_i[21]),
        .out_valid(mac3_valid_9)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_10 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[22]), .a_imag(mac2_i[22]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac2_r[18]), .even_imag_in(mac2_i[18]),
        .add_real_q(mac3_r[18]), .add_imag_q(mac3_i[18]),
        .sub_real_q(mac3_r[22]), .sub_imag_q(mac3_i[22]),
        .out_valid(mac3_valid_10)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_11 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[23]), .a_imag(mac2_i[23]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac2_r[19]), .even_imag_in(mac2_i[19]),
        .add_real_q(mac3_r[19]), .add_imag_q(mac3_i[19]),
        .sub_real_q(mac3_r[23]), .sub_imag_q(mac3_i[23]),
        .out_valid(mac3_valid_11)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_12 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[28]), .a_imag(mac2_i[28]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac2_r[24]), .even_imag_in(mac2_i[24]),
        .add_real_q(mac3_r[24]), .add_imag_q(mac3_i[24]),
        .sub_real_q(mac3_r[28]), .sub_imag_q(mac3_i[28]),
        .out_valid(mac3_valid_12)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_13 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[29]), .a_imag(mac2_i[29]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac2_r[25]), .even_imag_in(mac2_i[25]),
        .add_real_q(mac3_r[25]), .add_imag_q(mac3_i[25]),
        .sub_real_q(mac3_r[29]), .sub_imag_q(mac3_i[29]),
        .out_valid(mac3_valid_13)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_14 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[30]), .a_imag(mac2_i[30]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac2_r[26]), .even_imag_in(mac2_i[26]),
        .add_real_q(mac3_r[26]), .add_imag_q(mac3_i[26]),
        .sub_real_q(mac3_r[30]), .sub_imag_q(mac3_i[30]),
        .out_valid(mac3_valid_14)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM3_15 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac2_valid_15),
        .a_real(mac2_r[31]), .a_imag(mac2_i[31]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac2_r[27]), .even_imag_in(mac2_i[27]),
        .add_real_q(mac3_r[27]), .add_imag_q(mac3_i[27]),
        .sub_real_q(mac3_r[31]), .sub_imag_q(mac3_i[31]),
        .out_valid(mac3_valid_15)
      );
  //-----------------------------------------------------------------------------
  // Stages 4: (stride=8)
  //-----------------------------------------------------------------------------
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_0 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[8]), .a_imag(mac3_i[8]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac3_r[0]), .even_imag_in(mac3_i[0]),
        .add_real_q(mac4_r[0]), .add_imag_q(mac4_i[0]),
        .sub_real_q(mac4_r[8]), .sub_imag_q(mac4_i[8]),
        .out_valid(mac4_valid_0)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_1 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[9]), .a_imag(mac3_i[9]),
        .b_real(tw2_r[2]), .b_imag(tw2_i[2]),
        .even_real_in(mac3_r[1]), .even_imag_in(mac3_i[1]),
        .add_real_q(mac4_r[1]), .add_imag_q(mac4_i[1]),
        .sub_real_q(mac4_r[9]), .sub_imag_q(mac4_i[9]),
        .out_valid(mac4_valid_1)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_2 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[10]), .a_imag(mac3_i[10]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac3_r[2]), .even_imag_in(mac3_i[2]),
        .add_real_q(mac4_r[2]), .add_imag_q(mac4_i[2]),
        .sub_real_q(mac4_r[10]), .sub_imag_q(mac4_i[10]),
        .out_valid(mac4_valid_2)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_3 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[11]), .a_imag(mac3_i[11]),
        .b_real(tw2_r[6]), .b_imag(tw2_i[6]),
        .even_real_in(mac3_r[3]), .even_imag_in(mac3_i[3]),
        .add_real_q(mac4_r[3]), .add_imag_q(mac4_i[3]),
        .sub_real_q(mac4_r[11]), .sub_imag_q(mac4_i[11]),
        .out_valid(mac4_valid_3)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_4 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[12]), .a_imag(mac3_i[12]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac3_r[4]), .even_imag_in(mac3_i[4]),
        .add_real_q(mac4_r[4]), .add_imag_q(mac4_i[4]),
        .sub_real_q(mac4_r[12]), .sub_imag_q(mac4_i[12]),
        .out_valid(mac4_valid_4)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_5 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[13]), .a_imag(mac3_i[13]),
        .b_real(tw2_r[10]), .b_imag(tw2_i[10]),
        .even_real_in(mac3_r[5]), .even_imag_in(mac3_i[5]),
        .add_real_q(mac4_r[5]), .add_imag_q(mac4_i[5]),
        .sub_real_q(mac4_r[13]), .sub_imag_q(mac4_i[13]),
        .out_valid(mac4_valid_5)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_6 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[14]), .a_imag(mac3_i[14]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac3_r[6]), .even_imag_in(mac3_i[6]),
        .add_real_q(mac4_r[6]), .add_imag_q(mac4_i[6]),
        .sub_real_q(mac4_r[14]), .sub_imag_q(mac4_i[14]),
        .out_valid(mac4_valid_6)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_7 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[15]), .a_imag(mac3_i[15]),
        .b_real(tw2_r[14]), .b_imag(tw2_i[14]),
        .even_real_in(mac3_r[7]), .even_imag_in(mac3_i[7]),
        .add_real_q(mac4_r[7]), .add_imag_q(mac4_i[7]),
        .sub_real_q(mac4_r[15]), .sub_imag_q(mac4_i[15]),
        .out_valid(mac4_valid_7)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_8 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[24]), .a_imag(mac3_i[24]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac3_r[16]), .even_imag_in(mac3_i[16]),
        .add_real_q(mac4_r[16]), .add_imag_q(mac4_i[16]),
        .sub_real_q(mac4_r[24]), .sub_imag_q(mac4_i[24]),
        .out_valid(mac4_valid_8)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_9 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[25]), .a_imag(mac3_i[25]),
        .b_real(tw2_r[2]), .b_imag(tw2_i[2]),
        .even_real_in(mac3_r[17]), .even_imag_in(mac3_i[17]),
        .add_real_q(mac4_r[17]), .add_imag_q(mac4_i[17]),
        .sub_real_q(mac4_r[25]), .sub_imag_q(mac4_i[25]),
        .out_valid(mac4_valid_9)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_10 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[26]), .a_imag(mac3_i[26]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac3_r[18]), .even_imag_in(mac3_i[18]),
        .add_real_q(mac4_r[18]), .add_imag_q(mac4_i[18]),
        .sub_real_q(mac4_r[26]), .sub_imag_q(mac4_i[26]),
        .out_valid(mac4_valid_10)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_11 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[27]), .a_imag(mac3_i[27]),
        .b_real(tw2_r[6]), .b_imag(tw2_i[6]),
        .even_real_in(mac3_r[19]), .even_imag_in(mac3_i[19]),
        .add_real_q(mac4_r[19]), .add_imag_q(mac4_i[19]),
        .sub_real_q(mac4_r[27]), .sub_imag_q(mac4_i[27]),
        .out_valid(mac4_valid_11)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_12 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[28]), .a_imag(mac3_i[28]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac3_r[20]), .even_imag_in(mac3_i[20]),
        .add_real_q(mac4_r[20]), .add_imag_q(mac4_i[20]),
        .sub_real_q(mac4_r[28]), .sub_imag_q(mac4_i[28]),
        .out_valid(mac4_valid_12)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_13 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[29]), .a_imag(mac3_i[29]),
        .b_real(tw2_r[10]), .b_imag(tw2_i[10]),
        .even_real_in(mac3_r[21]), .even_imag_in(mac3_i[21]),
        .add_real_q(mac4_r[21]), .add_imag_q(mac4_i[21]),
        .sub_real_q(mac4_r[29]), .sub_imag_q(mac4_i[29]),
        .out_valid(mac4_valid_13)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_14 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[30]), .a_imag(mac3_i[30]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac3_r[22]), .even_imag_in(mac3_i[22]),
        .add_real_q(mac4_r[22]), .add_imag_q(mac4_i[22]),
        .sub_real_q(mac4_r[30]), .sub_imag_q(mac4_i[30]),
        .out_valid(mac4_valid_14)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM4_15 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac3_valid_15),
        .a_real(mac3_r[31]), .a_imag(mac3_i[31]),
        .b_real(tw2_r[14]), .b_imag(tw2_i[14]),
        .even_real_in(mac3_r[23]), .even_imag_in(mac3_i[23]),
        .add_real_q(mac4_r[23]), .add_imag_q(mac4_i[23]),
        .sub_real_q(mac4_r[31]), .sub_imag_q(mac4_i[31]),
        .out_valid(mac4_valid_15)
      );
  //-----------------------------------------------------------------------------
  // Stages 5: (stride=16)
  //-----------------------------------------------------------------------------
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_0 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[16]), .a_imag(mac4_i[16]),
        .b_real(tw2_r[0]), .b_imag(tw2_i[0]),
        .even_real_in(mac4_r[0]), .even_imag_in(mac4_i[0]),
        .add_real_q(mac5_r[0]), .add_imag_q(mac5_i[0]),
        .sub_real_q(mac5_r[16]), .sub_imag_q(mac5_i[16]),
        .out_valid(mac5_valid_0)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_1 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[17]), .a_imag(mac4_i[17]),
        .b_real(tw2_r[1]), .b_imag(tw2_i[1]),
        .even_real_in(mac4_r[1]), .even_imag_in(mac4_i[1]),
        .add_real_q(mac5_r[1]), .add_imag_q(mac5_i[1]),
        .sub_real_q(mac5_r[17]), .sub_imag_q(mac5_i[17]),
        .out_valid(mac5_valid_1)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_2 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[18]), .a_imag(mac4_i[18]),
        .b_real(tw2_r[2]), .b_imag(tw2_i[2]),
        .even_real_in(mac4_r[2]), .even_imag_in(mac4_i[2]),
        .add_real_q(mac5_r[2]), .add_imag_q(mac5_i[2]),
        .sub_real_q(mac5_r[18]), .sub_imag_q(mac5_i[18]),
        .out_valid(mac5_valid_2)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_3 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[19]), .a_imag(mac4_i[19]),
        .b_real(tw2_r[3]), .b_imag(tw2_i[3]),
        .even_real_in(mac4_r[3]), .even_imag_in(mac4_i[3]),
        .add_real_q(mac5_r[3]), .add_imag_q(mac5_i[3]),
        .sub_real_q(mac5_r[19]), .sub_imag_q(mac5_i[19]),
        .out_valid(mac5_valid_3)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_4 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[20]), .a_imag(mac4_i[20]),
        .b_real(tw2_r[4]), .b_imag(tw2_i[4]),
        .even_real_in(mac4_r[4]), .even_imag_in(mac4_i[4]),
        .add_real_q(mac5_r[4]), .add_imag_q(mac5_i[4]),
        .sub_real_q(mac5_r[20]), .sub_imag_q(mac5_i[20]),
        .out_valid(mac5_valid_4)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_5 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[21]), .a_imag(mac4_i[21]),
        .b_real(tw2_r[5]), .b_imag(tw2_i[5]),
        .even_real_in(mac4_r[5]), .even_imag_in(mac4_i[5]),
        .add_real_q(mac5_r[5]), .add_imag_q(mac5_i[5]),
        .sub_real_q(mac5_r[21]), .sub_imag_q(mac5_i[21]),
        .out_valid(mac5_valid_5)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_6 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[22]), .a_imag(mac4_i[22]),
        .b_real(tw2_r[6]), .b_imag(tw2_i[6]),
        .even_real_in(mac4_r[6]), .even_imag_in(mac4_i[6]),
        .add_real_q(mac5_r[6]), .add_imag_q(mac5_i[6]),
        .sub_real_q(mac5_r[22]), .sub_imag_q(mac5_i[22]),
        .out_valid(mac5_valid_6)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_7 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[23]), .a_imag(mac4_i[23]),
        .b_real(tw2_r[7]), .b_imag(tw2_i[7]),
        .even_real_in(mac4_r[7]), .even_imag_in(mac4_i[7]),
        .add_real_q(mac5_r[7]), .add_imag_q(mac5_i[7]),
        .sub_real_q(mac5_r[23]), .sub_imag_q(mac5_i[23]),
        .out_valid(mac5_valid_7)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_8 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[24]), .a_imag(mac4_i[24]),
        .b_real(tw2_r[8]), .b_imag(tw2_i[8]),
        .even_real_in(mac4_r[8]), .even_imag_in(mac4_i[8]),
        .add_real_q(mac5_r[8]), .add_imag_q(mac5_i[8]),
        .sub_real_q(mac5_r[24]), .sub_imag_q(mac5_i[24]),
        .out_valid(mac5_valid_8)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_9 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[25]), .a_imag(mac4_i[25]),
        .b_real(tw2_r[9]), .b_imag(tw2_i[9]),
        .even_real_in(mac4_r[9]), .even_imag_in(mac4_i[9]),
        .add_real_q(mac5_r[9]), .add_imag_q(mac5_i[9]),
        .sub_real_q(mac5_r[25]), .sub_imag_q(mac5_i[25]),
        .out_valid(mac5_valid_9)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_10 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[26]), .a_imag(mac4_i[26]),
        .b_real(tw2_r[10]), .b_imag(tw2_i[10]),
        .even_real_in(mac4_r[10]), .even_imag_in(mac4_i[10]),
        .add_real_q(mac5_r[10]), .add_imag_q(mac5_i[10]),
        .sub_real_q(mac5_r[26]), .sub_imag_q(mac5_i[26]),
        .out_valid(mac5_valid_10)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_11 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[27]), .a_imag(mac4_i[27]),
        .b_real(tw2_r[11]), .b_imag(tw2_i[11]),
        .even_real_in(mac4_r[11]), .even_imag_in(mac4_i[11]),
        .add_real_q(mac5_r[11]), .add_imag_q(mac5_i[11]),
        .sub_real_q(mac5_r[27]), .sub_imag_q(mac5_i[27]),
        .out_valid(mac5_valid_11)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_12 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[28]), .a_imag(mac4_i[28]),
        .b_real(tw2_r[12]), .b_imag(tw2_i[12]),
        .even_real_in(mac4_r[12]), .even_imag_in(mac4_i[12]),
        .add_real_q(mac5_r[12]), .add_imag_q(mac5_i[12]),
        .sub_real_q(mac5_r[28]), .sub_imag_q(mac5_i[28]),
        .out_valid(mac5_valid_12)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_13 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[29]), .a_imag(mac4_i[29]),
        .b_real(tw2_r[13]), .b_imag(tw2_i[13]),
        .even_real_in(mac4_r[13]), .even_imag_in(mac4_i[13]),
        .add_real_q(mac5_r[13]), .add_imag_q(mac5_i[13]),
        .sub_real_q(mac5_r[29]), .sub_imag_q(mac5_i[29]),
        .out_valid(mac5_valid_13)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_14 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[30]), .a_imag(mac4_i[30]),
        .b_real(tw2_r[14]), .b_imag(tw2_i[14]),
        .even_real_in(mac4_r[14]), .even_imag_in(mac4_i[14]),
        .add_real_q(mac5_r[14]), .add_imag_q(mac5_i[14]),
        .sub_real_q(mac5_r[30]), .sub_imag_q(mac5_i[30]),
        .out_valid(mac5_valid_14)
      );
      complex_mac #(.DATA_WIDTH(11), .OUT_WIDTH(11), .TW_WIDTH(8)) CM5_15 (
        .clk(clk), .rst_n(rst_n), .in_valid(mac4_valid_15),
        .a_real(mac4_r[31]), .a_imag(mac4_i[31]),
        .b_real(tw2_r[15]), .b_imag(tw2_i[15]),
        .even_real_in(mac4_r[15]), .even_imag_in(mac4_i[15]),
        .add_real_q(mac5_r[15]), .add_imag_q(mac5_i[15]),
        .sub_real_q(mac5_r[31]), .sub_imag_q(mac5_i[31]),
        .out_valid(mac5_valid_15)
      );
  //----------------------------------------------------------------------------- 
  // Output Logic
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      out_valid <= 0;
      out_real_1 <= 0;  out_imag_1 <= 0;
      out_real_2 <= 0;  out_imag_2 <= 0;
      out_real_3 <= 0;  out_imag_3 <= 0;
      out_real_4 <= 0;  out_imag_4 <= 0;
      out_real_5 <= 0;  out_imag_5 <= 0;
      out_real_6 <= 0;  out_imag_6 <= 0;
      out_real_7 <= 0;  out_imag_7 <= 0;
      out_real_8 <= 0;  out_imag_8 <= 0;
      out_real_9 <= 0;  out_imag_9 <= 0;
      out_real_10 <= 0; out_imag_10 <= 0;
      out_real_11 <= 0; out_imag_11 <= 0;
      out_real_12 <= 0; out_imag_12 <= 0;
      out_real_13 <= 0; out_imag_13 <= 0;
      out_real_14 <= 0; out_imag_14 <= 0;
      out_real_15 <= 0; out_imag_15 <= 0;
      out_real_16 <= 0; out_imag_16 <= 0;
      out_real_17 <= 0; out_imag_17 <= 0;
      out_real_18 <= 0; out_imag_18 <= 0;
      out_real_19 <= 0; out_imag_19 <= 0;
      out_real_20 <= 0; out_imag_20 <= 0;
      out_real_21 <= 0; out_imag_21 <= 0;
      out_real_22 <= 0; out_imag_22 <= 0;
      out_real_23 <= 0; out_imag_23 <= 0;
      out_real_24 <= 0; out_imag_24 <= 0;
      out_real_25 <= 0; out_imag_25 <= 0;
      out_real_26 <= 0; out_imag_26 <= 0;
      out_real_27 <= 0; out_imag_27 <= 0;
      out_real_28 <= 0; out_imag_28 <= 0;
      out_real_29 <= 0; out_imag_29 <= 0;
      out_real_30 <= 0; out_imag_30 <= 0;
      out_real_31 <= 0; out_imag_31 <= 0;
      out_real_32 <= 0; out_imag_32 <= 0;
    end else if (mac5_valid_15) begin
      out_valid <= 1;
      out_real_1 <= mac5_r[0];  out_imag_1 <= mac5_i[0];
      out_real_2 <= mac5_r[1];  out_imag_2 <= mac5_i[1];
      out_real_3 <= mac5_r[2];  out_imag_3 <= mac5_i[2];
      out_real_4 <= mac5_r[3];  out_imag_4 <= mac5_i[3];
      out_real_5 <= mac5_r[4];  out_imag_5 <= mac5_i[4];
      out_real_6 <= mac5_r[5];  out_imag_6 <= mac5_i[5];
      out_real_7 <= mac5_r[6];  out_imag_7 <= mac5_i[6];
      out_real_8 <= mac5_r[7];  out_imag_8 <= mac5_i[7];
      out_real_9 <= mac5_r[8];  out_imag_9 <= mac5_i[8];
      out_real_10 <= mac5_r[9]; out_imag_10 <= mac5_i[9];
      out_real_11 <= mac5_r[10]; out_imag_11 <= mac5_i[10];
      out_real_12 <= mac5_r[11]; out_imag_12 <= mac5_i[11];
      out_real_13 <= mac5_r[12]; out_imag_13 <= mac5_i[12];
      out_real_14 <= mac5_r[13]; out_imag_14 <= mac5_i[13];
      out_real_15 <= mac5_r[14]; out_imag_15 <= mac5_i[14];
      out_real_16 <= mac5_r[15]; out_imag_16 <= mac5_i[15];
      out_real_17 <= mac5_r[16]; out_imag_17 <= mac5_i[16];
      out_real_18 <= mac5_r[17]; out_imag_18 <= mac5_i[17];
      out_real_19 <= mac5_r[18]; out_imag_19 <= mac5_i[18];
      out_real_20 <= mac5_r[19]; out_imag_20 <= mac5_i[19];
      out_real_21 <= mac5_r[20]; out_imag_21 <= mac5_i[20];
      out_real_22 <= mac5_r[21]; out_imag_22 <= mac5_i[21];
      out_real_23 <= mac5_r[22]; out_imag_23 <= mac5_i[22];
      out_real_24 <= mac5_r[23]; out_imag_24 <= mac5_i[23];
      out_real_25 <= mac5_r[24]; out_imag_25 <= mac5_i[24];
      out_real_26 <= mac5_r[25]; out_imag_26 <= mac5_i[25];
      out_real_27 <= mac5_r[26]; out_imag_27 <= mac5_i[26];
      out_real_28 <= mac5_r[27]; out_imag_28 <= mac5_i[27];
      out_real_29 <= mac5_r[28]; out_imag_29 <= mac5_i[28];
      out_real_30 <= mac5_r[29]; out_imag_30 <= mac5_i[29];
      out_real_31 <= mac5_r[30]; out_imag_31 <= mac5_i[30];
      out_real_32 <= mac5_r[31]; out_imag_32 <= mac5_i[31];
    end else begin
      out_valid <= 0;
    end
  end

endmodule