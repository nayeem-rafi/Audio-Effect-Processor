clc;clear all;close all;

[y, Fs] = audioread('sound.mp3');

nsamples = length(y);
while true
    x = input('Enter percentage of signal you want to fade out (0 to 100): ');
    if x >= 0 && x <= 100
        break; 
    else
        disp('Error: Percentage must be between 0 and 100. Please try again.');
    end
end

if x==0
    yFin=y;
else
gradin = round(nsamples*(x/100));
T = nsamples / Fs;

fadeout = [linspace(1, 0,gradin), zeros(1, nsamples - gradin)]';

if size(y, 2) > 1
    fadeout = [fadeout, fadeout]; 
end

yFin = y .* fadeout;
end
audiowrite('music.wav', yFin, Fs);

sound(yFin, Fs);
subplot(211);plot(y);title('original');
subplot(212);plot (yFin);title('Fade out');