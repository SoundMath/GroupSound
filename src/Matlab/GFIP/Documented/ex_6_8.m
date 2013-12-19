% Example 6.8 (page 125) of [1] (figs 6.1--6.10)
% 
% Example similar in spirit to Example 6.8 (page 125) of [1]
% (corresponding to figures 6.1--6.10)
%
% HISTORY
%   2004.03.29 & William DeMeo & initial file
%   2004.04.16 & William DeMeo & revisions
%   2004.04.17 & William DeMeo & revisions
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
%   [1] An and Tolimieri, "Group Filters and Image Processing"

clear
K=6;
N=pow2(K+1);  % signal length (e.g. K=6 => N=128,  K=7 => N=256)
n=N/2;
nn=0:n-1;

u=zeros(N,1);  uu=zeros(N,1);  v=zeros(N,1);

%
% -- First example (figures 6.1--6.5) --
%
fig61 = amgauss(N,N/2,4*sqrt(N));         % gaussian window (center, scale)=(N/2, 2*sqrt(N))
x=linspace(-16,16,N);
fig62 = sinc(x);
u=fig61(:);  
v=fig62(:);

figure(1); clf; 
myfigure(real(u),real(v),1);

cuv = conv(u,v);                          % Matlab's convolution

u0 = [u; zeros(N-1,1)]; 
v0=[v;zeros(N-1,1)];
ccuv = ifft(fft(u0).*fft(v0));            % (circular) convolution theorem

figure(2); clf;
myfigure(real(cuv),real(ccuv),1);

%uu=gn2(u,1);  y=uu*v;                    % get convolution matrix

y1=cn_2(u,v,1);
y2=cn_2(u,v,2);
%y1=convsdp(u,v,1);
%y2=convsdp(u,v,2);
 
figure(3); clf;
myfigure(real(y1),real(y2),0);

%y3=convsdp(u,v,3);
y3=cn_2(u,v,3);

uu=gn_2(u,3);  yy3=uu*v;                    % get convolution matrix

figure(4); clf; axis tight;
subplot(1,2,1);plot(real(y3));
subplot(1,2,2);plot(real(yy3));

