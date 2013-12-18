function x = beats(K, intvl1, intvl2, DISP)
% beats.m
%
% Matlab code for the demonstration of relation between interference
% energy and beat frequency.
%
% inputs
%     K     (default = 8) signal length is N=pow2(K+1);
%     intvl (default = 4) interval in semi-tones between the two pure tones
%     DISP  (default = 0) DISP=1 ==> display signal
%
% outputs
%     x    row vector of length pow2(K+1) containing (analytic) signal
%          which is a composition of two pure tones
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001.12.21
% Copyright (c) 2001, William DeMeo

error(nargchk(0, 3, nargin));

if nargin < 1,  K=8; end;

% intvl1 == # of semi-tones separating x1 and x2
if nargin < 2, intvl1=4; end;
% intvl2== # of semi-tones separating x2 and x3
if nargin < 3, intvl2=3; end;

EX = 1;

% there are three EXamples:
% 1. same time, different frequency
% 2. different time, same frequency
% 3. different time, different frequency
% 4. const freq vs linear chirp

if nargin < 3, DISP = 1; end;

N=pow2(K+1);              % signal length (e.g. K=8, N=512)

v1 = 110;                      % starting frequency (e.g. A-2)
if(EX==4),
  % Example 4
  f1 = v1/N; f2 = 2*f1; n = (0:N-1); 
  sig1 = .5*exp(i*2*pi*f1.*n); % constant freq modulation
  sig1 = sig1(:);
  sig2 = .5*fmlin(N,0.0,f2);          % linear freq modulation

else,  

  %  Examples 1, 2, 3

  if(EX~=2),            % examples 1 and 3
    v = frequencies(12,2,v1);  % construct two octaves
    v2 = v(intvl1+1);           % v2 is intvl2 semi-tones above v1=v(1);
    v3 = v(intvl1+intvl2+1);           % v3 is intvl3 semi-tones above v1=v(1);
    v0 = (v2+v1)/2;            % v0 is the midpoint of v1 and v2
  else,
    v2 = v1;            % example 2: frequencies are both 110
  end;

  if(EX~=1),            % examples 2 and 3
    T1 = N/4;  T2 = 3*(N/4);
  else,
    T1 = N/2; T2 = T1;  % example 1: times are both N/2
  end;

  DUR = N; AMP = .5;              % duration and amplitude of atoms
  f0 = v0/N; f1 = v1/N; f2 = v2/N; f3 = v3/N;  % normalized frequencies
  sig1=atoms(N,[T1,f1,DUR,AMP]);
  sig2=atoms(N,[T2,f2,DUR,AMP]);
  sig3=atoms(N,[T1,f3,DUR,AMP]);
end;

sig = sig1+sig2+sig3;

if(DISP),
  % plot signal and its components
  figure(1); clf;
  oneper = N; %oneper = round(2/(f2-f1));
  subplot(3,1,1);plot(real(sig1));axis([0,oneper,-1,1]);
  title('signal 1');
  subplot(3,1,2);plot(real(sig2));axis([0,oneper,-1,1]);
  title('signal 2');
  subplot(3,1,3);plot(real(sig3));axis([0,oneper,-1,1]);
  title('signal 3');
  figure(2);clf;
  subplot(3,1,1);plot(real(sig1+sig2));axis([0,oneper,-1,1]);
  title('signal 1+2');
  subplot(3,1,2);plot(real(sig1+sig3));axis([0,oneper,-1,1]);
  title('signal 1+3');
  subplot(3,1,3);plot(real(sig));axis([0,oneper,-1,1]);
  title('signal 1+2+3');
end;

x=conj(sig(:)); x = x'; % signal is stored as ROW vector x
                        % (pre-conj since x' takes conj transpose)
			
disp('beats: making signal analytic with hilbert transform');
x = hilbert(x);         % make signal analytic

disp('Next step:  >> [MaxC,MaxP] = WHMP(sig,ITERS,TOL,DEBUG,DISP);');

