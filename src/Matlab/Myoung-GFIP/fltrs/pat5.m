clear;
n=32;
n2=n*2;
nd2=n/2;
gg1=bkgd(2,4,n);
gg2=bkgd(1,4,n);
gg=gg1+gg2;
gp1=11;
mm=max(max(gg));
mn=0;
lvl=input('input the noise level     ');
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
ngg=gg+ns;
figure(2)
clf
subplot(2,2,1),imagesc(gg)
axis image
subplot(2,2,2),imagesc(ngg)
axis image
axis off
pause
%
xx22=real(ww_22(ngg,gp1,22));
xx23=real(ww_22(ngg,gp1,23));
subplot(2,2,3),imagesc(xx22+xx23)
axis image
axis off
