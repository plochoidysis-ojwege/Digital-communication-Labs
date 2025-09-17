
% Self-contained script to generate, sample, quantize, and plot signals

clear; close all; clc;

%% 1. Define time axes and message signal
tot = 1;                % total time in seconds
td  = 0.002;            % time resolution for continuous signal
ts  = 0.02;             % sampling period
t   = 0 : td : tot;     % continuous-time vector
n   = 0 : ts : tot;     % sample-time vector

x  = sin(2*pi*t) - sin(6*pi*t);    % original message signal
xs = sin(2*pi*n) - sin(6*pi*n);    % sampled signal

%% 2. Quantization parameters
levels = 16;                        % number of quantization levels
xmin   = min(xs);
xmax   = max(xs);
step   = (xmax - xmin) / levels;    % quantization step size

%% 3. Apply uniform quantization
xq = step * round((xs - xmin) / step) + xmin;

%% 4. Plot sampled vs. quantized
figure;
hold on;
stem(n, xs, 'r',  'LineWidth', 1.5, 'DisplayName', 'Sampled Signal');
stem(n, xq, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Quantized Signal');
hold off;

xlabel('Time (s)');
ylabel('Amplitude');
title('Sampled Signal vs. Quantized Signal');
legend('Location', 'Best');
grid on;

%% 5. Compute and plot quantization error
q_err = xs - xq;

figure;
stem(n, q_err, 'k', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Error');
title('Quantization Error');
grid on;

