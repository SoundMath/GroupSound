function x = beats3(K, EX, DISP)
% beats3.m
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
n = (0:N-1); 
v1 = 27.5;                      % starting frequency (e.g. A-2)
f1 = v1/N; f2 = 2*f1; 
sig1 = .5*exp(i*2*pi*f1.*n); % constant freq modulation
sig2 = zeros(N,1);
sig1 = sig1(:);

v = frequencies(12,2,v1/2);  % construct two octaves
DUR = floor(N/12); AMP = .5;             % duration and amplitude of atoms
nk = (0:DUR/2-1);
phaseshift = 0;
for k = 0:2:23,
  fk = v(k+1)/N;
%  disp(sprintf('indices %d to %d, freq = %f', k*DUR+1,(k+1)*DUR, fk));
  indxs1 = (k/2)*DUR+1:(k/2+1/2)*DUR;
  disp(sprintf('indxs1 %d to %d, freq = %f', indxs1(1),(k/2+1/2)*DUR,fk));
  indxs2 = (k/2+1/2)*DUR+1:(k/2+1)*DUR;
  disp(sprintf('indxs2 %d to %d, freq = %f', indxs2(1),(k/2+1)*DUR));
  %  phaseshift = phaseshift + fk;
  lchirp = linspace(0,fk,DUR/2);
  sig2(indxs1) = .5*exp(i*2*pi*(lchirp.*nk)); % constant freq modulation
  sig2(indxs2) = .5*exp(i*2*pi*(fk.*nk)); % constant freq modulation
end;
disp(sprintf('length(sig1) = %d, length(sig2) = %d',length(sig1),length(sig2)));
sig = sig1+sig2;

if(DISP),
  % plot signal and its components
  figure(1); clf;
  oneper = N; %oneper = round(2/(f2-f1));
  subplot(3,1,1);plot(real(sig1));axis([0,oneper,-1,1]);
  subplot(3,1,2);plot(real(sig2));axis([0,oneper,-1,1]);
  subplot(3,1,3);plot(real(sig));axis([0,oneper,-1,1]);
end;

x=sig(:); x = x.'; % signal is stored as ROW vector x
                        % (pre-conj since x' takes conj transpose)
			
disp('beats: making signal analytic with hilbert transform');
x = hilbert(x);         % make signal analytic

disp('Next steps:  >> [MaxC,MaxP] = WHMP(x,ITERS,TOL,1,1,1);');
disp('             >> [WVE,WVI] = WVEnergy(x,MaxC,MaxP,0,DEBUG,DISP);');

%[MaxC,MaxP] = WHMP(x,30,.025,1,1,1);      
%DEBUG=1; DISP=1;
%[WVE,WVI] = WVEnergy(x,MaxC,MaxP,0,DEBUG,DISP);
