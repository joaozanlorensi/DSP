% Credits to <https://www.gaussianwaves.com/2014/07/sampling-a-signal-in-matlab/>

clc
clear all
close all

pkg load signal
pkg load control

f=1000; % Frequency of the signal
nCyl=10; % No of cycles generated
fs=25e3; % Very high sampling rate compared to f used to plot x almost as continuous
t=0:1/fs:nCyl*1/f; % Time index
x = myFunc(f,t);
 
% Plots the main signal

fs1=1.2e3; % Sampling frequency
t1=0:1/fs1:nCyl*1/f; % Time index
x1= myFunc(f,t1);

% Plots the main signal
plot(t,x);
title('Continuous and sampled signals');
xlabel('Time(s)');
ylabel('Amplitude');
hold on;

% Plots the sampled signal
stem(t1,x1);