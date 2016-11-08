clear all, close all, clc;
%% Tutorial Q3
r_c=-2;    
theta_c=0;
r_d = 0.5;
theta_d = 0;
num=[1 -1*r_c*exp(1i*theta_c)];
den=[1 -1* r_d*exp(1j* theta_d)];
[h,w] = freqz(num,den,500,'whole');

%% calculate zplane for sketching
H_z = tf(num,den,1,'variable','z^-1');
figure;
zplane(num, den);title('H (e^{j \omega})');

%%
figure;
plot(w, 20.*log10(abs(h)));title('H (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Log Magnidute (dB)');
figure;
plot(w, phase(h));title('H (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Phase (in radians)');
figure;
[gd,w] = grpdelay(num,den,500,'whole');
plot(w, gd);title('H (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Group delay (in samples)');

%% minimum-phase decomposition
r_c_min = -0.5;
theta_c_min = 0;
r_d_min = 0.5;
theta_d_min = 0;
Amp = 2;
num_min=[1 -1*r_c_min*exp(1i*theta_c_min)];
den_min=[1 -1* r_d_min*exp(1j* theta_d_min)];
[h_min,w_min] = freqz(num_min,den_min,500,'whole');
H_z = tf(num_min,den_min,1,'variable','z^-1');
figure;
zplane(num_min, den_min);title('H_{min} (e^{j \omega})');

h_min = h_min * Amp;
figure;
plot(w_min, 20.*log10(abs(h_min)));title('H_{min} (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Log Magnidute (dB)');
figure;
plot(w_min, phase(h_min));title('H_{min} (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Phase (in radians)');
figure;
[gd_min,w_min] = grpdelay(num_min,den_min,500,'whole');
plot(w_min, gd_min);title('H_{{min}} (e^{j \omega})');
xlabel('\omega (rad)');
ylabel('Group delay (in samples)');