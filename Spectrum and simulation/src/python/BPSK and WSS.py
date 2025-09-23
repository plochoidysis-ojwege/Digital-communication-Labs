import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

# Parameters
Fs = 1000          # Sampling frequency
T = 0.01           # Symbol period
A = 1              # Amplitude
num_symbols = 1000  # Number of symbols to generate
samples_per_symbol = int(T*Fs)  # Samples per symbol

# Generate random binary sequence
bits = np.random.randint(0, 2, num_symbols)

# BPSK modulation (0 -> +A, 1 -> -A)
symbols = A*(1 - 2*bits)

# Upsample and create rectangular pulse shaping
upsampled = np.repeat(symbols, samples_per_symbol)
pulse_shape = np.ones(samples_per_symbol)
tx_signal = np.convolve(upsampled, pulse_shape, mode='same')

# Calculate theoretical PSD
f = np.linspace(-Fs/2, Fs/2, 1024)
theoretical_psd = (A**2 * T) * (np.sinc(f*T))**2

# Estimate practical PSD
f_est, psd_est = signal.welch(tx_signal, Fs, nperseg=1024, scaling='density', center=True)

# Plotting
plt.figure(figsize=(12, 10))

plt.subplot(3,1,1)
plt.stem(bits[:20])
plt.title('First 20 Binary Bits')
plt.xlabel('Bit Index')
plt.ylabel('Bit Value')
plt.grid(True)

plt.subplot(3,1,2)
plt.plot(tx_signal[:200])
plt.title('BPSK Modulated Signal (First 200 Samples)')
plt.xlabel('Sample Index')
plt.ylabel('Amplitude')
plt.grid(True)

plt.subplot(3,1,3)
plt.plot(f, 10*np.log10(theoretical_psd/np.max(theoretical_psd)), 'r--', label='Theoretical')
plt.plot(f_est, 10*np.log10(psd_est/np.max(psd_est)), 'b', label='Estimated')
plt.title('Power Spectral Density')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Power/Frequency (dB/Hz)')
plt.legend()
plt.grid(True)

# WSS Verification
time_instances = np.arange(1000)
signal_means = np.array([np.mean(tx_signal[i:i+1000]) for i in time_instances])

plt.figure()
plt.plot(time_instances, signal_means)
plt.title('Mean Value over Time (WSS Check)')
plt.xlabel('Time Instance')
plt.ylabel('Mean Value')
plt.grid(True)

plt.tight_layout()
plt.show()