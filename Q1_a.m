clear all, close all, clc;
%% Tutorial Q1.(a) z= 0.6*exp(j* pi), p = 0.4*exp(j* 0)
r_c=0.6;
theta_c=pi;
r_d = 0.4;
theta_d = 0;
num=[1 -1*r_c*exp(1i*theta_c)];
den=[1 -1* r_d*exp(1j* theta_d)];
[h,w] = freqz(num,den,500,'whole');

%% calculate zplane for sketching
H_z = tf(num,den,1,'variable','z^-1');
figure;
zplane(num, den);

%%
figure;
plot(w, 20.*log10(abs(h)));
xlabel('\omega (rad)');
ylabel('Log Magnidute (dB)');
figure;
plot(w, phase(h));
xlabel('\omega (rad)');
ylabel('Phase (in radians)');
figure;
[gd,w] = grpdelay(num,den,500,'whole');
plot(w, gd);
xlabel('\omega (rad)');
ylabel('Group delay (in samples)');