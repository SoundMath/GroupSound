function G = WHAtomIP(K,s0,a1,a2,s,L1,M2)
% WHAtomIP.m
%
% Matlab code for computing inner product of a 
% specified Gabor atom with a Weyl-Heisenberg (WH) 
% system (ie a subgroup of atoms) of scale s
%
% Inputs 
%   K   length of signal is N = pow2(K+1)
%   s0  scale of input window is pow2(s0); 
%       s0 should be an integer in {0,2,...,K+1}
%       (for j=K+1 we use Fourier basis of complex exponentials)
%   a1  translation of input window
%   a2  modulation of input window
%   s   scale of W-H integer sampling subgroup is pow2(s); 
%   L1  (default = pow2(s-1)) optional translation sampling rate of
%        W-H system; must be an integer that evenly divides N = length(g)
%   M2  (default = pow2(K-s), where K is s.t. pow2(K+1) = length(g))
%       modulation sampling rate of W-H system; must be an integer 
%       that evenly divides N
%
% Outputs
%   G   a M1 x L2 matrix of inner products <g_a, g_b> where
%         a = (a1, a2) (fixed by input values)
%         b = (y1*L1, y2*M2) for all y1 = (0:M1-1), y2 = (0:L2-1)
%
%   The (p,q) element of G is the inner product for which y1=p, y2=q.
%
%             N-1
%    G(p,q) = sum g(n-a1)*g(n-p*L1)exp(i*2*pi*(a2-q*M2)*n/N)
%             n=0
%
%   Of course, g doesn't have negative indices, so for any 
%   m in {0,1,...,N-1}, we take g(n-m) to mean [g(N-m+1:N) g(1:N-m)]
%   i.e. g circularly translated m units to the right.
%
% See also: AtomIP.m, IP.m, WHip.m
% IP.m and WHip.m together compute inner prods for arbitrary input fn
% AtomIP.m and WHAtomIP.m together compute inner prods when input is a Gabor atom
%
% Other Notes  (For background see Tolomieri An [1])
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
%                 N-1
%     <g_a,g_b> = sum g(n-a1)<n,a2>*conj(g(n-b1)<n,b2>)
%                 n=0
%
%                 N-1
%     <g_a,g_b> = sum g(n-a1)*conj(g(n-b1))exp(i*2*pi*(a2-b2)*n/N)
%                 n=0
%
%                 N-1
%               = sum g(n-a1)*g(n-y1*L1)exp(i*2*pi*(a2-y2*M2)*n/N)
%                 n=0   
%                             (because g is real)
%                 N-1      
%               = sum g(n-a1)*g(n-y1*L1)exp(-i*2*pi*(y2*M2-a2)*n/N)
%                 n=0
%
%  For each y1, to find the L2 inner products for which y2 in
%  {0,1,...,L2-1} we can subsample an fft as follows:
%  Let gba = shift(g,b1-a1)and h = g.*gba   ( ie h(n) = g(n-a1)*g(n-b1) )
%   >> H = fft(h);  
%   >> % shift elements so H represents frequencies (b2-a2), b2=0,1,...N-1
%   >> H = shift(H,a2);  
%   >> G(y1+1,:) = H(1:M2:N);
%
% References:
%    [1] Richard Tolimieri and Myoung An, "Time-Frequency Representations"
%        Birkhauser, Boston, 1998
%
% Date: 2002.02.18
% Author: <williamdemeo@yahoo.com>
% all rights reserved

error(nargchk(5, 7, nargin));

if(K<2), error('first argument, K, should be at least 2'); end;

N = pow2(K+1);
  
if(s==0),          % Dirac
  error('s=0 is not an appropriate scale for a W-H group');
end;

if (s == K+1), % complex exponential
  error('s=K+1 is not an appropriate scale for a W-H group');
end;

if(s0<0 | s0>K+1),
  error('second argument, s0, is out of range (0,...,K+1)');
end;

if(a1<0 | a1> N-1),
  error('third argument, a1, is out of range (0,...,N-1)');
end;

if(a2<0 | a2> N-1),
  error('fourth argument, a2, is out of range (0,...,N-1)');
end;

if(s<0 | s>K+1),
  error('fifth argument, s, is out of range (0,...,K+1)');
end;

if nargin<6,  
  L1 = pow2(s-1); % default translation sampling rate;
  M2 = pow2(K-s); % default modulation sampling rate;
elseif nargin<7,
  warning('received 6th argument with no 7th argument...');
  warning(' ...ignoring 6th and 7th args and using defaults instead');
  L1 = pow2(s-1); M2 = pow2(K-s); 
end;

M1 = N/L1;  L2 = N/M2;
if(N~=L1*M1 | N~=L2*M2),
  error('L1 and M2 must evenly divide N');
end;

G = zeros(M1,L2);        % G will hold inner products 
g = ScaledWindow(N,s);  % g scaled by pow2(s)

% CASE: ga is a Dirac impulse at n = a1
if(s0==0),          

  ga = zeros(1,N); 
  ga(a1+1) = 1; 
  % ( ie below we will have: h(n) = gb(a1+1) )
  % make sure a2 is 0 or we'll unintentionally shift H below
  if(a2~=0), error('s0==0 ==> input is Dirac ==> must have a2 == 0');  end;

% CASE: ga is a complex exponential
elseif(s==K+1), 
  ga = (1/sqrt(N));
  % ( ie below we will have: h(n) = g(n-b1)/sqrt(N) )
  if(a1~=0), error('s0==K+1 ==> input is exp ==> must have a1 == 0');  end;
  
% CASE: ga is a typical atom ( s0 must be in {1,...,K} )
else,
  ga = ScaledWindow(N,s0); % g scaled by pow2(s0)
  ga = shift(ga,a1);       % ga translated a1 units right; ie g(n-a1)
  % ( ie below we will have: h(n) = g(n-a1)*g(n-b1) )
  
end;

for y1 = 0:M1-1,

  gb = shift(g,y1*L1);
  
  h = ga.*gb;   
    
  %  For each y1, we find the L2 inner products corresponding to 
  %  y2 in {0,1,...,L2-1} by subsampling an fft:
  H = fft(h);
  % shift elements so H represents frequencies (b2-a2), b2=0,1,...N-1
  H = shift(H,a2);  
  G(y1+1,:) = H(1:M2:N);

end;

% OLD: (from when ga Dirac was handled separately)
%
%if(s0==0),          % ga is a Dirac
%
%  for y1 = 0:M1-1,
%    gb = shift(g,y1*L1);
%    % Two ways:    (check which is faster)
%    % First way (brute force)
%    %    % For each y1, we find the L2 inner products corresponding to 
%    %    % y2 in {0,1,...,L2-1}:
%    %    G(y1,:) = gb(a1+1).*exp((-i*2*pi*a1/L2).*(0:L2-1))
%    % Second way (subsample of fft)
%         h = zeros(1,N); 
%	 h(a1+1) = gb(a1+1);
%         H = fft(h);
%         G(y1+1,:) = H(1:M2:N);
%  end;
%
