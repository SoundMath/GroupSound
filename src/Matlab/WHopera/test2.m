% test2.m
% Matlab workspace for testing WHopera programs
%

K = 8;
N = pow2(K+1);
v0 = 55;
f = frequencies(12,1,v0);
h = harmonics(K,f,0);

AMP = .5;              % amplitude of atoms

%%% TEST 1: compare tri-tone with non-tri-tone
%% TRITONE
f0 = 1; % tonic
f1a = 5; % <--> 4 semi-tones above tonic
f1b = 6; % <--> 5 semi-tones above tonic
f2 = 8; % <--> 7 semi-tones above tonic

sig0=AMP.*h(f0,:);  
sig1a=AMP.*h(f1a,:);  
sig1b=AMP.*h(f1b,:);  
sig2=AMP.*h(f2,:);  

disp(sprintf('beats: base frequency = f0 = %f', f(f0)));
disp(sprintf('beats:                 f1a = %f', f(f1a)));
disp(sprintf('beats:                 f1b = %f', f(f1b)));
disp(sprintf('beats:                  f2 = %f', f(f2)));

siga = sig0+sig1a+sig2;
sigb = sig0+sig1b+sig2;
disp('beats: making signals analytic with hilbert transform');

siga = hilbert(siga);         % make signal analytic
sigb = hilbert(sigb);         % make signal analytic
sig0 = hilbert(sig0);
sig1a = hilbert(sig1a);
sig1b = hilbert(sig1b);
sig2 = hilbert(sig2);

wavwrite(real(sig0),2*N,'sig0.wav');
wavwrite(real(sig1a),2*N,'sig1a.wav');
wavwrite(real(sig1b),2*N,'sig1b.wav');
wavwrite(real(sig2),2*N,'sig2.wav');
wavwrite(real(siga),2*N,'siga.wav');
wavwrite(real(sigb),2*N,'sigb.wav');

DISP = 1;
if(DISP),
  oneper = N; %oneper = round(2/(f2-f1));
  % plot signal and its components
  figure(1); clf;
  subplot(2,1,1);plot(real(sig0+sig1a));axis([0,oneper,-1,1]);
  title('sig0 + sig1a');
  subplot(2,1,2);plot(real(sig0+sig1b));axis([0,oneper,-1,1]);
  title('sig0 + sig1b');
  figure(2);clf;
  subplot(2,1,1);plot(real(siga));axis([0,oneper,-1,1]);
  title('sig0 + sig1a + sig2');
  subplot(2,1,2);plot(real(sigb));axis([0,oneper,-1,1]);
  title('sig0 + sig1b + sig2');
end;

% compute atom parameters and coefficients
MAXITERS = 30; TOL = 0.025; OPT = 1; DEBUG = 1; 
DISP = 1;  % display in figures 1, 2, 3
[MaxCa,MaxPa]=WHMP(siga,MAXITERS,TOL,OPT,DEBUG,DISP);
DISP = 4;  % display in figures 4, 5, 6
[MaxCb,MaxPb]=WHMP(sigb,MAXITERS,TOL,OPT,DEBUG,DISP);

% compute WV energy and interferences
WVT = 0; DEBUG = 1; 
DISP = 7; % display in figures 7, 8, 9
[WVEa, WVIa] = WVEnergy(siga, MaxCa, MaxPa, WVT, DEBUG, DISP);
DISP = 10; % display in figures 10, 11, 12
[WVEb, WVIb] = WVEnergy(sigb, MaxCb, MaxPb, WVT, DEBUG, DISP);

