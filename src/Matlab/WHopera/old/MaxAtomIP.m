function [maxc,maxp] = MaxAtomIP(K,s0,a1,a2)
% MaxAtomIP.m
%
% Matlab code for computing the maximum magnitude of the inner products of a
% specified Gabor atom with all atoms in a dictionary comprised of:
%    1. K Weyl-Heisenberg systems, 
%    2. N Diracs, 
%    3. N complex exponentials (Fourier basis elements)
%
% Inputs 
%   K   length of signal is pow2(K+1)
%   s   scale of input atom is pow2(s)
%   a1  translation of input atom; an integer in {0,1,...,N-1}
%   b2  modulation of input window; an integer in {0,1,...,N-1}
%
% Outputs
%   maxc  the maximum absolute value of inner products
%   maxp  a 1x3 array specifying the scale, translation, and
%         modulation parameters of atom having max ip with g
%         (see also WHatom.m)
%

error(nargchk(4, 4, nargin));

if(K<2), error('first argument, K, should be at least 2'); end;

if(s0<0 | s0>K+1), error('second argument, s0, is out of range (0,...,K+1)'); end;   

if(a1<0 | a1> N-1), error('third argument, a1, is out of range (0,...,N-1)'); end;

if(a2<0 | a2> N-1), error('fourth argument, a2, is out of range (0,...,N-1)'); end;

N = pow2(K+1);
MaxC = 0;
MaxP = zeros(1,3);  % scale, translation, and modulation of max corr atom

% SUBGROUP 1: K Weyl-Heisenberg systems (0 < s < K)
for s = 1:K,
  G = WHopera(K,s0,a1,a2,s);
  [maxG,rowindxs]=max(abs(G));  % column maxima and row indices
  [maxG,y2] = max(maxG));       % max of column maxima and col index
  y1 = rowindxs(y2);            % index of max row
  if(maxG > MaxC),
    L1 = pow2(s-1); M2 = pow2(K-s);
    MaxC = maxG; 
    MaxP(1) = s;        % scale of current max atom
    MaxP(2) = y1*L1;    % translation of current max atom
    MaxP(3) = y2*M2;    % modulation of current max atom
  end;
end;

% SUBGROUP 2: gb = discrete Dirac (s = 0)
% The Dirac of max ip with g is that having an impulse at maxgi
g = WHatom(K,s0,a1,a2);
[maxg,maxgi] = max(abs(g));
if (maxg > MaxC),
  MaxC = maxg; 
  MaxP(1) = 0;       % scale for Diracs is 0
  MaxP(2) = maxgi-1; % impulse at index maxgi <--> b1+1 = maxgi
  MaxP(3) = 0;
end;

% SUBGROUP 3: gb = complex exponential (s = K+1)
Gexp = zeros(1,N);

if(s0==0), % case: ga is Dirac impulse at n = a1

  h = zeros(1,N);
  h(a1+1) = 1/sqrt(N);  
  Gexp = fft(h);  % G has length N because elements correspond to 
  % frequencies b2 in {0,1,...,N-1}
	     
else,  % next two cases are handled by subsampling fft
  
  if(s0==K+1), % case: ga is complex exponential

    h= (1/N) .* ones(1,N);
  
  else,     % case: ga is a typical atom

    ga = ScaledWindow(N,s0);  % g scaled by pow2(s)
    ga = shift(ga,a1);
    h = (1/sqrt(N)).*ga;
  
  end;
  
  H = fft(h);
  Gexp = [H(N-a2+1:N) H(1:N-a2)];

end;

[maxg,maxgi] = max(abs(Gexp));
if(maxg > MaxC),
  MaxC = maxg; 
  MaxP(1) = K+1;       % scale of new max atom
  MaxP(2) = 0;         % translation is 0 for complex exponentials
  MaxP(3) = maxgi-1; % modulation frequency of new max atom
end;
