% Miscellaneous tests and experiments.
%
% Experiments for testing behavior of various 
% Matlab functions and operations.
%
% HISTORY
%   2005.03.05 & William DeMeo & demos for ICMC 2005 Paper
%   2004.12.09 & William DeMeo & demos for EE 616 talk
%   2004.04.29 & William DeMeo & minor mods
%   2004.04.26 & William DeMeo & initial file

clear;
ZeRo = 0; OnE = 1;

% [2004.04.30]
if (ZeRo),
  N=8;
  x = zeros(N);
  for n=1:N,
    x(n,:) = n*10 + (1:N);
  end;
  P = [ 1 zeros(1,7); zeros(7,1) fliplr(eye(7))];
end;

% TRANSLATIONS
if(OnE),
  N = 8;
  % delta fn on {0, 1, ..., N-1}
  [x,kk] = impseq(1,0,N-1);  x = .8*x;
  [y,kk2] = cyclicshift(x,kk,2);   % y(k) = x(k-2); (RIGHT translate by 2)
  [y,kk9] = cyclicshift(x,kk,9);   % y(k) = x(k-9); (RIGHT translate by 9)
  [y,kkN7] = cyclicshift(x,kk,-7);  % y(k) = x(k+7); (LEFT translate by 7)
  % these are equiv to: impseq(2,0,N-1); impseq(7,0,N-1); impseq(9,0,N-1); resp.
  figure(1);clf; 
  subplot(2,2,1); stem(kk,x); ylabel('x(m)'); title('x'); axis([0 8 0 1]); grid on;
  subplot(2,2,2); stem(kk2,y); ylabel('x(m-2)'); title('m^2 x');axis([0 8 0 1]); grid on;
  subplot(2,2,3); stem(kk9,y); ylabel('x(m-9)'); title('m^9 x');axis([0 8 0 1]); grid on;
  subplot(2,2,4); stem(kkN7,y); ylabel('x(m+7)'); title('m^{-7} x');axis([0 8 0 1]); grid on;
  % 
end;

% [2004.05.06]
% LINES FOR PHASE SCREENS
% Line of slope a/b through point (c,d).
if(ZeRo),
  N = 64;
  b = N-1; % horizonal run (object elevation)
  y = [0:N-1];  x = [0:N-1];
  yx = fline(N, 0, 1);
  yx = yx + fline(N, 1, 2);
  yx = yx + fline(N, -1, 2);
  yx = yx + fline(N, 1, 2, 32, 0);
  figure(1); clf; colormap(gray);
  imagesc(yx);
end;

% [2005.03.05, 2004.06.02]
if(OnE),
  K=3;
  N=pow2(K+1);  % signal length (e.g. K=3 => N=16, K=4 => N=32, ..., K=6 => N=128)
  n=N/2;        % signal half-length = 2^K   
  nn=0:n-1;

  v=zeros(N,1);   v(n+1)=1;
  u = linspace(-1,1,N);
  u = u(:);
  
  %tmp = u; u=v;  v=tmp;
  
  figure(2); clf;

  subplot(4,1,1);stem(u);axis([0,N,-1,1]); title('f \in CG_2, N=8'); 
  set(gca,'XTick',1:N); set(gca,'XTickLabel',' ');
  set(gca,'YTick',[]); 
  
  subplot(4,1,2);stem(v);axis([0,N,-1,1]); title('g = k_{15}');
  set(gca,'XTick',1:N); set(gca,'XTickLabel',' ');
  set(gca,'YTick',[]); 

  % Circular Convolution Theorem:
  ccuv = ifft(fft(u).*fft(v));     

  % Matlab does non-circular convolution:
  %  cuv=conv(u,v);  %  length(cuv) == 31 
  % We could acheive the same as follows:
  % u0 = [u; zeros(N-1,1)]; v0=[v;zeros(N-1,1)];
  % ccuv = ifft(fft(u0).*fft(v0));

  oneper=N;
  %  figure(2); clf; axis tight;
  subplot(4,1,3); stem(real(cuv)); %axis([0,length(cuv),-1,4]);
%  axis([0,oneper,-1,1]); title('g f = k_{15} f');
%  set(gca,'XTick',1:N); set(gca,'XTickLabel',' '); set(gca,'YTick',[]); 
  subplot(4,1,4);stem(real(ccuv)); %axis([0,length(ccuv),-1,4]);
%  axis([0,oneper,-1,1]); title('g f = k_{15} f');
%  set(gca,'XTick',1:N); set(gca,'XTickLabel',' '); set(gca,'YTick',[]); 

if(ZeRo),
  gp=1;
  uu=gn2(u,gp);  % convolution matrix
  y0=uu*v;
  y1=convsdp(u,v,gp);

  %  figure(3); clf;
  %  subplot(1,3,3);stem(real(y0));
  subplot(3,1,3); stem(y1); axis([0,oneper,-1,1]); title('g f = k_{15} f');
  set(gca,'XTick',1:N); set(gca,'XTickLabel',' ');
  set(gca,'YTick',[]); 
end;
end;

