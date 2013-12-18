function afwig = WVTrans_AFC(sig1,sig2,DISP)
% WVTrans_AFC -- Alias-Free Cross Wigner Transform
%  Usage
%    afwig = WVDist_AFC(sig1,sig2,1)
%  Inputs
%    sig1    1-d signal
%    sig2    1-d signal
%    DISP    DISP=1 => produce image plot of Wigner Transform
%            DISP=0 => do not produce image plot (default)
%  Outputs
%    afwig   complex-valued matrix representing the alias-free
%            cross Wigner-Ville distribution of zero-extended signal
%            with rows corresponding to frequencies and columns
%            corresponding to times.
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
if nargin < 2,
  afwig = WVDist_AF(sig1); 
else,
  if nargin < 3, DISP=0; end;
  
  sig1 = sig1(:); sig2 = conj(sig2); sig2 = sig2(:);
  n = length(sig1);
  if(n~=length(sig2)), error('signals must have equal length'); end;
  zerosn = zeros(n,1);
  f1 = [zerosn; sig1; zerosn]; f2 = [zerosn; sig2; zerosn];
  afwig = zeros(n, n);
  ix  = 0:(n/2-1);
  
  for t=1:n,
    tplus  = n + t + ix;
    tminus = n + t - ix;
    x = zerosn;
    % even indices
    x(1:2:n) = f1(tplus) .* f2(tminus); 
    % odd indices    
    x(2:2:(n)) = (f1(tplus+1).*f2(tminus) + f1(tplus).*f2(tminus-1))/2; 
    afwig(:, t) = 2* (fftshift(fft(x)));
  end

  %% display
  if(DISP),
    abstf = real(afwig);
    tfmax = max(max(abstf));
    tfmin = min(min(abstf));
    colormap(1-gray(256))
    image(linspace(0,1,n),linspace(0,1,n),256*(abstf-tfmin)/(tfmax-tfmin));
    axis('xy')
    title('Alias Free Wigner Distribution');
    xlabel('Time')
    ylabel('Frequency')
  end;
end;

%%% 
% MODIFIED (to handle *cross* Wigner transform)
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


