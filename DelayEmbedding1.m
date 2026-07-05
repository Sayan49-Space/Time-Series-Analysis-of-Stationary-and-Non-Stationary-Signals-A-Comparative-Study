%% ============================================================
% Delay Embedding & Takens Phase Space Reconstruction
% Author:
% =============================================================

clear;
clc;
close all;

%% Load Data
folder = 'C:\Users\sayan\Desktop\Time Series Analysis Project\CTCS Data Time Series';
filename = '11 (1).txt';     % Change filename if needed

data = load(fullfile(folder,filename));

time = data(:,1);
signal = data(:,2);

%% Remove Mean
signal = signal - mean(signal);

%% Time Vector
time = time - time(1);

%% Sampling Frequency
dt = mean(diff(time));
Fs = 1/dt;

fprintf('Sampling Frequency = %.2f Hz\n',Fs);

%% Plot Original Signal
figure('Name','Original Signal')

plot(time,signal,'b','LineWidth',1)

xlabel('Time (s)')
ylabel('Amplitude')
title('Original Signal')
grid on

%% ============================================================
% Estimate Delay using Autocorrelation
%% ============================================================

[r,lags] = xcorr(signal,'coeff');

r = r(lags>=0);
lags = lags(lags>=0);

figure('Name','Autocorrelation')

plot(lags,r,'LineWidth',1.5)

xlabel('Lag')
ylabel('Autocorrelation')
title('Autocorrelation Function')
grid on

%% First Zero Crossing

tau = find(r<0,1);

if isempty(tau)
    tau = 20;
end

fprintf('\nEstimated Delay (tau) = %d samples\n',tau);

%% ============================================================
% Embedding Dimension
%% ============================================================

m = 3;

fprintf('Embedding Dimension = %d\n',m);

%% ============================================================
% Delay Embedding
%% ============================================================

N = length(signal);

M = N-(m-1)*tau;

X = zeros(M,m);

for i=1:M

    X(i,1)=signal(i);
    X(i,2)=signal(i+tau);
    X(i,3)=signal(i+2*tau);

end

%% ============================================================
% 2D Delay Embedding
%% ============================================================

figure('Name','2D Delay Embedding')

plot(X(:,1),X(:,2),'k')

xlabel('x(t)')
ylabel('x(t+\tau)')

title('2D Delay Embedding')

grid on
axis equal

%% ============================================================
% 3D Takens Embedding
%% ============================================================

figure('Name','Takens Phase Space')

plot3(X(:,1),X(:,2),X(:,3),'b')

xlabel('x(t)')
ylabel('x(t+\tau)')
zlabel('x(t+2\tau)')

title('Takens Phase Space Reconstruction')

grid on
axis tight

view(45,30)

%% ============================================================
% Colored Attractor
%% ============================================================

figure('Name','Colored Attractor')

scatter3(X(:,1),X(:,2),X(:,3),6,1:length(X),'filled')

xlabel('x(t)')
ylabel('x(t+\tau)')
zlabel('x(t+2\tau)')

title('Takens Delay Embedded Attractor')

grid on
view(45,30)

colorbar

%% ============================================================
% Rotating View
%% ============================================================

figure('Name','Rotating 3D Attractor')

plot3(X(:,1),X(:,2),X(:,3),'r')

xlabel('x(t)')
ylabel('x(t+\tau)')
zlabel('x(t+2\tau)')

grid on

title('Rotating Takens Attractor')

for angle=1:360
    view(angle,30)
    drawnow
end

%% ============================================================
% Delay Coordinates
%% ============================================================

figure('Name','Delay Coordinates')

subplot(3,1,1)
plot(X(:,1))
ylabel('x(t)')
grid on

subplot(3,1,2)
plot(X(:,2))
ylabel('x(t+\tau)')
grid on

subplot(3,1,3)
plot(X(:,3))
ylabel('x(t+2\tau)')
xlabel('Samples')
grid on

%% ============================================================
% Statistics
%% ============================================================

fprintf('\n');
fprintf('Number of Samples      : %d\n',length(signal));
fprintf('Delay                  : %d samples\n',tau);
fprintf('Embedding Dimension    : %d\n',m);
fprintf('Embedded Points        : %d\n',size(X,1));

disp('------------------------------------------');
disp('Takens Phase Space Reconstruction Complete');
disp('------------------------------------------');