clc; clear all; close all;

inputFile = 'sound.mp3';
outputFile = 'outputaudio.wav';
[y, Fs] = audioread(inputFile);
while true
    st = input('Enter starting time (in seconds): ');
    ct = input('Enter ending time (in seconds): ');
    
    if st < 0 || ct < 0
        disp('Error: Start and end times cannot be negative. Please enter valid times.');
    elseif st >= ct
        disp('Error: End time must be greater than start time. Please try again.');
    else
        break; 
    end
end

stSample = round(st * Fs);
ctSample = round(ct * Fs);

if stSample < 1
stSample = 1;
end
if ctSample > length(y)
ctSample = length(y);
end

y1 = y(stSample:ctSample, :);
audiowrite(outputFile, y1, Fs);

[y1, Fs1] = audioread(outputFile);
sound(y1, Fs1);
subplot(211);plot(y);title('original');
subplot(212);plot (y1);title('trimmed');