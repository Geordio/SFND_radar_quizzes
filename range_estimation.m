%d_res = c / 2 * B_sweep;

% better to represent as 3e8
c = 3*10^8;

d_res = 1;
R_max = 300;

B_sweep = c/2*d_res;

% sweep time (chirp time)
Ts = 5.5 * R_max *2 / c;

%fb = f_tx - f_rx;

f_b = 0;
R = c *  Ts * f_b / (2 * B_sweep);
disp(R);
f_b = 1.1*10^6;
R = c *  Ts * f_b / (2 * B_sweep);
disp(R);

f_b = 13*10^6;
R = c *  Ts * f_b / (2 * B_sweep);
disp(R);

f_b = 24*10^6;
R = c *  Ts * f_b / (2 * B_sweep);
disp(R);

