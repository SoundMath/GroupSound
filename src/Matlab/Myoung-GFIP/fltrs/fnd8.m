clear;
n=16;
n2=n+n;
n3=n2+n;
n4=n3+n;
gp=2;
s2=input('input the scene   ')
sz=input('input the strip size  ')
hh=bkgd(s2,sz,n/2);
gg=zeros(n4,n2);
x=floor(n3*rand);
y=floor(n*rand);
gg(1+x:n+x,1+y:n+y)=hh(1:n,1:n);
%
mm=max(max(gg));
mn=0;
lvl=input('input the noise level     ')
sdv=lvl*mm;
ns=noise(n4,n2,mn,sdv);
ngg=gg+ns;
%
y23=real(ww_222(ngg,gp,23));
%
figure(1)
clf
subplot(3,3,1),imagesc(ngg)
subplot(3,3,2),imagesc(y23)
%
%
nn(1)=max(max(y23(1:n,1:n)));
nn(2)=max(max(y23(1+n:n2,1:n)));
nn(3)=max(max(y23(1+n2:n3,1:n)));
nn(4)=max(max(y23(1+n3:n4,1:n)));
nn(5)=max(max(y23(1:n,1+n:n2)));
nn(6)=max(max(y23(1+n:n2,1+n:n2)));
nn(7)=max(max(y23(1+n2:n3,1+n:n2)));
nn(8)=max(max(y23(1+n3:n4,1+n:n2)));
[nn(1:4)' nn(5:8)']
