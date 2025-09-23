% Experiment 2: Sampling, Reconstruction, and Low-Pass Filtering

clear all;
close all;
clc;

% Signal parameters
tot = 1;
td = 0.002;
t = 0:td:tot;
x = sin(2*pi*t) - sin(6*pi*t);

% Sampling
ts = 0.02;
Nfactor = round(ts/td);
xsm = downsample(x, Nfactor);      % Downsample (sample the signal)
xsmu = upsample(xsm, Nfactor);     % Upsample (insert zeros for reconstruction)

% Frequency axis for plotting
Lffu = 2^nextpow2(length(xsmu));
fmaxu = 1/(2*td);
Faxisu = linspace(-fmaxu, fmaxu, Lffu);

% Spectrum of upsampled signal
xfftu = fftshift(fft(xsmu, Lffu));
figure(1); 
plot(Faxisu, abs(xfftu)); 
xlabel('Frequency'); 
ylabel('Amplitude'); 
title('Spectrum of Sampled Signal'); 
grid; 

% Design a Low-Pass Filter (LPF)
BW = 10; % Bandwidth
H_lpf = zeros(1, Lffu);
H_lpf(Lffu/2-BW:Lffu/2+BW-1) = 1;
figure(2); 
plot(Faxisu, H_lpf); 
xlabel('Frequency'); 
ylabel('Amplitude');
title('Transfer function of LPF'); 
grid; 

% Apply LPF to the spectrum
x_recv = Nfactor * (xfftu) .* H_lpf;
figure(3) 
plot(Faxisu, abs(x_recv)); 
xlabel('Frequency'); 
ylabel('Amplitude'); 
title('Spectrum of LPF Output'); 
grid; 

% Reconstruct the signal in time domain
x_recv1 = real(ifft(fftshift(x_recv)));
x_recv2 = x_recv1(1:length(t));

% Compare original and reconstructed signals
figure(4) 
plot(t, x, 'r', t, x_recv2, 'b--', 'LineWidth', 2);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Original vs. Reconstructed Signal');
grid; 


