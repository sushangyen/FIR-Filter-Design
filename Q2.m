clear all, close all, clc;
%% Q2
r_c=1.5;
angle =0;
theta_c=angle;
r_d =1/r_c;
theta_d = angle;
num=[1 -1*r_c*exp(1j*theta_c)];
den=[1 -1* r_d.*exp(1j* theta_d)];
Amp = -r_d*exp(-1j* angle); 
% num=[1,0.3, -0.6];
% den = [1, 0.7,0.2, -0.4];
[h,w] = freqz(num,den,500,'whole');
h = h* Amp;
%% calculate zplane for sketching
H_z = tf(Amp*num,den,1,'variable','z^-1');
figure;
zplane(Amp*num, den);

%%
figure;
plot(w, 20.*log10(abs(h)));
ylim([-5 5]);
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