function[x,n] = impseq(n0,n1,n2)
% Generates x(n) = delta(n - n0); n1 <= n <= n2
% ---------------------------------------------------
%
% INPUT:
%        n0 = int: point of unit mass
%        n1 = int: lower boundary
%        n2 = int: upper boundary
%
% OUTPUT:
%        x = row vector of length n1-n2+1 where all but one elements are zero;
%            the nonzero element is at index n0.
%        n = row vector containing the set on which x is defined.
%
% [x,n] = impseq(n0,n1,n2)
%
% EXAMPLE:
%   For point mass at 1, on interval [0,5]
%     >> [x,n] = impseq(1,0,5)
%
% SEE: Ingle and Proakis page 23.
%
n = [n1:n2]; x = [(n-n0) == 0];
