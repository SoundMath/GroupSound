function sig = Atoms2Sig(K,P,C)
% 
% Matlab code for constructing a signal out of Gabor atoms having the
% given parameters.
%
% Inputs
%   K     the output signal will have length 2^(K+1)
%   P     matrix of atom parameters
%   C     vector of atom coefficients (each element represents the
%         projection of output signal onto the corresponding atom)
% Outputs
%   sig   column vector of real values representing the desired output
%         signal; that is, a linear combination of the atoms:
%          sig = MaxC(1)*atom(1) + MaxC(2)*atom(2) + ...
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 May 21
% Revised: 2002 Feb 25
% All rights reserved

N = pow2(K+1); M = length(C);
sig = zeros(1,N);
for m = 1:M,
  s = P(m,1); a1 = P(m,2); a2 = P(m,3);
  g = WHatom(K,s,a1,a2);
  sig = sig + C(m).*g;
end;
sig = sig(:);  % shape as a column vector
