[x,FS] = audioread('speech.wav'); 
[v,FS] = audioread('noise.wav');
y = x + v;

%%%C.1
N = 50;
w_cut = [300*2/FS, 3300*2/FS];
hbpn_b = fir1(N, w_cut, 'band');
freqz(hbpn_b,1,1024);
y_bpf = filter(hbpn_b,1,y);
%%soundsc(y_bpf,FS);
[h_b, w_b]=freqz(hbpn_b,1,1024);
xlabel('Frequency in radians','FontSize',14);
ylabel('Log magnitude in dB','FontSize',14);
title([num2str(N),'th order Band-pass FIR filter'],'FontSize',14);

%%%C.2
W1 = 500;
ov = 0.5;
noverlap1 = W1*ov;

w=500;
spectrogram(y_bpf, W1, noverlap1, W1,'yaxis');

%%%C.4
N = 50;
w_cut = [0.0375, 0.26];
hbpn_b = fir1(N, w_cut, 'band');
freqz(hbpn_b,1,1024);
y_bpf = filter(hbpn_b,1,y);
soundsc(y_bpf,FS);
[h_b, w_b]=freqz(hbpn_b,1,1024);
xlabel('Frequency in radians','FontSize',14);
ylabel('Log magnitude in dB','FontSize',14);
title([num2str(N),'th order Band-pass FIR filter'],'FontSize',14);

%%%C.5
W1 = 500;
ov = 0.5;
noverlap1 = W1*ov;

w=500;
spectrogram(y_bpf, W1, noverlap1, W1,'yaxis');