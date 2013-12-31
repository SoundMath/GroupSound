function h = harmonics(K, f0, w)
% harmonics.m -- generate a harmonic tone of length N = pow2(K+1)
%
% INPUT: 
%     K   N = pow2(K+1) is the length of the output signal
%     f0  the base frequencies (unnormalized)
%     w   (Boolean) if true, then write signals to files
%
% AUTHOR: William DeMeo <williamdemeo@gmail.com>
% DATE: 2013 Dec 30

if nargin<3, w=0; end
N = pow2(K+1);
n = (0:N-1);
amps = .3*[.6 .4 .2 .5 .3 .4 .2 .4 .2 .2 .3];
%amps = .4*[.6 .5 .4 .3 .3 .2 .2 .1 .1 .1 .1];

M = length(amps);

nf = length(f0);

h = zeros(nf,N);

for fn = 1:nf,

  sig = zeros(1,N);

  for m = 1:M,
    f = m*f0(fn);
    sig = sig + amps(m).*exp((i*2*pi*((f/N).*n + rand)));
  end;

  h(fn,:) = hilbert(sig);         % make signal analytic

  if(w),
    wavwrite(real(h(fn,:)),2*N,int2str(fn));
  end;
end;

figure(2); clf;
plot(real(h(nf,:)));axis([0,N,-1,1]);  title('harmonic signal');
