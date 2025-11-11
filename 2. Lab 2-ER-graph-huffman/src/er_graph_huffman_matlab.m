% ECE 2414 Digital Communications Lab 2
% ER Graph Compression Analysis
clear all; close all; clc

%% 1. Input Parameters
n = 75;         % Number of vertices
p = 0.2;        % Edge probability

%% 2. Data Generation
L_source = n*(n-1)/2;  % Source sequence length
S = rand(1, L_source) < p;  % Generate binary source sequence

%% 3. Numerical Analysis
% Calculate empirical probabilities
p_hat_0 = sum(S == 0) / L_source;
p_hat_1 = sum(S == 1) / L_source;

% Calculate theoretical entropy
H_X = -p*log2(p) - (1-p)*log2(1-p);
L_min = H_X * L_source;

% Huffman coding (with robust fallback)
try
    % use of Communications Toolbox
    dict = huffmandict([0 1], [p_hat_0 p_hat_1]);
    l0 = length(dict{1,2});  % Length of codeword for '0'
    l1 = length(dict{2,2});  % Length of codeword for '1'
catch
    % Manual assignment if Communications Toolbox unavailable
    if p_hat_0 >= p_hat_1
        l0 = 1; l1 = 1;  % Assign '0' and '1' directly
    else
        l0 = 1; l1 = 1;
    end
end

% Calculate average codeword length and compression metrics
L_avg = p_hat_0*l0 + p_hat_1*l1;
L_comp = L_source * L_avg;
eta = H_X / L_avg * 100;  % Compression efficiency in percentage

%% 4. Visualization
% Figure 1: Entropy Curve
figure('Position', [100 100 800 500]);
p_range = 0.01:0.01:0.99;
H_p = -p_range.*log2(p_range) - (1-p_range).*log2(1-p_range);

plot(p_range, H_p, 'b-', 'LineWidth', 2);
hold on;
plot(p, H_X, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
text(p+0.05, H_X, ['Operating Point (p=' num2str(p) ')']);
grid on;
xlabel('Probability (p)');
ylabel('Entropy H(p) [bits]');
title('Source Entropy vs. Probability');
saveas(gcf, 'Entropy_Curve.png');

% Figure 2: ER Graph Visualization
figure('Position', [100 100 800 500]);
n_small = 10;  % Smaller graph for visualization
A = rand(n_small) < p;  % Generate adjacency matrix
A = triu(A,1);  % Make it upper triangular
A = A + A';    % Make it symmetric
G = graph(A);  % Create graph object

plot(G, 'Layout', 'circle', 'NodeColor', 'r', ...
    'EdgeColor', 'b', 'LineWidth', 2, 'MarkerSize', 8);
title(['Example Erdős-Rényi Graph (n=' num2str(n_small) ', p=' num2str(p) ')']);
saveas(gcf, 'ER_Graph_Conceptual.png');

%% 5. Display Results
fprintf('\nNumerical Results:\n');
fprintf('Source Length (L_source): %d bits\n', L_source);
fprintf('Theoretical Entropy H(X): %.4f bits\n', H_X);
fprintf('Theoretical Minimum Length (L_min): %.2f bits\n', L_min);
fprintf('Average Codeword Length (L_avg): %.4f bits\n', L_avg);
fprintf('Actual Compressed Length (L_comp): %.2f bits\n', L_comp);
fprintf('Compression Efficiency (η): %.2f%%\n', eta);
fprintf('Empirical Probabilities: P(0)=%.4f, P(1)=%.4f\n', p_hat_0, p_hat_1);