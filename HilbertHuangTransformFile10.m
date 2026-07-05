clc;
clear;
close all;

%% Read File 10
fileName = 'C:\Users\sayan\Desktop\Time Series Analysis Project\CTCS Data Time Series\10.txt';

data = readmatrix(fileName);

t = data(:,1);
x = data(:,2);

%% Remove mean
x = x - mean(x);

%% Original Signal
figure;
plot(x,'b','LineWidth',1.5);
xlabel('Sample Number');
ylabel('Amplitude');
title('Original Signal - File 10');
grid on;

%% EMD
IMF = emd(x);

%% Plot IMFs
figure;
emd(x);
title('Intrinsic Mode Functions (IMFs) - File 10');

%% Hilbert Transform
numIMF = size(IMF,2);

amplitude = [];
phase = [];
instFreq = [];

for k = 1:numIMF

    z = hilbert(IMF(:,k));

    amplitude(:,k) = abs(z);

    phase(:,k) = unwrap(angle(z));

    instFreq(:,k) = [diff(phase(:,k));0]/(2*pi);

end

%% IMF1 Instantaneous Frequency
figure;
plot(instFreq(:,1),'b','LineWidth',1.5);
xlabel('Sample Number');
ylabel('Frequency');
title('Instantaneous Frequency of IMF 1 - File 10');
grid on;

%% IMF1 Instantaneous Amplitude
figure;
plot(amplitude(:,1),'r','LineWidth',1.5);
xlabel('Sample Number');
ylabel('Amplitude');
title('Instantaneous Amplitude of IMF 1 - File 10');
grid on;

%% Hilbert Spectrum
figure;
imagesc(instFreq');
axis xy;
xlabel('Sample Number');
ylabel('IMF Number');
title('Hilbert Spectrum - File 10');
colorbar;
colormap jet;