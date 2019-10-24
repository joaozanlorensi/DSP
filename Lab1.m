clc
clear all

rec = true;

if rec
  recObj = audiorecorder;
  disp("Start speaking")
  recordblocking(recObj, 3);
  disp("End of recording");
  x = getaudiodata(recObj);
  Fs = recObj.SampleRate;
else
  load("handel")
  x = y;
  clear y;
endif

% sound(x,Fs);
b = [1];
tau = 50e-3;
D = tau*Fs;
a = [1, zeros(1, round(D)-1), -0.7];
y = filter(b, a, x);
sound(y, Fs)
pause

tau = 100e-3;
D = tau*Fs;
a = [1, zeros(1, round(D)-1), -0.7];
y = filter(b, a, x);
sound(y, Fs)
pause

tau = 500e-3;
D = tau*Fs;
a = [1, zeros(1, round(D)-1), -0.7];
y = filter(b, a, x);
sound(y, Fs)
pause