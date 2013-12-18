function gp = shift(g, p)
% shift.m
%
% Translate input vector by p samples, with wrap around (ie circular)
%
%  Inputs
%    g   signal
%    p   amount by which g is translated to the right (p<0 translate left)
%
%  Outputs
%    gp  row vector representing translated version of g
%  Usage
%    gp = shift(g, p)

%error(nargchk(2, 2, nargin));

g = g(:);
g = g.';
N = length(g);

p = rem(p,N);
if p<0,
  p = p+N;
end
gp = zeros(1,N);
gp(1:p) = g(N-p+1:N);
gp(p+1:N) = g(1:N-p);
%% the above is faster than:
%% gp = [g(N-p+1:N); g(1:N-p)];
