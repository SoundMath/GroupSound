clear;
n=8;
n2=n*2;
nd2=n/2;
%gg=zeros(n2,n2);
%gg(1:n2,6)=1;
%gg(5:n2-6,6)=1;
%s2=input('input the scene number 0--6     ');
%sz=input('input the strip size 1--32    ');
%sz=4;
gg=bkgd(1,18,n);
[nx,ny]=size(gg);
nx2=nx/2;
szx=n/2;
szy=2;
hh=bkgd(3,4,n);
gg=hh;
%
[11,12, 13, 14, 15, 18, 19,23]
[29,31,103,104,201,202,203]
gp1=input('input the group number    ');
%gp1=11;
mm=max(max(gg));
mn=0;
%lvl=input('input the noise level     ');
lvl=1;
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
gg=gg+ns;
gg1=dd22(gg,11,1);
gg=gg+gg1+dd22(gg,gp1,2)+dd22(gg1,gp1,2);
%
[x1,x21,x22,x23,x4]=nn_22(gg,gp1);
xx1=(inn_22(x1,gp1));
xx21=(inn_22(x21,gp1));
xx22=(inn_22(x22,gp1));
xx23=(inn_22(x23,gp1));
xx4=(inn_22(x4,gp1));
[max(max(xx1)) max(max(xx21)) max(max(xx22)) max(max(xx23)) max(max(xx4))]'
%for k=1:n
%   kk1=mod(p1-(k-1),n)+1;
%   v2(p1+1,k)=y2(p1+1,k);
%   v2(p1+1+n,kk1)=y2(p1+1+n,kk1);
%end   
%
figure(1)
colormap(gray)
subplot(3,2,1),imagesc(gg)
axis image
axis off
subplot(3,2,2),imagesc(real(xx1))
axis image
axis off
subplot(3,2,3),imagesc(real(xx21))
axis image
axis off
subplot(3,2,4),imagesc(real(xx22))
axis image
axis off
subplot(3,2,5),imagesc(real(xx23))
axis image
axis off
subplot(3,2,6),spy(abs(x1)>.00001)
