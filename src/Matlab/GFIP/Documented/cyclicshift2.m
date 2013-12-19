function [y,jj,kk] = cyclicshift2(x,mm,nn,m0,n0)
% y(mm,nn) = x(mm-m0,nn-n0) where (mm-m0,nn-n0) is modulo
% (length(mm),length(nn))
%
% INPUT
%   x = 2d array of size length(mm)xlength(nn)
%   mm = index set for leading (vertical) dimension of x
%   nn = index set for trailing (horizontal) dimension of x
%   m0 = amount by which to down-shift x
%   n0 = amount by which to right-shift x
%
% OUTPUT
%   y = x (because it's the index set that's changed)
%   jj = index set for leading (vertical) dimension of y
%   kk = index set for trailing (horizontal) dimension of y
%
% USAGE
%   [y, jj, kk] = cyclicshift2(x,mm,nn,m0,n0)
%
N1 = length(mm);  % vertical dimension length
N2 = length(nn);  % horizontal dimension length
Nx = size(x);
if Nx(1) ~= N1 | Nx(2) ~= N2,
  error('size of input does not match index lengths');
end;
jj = mod(mm+m0,N1); kk = mod(nn+n0,N2); % index set for y
y = x;
