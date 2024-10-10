clc; clear all; close all;
[y, Fs] = audioread('sound7.mp3'); 
while true
    gain = input('Enter amplifying factor (up to 50): ');
    if gain >= 0 && gain <= 50
        break;
    else
        disp('Error: Amplifying factor must be between 0 and 50. Please try again.');
    end
end

threshold = 0.09;  

y1 = gain * y;

y1(y1 > threshold) = threshold; 
y1(y1 < -threshold) = -threshold; 
y1 = y1 / max(abs(y1));

audiowrite('output_distorted.wav', y1, Fs);

sound(y1, Fs);

subplot(211); plot(y); title('Original Audio');
subplot(212); plot(y1); title('Distorted Audio');