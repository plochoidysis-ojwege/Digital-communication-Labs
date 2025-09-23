# Digital Signal Spectrum Analysis

## Overview
This directory contains analysis and simulation of digitally transmitted signals, focusing on spectrum analysis and Wide Sense Stationarity (WSS) concepts.

## Problem Statement
We analyze a digitally transmitted signal of the form:

x(t) = ∑[k=-∞ to ∞] Xk⋅pT(t - kT)

where:
- pT(t) is a rectangular pulse defined as:
  - 1 for |t| ≤ T/2
  - 0 otherwise
- Xk represents binary data (0 or 1) mapped to +A or -A
- Equal probability distribution: P(Xk = +A) = P(Xk = -A) = 1/2

## Project Objectives
1. Calculate the theoretical spectrum of the digital signal
2. Demonstrate Wide Sense Stationarity (WSS) properties
3. Implement BPSK modulation simulation
4. Compare theoretical and practical spectrum results

## Directory Structure
```
/
├── src/          # MATLAB and Python implementation files
├──report/          # contains files I used to generate the report on overleaf
└── results/         # Simulation results,plots and hand calculations.
```

## Implementation Details
- Signal generation using BPSK modulation
- Spectrum analysis using FFT
- Theoretical vs practical spectrum comparison
- WSS property verification

