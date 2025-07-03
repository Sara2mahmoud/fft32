import cmath
import math

# ---- CONFIG --------------------------------------------------
N = 32

# Fractional bits (always 6)
Q_FRAC = 6

# Per-stage (input_bits, output_bits)
# Stage 1: in 8-bit → out 9-bit
# Stage 2: in 9-bit → out 9-bit
# Stage 3: in 9-bit → out 10-bit
# Stage 4: in 10-bit → out 10-bit
# Stage 5: in 10-bit → out 11-bit
STAGE_BITS = {
    1: (8,  9),
    2: (9,  9),
    3: (9, 10),
    4: (10, 10),
    5: (10, 11),
}

MEM_FILE = "input_vec.mem"

# ---- helpers -------------------------------------------------
def bit_reverse(index, bits=5):
    b = format(index, f'0{bits}b')
    return int(b[::-1], 2)

def q_fixed_to_float(h, Q, total_bits):
    """Hex string -> signed fixed -> float."""
    v = int(h, 16)
    sign = 1 << (total_bits - 1)
    mask = (1 << total_bits) - 1
    v &= mask
    if v & sign:
        v -= (1 << total_bits)
    return v / (1 << Q)

def float_to_q_fixed(val, Q, total_bits):
    """Float -> signed fixed -> raw bits."""
    scaled = int(round(val * (1 << Q)))
    max_pos = (1 << (total_bits - 1)) - 1
    min_neg = - (1 << (total_bits - 1))
    if scaled > max_pos:
        scaled = max_pos
    elif scaled < min_neg:
        scaled = min_neg
    return scaled & ((1 << total_bits) - 1)

def hex_width(bits):
    return (bits + 3) // 4

# ---- read & bit-reverse reorder ------------------------------
with open(MEM_FILE, "r") as f:
    lines = [l.strip() for l in f if l.strip()]
if len(lines) != N:
    raise ValueError(f"Expected {N} lines in {MEM_FILE}, got {len(lines)}")

reordered = [None] * N
for i, h in enumerate(lines):
    j = bit_reverse(i, bits=int(N).bit_length() - 1)
    reordered[j] = h

# ---- initial data (stage 1 input floats) --------------------
in_bits_1, out_bits_1 = STAGE_BITS[1]
x = [q_fixed_to_float(h, Q_FRAC, in_bits_1) + 0j for h in reordered]

# ---- precompute twiddles -------------------------------------
W = [cmath.exp(-2j * math.pi * k / N) for k in range(N)]

# ---- FFT stages ----------------------------------------------
for stage in range(1, int(N).bit_length()):
    in_bits, out_bits = STAGE_BITS[stage]
    hw = hex_width(out_bits)

    m    = 2 ** stage
    half = m // 2
    step = N // m

    # butterfly compute with floats
    for k in range(0, N, m):
        for j in range(half):
            idx = k + j
            idy = idx + half
            t   = x[idy] * W[j * step]
            u   = x[idx]
            x[idx] = u + t
            x[idy] = u - t

    # store pre-quantization floats
    float_pre = list(x)

    # quantize to this stage's output bits and store floats post-quant
    float_post = []
    for v in x:
        pr = float_to_q_fixed(v.real, Q_FRAC, out_bits)
        pi = float_to_q_fixed(v.imag, Q_FRAC, out_bits)
        # convert back to signed float
        sr = pr if pr < (1 << (out_bits-1)) else pr - (1 << out_bits)
        si = pi if pi < (1 << (out_bits-1)) else pi - (1 << out_bits)
        float_post.append((sr/(1<<Q_FRAC)) + 1j*(si/(1<<Q_FRAC)))
    x = float_post

    # display results
    print(f"\n=== After Stage {stage} (in {in_bits}-bit -> out {out_bits}-bit) ===")
    print("Idx |   Float Pre-Quant        |   Float Post-Quant       |   Hex (Re,Im)")
    print("-" * 80)
    for n in range(N):
        pre = float_pre[n]
        post = float_post[n]
        pr_hex = float_to_q_fixed(post.real, Q_FRAC, out_bits)
        pi_hex = float_to_q_fixed(post.imag, Q_FRAC, out_bits)
        print(f"{n:>3} | {pre.real:7.3f}+{pre.imag:7.3f}j | {post.real:7.3f}+{post.imag:7.3f}j | ({pr_hex:0{hw}X},{pi_hex:0{hw}X})")

    # write .mem
    fname = f"fft_stage{stage}.mem"
    with open(fname, "w") as fout:
        for v in x:
            pr = float_to_q_fixed(v.real, Q_FRAC, out_bits)
            pi = float_to_q_fixed(v.imag, Q_FRAC, out_bits)
            fout.write(f"{pr:0{hw}X} {pi:0{hw}X}\n")

print("Done: per-stage floating outputs logged and quantized files generated.")