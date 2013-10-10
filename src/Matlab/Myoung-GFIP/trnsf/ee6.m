clear;
m=16;
n=3*m;
n2=n+n;
n3=n2+n;
n4=n3+n;
n5=n4+n;
n6=n5+n;
nd2=n/2;
%orgn=1;
%
%s2=input('input the scene number 0--6     ');
s2=1;
%sz=input('input the strip size 1--32    ');
sz=4;
gg=bkgd(1,16,n2);
ff(1:n3,1:n2)=gg(1:n3,1:n2);
ff1(1:n3,1:n2)=gg(1+8:n3+8,1:n2);
%gp1=input('input the group number    ');
gp1=3;
mm=max(max(gg));
mn=0;
%lvl=input('input the noise level     ');
lvl=0;
sdv=lvl*mm;
ns=noise(n3,n2,mn,sdv);
nff=ff+ns;
a=mod([-1 m+1;m-1 m],n);
a2=mod(a*a,n);
a3=mod(a*a2,n);
a4=mod(a*a3,n);
a5=mod(a*a4,n);
a6=mod(a*a5,n);
for k1=1:n
   for k2=1:n
      b1=a*[k1-1;k2-1];
      kk1=mod(b1(1,1),n)+1;
      kk2=mod(b1(2,1),n)+1;
      g1(kk1+n, kk2+n)=ff(k1,   k2);
      g1(kk1+n2,kk2+n)=ff(k1+n, k2);
      g1(kk1,   kk2+n)=ff(k1+n2,k2);
      g1(kk1+n, kk2  )=ff(k1,   k2+n);
      g1(kk1+n2,kk2  )=ff(k1+n, k2+n);
      g1(kk1,   kk2  )=ff(k1+n2,k2+n);
   end
end
%
%
ngg=g1+ns;
[x1,x2,x3,x6]=nn6(ff+ff1,gp1);
u3=zeros(n3,n2);
u6=zeros(n3,n2);
for k=1:m-1
   u3(3*k+1,n-3*k+1)=x3(3*k+1,n-3*k+1);
   u6(n-k+1,k+1)=x6(n-k+1,k+1);
end   
uu3=(inn6(u3,gp1));
uu6=(inn6(u6,gp1));
%
xx1=(inn6(x1,gp1));
xx2=(inn6(x2,gp1));
xx3=(inn6(x3,gp1));
xx6=(inn6(x6,gp1));
mf=max(max(ff));
nf=max(max(nff));
m1=max(max(abs(real(xx1))));
m2=max(max(abs(real(xx2))));
m3=max(max(abs(real(xx3))));
m6=max(max(abs(real(xx6))));
%
[m1 m2 m3 m6]
figure(1)
colormap(gray)
subplot(2,3,1),imagesc(ff)
subplot(2,3,2),imagesc(nff)
subplot(2,3,3),imagesc(real(xx1))
subplot(2,3,4),imagesc(real(xx2))
subplot(2,3,5),imagesc(real(xx3))
subplot(2,3,6),imagesc(real(xx6))
