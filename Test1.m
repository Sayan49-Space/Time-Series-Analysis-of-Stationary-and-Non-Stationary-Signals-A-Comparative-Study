clc;
clear;
close all;

%% Folder Path
folderPath = 'C:\Users\sayan\Desktop\Time Series Analysis Project\CTCS Data Time Series';

%% Read files
files = dir(fullfile(folderPath,'*.txt'));

%% Natural sorting
[~,idx] = sort(str2double(erase({files.name},'.txt')));
files = files(idx);

numFiles = length(files);

%% Final K values
K_final = zeros(numFiles,1);

%% c values between 0 and pi
c_values = linspace(0.1, pi-0.1, 100);

%% LOOP OVER FILES
for f = 1:numFiles

    %% Read data
    fileName = fullfile(folderPath, files(f).name);

    data = readmatrix(fileName);

    %% Signal
    x = data(:,2);

    %% Remove NaN
    x = x(~isnan(x));

    %% Remove mean
    x = x - mean(x);

    %% Normalize
    x = x/std(x);

    N = length(x);

    n = (1:N)';

    %% Store K values for different c
    Kc = zeros(length(c_values),1);

    %% LOOP OVER c VALUES
    for j = 1:length(c_values)

        c = c_values(j);

        %% Translation variables
        p = cumsum(x .* cos(c*n));
        q = cumsum(x .* sin(c*n));

        %% Mean square displacement
        M = zeros(floor(N/10),1);

        for m = 1:floor(N/10)

            dp = p(m+1:end) - p(1:end-m);
            dq = q(m+1:end) - q(1:end-m);

            M(m) = mean(dp.^2 + dq.^2);

        end

        %% Correlation coefficient
        mm = (1:length(M))';

        C = corrcoef(mm,M);

        Kc(j) = C(1,2);

    end

    %% Median K
    K_final(f) = median(Kc);

    fprintf('File %d ---> K = %.4f\n', ...
        f, K_final(f));

end

%% Remove negative values
K_final(K_final < 0) = 0;

%% Smooth slightly
K_final = smoothdata(K_final,'movmean',2);

%% Plot
figure('Color','w');

plot(1:numFiles, K_final, 'ob', ...
    'MarkerFaceColor','b', ...
    'MarkerSize',6);

hold on;

plot(1:numFiles, K_final, '-b', ...
    'LineWidth',1.5);

xlabel('File Number','FontSize',12);
ylabel('K Value','FontSize',12);

title('0-1 Chaos Test','FontSize',14);

grid on;
box on;

xlim([1 numFiles]);
ylim([0 1]);

%% Save figure
saveas(gcf,'0_1_Chaos_Test.png');

disp('DONE');