//-----------------------------------------------------------------------------
//  Twiddle ROM for Q2.6 fixed-point (32 entries)
//  Format: signed 8-bit [2 integer bits, 6 fractional bits]
//-----------------------------------------------------------------------------
module twiddle_rom (
    input  wire           clk,
    input  wire   [5:0]   addr,     // 0..31
    output reg signed [7:0] tw_real,
    output reg signed [7:0] tw_imag
);

    always @(posedge clk) begin
        case (addr)
            6'h00: {tw_real,tw_imag} = {8'h40, 8'h00}; // +1.0000,  +0.0000
            6'h01: {tw_real,tw_imag} = {8'h3F, 8'hF4}; // +0.9844,  -0.1875
            6'h02: {tw_real,tw_imag} = {8'h3B, 8'hE8}; // +0.9219,  -0.3750
            6'h03: {tw_real,tw_imag} = {8'h35, 8'hDC}; // +0.8281,  -0.5625
            6'h04: {tw_real,tw_imag} = {8'h2D, 8'hD3}; // +0.7031,  -0.7031
            6'h05: {tw_real,tw_imag} = {8'h24, 8'hCB}; // +0.5625,  -0.8281
            6'h06: {tw_real,tw_imag} = {8'h18, 8'hC5}; // +0.3750,  -0.9219
            6'h07: {tw_real,tw_imag} = {8'h0C, 8'hC1}; // +0.1875,  -0.9844
            6'h08: {tw_real,tw_imag} = {8'h00, 8'hC0}; // +0.0000,  -1.0000
            6'h09: {tw_real,tw_imag} = {8'hF4, 8'hC1}; // -0.1875,  -0.9844
            6'h0A: {tw_real,tw_imag} = {8'hE8, 8'hC5}; // -0.3750,  -0.9219
            6'h0B: {tw_real,tw_imag} = {8'hDC, 8'hCB}; // -0.5625,  -0.8281
            6'h0C: {tw_real,tw_imag} = {8'hD3, 8'hD3}; // -0.7031,  -0.7031
            6'h0D: {tw_real,tw_imag} = {8'hCB, 8'hDC}; // -0.8281,  -0.5625
            6'h0E: {tw_real,tw_imag} = {8'hC5, 8'hE8}; // -0.9219,  -0.3750
            6'h0F: {tw_real,tw_imag} = {8'hC1, 8'hF4}; // -0.9844,  -0.1875
            6'h10: {tw_real,tw_imag} = {8'hC0, 8'h00}; // -1.0000,  +0.0000
            6'h11: {tw_real,tw_imag} = {8'hC1, 8'h0C}; // -0.9844,  +0.1875
            6'h12: {tw_real,tw_imag} = {8'hC5, 8'h18}; // -0.9219,  +0.3750
            6'h13: {tw_real,tw_imag} = {8'hCB, 8'h24}; // -0.8281,  +0.5625
            6'h14: {tw_real,tw_imag} = {8'hD3, 8'h2D}; // -0.7031,  +0.7031
            6'h15: {tw_real,tw_imag} = {8'hDC, 8'h35}; // -0.5625,  +0.8281
            6'h16: {tw_real,tw_imag} = {8'hE8, 8'h3B}; // -0.3750,  +0.9219
            6'h17: {tw_real,tw_imag} = {8'hF4, 8'h3F}; // -0.1875,  +0.9844
            6'h18: {tw_real,tw_imag} = {8'h00, 8'h40}; // +0.0000,  +1.0000
            6'h19: {tw_real,tw_imag} = {8'h0C, 8'h3F}; // +0.1875,  +0.9844
            6'h1A: {tw_real,tw_imag} = {8'h18, 8'h3B}; // +0.3750,  +0.9219
            6'h1B: {tw_real,tw_imag} = {8'h24, 8'h35}; // +0.5625,  +0.8281
            6'h1C: {tw_real,tw_imag} = {8'h2D, 8'h2D}; // +0.7031,  +0.7031
            6'h1D: {tw_real,tw_imag} = {8'h35, 8'h24}; // +0.8281,  +0.5625
            6'h1E: {tw_real,tw_imag} = {8'h3B, 8'h18}; // +0.9219,  +0.3750
            6'h1F: {tw_real,tw_imag} = {8'h3F, 8'h0C}; // +0.9844,  +0.1875
            default: {tw_real,tw_imag} = {8'h00, 8'h00};
        endcase
    end
endmodule






























