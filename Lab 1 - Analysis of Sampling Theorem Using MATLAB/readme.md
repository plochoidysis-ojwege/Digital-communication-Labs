# Analysis of Sampling Theorem Using MATLAB

## Objectives

The main objectives of this lab is to use the provided MATLAB codes to:

- Analyze and verify the Sampling Theorem.
- Reconstruct the original signal from sampled
 data.
- Perform quantization using MATLAB.

* Experiment 1: Sampling Theorem
 Analysis.
 1) The signal x(t) was generated with a high time res
olution (td = 0.002 s) to simulate a continuous-time
 waveform over a 1 second interval.
 2) Its spectrum was computed using the Fast Fourier Trans
form (FFT).
 3) The signal was sampled at fs = 50 Hz (ts = 0.02 s).
 4) The spectrum of the sampled signal was calculated and
 plotted.

Find the code used for this experiment 1 (MATLAB code)[]
I've also included the (Python code)[]

* Experiment 2: Signal Reconstruction
 1) The sampled signal was upsampled and zero filled to
 facilitate frequency-domain filtering.
 2) An ideal low-pass filter (LPF) with a cutoff frequency of
 10 Hz (the signal’s effective bandwidth) was designed
 in the frequency domain.
 3) The spectrum of the sampled signal was multiplied by
 the LPF’s transfer function.
 4) The inverse FFT (IFFT) of the filtered spectrum was
 computed to reconstruct the signal in the time domain.
 The MATLAB code for this experiment are (here)[]
 
 *  C. Quantization
 1) The signal sampled from Experiment 1 was quantized
 using uniform levels of L = 16.
 2) The quantized signal was plotted against the original
 sampled signal.
 3) The quantization error was calculated and plotted.
 The (MATLAB code)[] used in this experiment.