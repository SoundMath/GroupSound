function [C, P] = IP(K,s0,a1,a2,DEBUG)
% IP.m
%
% Matlab code for computing the inner products of a 
% specified function with all atoms in a dictionary comprised of:
%    1. N Diracs, 
%    2. K Weyl-Heisenberg systems, 
%    3. N complex exponentials (Fourier basis elements)
%
% (there are two interfaces to this function)
% 1. If number of input arguments is greater than 2:
%    Inputs 
%      K   pow2(K+1) is length of input atom
%      s   pow2(s) is scale of input atom
%      a1  translation of input atom; an integer in {0,1,...,N-1}
%      b2  modulation of input window; an integer in {0,1,...,N-1}
%      DEBUG  (default 0) DEBUG=1 ==> print extra debugging information
%
% 2. If number of input arguments is less than 3:
%    Inputs 
%      f      signal or function
%      DEBUG  (default 0) DEBUG=1 ==> print extra debugging information
%
% Outputs
%   C  the inner products between specified function and all 
%      atoms in a dictionary comprised of:
%        1. Diracs, (N atoms)
%        2. K Weyl-Heisenberg systems, (2^(K+3) atoms per system)
%        3. complex exponentials (N atoms)
%      in that order
%   P  the parameters of the atoms corresponding to inner products in C
%
% See also: WHip.m AtomIP.m, WHAtomIP.m
% IP.m and WHip.m together compute inner prods for arbitrary input fn
% AtomIP.m and WHAtomIP.m together compute inner prods when input is a Gabor atom

error(nargchk(1, 5, nargin));

if nargin==3,
  disp('USAGE: >> IP(f)  % where f is a signal');
  disp('   OR: >> IP(K,s,a1,a2)  % where inputs are atom parameters');
  error('exiting');
end;

if nargin < 2, DEBUG = 0; end;

if nargin < 3, % first argument must be a signal

  f = K;

else,          % arguments must be atom parameters

  f = WHatom(K,s0,a1,a2);

  if nargin < 5, DEBUG=0; end;

end;

N = length(f);  
K = log2(N)-1;

if(pow2(K+1) ~= N), error('length of f must be a power of 2'); end;

NAtoms = 2*N + K*pow2(K+3);

C = zeros(1,NAtoms);
P = zeros(NAtoms,3);

%%% SUBGROUP 1: discrete Diracs (s = 0)
C(1:N) = f;
P(1:N,1) = 0;        % Diracs all have scale s = 0
P(1:N,2) = (0:N-1)'; % Diracs have translation parameters y1 in (0:N-1)
P(1:N,3) = 0;        % Diracs all have 0 modulation frequency


%%% SUBGROUP 2: K Weyl-Heisenberg systems (0 < s < K)

% There are L2*M1 = pow2(s+1+K-s+2) = pow2(K+3) atoms at each scale
p2k3 = pow2(K+3);

C1d = zeros(p2k3,1);

for s = 1:K,

  [L1,M2,M1,L2] = SamplingGroups(K,s); 

  % the parameter indices for scale s:
  indxs = (N+((s-1)*p2k3)+1 : N+s*p2k3); % (N+1,...,N+p2k3), (N+p2k3+1:N+2*p2k3), etc.

  % scale parameter
  P(indxs,1) = s;  

  % translation parameters
  y1 = (0:M1-1)*L1;  % {0, L1, 2*L1, ..., (M1-1)*L1}
  Y1 = repmat(y1,L2,1); 
  Y1 = Y1(:);  % (0,0,...,0,L1,L1,...,L1,...,(M1-1)*L1)'
  P(indxs,2) = Y1;

  % modulation parameters
  y2 = (0:L2-1)*M2; y2 = y2(:);
  Y2 = repmat(y2,M1,1); % (0,M2,...(L2-1)*M2, 0,M2,..,(L2-1)*M2,...,(L2-1)*M2)'
  P(indxs,3) = Y2;
  
  % inner products
  C2d = WHip(f,s); % each row represents all modulations at a single translation
                   % each col represents all translations at a single modulation
  C2d = C2d.';     % tranposing reverses this: 
                   %      increase row index => increase modulation
		   %      increase col index => increase translation
  C1d = C2d(:);    % C1d = column of all inner products at scale s:
                   %      for each translation y1, run through all modulations   
  C(indxs)  = C1d.'; 

end;

% SUBGROUP 3: complex exponentials (s = K+1)
%   <f,eb> where eb(n) = (1/sqrt(N)).*exp(i*2*pi*b*n/N)
%   But remember, eb is on right of ip so use conjugate
h = (1/sqrt(N)).*f;
H = fft(h);

C(NAtoms-N+1:NAtoms) = H;
P(NAtoms-N+1:NAtoms,1) = K+1;
P(NAtoms-N+1:NAtoms,2) = 0;
P(NAtoms-N+1:NAtoms,3) = (0:N-1)';
