clear;
n2=input('input the data size    ');
n=n2/2;
m=n/2;
u=rand(n2,n);
v=rand(n2,n);
%
u1=cnvmt(u(1:n,1));
u2=cnvmt(u(1+n:n2,1));
%
nn=linspace(0,n-1,n);
gp=input('input the group number     ');
if (gp==1) % x --> x^-1
   rn=mod(n-nn,n)+1;
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   c1(1,3)=1+m;
   c1(2,3)=1;
   c1(1,4)=1+m;
   c1(2,4)=1+m;
end
%
if (gp==2) % x^k --> x^(m+1)*k
   rn=mod((m+1)*nn,n)+1;
   d1=m*m;
   for k2=0:m-1
      for k1=0:m-1
         c1(1,k1+1+m*k2)=2*k1+1;
         c1(2,k1+1+m*k2)=2*k2+1;
      end   
   end   
end
%
if (gp==3) % x^k --> x^(m-1)*k
   rn=mod((m-1)*nn,n)+1;
   d1=4;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   c1(1,3)=1+m;
   c1(2,3)=1;
   c1(1,4)=1+m;
   c1(2,4)=1+m;
end
%
for k1=1:n
   for k2=1:n
      v2(k1,k2)=u2(rn(k1),rn(k2));
   end   
end   
uu=[u1 v2;v2 u1];
dr=uu*v;
%
% convolution theorem
for k=1:n2
   [f1,f2]=n_2(uu(:,k),n,gp);
   fu(:,k)=f1+f2;
end   
fut=fu';
for k=1:n2
   [a1,a2]=mn_2(fut(:,k),gp);
   at(:,k)=a1+a2;
end
fuf=at';
[fv1,fv2]=mn_2(v,gp);
fv=fv1+fv2;
dd=fuf*fv;
c2=imn_2(dd,gp);
%
%
%
[d11,d12]=mn_2(u(:,1),gp);
[d21,d22]=mn_2(v(:,1),gp);
for k=1:n
   c(k,1)=d12(k)*d22(k)+d12(k+n)*d22(rn(k)+n);
   c(k+n,1)=d12(k+n)*d22(rn(k))+d12(k)*d22(k+n);
end   
%
for k=1:d1
   c(c1(k),1)=sqrt(2)*d11(c1(k),1)*d21(c1(k),1);
   c(c1(k)+n,1)=sqrt(2)*d11(c1(k)+n,1)*d21(c1(k)+n,1);
end
%
%cv=sqrt(n)*imn_2(c,gp);
%cc=gp_mn2(u,v,gp);
