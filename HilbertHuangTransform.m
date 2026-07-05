clc;
clear;
close all;

%% Read File 1
fileName = 'C:\Users\sayan\Desktop\Time Series Analysis Project\CTCS Data Time Series\1.txt';

data = readmatrix(fileName);

t = data(:,1);
x = data(:,2);

%% Remove mean
x = x - mean(x);

%% Plot original signal
figure;
plot(x,'b','LineWidth',1.5);
xlabel('Sample Number');
ylabel('Amplitude');
title('Original Signal - File 1');
grid on;

%% Empirical Mode Decomposition
IMF = emd(x);

%% Plot IMFs
figure;
emd(x);
title('Intrinsic Mode Functions (IMFs)');

%% Hilbert Transform on each IMF
numIMF = size(IMF,2);

for k = 1:numIMF

    z = hilbert(IMF(:,k));

    amplitude(:,k) = abs(z);

    phase(:,k) = unwrap(angle(z));

    instFreq(:,k) = [diff(phase(:,k));0]/(2*pi);

end

%% Instantaneous Frequency of IMF1
figure;

plot(instFreq(:,1),'b','LineWidth',1.5);

xlabel('Sample Number');
ylabel('Frequency');

title('Instantaneous Frequency of IMF 1');

grid on;

%% Instantaneous Amplitude of IMF1
figure;

plot(amplitude(:,1),'r','LineWidth',1.5);

xlabel('Sample Number');
ylabel('Amplitude');

title('Instantaneous Amplitude of IMF 1');

grid on;

%% Hilbert Spectrum
figure;

imagesc(instFreq');

axis xy;

xlabel('Sample Number');
ylabel('IMF Number');

title('Hilbert Spectrum - File 1');

colorbar;

colormap jet;