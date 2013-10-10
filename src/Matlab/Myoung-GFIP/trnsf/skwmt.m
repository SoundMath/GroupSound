function y=skwmt(x);
[sx,sy]=size(x);
if (sx==1)
   n=sy;
   xx(1,1)=x(1,1);
   for k=2:n
      xx(k,1)=x(1,n-k+2);
   end   
else
   n=sx;
   xx(1:n,1)=x(1:n,1);
end   
%
y(1:n,1)=xx;
for k=2:n
   y(1:n-1,k)=y(2:n,k-1);
   y(n,k)=y(1,k-1);
end   
