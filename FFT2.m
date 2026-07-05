clc;
clear;
close all;

% ------------------------------------------------
% Sampling Parameters
% ------------------------------------------------
fs = 1000;
t = 0:1/fs:1-1/fs;

% ------------------------------------------------
% Create Bursty / Intermittent Signal
% ------------------------------------------------
x = zeros(size(t));

% Burst 1
idx1 = (t >= 0.05 & t <= 0.15);

x(idx1) = x(idx1) + ...
          1.2*sin(2*pi*120*t(idx1));

% Burst 2
idx2 = (t >= 0.22 & t <= 0.32);

x(idx2) = x(idx2) + ...
          1.5*sin(2*pi*180*t(idx2));

% Burst 3
idx3 = (t >= 0.40 & t <= 0.52);

x(idx3) = x(idx3) + ...
          1.1*sin(2*pi*90*t(idx3));

% Burst 4
idx4 = (t >= 0.60 & t <= 0.75);

x(idx4) = x(idx4) + ...
          1.3*sin(2*pi*220*t(idx4));

% Burst 5
idx5 = (t >= 0.82 & t <= 0.95);

x(idx5) = x(idx5) + ...
          1.4*sin(2*pi*150*t(idx5));

% Add broadband noise
x = x + 0.35*randn(size(x));

% ------------------------------------------------
% FFT
% ------------------------------------------------
N = length(x);

X = fft(x);

f = (0:N-1)*(fs/N);

mag = abs(X)/N;

% ------------------------------------------------
% Plot Signal
% ------------------------------------------------
figure;

subplot(2,1,1)

plot(t,x)

xlabel('Time (s)')
ylabel('Amplitude')

title('Intermittent Bursty Signal')

grid on

% ------------------------------------------------
% FFT Plot
% ------------------------------------------------
subplot(2,1,2)

plot(f(1:N/2),mag(1:N/2),...
    'LineWidth',1.5)

xlabel('Frequency (Hz)')
ylabel('Magnitude')

title('FFT of Intermittent Bursty Signal')

xlim([0 500])

grid on