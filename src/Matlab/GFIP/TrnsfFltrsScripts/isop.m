%function xx=isop(a,y,n);
function [xx,yy]=isop(a,n);
%clear;
%n=8;
%m=n/2;
%a=[m+1 0;0 m+1];
%b=[m+1 m;0 m+1];
yy=zeros(n,n);
for k1=1:n
   for k2=1:n
      y(1,k2+n*(k1-1))=k1-1;
      y(2,k2+n*(k1-1))=k2-1;
   end
end
kk=0;
for k=1:n*n
   x=mod(a*y(:,k),n);
   xy=mod(x-y(:,k),n);
   nm=xy(1,1)+xy(2,1);
   if (nm==0)
      kk=kk+1;
      xx(1,kk)=y(1,k);
      xx(2,kk)=y(2,k);
   end   
end
for k=1:kk
   yy(xx(1,k)+1,xx(2,k)+1)=1;
end   
