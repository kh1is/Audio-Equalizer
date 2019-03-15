function Hd = IIR_Chebyshev_type_2_Lowpass(fs , n , fstop)
%IIR_CHEBYSHEV_TYPE_2_LOWPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 20-Dec-2018 18:22:17

% Chebyshev Type II Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N     = n;   % Order
Fstop = fstop;  % Stopband Frequency
Astop = 80;    % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.lowpass('N,Fst,Ast', N, Fstop, Astop, Fs);
Hd = design(h, 'cheby2');

% [EOF]