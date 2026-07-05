clc;
clear;
close all;

fs = 1000;
t = 0:1/fs:1;

% Signal
x = sin(2*pi*50*t);

% Hilbert Transform
z = hilbert(x);

% Envelope
env = abs(z);

% Instantaneous Phase
phase = angle(z);

% Plot
figure;

subplot(3,1,1);
plot(t,x);
title('Original Signal');

subplot(3,1,2);
plot(t,env);
title('Envelope using Hilbert Transform');

subplot(3,1,3);
plot(t,phase);
title('Instantaneous Phase');
