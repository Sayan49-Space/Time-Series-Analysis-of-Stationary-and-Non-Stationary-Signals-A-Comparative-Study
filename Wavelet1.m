clc;
clear;
close all;

% Sampling frequency
fs = 1000;

% Time vector
t = 0:1/fs:1;

% Signal
x = sin(2*pi*50*t) + 0.5*sin(2*pi*120*t);

% Add noise
x = x + 0.2*randn(size(x));

% 3-level DWT decomposition
[c,l] = wavedec(x,3,'db4');

% Extract coefficients
A3 = appcoef(c,l,'db4',3);

D1 = detcoef(c,l,1);
D2 = detcoef(c,l,2);
D3 = detcoef(c,l,3);

% Time vectors for coefficients
tD1 = linspace(0,1,length(D1));
tD2 = linspace(0,1,length(D2));
tD3 = linspace(0,1,length(D3));
tA3 = linspace(0,1,length(A3));

% Plotting
figure;

subplot(5,1,1);
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(5,1,2);
plot(tD1,D1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Detail Coefficients D1');

subplot(5,1,3);
plot(tD2,D2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Detail Coefficients D2');

subplot(5,1,4);
plot(tD3,D3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Detail Coefficients D3');

subplot(5,1,5);
plot(tA3,A3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Approximation Coefficients A3');