clc;
clear;
close all;

% ------------------------------------------------
% Sampling Parameters
% ------------------------------------------------
fs = 1000;
t = 0:1/fs:2-1/fs;

% ------------------------------------------------
% Signal 1
% Frequencies:
% 50 Hz + 150 Hz
% ------------------------------------------------
x1 = sin(2*pi*50*t) + ...
     sin(2*pi*150*t);

% ------------------------------------------------
% Signal 2
% Frequencies:
% 150 Hz + 300 Hz
% ------------------------------------------------
x2 = sin(2*pi*150*t) + ...
     sin(2*pi*300*t);

% ------------------------------------------------
% Combined Signal
% ------------------------------------------------
x_combined = x1 + x2;

% ------------------------------------------------
% FFT Parameters
% ------------------------------------------------
N = length(t);

f = (0:N-1)*(fs/N);

% ------------------------------------------------
% FFT Calculations
% ------------------------------------------------
X1 = fft(x1);
X2 = fft(x2);
Xc = fft(x_combined);

mag1 = abs(X1)/N;
mag2 = abs(X2)/N;
magc = abs(Xc)/N;

% ------------------------------------------------
% Plot Signals
% ------------------------------------------------
figure;

subplot(3,2,1)

plot(t,x1)

xlabel('Time (s)')
ylabel('Amplitude')

title('Signal 1 : 50 Hz + 150 Hz')

grid on

subplot(3,2,2)

plot(t,x2)

xlabel('Time (s)')
ylabel('Amplitude')

title('Signal 2 : 150 Hz + 300 Hz')

grid on

% ------------------------------------------------
% FFT of Signal 1
% ------------------------------------------------
subplot(3,2,3)

plot(f(1:N/2),mag1(1:N/2),...
    'LineWidth',1.5)

xlabel('Frequency (Hz)')
ylabel('Magnitude')

title('FFT of Signal 1')

xlim([0 350])

grid on

% ------------------------------------------------
% FFT of Signal 2
% ------------------------------------------------
subplot(3,2,4)

plot(f(1:N/2),mag2(1:N/2),...
    'LineWidth',1.5)

xlabel('Frequency (Hz)')
ylabel('Magnitude')

title('FFT of Signal 2')

xlim([0 350])

grid on

% ------------------------------------------------
% Combined Signal Plot
% ------------------------------------------------
subplot(3,2,5)

plot(t,x_combined)

xlabel('Time (s)')
ylabel('Amplitude')

title('Combined Signal')

grid on

% ------------------------------------------------
% FFT of Combined Signal
% ------------------------------------------------
subplot(3,2,6)

plot(f(1:N/2),magc(1:N/2),...
    'LineWidth',1.5)

xlabel('Frequency (Hz)')
ylabel('Magnitude')

title('FFT of Combined Signal')

xlim([0 350])

grid on
