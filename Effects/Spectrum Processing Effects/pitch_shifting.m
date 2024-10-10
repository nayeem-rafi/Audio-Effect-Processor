clc; clear; close all;
[y, Fs] = audioread('music.mp3');
while true
    nSemitones = input(['Enter nSemitones from -8 to 8 (Positive means deep, low frequency ' ...
        'and Negative means high frequency): '])
    if nSemitones >= -8 && nSemitones <= 8
        break;
    else
        disp('Error: Limit is -8 to +8. Please try again.'); 
    end
end
shiftFactor = 2^((-nSemitones)/12);

y1 = resample(y, round(Fs * shiftFactor), Fs);
audiowrite('output_pitch_shifted.wav', y1, Fs);
sound(y1, Fs);
subplot(2,1,1); plot(y); title('Original Audio');
subplot(2,1,2); plot(y1); title('Pitch Shifted Audio');