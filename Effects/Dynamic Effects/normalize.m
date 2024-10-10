clc; clear all; close all;
[y, Fs] = audioread('music.mp3'); 

peak = max(abs(y));
while true
    level = input('Enter level peak: ');
    if level >= 0 && level <= 5
        break;
    else
        disp('Error: Enter level peak between 0 and 5. Please try again.');
    end
end

y2 = (y / peak) * level;
audiowrite('output_normalized.wav', y2, Fs);
sound(y2, Fs);
subplot(211);plot(y);title('original');
subplot(212);plot (y2);title('Normalize');