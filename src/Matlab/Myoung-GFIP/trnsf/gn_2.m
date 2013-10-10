function y=gn_2(u,gp);
[n2,tem]=size(u);
n=n2/2;
m=n/2;
nn=linspace(0,n-1,n);
if (gp==1) % x --> x^-1
   rn=mod(n-nn,n)+1;
end
%
if (gp==2) % x^k --> x^(m+1)*k
   rn=mod((m+1)*nn,n)+1;
end
%
if (gp==3) % x^k --> x^(m-1)*k
   rn=mod((m-1)*nn,n)+1;
end
%
u1=cnvmt(u(1:n,1));
u2=cnvmt(u(1+n:n2,1));
%
for k2=1:n
   for k1=1:n
      ur2(k1,k2)=u2(rn(k1),rn(k2));
   end
end   
y=[u1 ur2;ur2 u1];
