function f = frequencies(nsteps,noct,f0)
% frequencies.m  -- Return a vector of pitch scale frequencies
%
% INPUT:
%     nsteps  (default nsteps=12)
%             number of scale steps per octave
%     noct    (default noct=8)
%             number of octaves
%     f0      (default f0=1/(2^(1/nsteps)-1) )
%             starting (lowest) frequency (Hz)
%
% OUTPUT:
%     f       a frequency vector of length noct*nsteps
%
% EXAMPLES:
%     >> f0=55; nsteps=12; noct=8;    % start from note A1 
%     >> f0=32.71; nsteps=24; noct=8; % or from note C1 
%     >> f0=12; nsteps=12; noct=11;   % or from 12 Hz (up to 23,197 Hz)
%     >> f=frequencies(nsteps,noct,f0);
%
%     >> frequencies(12, 1, 55)
%     results in: 55.000  58.270  61.735  65.406  69.296  73.416  77.782 ...
%                 ... 82.407  87.307  92.499  97.999  103.826  110.000
%
% NOTES:
%     Motivation for default starting frequency:
%     Let f0 be the fundamental freq for which 
%         1 semitone increase == 1 Hz increase 
%     This is obtained as follows:
%         >> nsteps=12; noct=10; f0=1/(2^(1/nsteps)-1);
%         >> F=frequencies(nsteps,noct,f0);  
%
% AUTHOR: William DeMeo <william.demeo@gmail.com>
% DATE: 2001 March 19
% UPDATED: 2013 Dec 30
% COPYRIGHT: (c) 2001, William DeMeo

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
