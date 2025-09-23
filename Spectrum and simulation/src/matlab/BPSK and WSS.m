% BPSK Spectrum Analysis and WSS Verification
clear all; close all; clc;

% Parameters
Fs = 1000;          % Sampling frequency
T = 0.01;           % Symbol period (100 Hz symbol rate)
A = 1;              % Amplitude
num_symbols = 10000; % Increase for better PSD estimation
samples_per_symbol = T * Fs; % Samples per symbol

% Generate random binary sequence
bits = randi([0 1], 1, num_symbols);

% BPSK modulation (0 -> +A, 1 -> -A)
symbols = A * (1 - 2 * bits);

% Create rectangular pulse shaped signal 
tx_signal = repelem(symbols, samples_per_symbol);

% Calculate theoretical PSD
f = linspace(-Fs/2, Fs/2, 1024);
theoretical_psd = (A^2 * T) * (sinc(f * T)).^2;

% Estimate practical PSD using Welch method
window_length = min(1024, length(tx_signal)/4);
[psd_est, f_est] = pwelch(tx_signal, window_length, [], 1024, Fs, 'centered');

% Convert to dB for plotting 
psd_est_db = 10*log10(psd_est + eps);
theoretical_psd_db = 10*log10(theoretical_psd + eps);

% Normalize for better comparison (optional)
psd_est_db = psd_est_db - max(psd_est_db);
theoretical_psd_db = theoretical_psd_db - max(theoretical_psd_db);

% Plotting
figure;

subplot(3,1,1);
stem(bits(1:20), 'filled');
title('First 20 Binary Bits');
xlabel('Bit Index'); ylabel('Bit Value'); grid on;

subplot(3,1,2);
plot((0:199)/Fs, tx_signal(1:200));
title('BPSK Modulated Signal (First 200 ms)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(f, theoretical_psd_db, 'r--', 'LineWidth', 2); hold on;
plot(f_est, psd_est_db, 'b', 'LineWidth', 1);
title('Power Spectral Density Comparison');
xlabel('Frequency (Hz)'); ylabel('Normalized PSD (dB)');
legend('Theoretical', 'Estimated'); grid on;
xlim([-200, 200]); % Zoom around main lobe

% WSS Verification - Improved
segment_length = 1000;
num_segments = floor(length(tx_signal) / segment_length);
signal_means = zeros(1, num_segments);
signal_vars = zeros(1, num_segments);

for i = 1:num_segments
    start_idx = (i-1)*segment_length + 1;
    end_idx = i*segment_length;
    segment = tx_signal(start_idx:end_idx);
    signal_means(i) = mean(segment);
    signal_vars(i) = var(segment);
end

figure;
subplot(2,1,1);
plot((1:num_segments)*segment_length/Fs, signal_means);
title('Mean Value over Time (WSS Check)');
xlabel('Time (s)'); ylabel('Mean'); grid on;

subplot(2,1,2);
plot((1:num_segments)*segment_length/Fs, signal_vars);
title('Variance over Time (WSS Check)');
xlabel('Time (s)'); ylabel('Variance'); grid on;

% Calculate correlation to show it depends only on time difference
max_lag = 100;
[corr_vals, lags] = xcorr(tx_signal(1:1000), max_lag, 'coeff');
figure;
stem(lags/Fs, corr_vals);
title('Autocorrelation Function (Should depend only on lag)');
xlabel('Lag (s)'); ylabel('Correlation'); grid on;