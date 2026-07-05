clc;
clear;
close all;

% Sampling Frequency
fs = 1000;

% Time Vector
t = 0:1/fs:1;

% Same signal used in CWT
x = sin(2*pi*50*t) + sin(2*pi*150*t);

% FFT
N = length(x);

X = fft(x);

% Frequency axis
f = (0:N-1)*(fs/N);

% Magnitude
mag = abs(X)/N;

% Plot only positive frequencies
figure;
plot(f(1:N/2),mag(1:N/2));

xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum of Signal');
grid on;