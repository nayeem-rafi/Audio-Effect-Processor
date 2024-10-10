clc; clear all; close all;
[y, fs] = audioread('music.mp3');

while true
    threshold = input('Enter threshold (0 to -100 dB): ');
    if threshold >= -100 && threshold <= 0
        break; 
    else
        disp('Error: Enter threshold between 0 to -100 dB. Please try again.');
    end
end
while true
    ratio = input('Enter ratio (1 to 20): ');
    if ratio >= 1 && ratio <= 20
        break; 
        disp('Error: Enter ratio between 1 to 20. Please try again.');
    end
end
while true
    makeupgain = input('Enter makeup gain (1 to 10): ');
    if makeupgain >= 1 && makeupgain <= 10
        break;
    else
        disp('Error: Enter makeup gain between 1 to 10. Please try again.');
    end
end
while true
    attacktime = input('Enter attack time (0 to 1): ');
    if attacktime >= 0 && attacktime <= 1
        break;
    else
        disp('Error: Enter attack time between 0 to 1. Please try again.');
    end
end
while true
    releasetime = input('Enter release time (0 to 1): ');
    if releasetime >= 0 && releasetime <= 1
        break;
    else
        disp('Error: Enter release time between 0 to 1. Please try again.');
    end
end
thresholdLin = 10^(threshold / 20);
makeupgainLin = 10^(makeupgain / 20);
attackSamples = round(attacktime * fs);
releaseSamples = round(releasetime * fs);

y2 = zeros(size(y));


for channel = 1:size(y, 2) 
    gainEn = 1; 
    
    for n = 1:length(y)
        inputLevel = abs(y(n, channel)); 
        if inputLevel > thresholdLin
            gainReduct = 1 / ratio + (1 - 1 / ratio) * (thresholdLin / inputLevel);
        else
            gainReduct = 1; 
        end
        if gainReduct < gainEn
            gainEn = gainEn + (gainReduct - gainEn) / attackSamples;
        else
            gainEn = gainEn + (gainReduct - gainEn) / releaseSamples;
        end
        y2(n, channel) = y(n, channel) * gainEn;
    end
end
y2 = y2 * makeupgainLin;
y2 = min(max(y2, -1), 1);

audiowrite('output_compressed.wav', y2, fs);
sound(y2, fs);
subplot(211); plot(y(:,1)); title('Original Signal');
subplot(212); plot(y2(:,1)); title('Compressed Signal');