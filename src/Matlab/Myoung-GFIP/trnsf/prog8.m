clear;
n=32;
n2=n*2;
n3=n*3;
orgn=1;
%
gg1=zeros(n2,n2);
gg2=zeros(n2,n2);
nm=n/4-1;
np=n/4+1;
x=linspace(0,n2-1,n2);
xp=mod(np*x,n);
xm=mod(nm*x,n);
for k=0:n2-1
   ln1(k+1,xp(k+1)+1)=15;
   ln2(k+1,xm(k+1)+1)=15;
end
gg1(1:n,1:n)=ln1(1:n,1:n);
%gg1(1:n2,1+n:n2)=ln1;
gg2(1:n,1:n)=ln2(1:n,1:n);
%gg2(1:n2,1+n:n2)=ln2;
trgt=gg1+gg2;   
trgt(1,1)=.5*trgt(1,1);
trgt(n/2+1,n/2+1)=.5*trgt(n/2+1,n/2+1);
%
lvl=input('input noise level as a multiple of max intensity    ')
sdv=lvl*max(max(trgt));
%mn=input('input the mean of the noise        ')
mn=0;
ns=noise(n2,n2,mn,sdv);
%
ff=trgt+ns;
figure(1)
clf
colormap(gray)
subplot(3,2,1),imagesc(gg1)
axis image
subplot(3,2,3),imagesc(gg2)
axis image
axis off
subplot(3,2,5),imagesc(trgt)
axis image
axis off
subplot(3,2,2),imagesc(ff)
axis image
axis off
pause
%
gp=23;
[y1,y2,y4]=nn_4(ff,gp);
yy2=real(inn_4(y2,gp));
subplot(3,2,4),imagesc(yy2)
axis image
axis off
%
pause
gp=24;
[u1,u2,u4]=nn_4(ff,gp);
uu2=real(inn_4(u2,gp));
subplot(3,2,6),imagesc(uu2)
axis image
axis off
