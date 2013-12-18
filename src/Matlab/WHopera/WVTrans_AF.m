function afwig = WVTrans_AF(sig,DISP)
% WVDist_AF -- Alias-Free Wigner-Ville Distribution
%  Usage
%    afwig = WVDist_AF(sig)
%  Inputs
%    sig     1-d signal
%    DISP    DISP=1 => produce image plot of Wigner Transform
%            DISP=0 => do not produce image plot (default)
%  Outputs
%    afwig   complex-valued matrix representing the alias-free
%            Wigner-Ville distribution of zero-extended signal with
%            rows corresponding to frequencies and columns corresponding
%            to times.
%
%  Side Effects
%    Image Plot of the alias-free Wigner-Ville distribution
%    (if DISP>0)
%
%  See Also
%    WVDist, WVDist_AF, ImagePhasePlane
%
%  References
%   Jechang Jeong and William J. Williams,
%   "Alias-Free Generalized Discrete-Time Time-Frequency Distribution,"
%   IEEE Transactions on Signal Processing, vol. 40, pp. 2757-2765.
%
if nargin < 2, DISP=0; end;
sig = sig(:);
n   = length(sig);
f   = [zeros(n,1); sig; zeros(n,1)];
afwig = zeros(n, n);
ix  = 0:(n/2-1);
zerosn = zeros(n,1);

for t=1:n,
  tplus    = n + t + ix;
  tminus   = n + t - ix;
  x = zerosn;
  %even indices
  x(1:2:(n)) = f(tplus) .* f(tminus);
  %odd indices
  x(2:2:(n)) = (f(tplus+1).*f(tminus) + f(tplus).*f(tminus-1))/2;  
  afwig(:, t) = 2* (fftshift(fft(x)));
end

if(DISP),
  abstf = real(afwig);
  tfmax = max(max(abstf));
  tfmin = min(min(abstf));
  colormap(1-gray(256))
  image(linspace(0,1,n),linspace(0,1,n),256*(abstf-tfmin)/(tfmax-tfmin));
  axis('xy')
  title('Alias Free Wigner Distribution')
  xlabel('Time')
  ylabel('Frequency')
end;

%%% Minor Modifications
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 May 25
% Copyright (c) 2001, William DeMeo
%%%

%
% Copyright (c) 1994-5, Shaobing Chen
%

%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    
