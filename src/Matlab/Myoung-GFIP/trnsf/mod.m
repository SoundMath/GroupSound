function y=mod(x,n)
[n1,n2]=size(x);
for k1=1:n1
   for k2=1:n2
      kk=floor(x(k1,k2)/n);
      y(k1,k2)=x(k1,k2)-kk*n;
   end
end   
