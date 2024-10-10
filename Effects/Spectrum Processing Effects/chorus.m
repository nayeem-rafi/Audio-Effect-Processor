
clc; clear all; close all;

[y, Fs] = audioread('music.mp3'); 

numVoices = 7;
while true
    delayT = input('Delay time (0 to 0.3): ');
    if delayT >= 0 && delayT <= 0.3
        break;
    else
        disp('Error: Delay time must be between 0 and 0.3. Please try again.');
    end
end

while true
    feedbackgain = input('Feedback gain (0 to 1): ');
    if feedbackgain >= 0 && feedbackgain <= 1
        break; 
    else
        disp('Error: Feedback gain must be between 0 and 1. Please try again.');
    end
end

depth = 0.005; 
rate = 0.5;
y_c = zeros(size(y));

t = (0:length(y)-1) / Fs; 
modulation = depth * sin(2 * pi * rate * t);


for i = 1:numVoices
    currentDelayTime = delayT +modulation; 
    currentDelaySamples = round(currentDelayTime * Fs); 

    delayedS = zeros(size(y)); 
    
    for n = 1:length(y)
       
        d = n - currentDelaySamples(n);
        if d > 0
            delayedS(n) = y(n) + feedbackgain * y(d);
        else
            delayedS(n) = y(n); 
        end
    end
 
    y_c = y_c + delayedS; 
end
y_c = y_c / max(abs(y_c));
audiowrite('output_chorus.wav', y_c, Fs);

sound(y_c, Fs);

figure;
subplot(2,1,1); plot(y); title('Original');
subplot(2,1,2); plot(y_c); title('Chorus');