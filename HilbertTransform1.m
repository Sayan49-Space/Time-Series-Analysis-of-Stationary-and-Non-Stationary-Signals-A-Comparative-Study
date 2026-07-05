clc;
clear;
close all;

% ------------------------------------------------
% Sampling Parameters
% ------------------------------------------------
fs = 1000;
t = 0:1/fs:2;

% ------------------------------------------------
% Modified Signal
% Carrier frequency reduced below 100 Hz
% ------------------------------------------------
x = (1 + 5*sin(2*pi*2*t)) ...
    .* sin(2*pi*100*t);

% ------------------------------------------------
% Hilbert Transform
% ------------------------------------------------
z = hilbert(x);

% Envelope
env = abs(z);

% Instantaneous Phase
phase = unwrap(angle(z));

% Instantaneous Frequency
inst_freq = diff(phase)*fs/(2*pi);

% ------------------------------------------------
% Plot Signal + Envelope
% ------------------------------------------------
figure;

subplot(2,1,1)

plot(t,x,'b','LineWidth',0.5)

hold on

plot(t,env,'r','LineWidth',2)
plot(t,-env,'r','LineWidth',2)

xlabel('Time (s)')
ylabel('Amplitude')

title('Signal with Hilbert Envelope')

legend('Original Signal','Envelope')

grid on

% ------------------------------------------------
% Instantaneous Frequency
% ------------------------------------------------
subplot(2,1,2)

plot(t(1:end-1),inst_freq,...
    'k','LineWidth',1.5)

xlabel('Time (s)')
ylabel('Frequency (Hz)')

title('Instantaneous Frequency')

ylim([0 100])

grid on