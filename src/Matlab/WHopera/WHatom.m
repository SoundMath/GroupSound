function g = WHatom(K,s,a1,a2,DISP)
%
% Matlab code for constructing a Gabor atom from the given parameters.
%
% You can also call WHatom like this
%    function g = WHatom(K,P,DISP)
% The program will parse parameters as:
%    s = P(1); a1 = P(2); a2 = P(3);
% 
% Inputs
%   K   N = pow2(K+1) is the length of output atom, g
%   s   S = pow2(s) is the scale of the output atom 
%       (roughly equal to the number of values for which g > 0)
%   a1  translation of atom
%   a2  modulation of atom
%   OR (instead of s, a1, a2):
%   P   a 1x3 vector of atom parameters:
%   DISP (default = 0) if a positive integer, the atom will be plotted in
%        figure number DISP
% Outputs
%   g   a scaled, translated, and modulated window.
%
%

DEBUG=1;

error(nargchk(2, 5, nargin));

switch nargin
  
  case 2, 
    DISP = 0;
    a1 = s(2); a2 = s(3); s = s(1);   % parse the parameters
  
  case 3,
    DISP = a1;
    a1 = s(2); a2 = s(3); s = s(1);   % parse the parameters
  
  case 4,
    DISP=0; 

end;

if(K<1), error('invalid first argument'); end;
if(s<0 | s>K+1), error('invalid second argument'); end;

nn = pow2(K);
N = 2*nn;   % equiv: pow2(K+1);

if(a1<0 | a1>(N-1)),error('invalid third argument'); end;
if(a2<0 | a2>(N-1)),error('invalid fourth argument'); end;

n=(0:N-1);                     % discrete time parameter
%n=(-nn+1:nn);                     % discrete time parameter

  % Dirac
if(s==0),          
  g = zeros(N); 
  g(a1+1)=1;  % a1 is in {0,1,...,N-1}

  % complex exponential
elseif (s == K+1), 
  g = (1/sqrt(N)).*exp((i*2*pi*a2/N).*n);

  % s must be in {1,...,K}
else,              
  g = ScaledWindow(N,s);        % scale by pow2(s)
  g = shift(g,a1);              % translate right by a1*L1 samples
  g = g .* exp((i*2*pi*a2/N).*n);  % modulate at frequency a2
  Ks = (1/norm(g));
  g = Ks.*g;

end;

ng = norm(g);

if(ng > (1+100*eps) | ng < (1-100*eps)), 
  warning(sprintf('norm(g) = %2.15f', ng));
end;

if(DISP),
  figure(DISP); clf;
  plot(real(g));
  axis([0,N-1,-1,1]);
end;
