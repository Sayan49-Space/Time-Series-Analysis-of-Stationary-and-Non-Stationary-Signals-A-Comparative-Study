clc;
clear;
close all;

% -------------------------------------------------
% Sampling Parameters
% -------------------------------------------------
fs = 1000;                 % Sampling frequency
t = 0:1/fs:3-1/fs;         % Exact 3-second signal

% -------------------------------------------------
% Create Intermittent Signal
% -------------------------------------------------
x = sin(2*pi*50*t);

% Intermittent burst 1
x(t>=0.5 & t<=0.8) = ...
x(t>=0.5 & t<=0.8) + ...
2*sin(2*pi*180*t(t>=0.5 & t<=0.8));

% Intermittent burst 2
x(t>=1.5 & t<=1.8) = ...
x(t>=1.5 & t<=1.8) + ...
1.5*sin(2*pi*220*t(t>=1.5 & t<=1.8));

% Intermittent burst 3
x(t>=2.5 & t<=2.8) = ...
x(t>=2.5 & t<=2.8) + ...
2.5*sin(2*pi*140*t(t>=2.5 & t<=2.8));

% Add noise
x = x + 0.2*randn(size(x));

% -------------------------------------------------
% DWT Decomposition
% -------------------------------------------------
[c,l] = wavedec(x,3,'db4');

% Extract D2 coefficients
D2 = detcoef(c,l,2);

% Effective sampling frequency of D2
fs_D2 = fs/(2^2);

% Time vector for D2
tD2 = (0:length(D2)-1)/fs_D2;

% -------------------------------------------------
% Plot Original Signal
% -------------------------------------------------
figure;

subplot(3,1,1)
plot(t,x,'k')
xlabel('Time (s)')
ylabel('Amplitude')
title('Original Intermittent Signal')
xlim([0 3])
grid on

% -------------------------------------------------
% Plot D2 Coefficients
% -------------------------------------------------
subplot(3,1,2)
plot(tD2,D2,'b')
xlabel('Time (s)')
ylabel('Amplitude')
title('D2 Detail Coefficients')
xlim([0 3])
grid on

% -------------------------------------------------
% Proper Continuous Wavelet Transform
% -------------------------------------------------
subplot(3,1,3)

cwt(D2,'amor',fs_D2)

title('Proper CWT of D2 Coefficients')

xlabel('Time (s)')
ylabel('Frequency (Hz)')

xlim([0 3])

colormap jet
colorbar