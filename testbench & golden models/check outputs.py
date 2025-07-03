import math

# ---- CONFIG --------------------------------------------------
TOTAL_BITS = 11    # 11-bit signed Q5.6
Q_FRAC     = 6     # fractional bits

# ---- helpers -------------------------------------------------
def hex_to_q56_signed(hex_str):
    """Convert hex string (signed 11-bit Q5.6) to float."""
    v = int(hex_str, 16)
    sign_bit = 1 << (TOTAL_BITS - 1)
    mask     = (1 << TOTAL_BITS) - 1
    v &= mask
    if v & sign_bit:
        v -= (1 << TOTAL_BITS)
    return v / (1 << Q_FRAC)


def q56_signed_to_hex(val):
    """Convert float val to signed 11-bit Q5.6 hex string."""
    scaled  = int(round(val * (1 << Q_FRAC)))
    max_pos = (1 << (TOTAL_BITS - 1)) - 1
    min_neg = - (1 << (TOTAL_BITS - 1))
    # clamp to representable range
    if scaled > max_pos:
        scaled = max_pos
    elif scaled < min_neg:
        scaled = min_neg

    packed = scaled & ((1 << TOTAL_BITS) - 1)
    # width in hex digits (12 bits → 3 hex digits)
    width = (TOTAL_BITS + 3) // 4
    return f"{packed:0{width}X}"


def compare_files_with_magnitude(file1, file2):
    """
    Compare two mem files of signed 11-bit Q5.6 complex samples.
    Prints per-line magnitude error (in float and Q5.6 hex) and average. """
    sum_err = 0.0
    count   = 0
    with open(file1) as f1, open(file2) as f2:
        for line_num, (l1, l2) in enumerate(zip(f1, f2), start=1):
            r1_hex, i1_hex = l1.strip().split()
            r2_hex, i2_hex = l2.strip().split()
            # to floats
            r1 = hex_to_q56_signed(r1_hex)
            i1 = hex_to_q56_signed(i1_hex)
            r2 = hex_to_q56_signed(r2_hex)
            i2 = hex_to_q56_signed(i2_hex)
            # magnitudes
            mag1 = math.hypot(r1, i1)
            mag2 = math.hypot(r2, i2)
            diff = abs(mag1 - mag2)
            # accumulate error
            sum_err += diff
            count   += 1
            # print details
            print(f"Line {line_num}:")
            print(f"  File1: ({r1_hex},{i1_hex}) -> mag={mag1:.6f}")
            print(f"  File2: ({r2_hex},{i2_hex}) -> mag={mag2:.6f}")
            print(f"  Mag diff: {diff:.6f}")
            print(f"  Error Q5.6 hex: {q56_signed_to_hex(diff)}\n")
    avg = sum_err / count if count else 0.0
    print(f"Average magnitude error: {avg:.6f}")


if __name__ == '__main__':
    compare_files_with_magnitude('dut_output_2.mem', 'fft32_q56.mem')
