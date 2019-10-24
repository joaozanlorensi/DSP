 % Estudante: Joao Pedro Zanlorensi Cardoso
 % Registro academico: 1937847

clc
clear all
pkg load signal

load('atividade_xcorr.mat');

% sound(r) % Sinal sem ruido
Time = 0:length(r)-1;
figure(1);
plot(Time, r);
xlabel('Time (s)');
ylabel('Clean');

% sound(x) % Sinal com ruido
Time = 0:length(x)-1;
figure(2);
plot(Time, x);
xlabel('Time (s)');
ylabel('Noisy');

[xCorr,lags] = xcorr(x, r);
figure(3)
% Representacao da cross-correlation entre o sinal limpo e ruidoso
plot(lags,xCorr);
grid;
xlabel('Lags (s)');
ylabel('Noisy');
axis tight;

[~,I] = max(abs(xCorr));
maxt = lags(I);
Trial = NaN(size(x));
Trial(maxt+1:maxt+length(r)) = r;
figure(4);
% Representacao do "fragmento" do sinal limpo em meio ao sinal ruidoso
plot(Time,x, Time, Trial);
xlabel('Time (s)');
ylabel('Noisy');
axis tight;