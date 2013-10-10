clear;
n=8;
m=n/2;
n2=n*2;
u=rand(n2,1);
v=rand(n2,1);
%
u1=cnvmt(u(1:n,1));
v1=cnvmt(u(1+n:n2,1));
nn=linspace(0,n-1,n);
gp=1;
if (gp==1) % x --> x^-1
   rn=mod(n-nn,n)+1;
   for k1=1:n
      for k2=1:n
         v2(k1,k2)=v1(k1,rn(k2));
      end   
   end   
end
uu=[u1 v2;v2 u1];
y=tr_2mtx(n);
yu=y*uu;
yuy=yu*y';
%
yy=zeros(n2,n2);
d1=sqrt(n)*tr_2(uu(:,1),n);
for k=2:m
   yy(k,k)=d1(k,1);
   yy(k,n2-k+2)=d1(n+k,1);
   yy(k+m,k+m)=d1(k+m,1);
   yy(k+m,n2-(k+m)+2)=d1(k+m+n,1);
   yy(k+n,k+n)=d1(k,1);
   yy(k+n,n-k+2)=d1(k+n,1);
   yy(k+m+n,k+m+n)=d1(k+m,1);
   yy(k+m+n,n-(k+m)+2)=d1(k+m+n,1);
end   
yy(1,1)=sqrt(2)*d1(1,1);
yy(1+m,1+m)=sqrt(2)*d1(1+m,1);
yy(1+n,1+n)=sqrt(2)*d1(1+n,1);
yy(1+m+n,1+m+n)=sqrt(2)*d1(1+m+n,1);
