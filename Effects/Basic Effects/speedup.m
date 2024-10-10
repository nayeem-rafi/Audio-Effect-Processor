clc;clear all; close all;

[y, Fs] = audioread('music.mp3'); 

while true
    inp = input('Enter speedup multiplying factor from 1x to 4x: ');
    if inp >= 1 && inp <= 4
        break; 
    else
        disp('Error: Multiplying factor must be between 1x and 4x. Please try again.');
    end
end
y1 =y;
nFs = Fs * inp; 
audiowrite('Audio.wav', y1, nFs);
subplot(211);plot(y,Fs);title('original');
subplot(212);plot (y1,nFs);title('Speed up');
sound(y, nFs);