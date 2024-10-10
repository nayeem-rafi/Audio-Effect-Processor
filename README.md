# Audio Effect Processor
By [Naimur Rahman](https://github.com/nayeem-rafi), [Md. Nayon Khan](https://github.com/nayon045), [Shuvom Karmakar](https://github.com/suvom027).
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
• Computer: A personal computer for developing and running the processor.
• MATLAB Software: The main development environment used for implementing
the effects and building the App Designer.

## Methodology
The Audio Effects Processor implements the following effects. Each effect is implemented
using Digital Signal Preocessing(DSP) techniques that manipulate the audio
waveform in distinct ways.

## Basic Effects
### Gain
The Gain effect changes the volume of the audio. Anyone can make it louder or
quieter by adjusting the gain. It works by multiplying the audio signal by a certain
factor—higher values make the sound louder, and values¡1 make it quieter.

#### Implentation
The audio signal is multiplied by a user-specified gain factor to increase or decrease
volume.
#### Input and output Analysis
We gave a limit of 0 to 4 times for gain. Below one for lowering the sound and more
than one to boost the sound. We had keep the limit because more than 4 times gain
can cause distortion in audio. Below a sample of input and output is given where
first we gave input 2x boost and then we gave 0.5x. We find out our gaining effect is
perfectly working from amplitude analysis of the signal.
<p align="left">
<img src="https://drive.google.com/file/d/1Jiu_HLv1czR9bpyVBPLhuixunMI3Mc1Q/view?usp=drive_link", width="720">
</p>
### Trimming
