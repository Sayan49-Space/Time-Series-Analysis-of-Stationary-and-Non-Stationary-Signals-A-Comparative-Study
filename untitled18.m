clc;
clear;
close all;

%% Load Data
data = load('11 (1).txt');

% Extract columns
t = data(:,1);
x = data(:,2);

% Convert huge timestamps to relative time
t = t - t(1);

%% Sampling Parameters
dt = mean(diff(t));
Fs = 1/dt;          % Sampling frequency
N = length(x);

%% FFT
X = fft(x);

% Frequency axis
f = (0:N-1)*(Fs/N);

% Magnitude spectrum
mag = abs(X)/N;

% Only positive frequencies
halfN = floor(N/2);

%% Plot Time Series and FFT
figure('Color','w');

% ---------------- Time Series ----------------
subplot(2,1,1)

plot(t, x, 'b', 'LineWidth', 1);

xlabel('Time (s)');
ylabel('Amplitude');

title('Time Series');

grid on;

% ---------------- FFT ----------------
subplot(2,1,2)

plot(f(1:halfN), mag(1:halfN), 'r', 'LineWidth', 1.2);

xlabel('Frequency (Hz)');
ylabel('Magnitude');

title('FFT Spectrum');

grid on;

% Adjust frequency range if needed
xlim([0 500]);