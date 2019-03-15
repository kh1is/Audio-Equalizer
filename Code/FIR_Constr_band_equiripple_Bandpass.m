function Hd = FIR_Constr_band_equiripple_Bandpass(fs , n , fstop1 , fpass1 , fpass2 , fstop2)
%FIR_CONSTR_BAND_EQUIRIPPLE_BANDPASS Returns a discrete-time filter object.

fs = 22500;
n = 120;
fstop1 = 5000;
fstop2 = 10500;
fpass1 = 5500;
fpass2 = 10000;

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 17:44:36

% Constrained Band Equiripple FIR Bandpass filter designed using the
% FIRCBAND function.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N      = n;    % Order
Fstop1 = fstop1;   % First Stopband Frequency
Fpass1 = fpass1;   % First Passband Frequency
Fpass2 = fpass2;  % Second Passband Frequency
Fstop2 = fstop2;  % Second Stopband Frequency
Wstop1 = 1;      % First Stopband Weight
Wpass  = 1;      % Passband Weight
Wstop2 = 1;      % Second Stopband Weight
dens   = 20;     % Density Factor

% Calculate the coefficients using the FIRCBAND function.
b  = fircband(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 ...
              0 0], [Wstop1 Wpass Wstop2], {dens});
Hd = dfilt.dffir(b);

% [EOF]