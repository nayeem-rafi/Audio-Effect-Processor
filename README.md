# Audio Effect Processor
By [Naimur Rahman](https://github.com/nayeem-rafi), [Md. Nayon Khan](https://github.com/nayon045), [Suvom Karmakar](https://github.com/suvom027).

## [Click for Open Source of Project Details & Video](https://drive.google.com/drive/folders/1DnzlJkw3hlO5iq0watlQuw7EBvpG2Dsl?usp=drive_link)
## Abstract
This project report documents the design and implementation of an Audio Effects
Processor using MATLAB, focusing on providing real-time manipulation of audio
signals through various digital signal processing (DSP) techniques. The system
enables the application of multiple audio effects like gain, echo, reverb, distortion,
speed adjustment, and more. This report covers the architecture, design
methodology, user interface development, and performance of our processor,
providing a comprehensive guide for anyone interested in understanding or
replicating this project.

## Introduction
In the era of digital sound manipulation, there is an ever-growing need for flexible
and effective tools that allow users to modify audio in creative ways. This project
is aimed at designing and implementing a MATLAB-based Audio Effects Processor,
which offers a variety of effects ranging from simple gain adjustments to more complex
effects such as reverb and chorus. The project is designed to demonstrate the practical
applications of DSP techniques, enabling users to manipulate audio easily through an
App Designer.

## Components
• **Computer**:  
A personal computer for developing and running the processor.

• **MATLAB Software**:  
The main development environment used for implementing the effects and building the App Designer.


## Methodology
The Audio Effects Processor implements the following effects. Each effect is implemented
using Digital Signal Preocessing(DSP) techniques that manipulate the audio
waveform in distinct ways.

## User Interface
We developed a user-friendly Interface using MATLAB’s App Designer, enabling users to
interact with the processor without needing to understand the underlying code. This
Interface significantly improves the accessibility of our system, catering to both experienced users and novices in DSP. We made two interfaces:
• **User Interface for all Effects**  

• **User Interface for Reverse Effects**

### Buttons In Interface
• **Browse button for file choose**  

• **All available effect buttons**  

• **Button to apply effect**  

• **Play different audios**  

• **Reset button**  

• **Save button**

### Features
• **User can choose any file by browsing**  

• **Can see both original and effected graph**  

• **Can save the audio**  

• **Can apply multiple effects over one audio**
<h1 align= "center">

**App Interface**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/c20c9456-8fa6-40fd-bbc6-5c1bb6bed35c", width="720">
</p>

## Basic Effects
### Gain
The Gain effect changes the volume of the audio. Anyone can make it louder or
quieter by adjusting the gain. It works by multiplying the audio signal by a certain
factor—higher values make the sound louder, and values¡1 make it quieter.

#### Implementation
The audio signal is multiplied by a user-specified gain factor to increase or decrease
volume.
#### Input and output Analysis
We gave a limit of 0 to 4 times for gain. Below one for lowering the sound and more
than one to boost the sound. We had keep the limit because more than 4 times gain
can cause distortion in audio. Below a sample of input and output is given where
first we gave input 2x boost. We find out our gaining effect is
perfectly working from amplitude analysis of the signal.
<h1 align= "center">

**Gain**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/3744e1f8-0be6-430f-94b6-7292adf97912", width="620">
</p>

### Trimming
Trimming means cutting a certain section of an audio, anywhere , any section of the
audio according to users preference.
#### Implementation
From the user input, from starting time to end time, we find out the total sample and
audio write that portion in a new signal variable.
#### Input and output Analysis
We make a limit in input like if user put end point time second larger than audio
signal than we had convert it to the end time. Here in this sample we choose to test it
by trimming 3 to 6 sec portion where from graph we got to know that it is working.
X-axis difference is because original and trimmed one respectively in 10ˆ5 and 10ˆ4.
<h1 align= "center">

**Trim**
</h1>

<p align="center">
<img src="https://github.com/user-attachments/assets/7e20b060-afb0-4c29-b3a3-7a73c6a0a43f", width="620">
</p>

### Fade In
The Fade In effect gradually increases the volume of the audio upto the point user
wanted and finally reach the maximum level and stay in max. The effect doesn’t have any extra gaining. So it starts soft and then becomes louder. This is useful for making
smooth transitions into a track.
#### Implementation
A linear ramp is applied to the initial part of the audio signal, gradually increasing
the amplitude to maximum.
#### Input and output Analysis
Here user can choose how much percentage of the audio will be affected by fade-in
effect. For example, here we choose 70 percent of our audio would be faded in.
<h1 align= "center">

**Fade In**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/f20ac608-6a1b-444f-8cd6-511086672d6d", width="620">
</p>

### Fade Out
The Fade Out effect does the opposite of fade-in. It gradually decreases the volume
at the end of the audio, so it fades into silence. This creates a smooth ending.
#### implementation
A linear ramp is applied to the end of the audio signal, reducing the amplitude to zero.

#### Input and output Analysis
Here user can choose how much percentage of the audio will be affected by fade-out
effect. For example, here we choose 90 percent of our audio would be faded out.
<h1 align= "center">

**Fade Out**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/6f5a9008-cc91-41cb-b7ad-fb1eff960e72", width="620">
</p>

### Reverse
The Reverse effect plays the audio backward, starting from the end and moving toward
the beginning.
#### Implementation
A matlab function ”flipud” used to flip the audio and play from the backward.
#### Input and output Analysis
Audio will be reversed like one to ten counting audio will be reversed, ten to one but
ten will be spelled as reversed ”net” and one will be ”eno”. Here is the sample output.
<h1 align= "center">

**Reverse**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/26807570-6777-4cdc-bb18-5c9191fb9cb4", width="620">
</p>

### Speed Up
The Speed Up effect changes the playback speed of the audio. Speeding it up makes
it play faster.
#### Implementation
Multiplying frequency is applied to the audio to change its duration, speeding it up
without altering pitch.
#### Input and output Analysis
User can chose how much faster they want the audio to be. They can choose between
1 to 4 times. From the graph we can’t analyse this effect. If signal plotted with time
it can be inspected.
<h1 align= "center">

**Speed Up**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/f064e997-256f-4cde-9edc-010852af75da", width="620">
</p>

## Dynamic Effects

### Compressor
The Compressor reduces the difference between the loud and soft parts of the audio.
If a sound gets too loud, the compressor lowers the volume to make it more balanced,
so the listener doesn’t have to adjust the volume constantly.
#### Implementation
Compression is applied based on a threshold, ratio, makeupgain, attacktime, releasetime
reducing the amplitude of loud sections. Threshold is limit, where if sound passes
threshold then it will be decrease according to the ratio, like if ration is 5 means after
passing threshold every 5dB will be converted to 1dB. Make up gain is additional
gain if user wanted to have gain then attacktime is how quickly the compressor reacts and starts reducing the volume (gain reduction) after the audio signal exceeds the
threshold and The release time refers to how quickly the compressor stops compressing
(returns the gain back to normal) once the signal falls below the threshold.
#### Input and output Analysis
Here as a sample input threshold set to -85dB, attacktime 0.1s,releasetime
0.01s,makeupgain 1 and ratio 5.
<h1 align= "center">

**Compressor**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/03520d51-4959-4b35-a1c8-2ba543beef0b", width="620">
</p>

### Distortion
The Distortion effect changes the audio to make it sound rough or gritty, usually by
increasing the signal strength beyond its limits. This can give the sound a fuzzy or
overdriven quality, often used in electric guitars.
#### Implementation
The signal is clipped or non-linearly transformed to create harmonic distortion.
#### Input and output Analysis
User can choose amplifying factor to have more distortion. Here in this sample, input
of amplifying given 1.
<h1 align= "center">

**Distortion**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/1316d5c5-aa44-4f18-9055-ad9237a20dd3", width="620">
</p>

### Normalize
The Normalize effect adjusts the overall volume so that the loudest part of the audio
reaches a target level. It ensures the audio isn’t too soft or too loud by scaling the
volume to a certain point.
#### Implementation
The signal is scaled proportionally to reach the desired peak value.
#### Input and output Analysis
User can choose the peak of the signal. The normalized signal basically scaled at
amplitude of1 then multiply with user gain. Here is an example output with peak 1
chosen.
<h1 align= "center">

**Normalize**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/d51e7295-2a54-40e3-8f31-2f5b32271dce", width="620">
</p>

## Time Based Effects

### Reverb
The Reverb effect simulates how sound behaves in a space like a room or hall. It adds
a sense of space and depth to the audio by creating small echoes, making the sound
feel more ”live” or distant.
#### Implementation
We used a matlab built-in function which convolve the audio signal with an impulse
response, simulating the reverberation of a specific environment. The function take
sample rate of the signal, Pre- delay, wet, high frequency damping factor. We fixed all
of the factor for reverb and let the user to handle wet mixing. Here, Pre-delay is the
amount of time between the original sound (the dry signal) and when the reverb effect
begins. It’s essentially a delay before the reverb kicks in and wet means the percentage
of signal affected by reverb effect and high-frequency damping refers to how the higher
frequencies in the reverb decay compared to lower frequencies.

#### Input and output Analysis
User can chose wet mixing percentage fo reverb effect. For example, in the sample her
we choose wet to be 100 percent.
<h1 align= "center">

**Reverb**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/7bb1872d-c1be-4555-99db-f84f2dafc8fd", width="620">
</p>

### Echo
The Echo effect is like delay but with multiple repetitions. Each time the sound repeats,
it becomes softer and softer, giving the impression of sound bouncing off walls, like in
a canyon or large room.
#### Implementation
We created echo by delaying the original signal and adding it to itself with reduced
amplitude. This is done by appending zeros to the signal, shifting it, scaling it, and
adding it back to the original signal by taking delay time(0-0.5)s input from user.
#### Input and output Analysis
Here as a sample we choose 0.1 as delay time.
<h1 align= "center">

**Echo**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/fc9fbd49-9afc-4674-afd7-d84cfed6b2d1", width="620">
</p>

### Delay
The Delay effect adds a copy of the audio that plays after a short pause. This
delayed copy is mixed with the original sound, making it sound like there’s an echo or
repetition.
#### Implementation
Echo and delay effect are quite similar but in delay their is more delay time than echo
and no attenuation in echoes.
#### Input and output Analysis
Here we take delay time 1 to 4 s as user input. In the sample we tested with delay
time of 2s.
<h1 align= "center">

**Delay**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/46cde784-7e09-4483-8b88-a761ae7feb6c", width="620">
</p>

## Spectrum Processing Effects

### Chorus
The Chorus effect creates a richer, fuller sound by layering the original audio with
slightly delayed and pitch-shifted versions of itself. This makes it sound like multiple
people or instruments are playing the same part.
#### Implementation
The chorus effect created by duplicating the original signal, applying small, varying
delays to each copy, and mixing them back with the original. This simulates the effect
of multiple voices or instruments playing the same note with slight timing variations.
#### Input and output Analysis
Here user can give input delay time in seconds 0 to 0.3 and a feedback gain 0 to 1.
That means delayed multiples of original sound gain would be same or less according
to user needs. Here, in example output we choose delay time as 0.1 and feedback gain
of 1.
<h1 align= "center">

**Chorus**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/ab3ac71d-0dad-4549-989c-0c0405b75c51", width="620">
</p>

### Pitch shifting
Pitch shifting changes the pitch of the audio without affecting the speed can create
deep to shallow voices by changes in voice frequency caused by shift of pitch.
#### Implementation
We pitch shifting achieve by resampling the signal at a different rate, effectively changing
its pitch. We have used matlab built-in function shiftpitch to resample and shift
the pitch.
#### Input and output Analysis
User can choose semitones pitch shifting parameter from -8 to 8. More positive means
higher frequency voice and negative means lower frequency deep voice. Here we chose
two outputs taking semitones of -5 and +5 and we can analyse pitch shifting from
graph by look over x axis.

<h2 align="center">


**Pitch Shift(-5)**
</h2>

<p align="center">
<img src="https://github.com/user-attachments/assets/f3e73999-5212-4bc9-a4e5-7aa8334da430", width="620">
</p>

<h2 align= "center">

**Pitch Shift(+5)**
</h2>

<p align="center">
<img src="https://github.com/user-attachments/assets/770a2f61-0a19-4794-becf-864b6fa8976f", width="620">
</p>

### Equalizer
The Equalization (EQ) effect adjusts the balance of different frequency ranges in the
audio. We can boost or reduce the bass, mids, or treble to change the tone of the
sound, similar to adjusting the ”bass” and ”treble” on a stereo.

#### Implementation
A 9-band equalizer is implemented using filters to control low, mid, and high-frequency
content. We keep both IIR and FIR filters and we choose 1st band 85 Hz, 2nd band
280 Hz, 3rd band 450 Hz, 4th band 1kHz, 5th band 3 KHz, 6th band 6 KHz, 7th band
10 KHz, 8th band 13 KHz and 9th band 16 KHz. Two basic effects were given built
in, they are ’Old Radio’ and Lo-Fi effect
#### Input and output Analysis
User can choose gain for every bands in dB. Here 3 output sample shown for random
input of Gain for 85 Hz: -20, Gain for 280 Hz: -16, Gain for 450 Hz: -14, Gain for 1000
Hz: -8, Gain for 3 kHz: -4, Gain for 6 kHz: 0, Gain for 10 kHz: 4, Gain for 13 kHz: 10,
Gain for 16 kHz: 12, filter type IIR and 2nd output for old radio effect and 3rd one
for Lo-Fi.

<h2 align= "center">

**Band Input Interface**
</h2>

<p align="center">
<img src="https://github.com/user-attachments/assets/853d247c-3f20-4e47-8404-a7cc6593a629", width="620">
</p>

<h2 align= "center">

**Random Input Equalizer**
</h2>

<p align="center">
<img src="https://github.com/user-attachments/assets/e4886ca4-cca2-42fa-8ee2-ed895d4ec5ba", width="620">
</p>

<h2 align= "center">

**Old Radio Effect by Equalizer**
</h2>
<p align="center">
<img src="https://github.com/user-attachments/assets/e344d466-d503-4cd2-b700-13c0b986637f", width="620">
</p>

<h1 align= "center">

**Lo-fi Effect by Equalizer**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/efb0dc92-d83f-475c-8d83-d1bc7538aef3", width="620">
</p>

## Result & Analysis
Our system successfully implements all audio effects expect some reverse and provides
intuitive controls for each. We tested it using various audio types, including speech
and music, and the effects were applied effectively. Users can quickly modify audio
and hear the impact of their chosen effects in real-time, demonstrating the processor’s
usability and flexibility.
## Application
• **Real-Time Audio Processing**  

• **Audio Editing and Production**  

• **Research in Audio Analysis**  

• **Interactive Audio Applications**

## Conclusion
The Audio Effects Processor project highlights the power of DSP in audio manipulation,
successfully integrating various effects into a cohesive and easy-to-use system. The
project’s practical application of DSP techniques, combined with a user-friendly interface,
offers a valuable tool for audio enthusiasts and professionals. Future work could
focus on optimizing the system for real-time processing and extending its capabilities
with more advanced effects.
