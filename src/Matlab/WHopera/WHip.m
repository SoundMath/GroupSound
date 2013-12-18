function G = WHip(f,s,L1,M2)
% WHip.m
%
% Matlab code for computing inner product of a function with all atoms in a
% Weyl-Heisenberg (WH) system (ie a subgroup of atoms)
%
% Inputs 
%   f   input function
%   s   scale of W-H integer sampling subgroup is pow2(s); 
%   L1  (default = pow2(s-1)) optional translation sampling rate of
%        W-H system; must be an integer that evenly divides N = length(g)
%   M2  (default = pow2(K-s), where K is s.t. pow2(K+1) = length(g))
%       modulation sampling rate of W-H system; must be an integer 
%       that evenly divides N
%
% Outputs
%   G   a M1 x L2 matrix of inner products <f, g_b> where
%         b = (y1*L1, y2*M2) for all y1 = (0:M1-1), y2 = (0:L2-1)
%
%   The (p,q) element of G is the inner product for which y1=p, y2=q.
%
%             N-1
%    G(p,q) = sum f(n)*g(n-p*L1)exp(-i*2*pi*q*M2*n/N)
%             n=0
%
%   Of course, g doesn't have negative indices, so for any 
%   m in {0,1,...,N-1}, we take g(n-m) to mean [g(N-m+1:N) g(1:N-m)]
%   i.e. g circularly translated m units to the right.
%
% See also: AtomIP.m, IP.m, WHAtomIP.m
% IP.m and WHip.m together compute inner prods for arbitrary input fn
% AtomIP.m and WHAtomIP.m together compute inner prods when input is a Gabor atom
%
% Other Notes   (For background see Tolomieri An [1])
%   Let N be the length of a window function g. (see also WHatom.m)
%   Let L1*M1 = L2*M2 = N, where M1 divides M2.
%   Then L1*Z/N x M2*Z/N is an integer oversampling subgroup of Z/N x Z/N.
%   Let x1 be in {0, 1, 2, ..., (M1-1)}, then
%   x1*L1 is in L1*Z/N = {0, L1, 2*L1, ..., (M1-1)*L1}, where L1*M1=N
%   and x2*M2 is in M2*Z/N = {0, M2, 2*M2, ..., (L2-1)*M2}, where L2*M2=N
%   Let a = (x1*L1, x2*M2), then
%        g_a(n) = g(n-a1)*<n,a2> 
%               = g(n-x1*L1)*<n,x2*M2> 
%               = g(n-x1*L1)*exp(i*2*pi*x2*M2*n/N)
%
%   We wish to compute the following:
%
%               N-1
%     <f,g_b> = sum f(n)*conj(g(n-b1)<n,b2>)
%               n=0
%
%               N-1
%     <f,g_b> = sum f(n)*conj(g(n-b1))exp(-i*2*pi*b2*n/N)
%               n=0
%
%               N-1
%             = sum f(n)*g(n-y1*L1)exp(-i*2*pi*y2*M2*n/N)
%               n=0   
%                             (because g is real)
%
%  For each y1, to find the L2 inner products for which y2 in
%  {0,1,...,L2-1} we can subsample an fft as follows:
%  Let gb = shift(g,b1) and h = f.*gb   ( ie h(n) = f(n)*g(n-b1) )
%  H = fft(h);  
%  G(y1,:) = H(1:M2:N);
%  (but that's the old way; the new way is faster)
%
% References:
%    [1] Richard Tolimieri and Myoung An, "Time-Frequency Representations"
%        Birkhauser, Boston, 1998
%
% Date: 2002.02.18
% Author: <williamdemeo@yahoo.com>
% all rights reserved

error(nargchk(2, 4, nargin));

N = length(f);
K = log2(N)-1;
if(K<2), error('first argument, K, should be at least 2'); end;

if(s==0),          % Dirac
  error('s=0 is not an appropriate scale for a W-H group');
end;

if (s == K+1), % complex exponential
  error('s=K+1 is not an appropriate scale for a W-H group');
end;

if(s<0 | s>K+1),
  error('fifth argument, s, is out of range (0,...,K+1)');
end;

if nargin<3,  
  L1 = pow2(s-1); % default translation sampling rate;
  M2 = pow2(K-s); % default modulation sampling rate;
elseif nargin<4,
  warning('received 3rd argument with no 4th argument...');
  warning(' ...ignoring 3rd and 4th args and using defaults instead');
  L1 = pow2(s-1); M2 = pow2(K-s); 
end;

M1 = N/L1;  L2 = N/M2;
if(N~=L1*M1 | N~=L2*M2),
  error('L1 and M2 must evenly divide N');
end;

G = zeros(M1,L2);        % G will hold inner products 
g = ScaledWindow(N,s);   % g scaled by pow2(s)
gb = zeros(1,N);
h = gb;
%h2d = zeros(L2,M2);
%H = h2d;
%Gcol = zeros(L2,1);

% NEW WAY: (doesn't waste fft computations like old way did)
oNeS = ones(M2,1);
for y1 = 0:M1-1,

  gb = shift(g,y1*L1);
  h = f.*gb;   % ( ie h(n) = f(n)*g(n-b1) )

  h2d = reshape(h,L2,M2);
  H = fft(h2d,L2);       % compute M2 length-L2 ffts
  Gcol = H*oNeS;       % sum the results
  G(y1+1,:) = Gcol.';  % transpose but not conjugate

end;

% OLD WAY:
%for y1 = 0:M1-1,
%
%  gb = shift(g,y1*L1);
%
%  h = f.*gb;   % ( ie h(n) = f(n)*g(n-b1) )
%
%  %  For each y1, we find the L2 inner products corresponding to 
%  %  y2 in {0,1,...,L2-1} by subsampling an fft:
%  H = fft(h);  
%  G(y1+1,:) = H(1:M2:N);
%end;

