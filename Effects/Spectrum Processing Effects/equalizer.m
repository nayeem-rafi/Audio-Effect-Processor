clc;clear all;close all;
load('filters.mat');

[x, Fs] = audioread('music.mp3');

gain = zeros(1, 9);

while true
    inp = input('Enter 1 for own preference, 2 for Old Radio, and 3 for Lo-Fi Effect: ');
    if ismember(inp, [1, 2, 3]) && inp == floor(inp)
        break;
    else
        disp('Error: Please enter a whole number (1, 2, or 3). Try again.');
    end
end

if inp== 1
disp('Enter the gain values in dB for the 9 frequency bands:');
gain = zeros(1, 9);
for i = 1:9
    switch i
        case 1
            freqRange = '>85 Hz';
        case 2
            freqRange = '280 Hz';
        case 3
            freqRange = '450 Hz';
        case 4
            freqRange = '1 kHz';
        case 5
            freqRange = '3 kHz';
        case 6
            freqRange = '6 kHz';
        case 7
            freqRange = '10 kHz';
        case 8
            freqRange = '13 kHz';
        case 9
            freqRange = '16< kHz';
    end
    
    
    while true
        gain(i) = input(['Gain for ' freqRange ': ']);
        if gain(i) >= -25 && gain(i) <= 25
            break;
        else
            disp('Error: Gain must be between -25 dB and 25 dB. Try again.');
        end
    end
end

filter_type = input('Enter filter type (IIR=1, FIR=2): ');
end

if inp== 2
disp('Old Radio');
gain(1) = -22 ;
gain(2) = -18;
gain(3) = -10;
gain(4) = 0;
gain(5) = 8;
gain(6) = 10;
gain(7) = -8;
gain(8) = -15;
gain(9) = -25;
filter_type = 1;
end

if inp== 3
disp('Lo-Fi');
gain(1) = -15 ;
gain(2) = 0;
gain(3) = 2;
gain(4) = 0;
gain(5) = 4;
gain(6) = 4;
gain(7) = -1;
gain(8) = -6;
gain(9) = -8;
filter_type = 1;
end

if filter_type == 1
    y1 = filter(iir1, x) .* db2mag(gain(1));
    y2 = filter(iir2, x) .* db2mag(gain(2));
    y3 = filter(iir3, x) .* db2mag(gain(3));
    y4 = filter(iir4, x) .* db2mag(gain(4));
    y5 = filter(iir5, x) .* db2mag(gain(5));
    y6 = filter(iir6, x) .* db2mag(gain(6));
    y7 = filter(iir7, x) .* db2mag(gain(7));
    y8 = filter(iir8, x) .* db2mag(gain(8));
    y9 = filter(iir9, x) .* db2mag(gain(9));
else
    y1 = filter(fir1, x) .* db2mag(gain(1));
    y2 = filter(fir2, x) .* db2mag(gain(2));
    y3 = filter(fir3, x) .* db2mag(gain(3));
    y4 = filter(fir4, x) .* db2mag(gain(4));
    y5 = filter(fir5, x) .* db2mag(gain(5));
    y6 = filter(fir6, x) .* db2mag(gain(6));
    y7 = filter(fir7, x) .* db2mag(gain(7));
    y8 = filter(fir8, x) .* db2mag(gain(8));
    y9 = filter(fir9, x) .* db2mag(gain(9));
end
y = y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8 + y9;
t = (0:length(x)-1) / Fs;
sound(y,Fs);
subplot(2, 1, 1);plot(t, x);title('Original Signal');
subplot(2, 1, 2);plot(t, y);title('Filtered Output Signal');
audiowrite('filtered_output_all_bands.wav', y, Fs);
