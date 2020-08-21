%% define a signal amplitude=A frequency = f
%signal = A*cos(2*pi*f*t);

% run fft N = number of samples
% only care about magnitude so abs it. 
%signal_fft = fft(signal,N);
%signal_fft = abs(signal_fft);

%signal_fft = signal_fft(1:L/2-1);
%%

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector
A1 = 0.7;              % amplitude1
f1 = 77;
A2 = 2;
f2 = 43;


% TODO: Form a signal containing a 77 Hz sinusoid of amplitude 0.7 and a 43Hz sinusoid of amplitude 2.
S = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t)

% Corrupt the signal with noise 
X = S + 2*randn(size(t));

% Plot the noisy signal in the time domain. It is difficult to identify the frequency components by looking at the signal X(t). 
plot(1000*t(1:50) ,X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

% TODO : Compute the Fourier transform of the signal. 
Y = fft(X);

% TODO : Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(Y/L); % normalise first

P1 = P2(1:L/2+1);


% Plotting
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')