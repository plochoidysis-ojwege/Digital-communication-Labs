# Lab 2 - Design & Implementation of Lossless Compression
( Bernoulli Sequences and Erdős–Rényi Graphs )

## 1. Objectives
1. Design and implement an optimal lossless compression algorithm for a Bernoulli sequence.  
2. Extend the approach to compress an Erdős–Rényi (ER) graph.

## 2. Overview
This lab implements Huffman coding for Bernoulli sequences and applies it to the binary edge representation of ER graphs (G(n,p)). The report analyses why single-symbol Huffman on a binary source may not reach the entropy limit and recommends block or sequence-based methods (Arithmetic Coding, LZ).

## 3. Repository structure
- `src/` — MATLAB scripts and functions.  
- `Figures/` — Generated images.  
- `Report/` — LaTeX source, bibliography, and final PDF.

## 4. Requirements
- MATLAB R2025b (tested).  
- Communication Toolbox (optional — scripts detect availability).


## 5. Key results
- Source length: 2775 bits (n = 75).  
- Theoretical entropy at p = 0.2: 0.7219 bits/symbol.  
- Single-symbol Huffman average length: 1.000 bits/symbol → no compression.  
- Compression efficiency (theoretical potential): 72.19%.

## 6. Figures
Numerical results:  
![results](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/2.%20Lab%202-ER-graph-huffman/Figures/results.png)

Entropy curve:  
![entropy](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/2.%20Lab%202-ER-graph-huffman/Figures/Entropy_Curve.png)

ER graph example:  
![er example](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/2.%20Lab%202-ER-graph-huffman/Figures/ER_Graph_Conceptual.png)

## 7. Discussion & recommended next steps
1. Problem: single-symbol Huffman on a binary alphabet cannot assign sub-1-bit codewords.  
2. Recommendations:
   - Implement Block Huffman coding (group k symbols → larger alphabet).  
   - Implement Arithmetic Coding or Lempel–Ziv for sequence compression.  
3. Investigate: trade-off between block size, compression ratio, and runtime; test across different n and p.

## 8. Sources & references
- Bibliography: `Report/references.bib`  
- Final PDF report: `Report/main.pdf`
  or find it through the link; [main.pdf](https://github.com/plochoidysis-ojwege/Digital-communication-Labs/blob/main/2.%20Lab%202-ER-graph-huffman/Report/main.pdf)
- MATLAB source: `src/er-graph-huffman-matlab.m`