// //-----------------------------------------------------------------------------
// //  Twiddle ROM for Q3.5 fixed-point (32 entries)
// //  Format: signed 8-bit [3 integer bits, 5 fractional bits]
// //-----------------------------------------------------------------------------
// module twiddle_rom (
//     input  wire           clk,
//     input  wire   [5:0]   addr,     // 0..31
//     output reg signed [7:0] tw_real,
//     output reg signed [7:0] tw_imag
// );

//     always @(posedge clk) begin
//         case (addr)
//             6'h00: {tw_real,tw_imag} = {8'h20, 8'h00}; // +1.0000,  -0.0000
//             6'h01: {tw_real,tw_imag} = {8'h1F, 8'hFA}; // +0.9688,  -0.1563
//             6'h02: {tw_real,tw_imag} = {8'h1E, 8'hF4}; // +0.9375,  -0.3125
//             6'h03: {tw_real,tw_imag} = {8'h1B, 8'hEE}; // +0.8438,  -0.4375
//             6'h04: {tw_real,tw_imag} = {8'h17, 8'hE9}; // +0.7188,  -0.5938
//             6'h05: {tw_real,tw_imag} = {8'h12, 8'hE5}; // +0.5625,  -0.7188
//             6'h06: {tw_real,tw_imag} = {8'h0C, 8'hE2}; // +0.3750,  -0.8750
//             6'h07: {tw_real,tw_imag} = {8'h06, 8'hE1}; // +0.1875,  -0.9375
//             6'h08: {tw_real,tw_imag} = {8'h00, 8'hE0}; // +0.0000,  -1.0000
//             6'h09: {tw_real,tw_imag} = {8'hFA, 8'hE1}; // -0.1875,  -0.9375
//             6'h0A: {tw_real,tw_imag} = {8'hF4, 8'hE2}; // -0.3125,  -0.8750
//             6'h0B: {tw_real,tw_imag} = {8'hEE, 8'hE5}; // -0.4375,  -0.7188
//             6'h0C: {tw_real,tw_imag} = {8'hE9, 8'hE9}; // -0.5938,  -0.5938
//             6'h0D: {tw_real,tw_imag} = {8'hE5, 8'hEE}; // -0.7188,  -0.4375
//             6'h0E: {tw_real,tw_imag} = {8'hE2, 8'hF4}; // -0.8750,  -0.3125
//             6'h0F: {tw_real,tw_imag} = {8'hE1, 8'hFA}; // -0.9375,  -0.1563
//             6'h10: {tw_real,tw_imag} = {8'hE0, 8'h00}; // -1.0000,  +0.0000
//             6'h11: {tw_real,tw_imag} = {8'hE1, 8'h06}; // -0.9375,  +0.1875
//             6'h12: {tw_real,tw_imag} = {8'hE2, 8'h0C}; // -0.8750,  +0.3750
//             6'h13: {tw_real,tw_imag} = {8'hE5, 8'h12}; // -0.7188,  +0.5625
//             6'h14: {tw_real,tw_imag} = {8'hE9, 8'h17}; // -0.5938,  +0.7188
//             6'h15: {tw_real,tw_imag} = {8'hEE, 8'h1B}; // -0.4375,  +0.8438
//             6'h16: {tw_real,tw_imag} = {8'hF4, 8'h1E}; // -0.3125,  +0.9375
//             6'h17: {tw_real,tw_imag} = {8'hFA, 8'h1F}; // -0.1563,  +0.9688
//             6'h18: {tw_real,tw_imag} = {8'h00, 8'h20}; // +0.0000,  +1.0000
//             6'h19: {tw_real,tw_imag} = {8'h06, 8'h1F}; // +0.1875,  +0.9688
//             6'h1A: {tw_real,tw_imag} = {8'h0C, 8'h1E}; // +0.3750,  +0.9375
//             6'h1B: {tw_real,tw_imag} = {8'h12, 8'h1B}; // +0.5625,  +0.8438
//             6'h1C: {tw_real,tw_imag} = {8'h17, 8'h17}; // +0.7188,  +0.7188
//             6'h1D: {tw_real,tw_imag} = {8'h1B, 8'h12}; // +0.8438,  +0.5625
//             6'h1E: {tw_real,tw_imag} = {8'h1E, 8'h0C}; // +0.9375,  +0.3750
//             6'h1F: {tw_real,tw_imag} = {8'h1F, 8'h06}; // +0.9688,  +0.1875
//             default: {tw_real,tw_imag} = {8'h00, 8'h00};
//         endcase
//     end
// endmodule
