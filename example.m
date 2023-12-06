close all
% load audio files
load mtlb.mat
% Fs - sampling frequency
% mtlb - audio signal

% normalize audio signal
mtlb = mtlb./(max(abs(mtlb)));

% resample audio signal
re_Fs = 16000;
mtlb = resample(mtlb, re_Fs, Fs);

% Compressor settings
comp_value = 0.1;
disp = 1;

% Apply compression
[comp_y] = comp_simple(mtlb, comp_value, disp);

% Effective compression ratio
ms = 10;
[CR_input] = CR(mtlb, re_Fs, ms);    % compression range of input
[CR_output] = CR(comp_y, re_Fs, ms); % compression range of output 
[ECR_all] = ECR(CR_input, CR_output); % Effective compression ratio

% figure
figure()
plot(comp_y)
hold on
plot(mtlb)
hold off
axis([0 length(mtlb) -1 1])
xlabel('Samples')
ylabel('Amplutide')
legend('input signal','output signals')

figure()
plot(ECR_all)
xlabel('Freqency Hz')
ylabel('Effective compression ratio')
grid on
xticklabels({'125','250','500','1000','2000','4000','8000'})