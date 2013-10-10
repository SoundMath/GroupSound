clear;
n=32;
n2=n*2;
n3=n*3;
orgn=1;
%
%
%
%s2=input('input the scene number 0--6     ')
%sz=input('input the strip size 1--32    ')
%gg1=bkgd(s2,sz,n);
%gg=llins(3,n);
%gg=bkgd(6,8,n);
%gg=4*gg1+gg2;
%gg1=imread('c:\My Documents\My Pictures\basket.tif');
gg1=imread('c:\My Documents\My Pictures\fence.tif');
gg=double(gg1(1:n2,1:n2));
%
%s2=input('input the scene number 0--6     ')
%sz=input('input the strip size 1--32    ')
%gg2=bkgd(s2,sz,n);
%gg=gg1+gg2;
%
% gp; 1,2,3,11,12,21,22,23,24
mm=max(max(gg));
mn=0;
%lvl=input('input the noise level     ')
%sdv=lvl*mm;
%ns=noise(n2,n2,mn,sdv);
%ngg=gg+ns;
%
%gp=23;

gp=input('input the group number 1--6   ')
[x1,x2,x4]=scl4(gg,n,gp);
xx1=real(iscl4(x1,n,gp));
xx2=real(iscl4(x2,n,gp));
xx4=real(iscl4(x4,n,gp));
%
%figure(1)
%clf
%colormap(gray)
%subplot(1,3,1),imagesc(gg)
%axis image
%axis off
%subplot(1,3,2),imagesc(ngg)
%axis image
%axis off
%subplot(1,3,3),imagesc(vv1+vv2)
%axis image
%axis off
%
%
subplot(4,2,1),imagesc(gg)
subplot(4,2,2),imagesc(xx1)
subplot(4,2,3),imagesc(xx2)
subplot(4,2,4),imagesc(xx4)
[1  2  3 11 21 22 23 24]
gp=input('input the group number    ')
[v1,v2,v4]=nn2_4(xx4,n,gp);
vv1=real(inn2_4(v1,n,gp));
vv2=real(inn2_4(v2,n,gp));
vv4=real(inn2_4(v4,n,gp));
%
subplot(4,2,5),imagesc(gg)
subplot(4,2,6),imagesc(vv1)
subplot(4,2,7),imagesc(vv2)
subplot(4,2,8),imagesc(vv4)
