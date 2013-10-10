function y=cnv2(u,v,gp);
[n2,tem]=size(u);
n=n2/2;
m=n/2;
nn=linspace(0,n-1,n);
uu(1:n,1)=u(1:n,1);
if (gp==1) % x --> x^-1
   rn=mod(n-nn,n)+1;
   for k=1:n
      uu(k+n,1)=u(rn(k)+n,1);
   end   
end
%
if (gp==2) % x^k --> x^(m+1)*k
   rn=mod((m+1)*nn,n)+1;
   for k=1:n
      uu(k+n,1)=u(rn(k)+n,1);
   end   
end
%
if (gp==3) % x^k --> x^(m-1)*k
   rn=mod((m-1)*nn,n)+1;
   for k=1:n
      uu(k+n,1)=u(rn(k)+n,1);
   end   
end
%
[d11,d12]=n_2(uu(:,1),gp);
[d21,d22]=n_2(v(:,1),gp);
c(1:n,1)=d12(1:n,1).*d22(1:n,1)+d12(1+n:n2).*d22(1+n:n2);
c(1+n:n2,1)=d12(1+n:n2,1).*d22(1:n,1)+d12(1:n).*d22(1+n:n2);
%
c(1:n,1)=c(1:n,1)+sqrt(2)*d11(1:n,1).*d21(1:n,1);
c(1+n:n2,1)=c(1+n:n2)+sqrt(2)*d11(1+n:n2,1).*d21(1+n:n2,1);
%
y=sqrt(n)*in_2(c,gp);
