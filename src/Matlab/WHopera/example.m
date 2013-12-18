function x = example(K, EX, DISP)
% example.m
%
% Matlab code for the demonstration of relation between interference
% energy and beat frequency.
%
% inputs
%     K    (default = 8) signal length is N=pow2(K+1);
%     EX   (default = 4) example number 
%     DISP (default = 0) DISP=1 ==> display signal
%
% outputs
%     x    row vector of length pow2(K+1) containing (analytic) signal
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001.12.21
% Copyright (c) 2001, William DeMeo

error(nargchk(0, 3, nargin));

if nargin < 1,  K=8; end;
if nargin < 2, EX=4; end;
% there are three EXAMPLE options:
% 1. same time, different frequency
% 2. different time, same frequency
% 3. different time, different frequency
% 4. const freq vs linear chirp

if nargin < 3, DISP = 1; end;

N=pow2(K+1);              % signal length (e.g. K=8, N=512)

v1 = 110;                      % starting frequency (e.g. A-2)
if(EX==4),
  f1 = v1/N; f2 = 2*f1; n = (1:N); 
  sig1 = .5*exp(i*2*pi*f1.*n); % constant freq modulation
  sig1 = sig1(:);
  sig2 = .5*fmlin(N,0.0,f2);          % linear freq modulation
else,

  intvl = 1;                   % # of semi-tones separating x1 and x2
  if(EX~=2),
    v = frequencies(12,2,v1);  % construct two octaves
    v2 = v(intvl+1);           % v2 is intvl semi-tones above v1
    v0 = (v2+v1)/2;            % v0 is the midpoint of v1 and v2
  else,
    v2 = v1;
  end;
  if(EX~=1),
    T1 = .25*N;  T2 = .75*N;
  else,
    T1 = .5*N; T2 = T1;
  end;
  DUR = .5*N; AMP = .5;             % duration and amplitude of atoms
  f0 = v0/N; f1 = v1/N; f2 = v2/N;  % normalized frequencies
  sig1=atoms(N,[T1,f1,DUR,AMP]);
  sig2=atoms(N,[T2,f2,DUR,AMP]);
end;

sig = sig1+sig2;

if(DISP),
  % plot signal and its components
  figure(1); clf;
  oneper = N; %oneper = round(2/(f2-f1));
  subplot(3,1,1);plot(real(sig1));axis([0,oneper,-1,1]);
  subplot(3,1,2);plot(real(sig2));axis([0,oneper,-1,1]);
  subplot(3,1,3);plot(real(sig));axis([0,oneper,-1,1]);
end;

x=conj(sig(:)); x = x'; % signal is stored as ROW vector x
                        % (pre-conj since x' takes conj transpose)
			
disp('beats: making signal analytic with hilbert transform');
x = hilbert(x);         % make signal analytic

disp('Next step:  >> [P,C] = Dictionary(x,1);');

