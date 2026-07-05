# Time Series Analysis of Stationary and Non-Stationary Signals: A Comparative Study

## Overview

This project presents a comprehensive study of **time-series analysis** techniques for stationary, non-stationary, frequency-varying, and intermittent thermoacoustic signals. The work compares classical signal processing methods with modern time-frequency and nonlinear dynamical analysis techniques using MATLAB.

The project was carried out under the guidance of **Dr. Sirshendu Mondal**, Department of Mechanical Engineering, National Institute of Technology Durgapur.

The experimental datasets analyzed in this project originate from the **Centre for Combustion, Thermo-fluid and Control Systems (CTCS) Laboratory**, Department of Aerospace Engineering, IIT Madras, under the research contributions of **Prof. R. I. Sujith** and his research group.

---

## Objectives

- Analyze stationary and non-stationary signals.
- Compare FFT and Wavelet Transform.
- Study frequency-varying and intermittent signals.
- Perform adaptive signal decomposition using EMD.
- Analyze instantaneous signal characteristics using the Hilbert Transform and Hilbert–Huang Transform.
- Reconstruct phase space using Delay Embedding and Takens' Embedding Theorem.
- Detect chaotic dynamics using the 0–1 Test for Chaos.
- Investigate thermoacoustic instability using experimental combustion datasets.

---

## Topics Covered

### Signal Processing
- Fast Fourier Transform (FFT)
- Continuous Wavelet Transform (CWT)
- Discrete Wavelet Transform (DWT)

### Adaptive Signal Analysis
- Empirical Mode Decomposition (EMD)
- Hilbert Transform
- Hilbert Spectrum
- Hilbert Marginal Spectrum
- Hilbert–Huang Transform (HHT)

### Nonlinear Dynamics
- Delay Embedding
- Takens' Embedding Theorem
- Phase Space Reconstruction
- 0–1 Test for Chaos

### Dynamical Systems Theory
- Quasi-Static Process
- Dynamical Systems
- State-Space Modelling
- Homogeneous and Non-Homogeneous Systems
- Order of Dynamical Systems
- Equilibrium (Fixed) Points
- Stability
- Bifurcation
- Nyquist Sampling Theorem
- Nyquist Stability Criterion

### Thermoacoustics
- Rayleigh Criterion
- Rijke Tube
- Thermo-Acoustic Rig for Axial Instabilities (TARA)
- Thermoacoustic Instability

---

## Experimental Data

The project analyzes thermoacoustic pressure signals obtained from combustion experiments performed at the **CTCS Laboratory, IIT Madras**.

The datasets include:

- Stationary periodic signals
- Frequency-varying signals
- Intermittent signals
- Thermoacoustic pressure oscillations

---

## MATLAB Analysis

The repository contains MATLAB implementations for

- FFT Analysis
- Continuous Wavelet Transform
- Discrete Wavelet Transform
- Empirical Mode Decomposition
- Hilbert Transform
- Hilbert Spectrum
- Hilbert Marginal Spectrum
- Hilbert–Huang Transform
- Delay Embedding
- Takens Phase Space Reconstruction
- 0–1 Test for Chaos

---

## Results

The study demonstrates that

- FFT effectively identifies stationary frequency components.
- Wavelet Transform provides excellent time-frequency localization.
- EMD adaptively decomposes nonlinear and non-stationary signals.
- HHT accurately estimates instantaneous frequency and amplitude.
- Delay Embedding reconstructs the underlying phase-space dynamics.
- The 0–1 Test successfully distinguishes regular and chaotic behavior.
- Modern adaptive signal processing techniques outperform conventional Fourier analysis for transient thermoacoustic signals.

---

## Software Used

- MATLAB R2024a
- Signal Processing Toolbox
- Wavelet Toolbox

---

## Repository Structure

```
├── MATLAB Codes/
│   ├── FFT
│   ├── CWT
│   ├── DWT
│   ├── EMD
│   ├── HHT
│   ├── Delay Embedding
│   ├── Takens Reconstruction
│   └── 0-1 Chaos Test
│
├── Experimental Data/
│
├── Figures/
│
├── Report/
│   └── Project Report.pdf
│
└── README.md
```

---

## Applications

- Thermoacoustic Instability
- Combustion Dynamics
- Aerospace Engineering
- Mechanical Vibrations
- Structural Health Monitoring
- Fluid Mechanics
- Chaos Detection
- Nonlinear Dynamical Systems

---

## Acknowledgements

I sincerely thank **Dr. Sirshendu Mondal** (Department of Mechanical Engineering, NIT Durgapur) for his valuable guidance throughout this project.

I also acknowledge **Prof. R. I. Sujith** and the **Centre for Combustion, Thermo-fluid and Control Systems (CTCS) Laboratory, IIT Madras** for their outstanding research contributions and for making the thermoacoustic datasets available for academic research.

---

## References

Key references include the works of

- Stéphane Mallat
- Ingrid Daubechies
- N. E. Huang
- G. A. Gottwald
- I. Melbourne
- R. I. Sujith
- T. M. Bury

---

## Author

**Sayan Pal**

B.Tech Mechanical Engineering (Third Year)

VIT-AP University

Research Interests:
- Signal Processing
- CFD
- Thermoacoustics
- Combustion Dynamics
- Nonlinear Dynamics
- Aerospace Engineering

---

## License

This repository is intended for **academic and educational purposes only**.

The thermoacoustic datasets and certain figures originate from the published work of **Prof. R. I. Sujith** and collaborators and remain the intellectual property of their respective authors. Please cite the original publications when using these datasets or figures.
