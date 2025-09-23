# Analysis of Sampling Theorem Using MATLAB

## Objectives

The main objectives of this lab is to use the provided MATLAB codes to:

- Analyze and verify the Sampling Theorem.
- Reconstruct the original signal from sampled
 data.
- Perform quantization using MATLAB.

## Experiment 1: Sampling Theorem Analysis.

Though I used the [MATLAB codes](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/src/MATLAB%20codes/Experiment%20one%20-sampling%20theorem%20analysis/1.%20Sampling%20theorem%20analysis.m) for the report.I've also included the [Python code](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/src/Python%20codes/Sampling%20and%20%20Reconstruction.py) 

Having run the code for sampling theorem, the following were the results:
  * The input message.
    As shown below :
    
    ![Input message](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/1.%20Sampling%20theory/fig%201.png)
 The signal x(t) was generated with a high time resolution (td = 0.002 s) to simulate a continuous-time waveform over a 1 second interval.
    
   * The spectrum of input message signal
This is how the spectrum of the input signal appeared.

![The spectrum](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/1.%20Sampling%20theory/fig%202.png)
 Its spectrum is computed using the Fast Fourier Transform (FFT).
 
* Sampled signal
  After sampling , the signal is as below:
  
  ![Sampled signal](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/1.%20Sampling%20theory/fig%203.png)
 The signal was sampled at fs = 50 Hz (ts = 0.02 s).

* The spectrum of the sampled signal
  
 The spectrum of the sampled signal was calculated and
 plotted.
 It looks like this :
 ![spectrum of the sampled signal](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/1.%20Sampling%20theory/fig%204.png)


## Experiment 2: Signal Reconstruction
  
  The sampled signal was upsampled and zero filled to
 facilitate frequency-domain filtering.

![Spectrum of the sampled signal](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/2.%20Reconstruction/fig%201.2.png)

 An ideal low-pass filter (LPF) with a cutoff frequency of 10 Hz (the signal’s effective bandwidth) was designed
 in the frequency domain.
 
 ![Transfer fn of lpf](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/2.%20Reconstruction/fig%202.2.png)
 
The spectrum of the sampled signal was multiplied by the LPF’s transfer function.

![spectrum of lpf](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/2.%20Reconstruction/fig%203.2.png)

 The inverse FFT (IFFT) of the filtered spectrum was computed to reconstruct the signal in the time domain.
    
![original vs reconstructed](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/2.%20Reconstruction/fig%204.2.png)

 
 ## C. Quantization
   
The following MATLAB codes were run :

[quantization.m](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/src/MATLAB%20codes/Quantization/Quantization.m)


For formalarlity, also find the Python code here:
[quantization.py](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/src/Python%20codes/Quantization.py)

 The signal sampled from Experiment 1 was quantized using uniform levels of L = 16.
 
![sampled vs quant](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/3.%20Quantization/fig%201.3.png)
 The quantized signal was plotted against the original sampled signal.
 The quantization error was calculated and plotted.

   ![quant error](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/1.%20Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Figures/3.%20Quantization/fig%202.3.png)

---
# For more detailed analysis of this lab , find the lab report below;

 [THE LAB REPORT](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/Lab%201%20-%20Analysis%20of%20Sampling%20Theorem%20Using%20MATLAB/Report/Lab%201%20report.pdf)
