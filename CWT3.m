clc;
clear;
close all;

% ------------------------------------------------
% Load Uploaded File
% ------------------------------------------------
data = load('2.txt');

% Extract columns
t_raw = data(:,1);
x = data(:,2);

% ------------------------------------------------
% Convert Time to Relative Seconds
% ------------------------------------------------
t = t_raw - t_raw(1);

% Sampling interval
dt = mean(diff(t));

% Sampling frequency
fs = 1/dt;

% ------------------------------------------------
% Remove Mean / Trend
% ------------------------------------------------
x = detrend(x);

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
% CWT up to 500 Hz
% ------------------------------------------------
subplot(2,1,2)

cwt(x,'amor',fs,...
    'FrequencyLimits',[0 500])

title('CWT up to 500 Hz')

xlabel('Time (s)')
ylabel('Frequency (Hz)')

ylim([0 500])

colormap jet
colorbar