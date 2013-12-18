function [MaxC,MaxP] = MaxIP(f, DEBUG)
% MaxIP.m
%
% Matlab code for computing the maximum magnitude of the inner products of a
% given function, f, with all atoms in a dictionary comprised of:
%    1. K Weyl-Heisenberg systems, 
%    2. N Diracs, 
%    3. N complex exponentials (Fourier basis elements)
%
% Inputs 
%   f      a function
%   DEBUG  (default 0) DEBUG=1 ==> print extra debugging information
%
% Outputs
%   MaxC  the inner product having maximum absolute value (may be complex)
%   MaxP  a 1x3 array specifying the scale, translation, and
%         modulation parameters of atom having max ip with g
%         (see also atom.m)
%

error(nargchk(1, 2, nargin));

if nargin < 2, DEBUG=0; end;

N = length(f);  K = log2(N)-1;

if(pow2(K+1) ~= N), error('length of f must be a power of 2'); end;

MaxAbsC = 0;
MaxP = zeros(1,3);  % scale, translation, and modulation of max corr atom

% SUBGROUP 1: gb = discrete Dirac (s = 0)
if(DEBUG),
  disp('MaxIP: maximizing over inner prods with Diracs');
end;
[maxg,maxgi] = max(abs(f)); % Dirac of max ip with f has impulse at maxgi
if (maxg > MaxAbsC),
  MaxAbsC = maxg; 
  MaxC = f(maxgi); 
  MaxP(1) = 0;     % scale for Diracs is 0
  MaxP(2) = maxgi-1;  % impulse at index maxgi <--> b1+1 = maxgi
  MaxP(3) = 0;
end;

% SUBGROUP 2: K Weyl-Heisenberg systems (0 < s < K)
disp('MaxIP: maximizing over inner prods with W-H system of atoms');
for s = 1:K,
  G = WHip(f,s);
  [maxG,rowindxs]=max(abs(G));  % column maxima and row indices
  [maxG,y2] = max(maxG) ;       % max of column maxima and col index
  y1 = rowindxs(y2);            % index of max row
  if(maxG > MaxAbsC),
    L1 = pow2(s-1); M2 = pow2(K-s);
    MaxAbsC = maxG; MaxC = G(y1,y2); 
      % DEBUGGING CONDITIONAL (can be removed later)
      if(abs(MaxC)~=MaxAbsC),   
        error('MaxIP: using wrong element G(y1,y2)'); 
      end;
    MaxP(1) = s;        % scale of current max atom
    MaxP(2) = (y1-1)*L1;    % translation of current max atom
    MaxP(3) = (y2-1)*M2;    % modulation of current max atom
  end;
end;

% SUBGROUP 3: gb = complex exponential (s = K+1)
if(DEBUG),
  disp('MaxIP: maximizing over inner prods with Fourier basis');
end;
h = (1/sqrt(N)).*f;
H = fft(h);

[maxg,maxgi] = max(abs(H));
if(maxg > MaxAbsC),
  MaxAbsC = maxg; 
  MaxC = H(maxgi); 
  MaxP(1) = K+1;       % scale of new max atom
  MaxP(2) = 0;         % translation is 0 for complex exponentials
  MaxP(3) = maxgi-1;   % modulation frequency of new max atom
end;

