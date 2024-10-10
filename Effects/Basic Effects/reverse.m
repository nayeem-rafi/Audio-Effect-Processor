clc; clear all; close all;
outputFile = 'reverse.wav';

[y, Fs] = audioread( 'sound7.mp3');

y_re = flipud(y);
audiowrite(outputFile, y_re, Fs);

sound(y_re, Fs);
subplot(211);plot(y);title('original');
subplot(212);plot (y_re);title('reversed');