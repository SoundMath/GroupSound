function f = frequencies(nsteps,noct,f0)
% frequencies.m
%
% Matlab code to generate pitch scale frequencies
%
% Inputs
%    nsteps  (default nsteps=12)
%            number of scale steps per octave
%    noct    (default noct=8)
%            number of octaves
%    f0      (default f0=1/(2^(1/nsteps)-1) )
%            starting (lowest) frequency (Hz)
%
% Outputs
%    f       a frequency vector of length noct*nsteps
%
% Examples
% >> f0=55; nsteps=12; noct=8;    % start from note A1 
% >> f0=32.71; nsteps=24; noct=8; % or from note C1 
% >> f0=12; nsteps=12; noct=11;   % or from 12 Hz (up to 23,197 Hz)
% >> f=frequencies(nsteps,noct,f0);
% Notes
%    Motivation for default starting frequency:
%    Let f0 be the fundamental freq for which 
%      1 semitone increase == 1 Hz increase 
%    This is obtained as follows:
% >> nsteps=12; noct=10; f0=1/(2^(1/nsteps)-1);
% >> F=frequencies(nsteps,noct,f0);  
%
% Let f0 be the fundamental freq for which 
%   1 semitone increase == 1 Hz increase. Then,
% >> nsteps=12; noct=10; f0=1/(2^(1/nsteps)-1);
% >> f=frequencies(f0,nsteps,noct)';  % get a _column_ of frequencies
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 March 19
% Copyright (c) 2001, William DeMeo

if nargin < 1,
  nsteps=12;
end
if nargin < 2,
  noct=11;
end
if nargin < 3,
  f0 = 1/(2^(1/nsteps)-1); % fundamental frequency
  %f0=32.71;
end

Nsteps=nsteps*noct;
f=[f0];
%for i = 1:(Nsteps-1) 
for i = 1:Nsteps 
  f = [f 2^(1/nsteps)*f(i)];
end
