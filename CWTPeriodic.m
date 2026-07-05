clc;
clear;
close all;

% Sampling frequency
fs = 1000;

% Time vector
t = 0:1/fs:1;

% Signal with varying frequencies
x = sin(2*pi*50*t) + sin(2*pi*150*t);

% Continuous Wavelet Transform
cwt(x,'amor',fs);

title('Continuous Wavelet Transform');