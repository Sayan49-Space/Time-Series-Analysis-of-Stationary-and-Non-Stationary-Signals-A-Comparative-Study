%% =========================================================
% COMPLETE HILBERT ANALYSIS WITH ZOOM
% File : 19.txt
%% =========================================================

clc;
clear;
close all;

%% =========================================================
% LOAD DATA
%% =========================================================

filepath = 'C:/Users/sayan/Desktop/Time Series Analysis Project/CTCS Data Time Series/19.txt';

data = load(filepath);

t = data(:,1);
x = data(:,2);

%% =========================================================
% TIME NORMALIZATION
%% =========================================================

t = t - t(1);

dt = mean(diff(t));
Fs = 1/dt;

fprintf('Sampling Frequency = %.4f Hz\n',Fs);

%% =========================================================
% PREPROCESSING
%% =========================================================

x = detrend(x);

%% =========================================================
% HILBERT TRANSFORM
%% =========================================================

z = hilbert(x);

amp = abs(z);

phase = unwrap(angle(z));

freq = gradient(phase)/(2*pi*dt);

freqSmooth = movmean(freq,11);

%% =========================================================
% AUTO ZOOM
%% =========================================================

N = length(x);

Nzoom = min(1000,N);

%% =========================================================
% ORIGINAL SIGNAL + ENVELOPE (ZOOMED)
%% =========================================================

figure('Color','w','Position',[100 100 1200 800]);

subplot(4,1,1)

plot(t(1:Nzoom),x(1:Nzoom),...
     'b','LineWidth',1.5)

hold on

plot(t(1:Nzoom),amp(1:Nzoom),...
     'r','LineWidth',2)

plot(t(1:Nzoom),-amp(1:Nzoom),...
     'r','LineWidth',2)

grid on

xlabel('Time (s)')
ylabel('Amplitude')

title('Signal + Hilbert Envelope (Zoomed)')

legend('Signal',...
       '+Envelope',...
       '-Envelope')

%% =========================================================
% AMPLITUDE
%% =========================================================

subplot(4,1,2)

plot(t(1:Nzoom),...
     amp(1:Nzoom),...
     'b',...
     'LineWidth',2)

grid on

xlabel('Time (s)')
ylabel('Amplitude')

title('Instantaneous Amplitude')

%% =========================================================
% PHASE
%% =========================================================

subplot(4,1,3)

plot(t(1:Nzoom),...
     phase(1:Nzoom),...
     'b',...
     'LineWidth',2)

grid on

xlabel('Time (s)')
ylabel('Phase (rad)')

title('Instantaneous Phase')

%% =========================================================
% FREQUENCY
%% =========================================================

subplot(4,1,4)

plot(t(1:Nzoom),...
     freq(1:Nzoom),...
     'Color',[0.8 0.8 0.8])

hold on

plot(t(1:Nzoom),...
     freqSmooth(1:Nzoom),...
     'b',...
     'LineWidth',2)

grid on

xlabel('Time (s)')
ylabel('Frequency (Hz)')

title('Instantaneous Frequency')

legend('Raw',...
       'Smoothed')

%% =========================================================
% FULL SIGNAL + ENVELOPE
%% =========================================================

figure('Color','w')

plot(t,x,...
     'b',...
     'LineWidth',1.2)

hold on

plot(t,amp,...
     'r',...
     'LineWidth',1.8)

plot(t,-amp,...
     'r',...
     'LineWidth',1.8)

grid on

xlabel('Time (s)')
ylabel('Amplitude')

title('Full Signal with Envelope')

legend('Signal',...
       '+Envelope',...
       '-Envelope')

%% =========================================================
% HILBERT SPECTRUM
%% =========================================================

figure('Color','w')

scatter(t,...
        freq,...
        10,...
        amp,...
        'filled')

xlabel('Time (s)')
ylabel('Frequency (Hz)')

title('Hilbert Spectrum')

colormap(jet)

cb = colorbar;
cb.Label.String = 'Amplitude';

grid on

%% =========================================================
% MARGINAL SPECTRUM
%% =========================================================

nbins = 200;

edges = linspace(min(freq),...
                 max(freq),...
                 nbins);

marginal = zeros(length(edges)-1,1);

for k = 1:length(edges)-1

    idx = freq >= edges(k) & ...
          freq < edges(k+1);

    marginal(k) = sum(amp(idx));

end

fc = edges(1:end-1);

figure('Color','w')

plot(fc,...
     marginal,...
     'b',...
     'LineWidth',2)

grid on

xlabel('Frequency (Hz)')
ylabel('Amplitude')

title('Hilbert Marginal Spectrum')

%% =========================================================
% SAVE RESULTS
%% =========================================================

Result = table(...
    t,...
    x,...
    amp,...
    phase,...
    freq,...
    freqSmooth,...
    'VariableNames',...
    {'Time',...
     'Signal',...
     'Amplitude',...
     'Phase',...
     'Frequency',...
     'FrequencySmooth'});

writetable(Result,...
    'Hilbert_Result_19.csv');

disp('Hilbert Analysis Completed');

%% =========================================================
% INTERACTIVE TOOLS
%% =========================================================

zoom on
pan on