clear;
n=16;
n2=n+n;
n3=n2+n;
n4=n3+n;
nd2=n/2;
%
%s2=input('input the scene number 0--6     ');
s2=1;
%sz=input('input the strip size 1--32    ');
sz=4;
%gg=bkgd(s2,sz,n2);
%ff(1:n2,1:n2)=gg(1:n2,1:n2);
gg=zeros(n2,n2);
for k=0:n-1
   gg(mod(n-(n/4-1)*(k-1),n)+1,k+1)=1;
   gg(mod(n-(n/4+1)*(k-1),n)+1,k+1)=1;
end  
gg(1+n:n2,1:n)=gg(1:n,1:n);
gg(1:n,1+n:n2)=gg(1:n,1:n);
gg(1+n:n2,1+n:n2)=gg(1:n,1:n);
%
%x_off=floor(n*rand);
%gg1(1+x_off:x_off+n,1:n)=gg(1:n,1:n);
%[1 2 3 11 12 21 22 23 24]
%gp1=input('input the group number    ');
%gp1=1;
%
gp1=102;
%[ff1,ff2,ff3]=dd4(gg,gp1);
gp2=103;
%[gg1,gg2,gg3]=dd4(gg,gp2);
ff=gg;
%
mm=max(max(ff));
mn=0;
lvl=input('input the noise level     ');
%lvl=0;
sdv=lvl*mm;
ns=noise(n2,n2,mn,sdv);
ngg=ff+ns;
%
[u1,u2,u4]=kk4(ngg,gp1);
uu1=real(ikk4(u1,gp1)); % rotate the verticals by 45
uu2=real(ikk4(u2,gp1));
uu4=real(ikk4(u4,gp1));
%
%mgg=real(ngg-uu1);
mgg=ngg;
[y1,y2,y4]=kk4(mgg,gp2);
yy1=real(ikk4(y1,gp2)); % rotate the verticals by 58
yy2=real(ikk4(y2,gp2));
yy4=real(ikk4(y4,gp2));
%
figure(1)
colormap(gray)
%subplot(3,2,1),imagesc(gg)
%subplot(3,2,2),imagesc(real(ngg))
%subplot(3,2,3),imagesc(real(yy1))
%subplot(3,2,4),imagesc(real(uu1))
%subplot(3,2,5),imagesc(real(yy1+uu1))
%t_off=n*m2/(m1+m2);
%big=.8*max(max(ngg))*ones(n2,2*n2+2);
%big(1:n2,1:n2)=real(uu1);
%big(1:n2,3+n2:2+2*n2)=real(yy1);
%
big=.8*max(max(ngg))*ones(n2,5*n2+8);
big(1:n2,1:n2)=ff;
big(1:n2,3+n2:2+2*n2)=ngg;
big(1:n2,5+2*n2:4+3*n2)=real(uu1);
big(1:n2,7+3*n2:6+4*n2)=real(yy1);
big(1:n2,9+4*n2:8+5*n2)=real(uu1+yy1);
%
%big(1:n2,1:n2)=ngg;
%big(1:n2,3+n2:2+2*n2)=real(uu1);
%big(1:n2,5+2*n2:4+3*n2)=real(mgg);
%big(1:n2,7+3*n2:6+4*n2)=real(yy1);
%big(1:n2,9+4*n2:8+5*n2)=real(uu1+yy1);
imagesc(big)
axis image
axis off