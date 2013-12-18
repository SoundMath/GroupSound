% Use this for even n:
n=16;
gp=1;
n2=n+n;
m=n/2;
rt2=1/sqrt(2);
x=rand(n2,n2);
%
if (gp==1) % sdp (R_0 x R_1)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1+m;
   d21=n-2;
   for k=2:m
      c21(1,k-1)=k;
      c21(2,k-1)=k;
      c21(1,k+m-2)=k+m;
      c21(2,k+m-2)=k+m;
   end   
   d22=2;
   c22(1,1)=1;
   c22(2,1)=1+m;
   c22(1,2)=1+m;
   c22(2,2)=1;
   d23=n-2;
   for k=2:m
      c23(1,k-1)=k;
      c23(2,k-1)=n-k+2;
      c23(1,m+k-2)=k+m;
      c23(2,m+k-2)=n-m-k+2;
   end  
%   
   for k=1:d1
      t1(1,k)=x(c1(1,k),c1(2,k));
      t1(3,k)=x(c1(1,k),c1(2,k)+n);
      t1(2,k)=x(c1(1,k)+n,c1(2,k));
      t1(4,k)=x(c1(1,k)+n,c1(2,k)+n);
   end      
   t1=f22(t1,d1);
   for k=1:d1
      x(c1(1,k),c1(2,k))=t1(1,k);
      x(c1(1,k),c1(2,k)+n)=t1(3,k);
      x(c1(1,k)+n,c1(2,k))=t1(2,k);
      x(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
   end      
   for k=1:d21
      t2(1,k)=x(c21(1,k),c21(2,k));
      t2(2,k)=x(c21(1,k)+n,c21(2,k));
   end   
   for k=1:d22
      t2(1,k+d21)=x(c22(1,k),c22(2,k));
      t2(2,k+d21)=x(c22(1,k),c22(2,k)+n);
   end   
   for k=1:d23
      t2(1,k+d21+d22)=x(c23(1,k),c23(2,k));
      t2(2,k+d21+d22)=x(c23(1,k)+n,c23(2,k)+n);
   end   
   t2=f2(t2,d21+d22+d23);
   for k=1:d21
      x(c21(1,k),c21(2,k))=t2(1,k);
      x(c21(1,k)+n,c21(2,k))=t2(2,k);
   end   
   for k=1:d22
      x(c22(1,k),c22(2,k))=t2(1,k+d21);
      x(c22(1,k),c22(2,k)+n)=t2(2,k+d21);
   end   
   for k=1:d23
      x(c23(1,k),c23(2,k))=t2(1,k+d21+d22);
      x(c23(1,k)+n,c23(2,k)+n)=t2(2,k+d21+d22);
   end   
%  
%
% 2-d idempotents
%   t1=rt2*(x(1,1+m)+x(1,1+m+n));
%   t2=rt2*(x(1,1+m)-x(1,1+m+n));
%   t3=rt2*(x(1+m,1)+x(1+m,1+n));
%   t4=rt2*(x(1+m,1)-x(1+m,1+n));
%   x(1,1+m)=t1;
%   x(1,1+m+n)=t2;
%   x(1+m,1)=t3;
%   x(1+m,1+n)=t4;
%   for k=2:m
%      t1=rt2*(x(k,k)+x(k+n,k));
%      t2=rt2*(x(k,k)-x(k+n,k));
%      x(k,k)=t1;
%      x(k+n,k)=t2;
%      t1=rt2*(x(k+m,k+m)+x(k+m+n,k+m));
%      t2=rt2*(x(k+m,k+m)-x(k+m+n,k+m));
%      x(k+m,k+m)=t1;
%      x(k+m+n,k+m)=t2;
%      t1=rt2*(x(k,n-k+2)+x(k+n,n-k+2+n));
%      t2=rt2*(x(k,n-k+2)-x(k+n,n-k+2+n));
%      x(k,n-k+2)=t1;
%      x(k+n,n-k+2+n)=t2;
%      t1=rt2*(x(k+m,n-k-m+2)+x(k+m+n,n-k-m+2+n));
%      t2=rt2*(x(k+m,n-k-m+2)-x(k+m+n,n-k-m+2+n));
%      x(k+m,n-k-m+2)=t1;
%      x(k+m+n,n-k-m+2+n)=t2;
%   end   
end
%
if (gp==2) % sdp (R_0 x R_2)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   for k=1:d1
      t(1,k)=x(c1(1,k),c1(2,k));
      t(3,k)=x(c1(1,k),c1(2,k)+n);
      t(2,k)=x(c1(1,k)+n,c1(2,k));
      t(4,k)=x(c1(1,k)+n,c1(2,k)+n);
   end      
   t=f22(t,d1);
   for k=1:d1
      x(c1(1,k),c1(2,k))=t(1,k);
      x(c1(1,k),c1(2,k)+n)=t(3,k);
      x(c1(1,k)+n,c1(2,k))=t(2,k);
      x(c1(1,k)+n,c1(2,k)+n)=t(4,k);
   end      
% 2-d idempotents
   t1=rt2*(x(1,1+m)+x(1+n,1+m));
   t2=rt2*(x(1,1+m)-x(1+n,1+m));
   t3=rt2*(x(1+m,1+m)+x(1+m+n,1+m));
   t4=rt2*(x(1+m,1+m)-x(1+m+n,1+m));
   x(1,1+m)=t1;
   x(1+n,1+m)=t2;
   x(1+m,1+m)=t3;
   x(1+m+n,1+m)=t4;
   for k=2:m
      k2=2*k-1;
      t1=rt2*(x(k,k2)+x(k,k2+n));
      t2=rt2*(x(k,k2)-x(k,k2+n));
      x(k,k2)=t1;
      x(k,k2+n)=t2;
      t1=rt2*(x(k+m,k2)+x(k+m,k2+n));
      t2=rt2*(x(k+m,k2)-x(k+m,k2+n));
      x(k+m,k2)=t1;
      x(k+m,k2+n)=t2;
      t1=rt2*(x(k,1)+x(k+n,1+n));
      t2=rt2*(x(k,1)-x(k+n,1+n));
      x(k,1)=t1;
      x(k+n,1+n)=t2;
      t1=rt2*(x(k+m,1)+x(k+m+n,1+n));
      t2=rt2*(x(k+m,1)-x(k+m+n,1+n));
      x(k+m,1)=t1;
      x(k+m+n,1+n)=t2;
   end   
end   
%
if (gp==3) % sdp (R_1 x R_4)
   d1=m;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=2*k-1;
   end   
   for k=1:d1
      t(1,k)=x(c1(1,k),c1(2,k));
      t(3,k)=x(c1(1,k),c1(2,k)+n);
      t(2,k)=x(c1(1,k)+n,c1(2,k));
      t(4,k)=x(c1(1,k)+n,c1(2,k)+n);
   end      
   t=f22(t,d1);
   for k=1:d1
      x(c1(1,k),c1(2,k))=t(1,k);
      x(c1(1,k),c1(2,k)+n)=t(3,k);
      x(c1(1,k)+n,c1(2,k))=t(2,k);
      x(c1(1,k)+n,c1(2,k)+n)=t(4,k);
   end      
   for k=0:m-1
      kk1=2+2*k;
      kk2=1+2*k;
      s1=x(kk1,kk1)+x(kk1+n,kk1);
      s2=x(kk1,kk1)-x(kk1+n,kk1);
      x(kk1,kk1)=rt2*s1;
      x(kk1+n,kk1)=rt2*s2;
   end
   for k=0:m/2-1
      k1=2+2*k;
      kk1=n/2+k1;
      r1=x(k1,kk1)+x(k1+n,kk1+n);
      r2=x(k1,kk1)-x(k1+n,kk1+n);
      x(k1,kk1)=rt2*r1;
      x(k1+n,kk1+n)=rt2*r2;
      r1=x(kk1,k1)+x(kk1+n,k1+n);
      r2=x(kk1,k1)-x(kk1+n,k1+n);
      x(kk1,k1)=rt2*r1;
      x(kk1+n,k1+n)=rt2*r2;
   end   
%
   for k2=0:m-1
      kk2=1+2*k2;
      for k1=0:m-1
         kk1=1+2*k1;
         if (k1 ~= k2)
            s1=x(kk1,kk2)+x(kk1,kk2+n);
            s2=x(kk1,kk2)-x(kk1,kk2+n);
            x(kk1,kk2)=rt2*s1;
            x(kk1,kk2+n)=rt2*s2;
         end
      end
   end   
end
%
y(1:n,1:n)=(1/n)*fft2(x(1:n,1:n));
y(1+n:n2,1:n)=(1/n)*fft2(x(1+n:n2,1:n));
y(1:n,1+n:n2)=(1/n)*fft2(x(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=(1/n)*fft2(x(1+n:n2,1+n:n2));
%
