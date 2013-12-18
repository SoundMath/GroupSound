function x = beats(K, intvl1, intvl2, DISP)
% beats.m
% function x = beats(K, intvl1, intvl2, DISP)
%
% Matlab code for the demonstration of relation between interference
% energy and beat frequency.
%
% inputs
%     K      (default = 8) signal length is N=pow2(K+1);
%     intvl1 (default = 4) interval in semi-tones between first and second tone
%     intvl2 (default = 7) interval in semi-tones between first and third tone
%     DISP   (default = 0) DISP=1 ==> display signal
%
% outputs
%     x    row vector of length pow2(K+1) containing (analytic) signal
%          which is a composition of two pure tones
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001.12.21
% Copyright (c) 2001, William DeMeo

error(nargchk(0, 4, nargin));

if nargin < 1,  K=8; end;

% intvl1 == # of semi-tones separating x1 and x2
if nargin < 2, intvl1=4; end;
% intvl2== # of semi-tones separating x1 and x3
if nargin < 3, intvl2=7; end;

if nargin < 4, DISP = 1; end;

N=pow2(K+1);              % signal length (e.g. K=8, N=512)
n = (0:N-1); 

v1 = 110;                      % starting frequency (e.g. A-2)

v = frequencies(12,2,v1);  % construct two octaves
v2 = v(intvl1+1);           % v2 is intvl2 semi-tones above v1=v(1);
v3 = v(intvl2+1);           % v3 is intvl3 semi-tones above v1=v(1);
v0 = (v2+v1)/2;            % v0 is the midpoint of v1 and v2

AMP = .5;              % duration and amplitude of atoms

f0 = v0/N; f1 = v1/N; f2 = v2/N; f3 = v3/N;  % normalized frequencies

disp(sprintf('beats: base frequency = v1 = %f', v1));
disp(sprintf('beats:                  v2 = %f', v2));
disp(sprintf('beats:                  v3 = %f', v3));

sig1=AMP.*exp(i*2*pi*v1*n/N);

sig2=AMP.*exp(i*2*pi*v2*n/N);

sig3=AMP.*exp(i*2*pi*v3*n/N);

sig = sig1+sig2+sig3;
disp('beats: making signal analytic with hilbert transform');
%x = hilbert(x);         % make signal analytic

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

x=sig(:); x = x.'; % signal is stored as ROW vector x
			

disp('Next step:  >> [MaxC,MaxP] = WHMP(sig,ITERS,TOL,DEBUG,DISP);');

