function ff=fline(N, a, b, c, d, DISPLAY)
% Line of slope a/b through point (c,d).
%
% Returns NxN array representing line of slope a/b,
% passing through the point (c,d).  
%
% INPUT
%   N & (int) leading dimension of output array
%   a & (int) rise (but n.b., in Matlab you "rise" down)
%   b & (int) run
%   c & (int) 1st coord of pt through which line passes
%   d & (int) 2nd coord of pt through which line passes
%
% OUTPUT
%   ff & scene array
%
if nargin < 1, N=64; end;
if nargin < 2, a=1; end;
if nargin < 3, b=1; end;
if nargin < 4, c=0; end;
if nargin < 5, d=0; end;
if nargin < 6, DISPLAY=0; end;
ff=zeros(N);
yy= mod(c+(0:N-1)*a,N)+1;
xx= mod(d+(0:N-1)*b,N)+1;
for n=1:N,
  ff(yy(n),xx(n))=1;
end;
if DISPLAY,
  imagesc(ff);
end;
