clc;
clear;
close all;

% ------------------------------------------------
% Load Data File
% ------------------------------------------------
data = load('2.txt');

% Extract columns
t_raw = data(:,1);
x = data(:,2);

% ------------------------------------------------
% Normalize Time Axis
% ------------------------------------------------
% Convert large timestamps into relative seconds

t = t_raw - t_raw(1);

% Sampling interval
dt = mean(diff(t));

% Sampling frequency
fs = 1/dt;

% ------------------------------------------------
% Plot Original Signal
% ------------------------------------------------
figure;

subplot(2,1,1)

plot(t,x)

xlabel('Time (s)')
ylabel('Amplitude')

title('Original Signal')

grid on

% ------------------------------------------------
% Proper Continuous Wavelet Transform
% ------------------------------------------------
subplot(2,1,2)

cwt(x,'amor',fs)

title('Continuous Wavelet Transform (CWT)')

xlabel('Time (s)')
ylabel('Frequency (Hz)')

colormap jet
colorbar