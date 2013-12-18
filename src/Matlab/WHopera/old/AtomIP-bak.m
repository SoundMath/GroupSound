function ip = AtomIP(K,s0,a1,a2)
% AtomIP.m
%
% Matlab code for computing the inner products of a
% specified Gabor atom with all atoms in a dictionary comprised of:
%    1. N Diracs, 
%    2. K Weyl-Heisenberg systems, 
%    3. N complex exponentials (Fourier basis elements)
%
% Inputs 
%   K   length of signal is pow2(K+1)
%   s   scale of input atom is pow2(s)
%   a1  translation of input atom; an integer in {0,1,...,N-1}
%   b2  modulation of input window; an integer in {0,1,...,N-1}
%
% Outputs
%   ip  the inner products between specified atom with all atoms in a dictionary
%   comprised of:
%     1. Diracs, (N atoms)
%     2. K Weyl-Heisenberg systems, (2^(K+3) atoms per system)
%     3. complex exponentials (N atoms)
%   in that order
%
% See also: WHAtomIP.m, IP.m, and WHip.m
% IP.m and WHip.m together compute inner prods for arbitrary input fn
% AtomIP.m and WHAtomIP.m together compute inner prods when input is a Gabor atom
%
%  As of 2002.02.27:  -->> WHAtomIP has been decomissioned <<--
%           
% Author: William DeMeo <williamdemeo@yahoo.com>
% Date: 2002.02.20
% (c) 2002, William DeMeo
% All rights reserved
%
error(nargchk(4, 4, nargin));

if(K<2), error('first argument, K, should be at least 2'); end;

if(s0<0 | s0>K+1), error('second argument, s0, is out of range (0,...,K+1)'); end;   

N = pow2(K+1);

if(a1<0 | a1> N-1), error('third argument, a1, is out of range (0,...,N-1)'); end;

if(a2<0 | a2> N-1), error('fourth argument, a2, is out of range (0,...,N-1)'); end;

N = pow2(K+1);
NAtoms = 2*N + K*pow2(K+3);
ip = zeros(1,NAtoms);

inAtom = WHatom(K,s0,a1,a2);
% SUBGROUP 1: discrete Diracs (s = 0)
ip(1:N) = inAtom;

% SUBGROUP 2: K Weyl-Heisenberg systems (0 < s < K)
p2k3 = pow2(K+3);

%% timing tests (consistently showed WHip is faster than WHAtom)
%%timesum = 0;
%%disp('AtomIP: timing WHAtomIP...');
for s = 1:K,

  % the parameter indices for scale s:
  indxs = (N+((s-1)*p2k3)+1 : N+s*p2k3); % (N+1,...,N+p2k3), (N+p2k3+1:N+2*p2k3), etc.

  %%  -->> WHAtomIP has been decomissioned <<--
  %% timing tests (consistently showed WHip is faster than WHAtom)
  %%  tt = cputime;
  %%  ip2d = WHAtomIP(K,s0,a1,a2,s);
  %%  timesum = timesum + cputime-tt;

  ip2d = WHip(inAtom,s);
  ip2d = ip2d.';  % delimit translations by col, modulations by row
  ip2d = ip2d(:);
  ip(indxs)  = ip2d.';
end;
%% disp(sprintf('AtomIP: time for WHAtomIP = %d',timesum));

% SUBGROUP 3: complex exponentials (s = K+1)
%   <g,eb> where eb(n) = (1/sqrt(N)).*exp(i*2*pi*b*n/N)
%   But remember, eb is on right of ip so use conjugate

% CASE: ga is a Dirac impulse at n = a1
if(s0==0),

  ga = zeros(1,N); 
  ga(a1+1) = 1; 
  % ( ie below we will have: h(n) = gb(a1+1) )
  % make sure a2 is 0 or we'll unintentionally shift H below
  if(a2~=0), error('s0==0 ==> input is Dirac ==> must have a2 == 0');  end;
	     
% CASE: ga is a complex exponential
elseif(s0==K+1),
  oosn = (1/sqrt(N));
  ga = repmat(oosn,1,N);
  
% CASE: ga is a typical atom ( s0 must be in {1,...,K} )
else,
  ga = ScaledWindow(N,s0);  % g scaled by pow2(s)
  ga = shift(ga,a1);

end;  

h = (1/sqrt(N)).*ga;
  
H = fft(h);

% ipexp has length N because elements correspond to 
% frequencies b2 in {0,1,...,N-1}
ipexp = shift(H,a2); % equiv: ipexp = [H(N-a2+1:N) H(1:N-a2)];  

ip(NAtoms-N+1:NAtoms) = ipexp;
