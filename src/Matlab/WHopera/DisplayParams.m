function DisplayParams(string,P,n)
%
% Matlab code for displaying parameter values in MZMP.m program
% for debugging purposes.
%
% Inputs
%   string  a string to print preceding the parameters
%   P       parameter vector
%   n       number of parameters to display
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 May 25
% Copyright (c) 2001, William DeMeo
if (nargin < 2), error('USAGE: DisplayParams(string,P,n)'); end;
if (nargin < 3), n=1; end;

if(isreal(P)),
  switch n
    case 1,
      disp(sprintf('%s%g',string,P(1)));
    case 2,
      disp(sprintf('%s%g, %g',string,P(1), P(2)));
    case 3,
      disp(sprintf('%s%g, %g, %g',string,P(1), P(2), P(3)));
    case 4,
      disp(sprintf('%s%g, %g, %g, %g',string,P(1), P(2), P(3), P(4)));
    case 5,
      disp(sprintf('%s%g, %g, %g, %g, %g',string,P(1), P(2), P(3), ...
	  P(4), P(5)));
    otherwise,
      error('too many parameters (can only handle 5)');
  end;
else,
  C = imag(P); P = real(P);
  switch n
    case 1,
      disp(sprintf('%s(%g, %g)',string,P(1),C(1)));
    case 2,
      disp(sprintf('%s(%g, %g), (%g, %g)',string,P(1),C(1),P(2),C(2)));
    case 3,
      disp(sprintf('%s(%g, %g), (%g, %g), (%g, %g)',...
	  string,P(1),C(1),P(2),C(2),P(3),C(3)));
    case 4,
      disp(sprintf('%s(%g, %g), (%g, %g), (%g, %g), (%g, %g)',...
	  string,P(1),C(1),P(2),C(2),P(3),C(3),P(4),C(4)));
    case 5,
   disp(sprintf('%s(%g, %g), (%g, %g), (%g, %g), (%g, %g), (%g, %g)',...
       string,P(1),C(1),P(2),C(2),P(3),C(3),P(4),C(4),P(5),C(5)));
    otherwise,
      error('too many parameters (can only handle 5)');
  end;
end;


  
