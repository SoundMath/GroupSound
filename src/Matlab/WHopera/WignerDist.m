function afwig = WignerDist(sig1,sig2)
% WignerDist -- Alias-Free Wigner-Ville Distribution
%  Usage
%    afwig = WignerDist(sig)
%  Inputs
%    sig1     1-d signal
%    sig2     an optional second 1-d signal; 
%             if sig2 is input, cross WV will be computed
%    DISP     (default = 0) 1 ==> plot WV Dist
%  Outputs
%    afwig   complex-valued matrix representing the alias-free
%            Wigner-Ville distribution of zero-extended signal with
%            rows corresponding to frequencies and columns corresponding
%            to times.
%
%  Side Effects
%    Image Plot of the alias-free Wigner-Ville distribution
%
%  See Also
%	Interpol2
%
%  References
%   Mallat's book, sections 4.5.1 and 4.5.4
%

DISP = 0;
  
sig1 = sig1(:);

N   = length(sig1);

sig1 = Interpol2(sig1);

if nargin < 2,
  sig2 = sig1;
else,
  sig2 = sig2(:);
  sig2 = Interpol2(sig2);
end;

f1 = [zeros(2*N,1) sig1 zeros(2*N,1)];
f2 = [zeros(2*N,1) sig2 zeros(2*N,1)];

afwig = zeros(N, N);

q  = (0 : 2*N-1);
p(1:N) = q(1:N);                % p(1:N) = 1:N
p(N+1:2*N) = q(N+1:2*N) - 2*N;  % p(N+1:2*N) = -N:0

for n=1:N,
  nplus    = 2*n + p;
  nminus   = 2*n - p;

  x = f1(2*N+nplus) .* conj(f2(2*N+nminus));
  aux = fft(x);
  afwig(:,n) = aux(1:2:2*N-1).';
end

% this should be zero :
if(DISP),
  max(max(abs(imag(afwig(1:N/2,:)))));
  abstf = real(afwig(1:N/2,:)).*(real(afwig(1:N/2,:))>=zeros(N/2,N));
  tfmax = max(max(abstf));
  tfmin = min(min(abstf));
  colormap(1-gray(256))
  image(linspace(0,N,N),linspace(0,N/2,N/2),256*(abstf-tfmin)/(tfmax-tfmin));
  axis('xy')
  title('');
  xlabel('Time')
  ylabel('Frequency')
end;

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%
% Modified by William DeMeo on 2002.02.28
% to handle cross WV
    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    
