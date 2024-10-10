clc; clear all; close all;
[y, fs] = audioread('sound.mp3');

while true
    inp = input('Enter wet % (0 to 100): ');
    if inp >= 0 && inp <= 100
        break;
    else
        disp('Error: Limit is 0 to 100. Please try again.');
    end
end

wet = inp/100;
r = reverberator('SampleRate', fs, ...
    'PreDelay', 1, ...                
    'WetDryMix', wet, ...             
    'HighFrequencyDamping', 0.5);

y1 = r(y);
sound(y1, fs);
audiowrite('out_reverb.wav', y1, fs);
subplot(211);plot(y);title('original');
subplot(212);plot (y1);title('Reverb');