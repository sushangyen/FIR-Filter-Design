%%%Part A.
[x,FS] = audioread('speech.wav'); 
[v,FS] = audioread('noise.wav');
 
%%%A.1
y = x + v;
 
subplot(3,1,1);
plot(x);
xlabel('n');
ylabel('x[n]');
subplot(3,1,2);
plot(v);
xlabel('n');
ylabel('v[n]');
subplot(3,1,3);
plot(y);
xlabel('n');
ylabel('y[n]');
%%%
 
%%%A.2
s1 = FS*0.80;
s2 = FS*0.83;
x_cut = x(s1:s2);
y_cut = y(s1:s2);
X_CUT_FFT = fft(x_cut);
Y_CUT_FFT = fft(y_cut);
log_x = 20*log10(abs(X_CUT_FFT));
log_y = 20*log10(abs(Y_CUT_FFT));
 
subplot(2,1,1);
plot(log_x);
xlabel('n');
ylabel('x[n]');
subplot(2,1,2);
plot(log_y);
xlabel('n');
ylabel('v[n]');
