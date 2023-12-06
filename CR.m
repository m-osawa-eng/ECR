function [CR_value] = CR(x, Fs, ms)
% Calculation of compression range.
% x  - input data
% Fs - sampling frequency
% ms - segment time ms
% CR_value - compression range

Fc = [125 250 500 1000 2000 4000 8000];
N = 3;
bandpassFreq = [];
bandpassFreq(:,1) = Fc/sqrt(2);
bandpassFreq(:,2) = Fc*sqrt(2);
bandpassFreq(length(Fc),2) = Fs/2-0.0001;


seg = floor(Fs/(1000/ms));
len_flame = floor(length(x)/seg);

CR_all = zeros(len_flame,length(bandpassFreq));

for count = 1:1:length(bandpassFreq)
    W1 = bandpassFreq(count,1)/(Fs/2);
    W2 = bandpassFreq(count,2)/(Fs/2);
    [B,A] = butter(N,[W1,W2]);
    x_temp = filter(B,A,x);
    ii = 1;
    for i = 1:seg:length(x)-seg
        CR_all(ii,count)=20*log10(rms(x_temp(i:i+seg)));
        ii = ii + 1;
    end
end

CR_temp = prctile(CR_all,[5 90],1);
CR_value = CR_temp(2,:) - CR_temp(1,:);
end