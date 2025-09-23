import numpy as np
import matplotlib.pyplot as plt

# 1. Generate sampled signal
tot = 1
td = 0.002
ts = 0.02
t = np.arange(0, tot, td)
n = np.arange(0, tot, ts)
x_sampled = np.sin(2 * np.pi * n) - np.sin(6 * np.pi * n)

# 2. Quantization setup
levels = 16
x_min = np.min(x_sampled)
x_max = np.max(x_sampled)
step = (x_max - x_min) / levels

# 3. Apply quantization
x_quantized = step * np.round((x_sampled - x_min) / step) + x_min

# 4. Plot sampled vs. quantized
plt.figure()
plt.stem(
    n,
    x_sampled,
    'r',
    markerfmt='ro',
    basefmt=' ',
    use_line_collection=True,
    label='Sampled Signal'
)
plt.stem(
    n,
    x_quantized,
    'b--',
    markerfmt='bo',
    basefmt=' ',
    use_line_collection=True,
    label='Quantized Signal'
)
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.title('Sampled Signal vs. Quantized Signal')
plt.legend()
plt.grid(True)
plt.show()

# 5. Plot quantization error
quantization_error = x_sampled - x_quantized
plt.figure()
plt.stem(
    n,
    quantization_error,
    basefmt=' ',
    use_line_collection=True
)
plt.xlabel('Time (s)')
plt.ylabel('Error')
plt.title('Quantization Error')
plt.grid(True)
plt.show()
