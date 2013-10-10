clear;
n=16;
n2=n+n;
n3=n2+n;
n4=n3+n;
nd2=n/2;
%
s2=input('input the scene number 0--6     ');
%s2=2;
sz=input('input the strip size 1--32    ');
%sz=10;
gg=bkgd(s2,sz,n);
ff(1:n2,1:n)=gg(1:n2,1:n);
[1 2 3 4 5]
gp1=input('input the group number    ');
%gp1=1;
mm=max(max(gg));
mn=0;
%lvl=input('input the noise level     ');
lvl=0.1;
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
nff(1:n2,1:n)=ff(1:n2,1:n)+ns(1:n2,1:n);
%
[x1,x2]=nn_2(nff,gp1);
xx1=(inn_2(x1,gp1));
u2=zeros(n2,n);
u2(2,3)=x2(2,3);
u2(3+n,2)=x2(3+n,2);
uu2=(inn_2(u2,gp1));
xx2=(inn_2(x2,gp1));
%
gg1=dd2(nff,gp1);
[y1,y2]=nn_2(gg1,gp1);
yy1=(inn_2(y1,gp1));
v2=zeros(n2,n);
v2(2,3)=y2(2,3);
v2(3+n,2)=y2(3+n,2);
vv2=(inn_2(v2,gp1));
yy2=(inn_2(y2,gp1));
%
figure(1)
colormap(gray)
subplot(3,2,1),imagesc(nff)
subplot(3,2,3),imagesc(real(xx1))
subplot(3,2,5),imagesc(real(xx2))
subplot(3,2,2),imagesc(gg1)
subplot(3,2,4),imagesc(real(yy1))
subplot(3,2,6),imagesc(real(yy2))
