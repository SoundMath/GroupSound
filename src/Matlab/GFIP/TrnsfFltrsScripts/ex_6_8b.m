% Example 6.8 (page 125) of [1] (figs 6.6--6.10).
%
% Example similar in spirit to Example 6.8 (page 125) of [1]
% (corresponding to figures 6.6--6.10)
%
% HISTORY
%   2004.03.29 & William DeMeo & initial file
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

u=zeros(N,1); uu=zeros(N,1); 
v=zeros(N,1);

fig6_6=amgauss(N,N/2,2*sqrt(N));  % gaussian with (center, scale)=(N/2, sqrt(N))
fig6_7=fmlin(N,0,pow2(-5),1);
u=fig6_6(:);  
v=fig6_7(:);

figure(1); clf;
subplot(1,2,1);plot(real(u));axis([0,N,-1,1]);
subplot(1,2,2);plot(real(v));axis([0,N,-1,1]);

cuv=conv(u,v);

u0 = [u; zeros(N-1,1)]; v0=[v;zeros(N-1,1)];
ccuv = ifft(fft(u0).*fft(v0));     % (circular) convolution theorem

figure(2); clf; axis tight;
subplot(1,2,1);plot(real(cuv)); axis([0,length(cuv),-1,4]);
subplot(1,2,2);plot(real(ccuv)); axis([0,length(ccuv),-1,4]);

gp=1;
uu=gn2(u,1);  % convolution matrix
y0=uu*v;
y1=convsdp(u,v,1);
y2=convsdp(u,v,2);

figure(2); clf;
subplot(1,3,1);plot(real(y0));%axis([0,oneper,-1,1]);
subplot(1,3,2);plot(real(y1));%axis([0,oneper,-1,1]);
subplot(1,3,3);plot(real(y2));%axis([0,oneper,-1,1]);

%zero2pi =linspace(0,pi,N);
%u=cos(zero2pi);
%u=u(:);
%uru(1:n) = u(1:n);
%rn=mod(n-nn,n)+1;
%for k=1:n
%  uru(k+n)=u(rn(k)+n);
%end   
%figure(1);clf; plot(u);
%figure(2);clf; plot(uru);
%gp=1;
