clc;clear all;close all;

[y, Fs] = audioread('music.mp3');

while true
    delayTime = input('Enter delay time 1 to 4: ');

    if delayTime >= 1 && delayTime <= 4
        break; 
    else
        disp('Error: Delay time must be in 1 to 4. Please try again.'); 
    end
end
feedback = 0.75; 
mix = 0.75;
delaySamples = round(delayTime * Fs);
Buffer = zeros(size(y, 1) + delaySamples, size(y, 2));
for n = 1:size(y, 1)
    Buffer(n + delaySamples, :) = y(n, :) + feedback * Buffer(n, :);
end
y1 = (1 - mix) * y + mix * Buffer(1:size(y, 1), :);
audiowrite('output_delay.wav', y1, Fs);
sound(y1, Fs);
subplot(211);plot(y);title('original');
subplot(212);plot (y1);title('Delay');