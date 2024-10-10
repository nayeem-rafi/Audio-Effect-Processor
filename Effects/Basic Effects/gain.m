clc; clear all; close all;

[y, Fs] = audioread('sound7.mp3');

while true
    inp = input('Enter multiplying factor (0 to 4 times): ');
    
    if inp >=0 && inp <=4
        break;
    else
        disp('Invalid input! Please enter a value between 0 and 4.');
    end
end
gain = inp * y;
audiowrite('music.wav', gain, Fs);
sound(gain, Fs);
subplot(2,1,1); plot(y); title('Original');
subplot(2,1,2); plot(gain); title('Gained');