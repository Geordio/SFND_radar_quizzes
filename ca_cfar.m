% Implement 1D CFAR using lagging cells on the given noise and target scenario.

% Close and delete all currently open figures
close all;

% Data_points
Ns = 1000;

% Generate random noise
s=abs(randn(Ns,1));

%Targets location. Assigning bin 100, 200, 300 and 700 as Targets with the amplitudes of 8, 9, 4, 11.
s([100 ,200, 300, 700])=[8 9 4 11];

%plot the output
plot(s);

% TODO: Apply CFAR to detect the targets by filtering the noise.

% 1. Define the following:
% 1a. Training Cells
T = 12;

% 1b. Guard Cells 
G = 4;

% Offset : Adding room above noise threshold for desired SNR 
offset=5.5;

% Vector to hold threshold values 
threshold_cfar = [];

%Vector to hold final signal after thresholding
signal_cfar = [];


% 2. Slide window across the signal length
% (Ns-2*(G+T))= for leading and lagging; (Ns-2*(G+T)) = for lagging only
for i = 1:(Ns-2*(G+T))   
% for i = 1:(Ns-(G+T))     

    % 2. - 5. Determine the noise threshold by measuring it within the training cells
    lagging_sum = sum(s(i:i+T-1));
    lagging_mean = lagging_sum/T;
    fprintf("lagging sum: %d, lagging mean: %d\n", lagging_sum, lagging_mean);
    signal = s(i+T+G);
    
     leading_sum = sum(s(i+T+2*G+1:i+2*T+2*G));
     leading_mean = leading_sum/T;
     fprintf("leading sum: %d, leading sum: %d\n", leading_sum, leading_sum);    
%     threshold = (leading_sum + lagging_sum)/(2*T)*offset;
    threshold = (lagging_sum)/T*offset;
    
    threshold_cfar = [threshold_cfar, {threshold}];
    % 6. Measuring the signal within the CUT

    % 8. Filter the signal above the threshold
    if (signal<threshold)
     signal =0;
    end
    signal_cfar = [signal_cfar, {signal}];
end




% plot the filtered signal
plot (cell2mat(signal_cfar),'g--');

% plot original sig, threshold and filtered signal within the same figure.
figure,plot(s);
hold on,plot(cell2mat(circshift(threshold_cfar,G)),'r--','LineWidth',2)
hold on, plot (cell2mat(circshift(signal_cfar,(T+G))),'g--','LineWidth',4);
legend('Signal','CFAR Threshold','detection')