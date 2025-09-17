% Define quantization levels
 levels = 16;
 x_min = min(x_sampled);
 x_max = max(x_sampled);
 step = (x_max- x_min) / levels;
 % Quantize the sampled signal
 x_quantized = step * round((x_sampled- x_min) / step) + x_min;
 % Plot quantized vs. sampled signal
 figure;
 stem(n, x_sampled, ’r’, ’LineWidth’, 1.5); hold on;
 stem(n, x_quantized, ’b--’, ’LineWidth’, 1.5);
 xlabel(’Time (s)’);
 ylabel(’Amplitude’);
 title(’Sampled Signal vs. Quantized Signal’);
 legend(’Sampled Signal’, ’Quantized Signal’);
grid on;
 % Quantization error
 quantization_error = x_sampled- x_quantized;
 figure;
 stem(n, quantization_error, ’LineWidth’, 1.5);
 xlabel(’Time (s)’);
 ylabel(’Error’);
 title(’Quantization Error’);
 grid on;

