function [WVE, WVI] = WVEnergy(x, C, P, WVT, DEBUG, DISP)
% WVEnergy.m
%
% Matlab code for the demonstration of relation between interference
% energy and beat frequency.
%
% inputs
%     x     analytic signal with which to correlate atoms;
%             signal length must be a power of 2
%     C     pre-computed max atom correlations
%     P     pre-computed max atom parameters (obtained from Dictionary.m)
%     WVT   (default = 0) determines which method to use for computing WV
%     DEBUG (default = 0) 1 ==> print debugging messages
%     DISP  (default = 0) DISP>0 ==> plot W-V energy & interference in figures
%           starting with figure number DISP
%     
%     
% Other Notes
%     will only use pre-computed values if both P_0 and C_0 are passed
%
% See also:  WHMP, WHatom, WVTrans_AF, WVTrans_AFC
%
% Author: William DeMeo <william.demeo@verizon.net>
% Date: 2001 July 30
% Copyright (c) 2001, William DeMeo


if nargin < 4, WVT = 0; end;

if nargin < 5, DEBUG = 0; end;

if nargin < 6, DISP = 0; end;

N=length(x); K=log2(N)-1; 

M = size(P,1);  % M = number of atoms used in signal representation
		
%%% COMPUTE WIGNER TRANSFORMS %%%
% P is at most of size MAXITERSx4; C is at most 1xMAXITERS
WVE = zeros(N,N);
WVI = zeros(N,N);


if(DEBUG),
  disp('WVEnergy: computing energy & interferences...');
end;

for n=1:M-1,

  g1 = WHatom(K,P(n,:));

  if(DEBUG), disp('WVEnergy: computing auto WV...'); t0 = cputime; end;
  
  if(WVT),  % which method to use
    WV = WVTrans_AF(g1);
  else,
    WV = WignerDist(g1);
  end;

  if(DEBUG), 
    t1 = cputime - t0; 
    disp(sprintf('WVEnergy: ...done in %f seconds.',t1));
  end;

  WVE = WVE + (C(n)*conj(C(n))).*WV; %  WVE = WVE + (abs(C(n))^2)*WV;

  if(DEBUG), disp('WVEnergy: computing cross WVs...'); t1 = cputime; end;

  for m=n+1:M,   % M is not very large, so make a matrix of atoms
    g2 = WHatom(K,P(m,:));

    if(WVT),  % which method to use
      WV = WVTrans_AFC(g1,g2);
    else,
      WV = WignerDist(g1,g2);
    end;

    WVI = WVI + 2.*real(C(n)*conj(C(m)).*WV);
  end;
  
  if(DEBUG),
    t1 = cputime - t1;
    t2 = cputime - t0;
    disp(sprintf('WVEnergy: ...done in %d seconds.',t1));
    disp(sprintf('WVEnergy: -- Atom %d of %d done in %f seconds total -- ',n,M,t2));
  end;

end;

% final atom
g1 = WHatom(K,P(M,:));

if(WVT),  % which method to use
  WV = WVTrans_AF(g1);
else,
  WV = WignerDist(g1);
end;

WVE = WVE + (C(M)*conj(C(M))).*WV;

if(DISP<0),
  figure(1);clf;
  absE = real(WVE);
  imagesc(absE);
  axis('xy'); title('Wigner Energy'); xlabel('Time'); ylabel('Frequency')

  figure(2);clf;
  absI = real(WVI);
  imagesc(absI);
  axis('xy'); title('Wigner Interference'); xlabel('Time'); ylabel('Frequency');

  figure(3);clf;  
  abstf = real(WVE+WVI);
  imagesc(abstf);
  axis('xy'); title('Wigner Transform'); xlabel('Time'); ylabel('Frequency')

end;

if(DISP>0),
  figure(DISP);clf;
  absE = real(WVE);
  tfmax = max(max(absE));
  tfmin = min(min(absE));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(absE-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Energy'); xlabel('Time'); ylabel('Frequency')

  figure(DISP+1);clf;
  absI = real(WVI);
  tfmax = max(max(absI)); tfmin = min(min(absI));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(absI-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Interference'); xlabel('Time'); ylabel('Frequency');

  figure(DISP+2);clf;  
  abstf = real(WVE+WVI);
  tfmax = max(max(abstf)); tfmin = min(min(abstf));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(abstf-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Transform'); xlabel('Time'); ylabel('Frequency')

end;

