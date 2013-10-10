function y=p4(n,dt);
y=zeros(n,n);
y(1:n/2+1,1:n/2+1)=dt(1:n/2+1,1:n/2+1);
for k1=2:n/2+1
   for k2=2:n/2+1
      y(n-k2+2,k1)=y(k1,k2);
      y(n-k1+2,n-k2+2)=y(k1,k2);
      y(k2,n-k1+2)=y(k1,k2);
   end
   y(1,k1)=y(k1,1);
   y(n-k1+2,1)=y(k1,1);
   y(1,n-k1+2)=y(k1,1);
end   
for k2=2:n/2+1
   y(n-k2+2,1)=y(1,k2);
   y(1,n-k2+2)=y(1,k2);
   y(k2,1)=y(1,k2);
end   
   