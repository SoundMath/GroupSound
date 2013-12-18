clear;
n=16;
n2=n+n;
n3=n2+n;
n4=n3+n;
bkg=bkgd(2,2,n2);
gg=zeros(n4,n4);
bbv(1:n+2,1:n/2)=1;
bbh(1:n/2,1:n+2)=1;
xv=floor((n4-n-2)*rand);
yv=floor((n4-n/2)*rand);
xh=floor((n4-n/2)*rand);
yh=floor((n4-n-2)*rand);
[xv+1 yv+1]
[xh+1 yh+1]
xb=floor(n4*rand)+1;
yb=floor(n4*rand)+1;
for k=2:n2
   ngg(k,k+n)=1;
   ngg(k,n2-k+2)=1;
end   
gg(1+xv:xv+n+2,1+yv:yv+n/2)=bbv;
gg(1+xh:xh+n/2,1+yh:yh+n+2)=bbh;
gg(xb,yb)=4;
%
mm=.25*max(max(gg));
mn=0;
lvl=input('input the noise level     ')
sdv=lvl*mm;
ns=noise(n4,n4,mn,sdv);
ngg=-ns.*(gg+bkg);
%ngg(1+xv:xv+n+2,1+yv:yv+n/2)=bbv;
%ngg(1+xh:xh+n/2,1+yh:yh+n+2)=bbh;
%
gp=2;
y42=real(ww_2222(ngg,1,42));
x41=real(ww_2222(ngg-y42,2,41));
%y42=real(ww_2222(ngg-x41,1,42));
subplot(2,2,1),imagesc(gg)
axis image
subplot(2,2,2),imagesc(ngg)
axis image
subplot(2,2,3),imagesc(y42)
axis image
subplot(2,2,4),imagesc(x41)
axis image
