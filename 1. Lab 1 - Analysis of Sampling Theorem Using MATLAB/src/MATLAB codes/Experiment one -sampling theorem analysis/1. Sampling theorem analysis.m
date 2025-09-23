 % Experiment 1: Sampling Theorem Analysis
close all;
clc;

% Time and signal definition
tot = 1;
td = 0.002;
t = 0:td:tot;
x = sin(2*pi*t) - sin(6*pi*t);

% Plot the input message signal
figure; 
plot(t, x, 'LineWidth', 2); ]
xlabel('Time (s)'); 
ylabel('Amplitude'); 
title('Input Message Signal'); 
grid on; 

% Frequency analysis of the input signal
L = length(x);
Lfft = 2^nextpow2(L);
fmax = 1/(2*td);
Faxis = linspace(-fmax, fmax, Lfft);
Xfft = fftshift(fft(x, Lfft));
figure;
plot(Faxis, abs(Xfft));
xlabel('Frequency (Hz)'); 
ylabel('Magnitude');
title('Spectrum of Input Message Signal'); 
grid on; %[output:9c28ebfc]

% Sampling the signal
ts = 0.02;
n = 0:ts:tot;
x_sampled = sin(2*pi*n) - sin(6*pi*n);

% Plot the sampled signal
figure;
stem(n, x_sampled, 'LineWidth', 2);
xlabel('Time (s)'); 
ylabel('Amplitude');
title('Sampled Signal'); 
grid on; 

% Upsample for spectrum analysis
x_sampled_upsampled = upsample(x_sampled, round(ts/td));
Lffu = 2^nextpow2(length(x_sampled_upsampled));
fmaxu = 1/(2*td);
Faxisu = linspace(-fmaxu, fmaxu, Lffu);
Xfftu = fftshift(fft(x_sampled_upsampled, Lffu));
figure; 
plot(Faxisu, abs(Xfftu)); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 
title('Spectrum of Sampled Signal'); 
grid on; 
