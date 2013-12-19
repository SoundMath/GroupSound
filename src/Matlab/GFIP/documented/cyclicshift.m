function [y,kk] = cyclicshift(x, nn, n0)
% y(nn) = x(nn-n0) where nn-n0 is mod length(nn)
%
% INPUT
%   x = vector (signal) with length(m) elements
%   nn = index set
%   n0 = amount by which to right-shift x
%
% OUTPUT
%   y = x (because it's the index set that's changed)
%   kk = index set
%
% USAGE
%   [y,kk] = sigshift(x,nn,n0)
%
N = length(nn);
if length(x) ~= N,
  error('size of input does not match index lengths');
end;
kk = mod(nn+n0,N); 
y = x;
