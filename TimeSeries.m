clc;
clear;
close all;

% Load data
data = load('14 (1).txt');

% Separate columns
t = data(:,1);
x = data(:,2);

% Convert time to relative time
t = t - t(1);

% Sampling interval
dt = mean(diff(t));

% Sampling frequency
Fs = 1/dt;

% Length of signal
N = length(x);

% FFT
X = fft(x);

% Frequency axis
f = (0:N-1)*(Fs/N);

% Magnitude
mag = abs(X)/N;

% Only positive frequencies
halfN = floor(N/2);

figure;

plot(f(1:halfN), mag(1:halfN), 'b', 'LineWidth', 1.5);

xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum');

grid on;
xlim([0 max(f(1:halfN))]);