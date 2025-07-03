import numpy as np

import numpy as np

def to_qmn(x, Qm, Qn):
    """
    Convert a float or numpy array to signed Qm.n fixed-point format as np.int8 or np.int16.

    Parameters:
        x   : float or np.ndarray — input float(s)
        Qm  : int — number of integer bits
        Qn  : int — number of fractional bits

    Returns:
        Signed integer(s) in fixed-point representation (Qm.n)
    """
    total_bits = Qm + Qn
    max_val = (1 << (total_bits - 1)) - 1
    min_val = -(1 << (total_bits - 1))
    
    scale = 1 << Qn
    x_clipped = np.clip(x, min_val / scale, max_val / scale)
    result = np.round(x_clipped * scale).astype(int)

    # Clip again after rounding (to be safe)
    result = np.clip(result, min_val, max_val)

    # Choose appropriate numpy type
    if total_bits <= 8:
        return result.astype(np.int8)
    elif total_bits <= 16:
        return result.astype(np.int16)
    else:
        raise ValueError("Q format too large for 16-bit integer representation.")

N = 32

# 1) Create random test signal in [-0.1, +0.1]
signal = np.random.uniform(-2,1.984375, size=N)

# (Optional) If you still want a Gaussian core but then limit:
# signal = np.random.randn(N)
# signal = np.clip(signal, -0.1, 0.1)

# 2) Convert to Q1.7 and save as 2's-complement hex
with open('input_vec.mem', 'w') as f:
    for s in signal:
        val = to_qmn(s,2,6)
        f.write(f"{np.uint8(val):02X}\n")