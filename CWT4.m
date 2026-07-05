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
% First Half:
% 50 Hz + 150 Hz
% ------------------------------------------------
x1 = zeros(size(t));

idx1 = t < 1;

x1(idx1) = sin(2*pi*50*t(idx1)) + ...
           sin(2*pi*150*t(idx1));

% ------------------------------------------------
% Signal 2
% Second Half:
% 150 Hz + 300 Hz
% ------------------------------------------------
x2 = zeros(size(t));

idx2 = t >= 1;

x2(idx2) = sin(2*pi*150*t(idx2)) + ...
           sin(2*pi*300*t(idx2));

% ------------------------------------------------
% Combined Time-Varying Signal
% ------------------------------------------------
x = x1 + x2;

% ------------------------------------------------
% Plot Combined Signal
% ------------------------------------------------
figure;

subplot(3,1,1)

plot(t,x)

xlabel('Time (s)')
ylabel('Amplitude')

title('Combined Time-Varying Signal')

grid on

% ------------------------------------------------
% FFT
% ------------------------------------------------
N = length(x);

X = fft(x);

f = (0:N-1)*(fs/N);

mag = abs(X)/N;

subplot(3,1,2)

plot(f(1:N/2),mag(1:N/2),...
    'LineWidth',1.5)

xlabel('Frequency (Hz)')
ylabel('Magnitude')

title('FFT of Combined Signal')

xlim([0 350])

grid on

% ------------------------------------------------
% Continuous Wavelet Transform
% ------------------------------------------------
subplot(3,1,3)

cwt(x,...
    'amor',...
    fs,...
    'VoicesPerOctave',48,...
    'FrequencyLimits',[20 350])

title('CWT Showing Frequency Variation with Time')

xlabel('Time (s)')
ylabel('Frequency (Hz)')

ylim([20 350])

shading interp

colormap jet
colorbar