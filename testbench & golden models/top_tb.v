`timescale 1ns/1ps

module tb_fft32_top;
  // Clock & reset
  reg        clk = 0;
  reg        rst_n;
  // I/O
  reg        in_valid;
    reg signed [7:0] in_real_1; // Q1.7 input sample
    reg signed [7:0] in_real_2; // Q1.7 input sample
    reg signed [7:0] in_real_3; // Q1.7 input sample
    reg signed [7:0] in_real_4; // Q1.7 input sample
    reg signed [7:0] in_real_5; // Q1.7 input sample
    reg signed [7:0] in_real_6; // Q1.7 input sample
    reg signed [7:0] in_real_7; // Q1.7 input sample
    reg signed [7:0] in_real_8; // Q1.7 input sample
    reg signed [7:0] in_real_9; // Q1.7 input sample
    reg signed [7:0] in_real_10; // Q1.7 input sample
    reg signed [7:0] in_real_11; // Q1.7 input sample
    reg signed [7:0] in_real_12; // Q1.7 input sample
    reg signed [7:0] in_real_13; // Q1.7 input sample
    reg signed [7:0] in_real_14; // Q1.7 input sample
    reg signed [7:0] in_real_15; // Q1.7 input sample
    reg signed [7:0] in_real_16; // Q1.7 input sample
    reg signed [7:0] in_real_17; // Q1.7 input sample
    reg signed [7:0] in_real_18; // Q1.7 input sample
    reg signed [7:0] in_real_19; // Q1.7 input sample
    reg signed [7:0] in_real_20; // Q1.7 input sample
    reg signed [7:0] in_real_21; // Q1.7 input sample
    reg signed [7:0] in_real_22; // Q1.7 input sample
    reg signed [7:0] in_real_23; // Q1.7 input sample
    reg signed [7:0] in_real_24; // Q1.7 input sample
    reg signed [7:0] in_real_25; // Q1.7 input sample
    reg signed [7:0] in_real_26; // Q1.7 input sample
    reg signed [7:0] in_real_27; // Q1.7 input sample
    reg signed [7:0] in_real_28; // Q1.7 input sample
    reg signed [7:0] in_real_29; // Q1.7 input sample
    reg signed [7:0] in_real_30; // Q1.7 input sample
    reg signed [7:0] in_real_31; // Q1.7 input sample
    reg signed [7:0] in_real_32; // Q1.7 input sample
  wire signed [10:0] out_real_1, out_imag_1;
  wire signed [10:0] out_real_2, out_imag_2;
  wire signed [10:0] out_real_3, out_imag_3;
  wire signed [10:0] out_real_4, out_imag_4;
  wire signed [10:0] out_real_5, out_imag_5;
  wire signed [10:0] out_real_6, out_imag_6;
  wire signed [10:0] out_real_7, out_imag_7;
  wire signed [10:0] out_real_8, out_imag_8;
  wire signed [10:0] out_real_9, out_imag_9;
  wire signed [10:0] out_real_10, out_imag_10;
  wire signed [10:0] out_real_11, out_imag_11;
  wire signed [10:0] out_real_12, out_imag_12;
  wire signed [10:0] out_real_13, out_imag_13;
  wire signed [10:0] out_real_14, out_imag_14;
  wire signed [10:0] out_real_15, out_imag_15;
  wire signed [10:0] out_real_16, out_imag_16;
  wire signed [10:0] out_real_17, out_imag_17;
  wire signed [10:0] out_real_18, out_imag_18;
  wire signed [10:0] out_real_19, out_imag_19;
  wire signed [10:0] out_real_20, out_imag_20;
  wire signed [10:0] out_real_21, out_imag_21;
  wire signed [10:0] out_real_22, out_imag_22;
  wire signed [10:0] out_real_23, out_imag_23;
  wire signed [10:0] out_real_24, out_imag_24;
  wire signed [10:0] out_real_25, out_imag_25;
  wire signed [10:0] out_real_26, out_imag_26;
  wire signed [10:0] out_real_27, out_imag_27;
  wire signed [10:0] out_real_28, out_imag_28;
  wire signed [10:0] out_real_29, out_imag_29;
  wire signed [10:0] out_real_30, out_imag_30;
  wire signed [10:0] out_real_31, out_imag_31;
  wire signed [10:0] out_real_32, out_imag_32;
  wire       out_valid;
  wire signed [10:0] out_real, out_imag;

  // DUT
  fft32_top dut (
    .clk      (clk),
    .rst_n    (rst_n),
    .in_valid (in_valid),
    .in_real_1(in_real_1),
    .in_real_2(in_real_2),
    .in_real_3(in_real_3),
    .in_real_4(in_real_4),
    .in_real_5(in_real_5),
    .in_real_6(in_real_6),
    .in_real_7(in_real_7),
    .in_real_8(in_real_8),
    .in_real_9(in_real_9),
    .in_real_10(in_real_10),
    .in_real_11(in_real_11),
    .in_real_12(in_real_12),
    .in_real_13(in_real_13),
    .in_real_14(in_real_14),
    .in_real_15(in_real_15),
    .in_real_16(in_real_16),
    .in_real_17(in_real_17),
    .in_real_18(in_real_18),
    .in_real_19(in_real_19),
    .in_real_20(in_real_20),
    .in_real_21(in_real_21),
    .in_real_22(in_real_22),
    .in_real_23(in_real_23),
    .in_real_24(in_real_24),
    .in_real_25(in_real_25),
    .in_real_26(in_real_26),
    .in_real_27(in_real_27),
    .in_real_28(in_real_28),
    .in_real_29(in_real_29),
    .in_real_30(in_real_30),
    .in_real_31(in_real_31),
    .in_real_32(in_real_32),
    .out_valid(out_valid),
    .out_real_1 (out_real_1),
    .out_imag_1 (out_imag_1),
    .out_real_2 (out_real_2),
    .out_imag_2 (out_imag_2),
    .out_real_3 (out_real_3),
    .out_imag_3 (out_imag_3),
    .out_real_4 (out_real_4),
    .out_imag_4 (out_imag_4),
    .out_real_5 (out_real_5),
    .out_imag_5 (out_imag_5),
    .out_real_6 (out_real_6),
    .out_imag_6 (out_imag_6),
    .out_real_7 (out_real_7),
    .out_imag_7 (out_imag_7),
    .out_real_8 (out_real_8),
    .out_imag_8 (out_imag_8),
    .out_real_9 (out_real_9),
    .out_imag_9 (out_imag_9),
    .out_real_10(out_real_10),
    .out_imag_10(out_imag_10),
    .out_real_11(out_real_11),
    .out_imag_11(out_imag_11),
    .out_real_12(out_real_12),
    .out_imag_12(out_imag_12),
    .out_real_13(out_real_13),
    .out_imag_13(out_imag_13),
    .out_real_14(out_real_14),
    .out_imag_14(out_imag_14),
    .out_real_15(out_real_15),
    .out_imag_15(out_imag_15),
    .out_real_16(out_real_16),
    .out_imag_16(out_imag_16),
    .out_real_17(out_real_17),
    .out_imag_17(out_imag_17),
    .out_real_18(out_real_18),
    .out_imag_18(out_imag_18),
    .out_real_19(out_real_19),
    .out_imag_19(out_imag_19),
    .out_real_20(out_real_20),
    .out_imag_20(out_imag_20),
    .out_real_21(out_real_21),
    .out_imag_21(out_imag_21),
    .out_real_22(out_real_22),
    .out_imag_22(out_imag_22),
    .out_real_23(out_real_23),
    .out_imag_23(out_imag_23),
    .out_real_24(out_real_24),
    .out_imag_24(out_imag_24),
    .out_real_25(out_real_25),
    .out_imag_25(out_imag_25),
    .out_real_26(out_real_26),
    .out_imag_26(out_imag_26),
    .out_real_27(out_real_27),
    .out_imag_27(out_imag_27),
    .out_real_28(out_real_28),
    .out_imag_28(out_imag_28),
    .out_real_29(out_real_29),
    .out_imag_29(out_imag_29),
    .out_real_30(out_real_30),
    .out_imag_30(out_imag_30),
    .out_real_31(out_real_31),
    .out_imag_31(out_imag_31),
    .out_real_32(out_real_32),
    .out_imag_32(out_imag_32)
  );

  // Input memories
  reg signed [7:0] input_mem0 [0:31];
  reg signed [7:0] input_mem1 [0:31];
  integer i;

  // File handles
  integer infile0, infile1;

  // Clock: 20 MHz (50 ns)
  always #25 clk = ~clk;

  // 1) preload both inputs
  initial begin
    infile0 = $fopen("input_vec.mem",   "r");
    for (i=0; i<32; i=i+1) $fscanf(infile0, "%h\n", input_mem0[i]);
    $fclose(infile0);

    infile1 = $fopen("input_vec_1.mem", "r");
    for (i=0; i<32; i=i+1) $fscanf(infile1, "%h\n", input_mem1[i]);
    $fclose(infile1);
  end

  // 2) reset + feed bursts, then signal capture events
  initial begin
    rst_n    = 0; in_valid = 0;
    in_real_1 = 0; in_real_2 = 0; in_real_3 = 0; in_real_4 = 0;
    in_real_5 = 0; in_real_6 = 0; in_real_7 = 0; in_real_8 = 0;
    in_real_9 = 0; in_real_10 = 0; in_real_11 = 0; in_real_12 = 0;
    in_real_13 = 0; in_real_14 = 0; in_real_15 = 0; in_real_16 = 0;
    in_real_17 = 0; in_real_18 = 0; in_real_19 = 0; in_real_20 = 0;
    in_real_21 = 0; in_real_22 = 0; in_real_23 = 0; in_real_24 = 0;
    in_real_25 = 0; in_real_26 = 0; in_real_27 = 0; in_real_28 = 0;
    in_real_29 = 0; in_real_30 = 0; in_real_31 = 0; in_real_32 = 0;

    #100 rst_n = 1;
        in_real_1 = input_mem0[0];
        in_real_2 = input_mem0[1];
        in_real_3 = input_mem0[2];
        in_real_4 = input_mem0[3];
        in_real_5 = input_mem0[4];
        in_real_6 = input_mem0[5];
        in_real_7 = input_mem0[6];
        in_real_8 = input_mem0[7];
        in_real_9 = input_mem0[8];
        in_real_10 = input_mem0[9];
        in_real_11 = input_mem0[10];
        in_real_12 = input_mem0[11];
        in_real_13 = input_mem0[12];
        in_real_14 = input_mem0[13];
        in_real_15 = input_mem0[14];
        in_real_16 = input_mem0[15];
        in_real_17 = input_mem0[16];
        in_real_18 = input_mem0[17];
        in_real_19 = input_mem0[18];
        in_real_20 = input_mem0[19];
        in_real_21 = input_mem0[20];
        in_real_22 = input_mem0[21];
        in_real_23 = input_mem0[22];
        in_real_24 = input_mem0[23];
        in_real_25 = input_mem0[24];
        in_real_26 = input_mem0[25];
        in_real_27 = input_mem0[26];
        in_real_28 = input_mem0[27];
        in_real_29 = input_mem0[28];
        in_real_30 = input_mem0[29];
        in_real_31 = input_mem0[30];
        in_real_32 = input_mem0[31];
        in_valid = 1;
    #(50);
        in_valid = 0;
        in_real_1 = input_mem1[0];
        in_real_2 = input_mem1[1];
        in_real_3 = input_mem1[2];
        in_real_4 = input_mem1[3];
        in_real_5 = input_mem1[4];
        in_real_6 = input_mem1[5];
        in_real_7 = input_mem1[6];
        in_real_8 = input_mem1[7];
        in_real_9 = input_mem1[8];
        in_real_10 = input_mem1[9];
        in_real_11 = input_mem1[10];
        in_real_12 = input_mem1[11];
        in_real_13 = input_mem1[12];
        in_real_14 = input_mem1[13];
        in_real_15 = input_mem1[14];
        in_real_16 = input_mem1[15];
        in_real_17 = input_mem1[16];
        in_real_18 = input_mem1[17];
        in_real_19 = input_mem1[18];
        in_real_20 = input_mem1[19];
        in_real_21 = input_mem1[20];
        in_real_22 = input_mem1[21];
        in_real_23 = input_mem1[22];
        in_real_24 = input_mem1[23];
        in_real_25 = input_mem1[24];
        in_real_26 = input_mem1[25];
        in_real_27 = input_mem1[26];
        in_real_28 = input_mem1[27];
        in_real_29 = input_mem1[28];
        in_real_30 = input_mem1[29];
        in_real_31 = input_mem1[30];
        in_real_32 = input_mem1[31];
        in_valid = 1;
        #50;
    in_valid = 0;
end

  // 3) capture burst #1 outputs
  initial begin : write
    integer outfile1;
    integer outfile2;
    integer k;
    wait (out_valid);      // wait for first valid
    outfile1 = $fopen("dut_output_1.mem", "w");
      if (out_valid) begin
        $fwrite(outfile1, "%h %h\n", out_real_1, out_imag_1);
        $fwrite(outfile1, "%h %h\n", out_real_2, out_imag_2);
        $fwrite(outfile1, "%h %h\n", out_real_3, out_imag_3);
        $fwrite(outfile1, "%h %h\n", out_real_4, out_imag_4);
        $fwrite(outfile1, "%h %h\n", out_real_5, out_imag_5);
        $fwrite(outfile1, "%h %h\n", out_real_6, out_imag_6);
        $fwrite(outfile1, "%h %h\n", out_real_7, out_imag_7);
        $fwrite(outfile1, "%h %h\n", out_real_8, out_imag_8);
        $fwrite(outfile1, "%h %h\n", out_real_9, out_imag_9);
        $fwrite(outfile1, "%h %h\n", out_real_10, out_imag_10);
        $fwrite(outfile1, "%h %h\n", out_real_11, out_imag_11);
        $fwrite(outfile1, "%h %h\n", out_real_12, out_imag_12);
        $fwrite(outfile1, "%h %h\n", out_real_13, out_imag_13);
        $fwrite(outfile1, "%h %h\n", out_real_14, out_imag_14);
        $fwrite(outfile1, "%h %h\n", out_real_15, out_imag_15);
        $fwrite(outfile1, "%h %h\n", out_real_16, out_imag_16);
        $fwrite(outfile1, "%h %h\n", out_real_17, out_imag_17);
        $fwrite(outfile1, "%h %h\n", out_real_18, out_imag_18);
        $fwrite(outfile1, "%h %h\n", out_real_19, out_imag_19);
        $fwrite(outfile1, "%h %h\n", out_real_20, out_imag_20);
        $fwrite(outfile1, "%h %h\n", out_real_21, out_imag_21);
        $fwrite(outfile1, "%h %h\n", out_real_22, out_imag_22);
        $fwrite(outfile1, "%h %h\n", out_real_23, out_imag_23);
        $fwrite(outfile1, "%h %h\n", out_real_24, out_imag_24);
        $fwrite(outfile1, "%h %h\n", out_real_25, out_imag_25);
        $fwrite(outfile1, "%h %h\n", out_real_26, out_imag_26);
        $fwrite(outfile1, "%h %h\n", out_real_27, out_imag_27);
        $fwrite(outfile1, "%h %h\n", out_real_28, out_imag_28);
        $fwrite(outfile1, "%h %h\n", out_real_29, out_imag_29);
        $fwrite(outfile1, "%h %h\n", out_real_30, out_imag_30);
        $fwrite(outfile1, "%h %h\n", out_real_31, out_imag_31);
        $fwrite(outfile1, "%h %h\n", out_real_32, out_imag_32);
      end
    $fclose(outfile1);
    k=0;
    #(100) 
    wait (out_valid);
    outfile2 = $fopen("dut_output_2.mem", "w");
    if (out_valid) begin
        $fwrite(outfile1, "%h %h\n", out_real_1, out_imag_1);
        $fwrite(outfile1, "%h %h\n", out_real_2, out_imag_2);
        $fwrite(outfile1, "%h %h\n", out_real_3, out_imag_3);
        $fwrite(outfile1, "%h %h\n", out_real_4, out_imag_4);
        $fwrite(outfile1, "%h %h\n", out_real_5, out_imag_5);
        $fwrite(outfile1, "%h %h\n", out_real_6, out_imag_6);
        $fwrite(outfile1, "%h %h\n", out_real_7, out_imag_7);
        $fwrite(outfile1, "%h %h\n", out_real_8, out_imag_8);
        $fwrite(outfile1, "%h %h\n", out_real_9, out_imag_9);
        $fwrite(outfile1, "%h %h\n", out_real_10, out_imag_10);
        $fwrite(outfile1, "%h %h\n", out_real_11, out_imag_11);
        $fwrite(outfile1, "%h %h\n", out_real_12, out_imag_12);
        $fwrite(outfile1, "%h %h\n", out_real_13, out_imag_13);
        $fwrite(outfile1, "%h %h\n", out_real_14, out_imag_14);
        $fwrite(outfile1, "%h %h\n", out_real_15, out_imag_15);
        $fwrite(outfile1, "%h %h\n", out_real_16, out_imag_16);
        $fwrite(outfile1, "%h %h\n", out_real_17, out_imag_17);
        $fwrite(outfile1, "%h %h\n", out_real_18, out_imag_18);
        $fwrite(outfile1, "%h %h\n", out_real_19, out_imag_19);
        $fwrite(outfile1, "%h %h\n", out_real_20, out_imag_20);
        $fwrite(outfile1, "%h %h\n", out_real_21, out_imag_21);
        $fwrite(outfile1, "%h %h\n", out_real_22, out_imag_22);
        $fwrite(outfile1, "%h %h\n", out_real_23, out_imag_23);
        $fwrite(outfile1, "%h %h\n", out_real_24, out_imag_24);
        $fwrite(outfile1, "%h %h\n", out_real_25, out_imag_25);
        $fwrite(outfile1, "%h %h\n", out_real_26, out_imag_26);
        $fwrite(outfile1, "%h %h\n", out_real_27, out_imag_27);
        $fwrite(outfile1, "%h %h\n", out_real_28, out_imag_28);
        $fwrite(outfile1, "%h %h\n", out_real_29, out_imag_29);
        $fwrite(outfile1, "%h %h\n", out_real_30, out_imag_30);
        $fwrite(outfile1, "%h %h\n", out_real_31, out_imag_31);
        $fwrite(outfile1, "%h %h\n", out_real_32, out_imag_32);
      end
    $fclose(outfile2);
    #100
    $stop;
  end
endmodule
