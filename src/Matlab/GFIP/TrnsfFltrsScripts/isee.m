n=32;
m=n/2;
%
gp=201;
if (gp==201) %[1 0;0 -1],[1 0;N/2 1]
   d1=n;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=1;
      c1(1,m+k)=2*k-1;
      c1(2,m+k)=1+m;
   end   
   d21=n;
   for k=1:m
      c21(1,k)=2*k;
      c21(2,k)=1;
      c21(1,k+m)=2*k;
      c21(2,k+m)=m+1;
   end   
   d22=m*(n-2);
   mm=m*(m-1);
   for k2=2:m
      for k1=1:m
         c22(1,k1+m*(k2-2))=2*k1-1;
         c22(2,k1+m*(k2-2))=k2;
         c22(1,k1+m*(k2-2)+mm)=2*k1-1;
         c22(2,k1+m*(k2-2)+mm)=k2+m;
      end
   end   
   d23=n;
   for k=1:m
      c23(1,k)=2*k;
      c23(2,k)=m/2+1;
      c23(1,m+k)=2*k;
      c23(2,m+k)=m+m/2+1;
   end   
end 
iy201=zeros(n,n);
for k=1:d1
   iy201(c1(1,k),c1(2,k))=1;
end   
for k=1:d21
   iy201(c21(1,k),c21(2,k))=1;
end   
for k=1:d22
   iy201(c22(1,k),c22(2,k))=1;
end   
for k=1:d23
   iy201(c23(1,k),c23(2,k))=1;
end   
%
gp=202;
if (gp==202) %[1 0;N/2 N/2-1],[1 N/2;N/2 1]
   d1=n;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=1;
      c1(1,m+k)=2*k-1;
      c1(2,m+k)=1+m;
   end   
   d21=n;
   for k=1:m
      c21(1,k)=2*k;
      c21(2,k)=n/4+1;
      c21(1,k+m)=2*k;
      c21(2,k+m)=m+n/4+1;
   end   
   d22=m*(m-2);
   mm=m*(m/2-1);
   for k2=2:m/2
      for k1=1:m
         c22(1,k1+m*(k2-2))=2*k1-1;
         c22(2,k1+m*(k2-2))=2*k2-1;
         c22(1,k1+m*(k2-2)+mm)=2*k1-1;
         c22(2,k1+m*(k2-2)+mm)=2*k2-1+m;
      end
   end   
   d23=n;
   for k=1:m
      c23(1,k)=2*k;
      c23(2,k)=1;
      c23(1,m+k)=2*k;
      c23(2,m+k)=m+1;
   end   
end   
iy202=zeros(n,n);
for k=1:d1
   iy202(c1(1,k),c1(2,k))=1;
end   
for k=1:d21
   iy202(c21(1,k),c21(2,k))=1;
end   
for k=1:d22
   iy202(c22(1,k),c22(2,k))=1;
end   
for k=1:d23
   iy202(c23(1,k),c23(2,k))=1;
end   
%
gp=203;
if (gp==203) %[-1 0;0 1],[N/2+1 N/2;N/2 1]
   d1=n;
   for k=1:m
      c1(1,k)=1;
      c1(2,k)=2*k-1;
      c1(1,m+k)=1+m;
      c1(2,m+k)=2*k-1;
   end   
   d21=n;
   for k=1:m
      c21(1,k)=1;
      c21(2,k)=2*k;
      c21(1,k+m)=m+1;
      c21(2,k+m)=2*k;
   end   
   d22=m*(m-2);
   for k2=1:m
      kk=(k2-1)*(m-2);
      for k1=1:m/2-1
         c22(1,k1+kk)=2*k1+1;
         c22(2,k1+kk)=2*k2-1;
         c22(1,k1+m/2-1+kk)=2*k1+1+m;
         c22(2,k1+m/2-1+kk)=2*k2-1;
      end
   end   
   d23=n;
   for k=1:m
      c23(1,k)=n/4+1;
      c23(2,k)=2*k;
      c23(1,m+k)=n/4+m+1;
      c23(2,m+k)=2*k;
   end   
end   
iy203=zeros(n,n);
for k=1:d1
   iy203(c1(1,k),c1(2,k))=1;
end   
for k=1:d21
   iy203(c21(1,k),c21(2,k))=1;
end   
for k=1:d22
   iy203(c22(1,k),c22(2,k))=1;
end   
for k=1:d23
   iy203(c23(1,k),c23(2,k))=1;
end   
