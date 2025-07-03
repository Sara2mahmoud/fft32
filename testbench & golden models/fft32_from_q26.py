

import numpy as np

# ---- CONFIG --------------------------------------------------
N_POINTS   = 32    # FFT length
IN_FILE    = 'input_vec_1.mem'
OUT_FILE   = 'fft32_q56.mem'
# Q2.6 input format
IN_BITS    = 8     # total bits for signed Q2.6
IN_FRAC    = 6     # fractional bits (n in Qm.n)
# Q5.6 output format
OUT_BITS   = 11    # total bits for signed Q5.6
OUT_FRAC   = 6     # fractional bits

# ---- helpers -------------------------------------------------
def hex_to_signed_float(hex_str, total_bits, q_frac):
    """
    Convert a hex string (two's-complement, total_bits) to Python float.
    """
    v = int(hex_str, 16)
    sign = 1 << (total_bits - 1)
    mask = (1 << total_bits) - 1
    v &= mask
    if v & sign:
        v -= (1 << total_bits)
    return v / (1 << q_frac)

def to_qmn_signed_int(value, total_bits, q_frac):
    """
    Convert float (or array) to signed Qm.n fixed-point integer (two's-complement).
    """
    scale   = 1 << q_frac
    maxp    = (1 << (total_bits - 1)) - 1
    minn    = - (1 << (total_bits - 1))
    raw     = np.round(np.asarray(value) * scale).astype(int)
    raw     = np.clip(raw, minn, maxp)
    mask    = (1 << total_bits) - 1
    return raw & mask

def format_hex(raw, total_bits):
    """
    Format integer array (or scalar) as zero-padded hex string(s).
    """
    width = (total_bits + 3) // 4
    if isinstance(raw, np.ndarray):
        return [f"{int(x):0{width}X}" for x in raw]
    else:
        return f"{int(raw):0{width}X}"

# ---- main ----------------------------------------------------
def main():
    # 1) Read Q2.6 inputs from file
    with open(IN_FILE, 'r') as f:
        lines = [ln.strip() for ln in f if ln.strip()]
    if len(lines) != N_POINTS:
        raise ValueError(f"Expected {N_POINTS} lines in {IN_FILE}, got {len(lines)}")
    # convert hex → float
    signal = np.array([hex_to_signed_float(h, IN_BITS, IN_FRAC) for h in lines])

    # 2) Compute 32-point FFT
    fft_out = np.fft.fft(signal, n=N_POINTS)

    # 3) Quantize to Q5.6 integers
    real_q = to_qmn_signed_int(fft_out.real, OUT_BITS, OUT_FRAC)
    imag_q = to_qmn_signed_int(fft_out.imag, OUT_BITS, OUT_FRAC)

    # 4) Format as hex strings
    real_hex = format_hex(real_q, OUT_BITS)
    imag_hex = format_hex(imag_q, OUT_BITS)

    # 5) Write to output .mem file
    with open(OUT_FILE, 'w') as f:
        for r, i in zip(real_hex, imag_hex):
            f.write(f"{r} {i}\n")

    print(f"Wrote {N_POINTS}-point FFT Q5.6 output to '{OUT_FILE}'")

if __name__ == '__main__':
    main()
