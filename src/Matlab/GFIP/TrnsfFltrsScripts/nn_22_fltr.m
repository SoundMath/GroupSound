function [y1,y21,y22,y23,y4]=nn_22(x,gp)
% Use this for even n:
[n2,tem]=size(x);
n=n2/2;
m=n/2;
l=n/4;
rt2=sqrt(2);
y1=zeros(n2,n2);
y21=zeros(n2,n2);
y22=zeros(n2,n2);
y23=zeros(n2,n2);
y4=zeros(n2,n2);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
%
if (gp==11) % sdp (-x,-y) x (y,x)
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1+m;
   d21=2;
   c21(1,1)=1;
   c21(2,1)=1+m;
   c21(1,2)=1+m;
   c21(2,2)=1;
   d22=n-2;
   for k=2:m
      c22(1,k-1)=k;
      c22(2,k-1)=k;
      c22(1,k+m-2)=k+m;
      c22(2,k+m-2)=k+m;
   end   
   d23=n-2;
   for k=2:m
      c23(1,k-1)=k;
      c23(2,k-1)=n-k+2;
      c23(1,m+k-2)=k+m;
      c23(2,m+k-2)=n-m-k+2;
   end   
end   
%
if (gp==12) % [0 1;1 0], [0 n/2+1;n/2+1 0],[n/2+1 0;0 n/2+1]
   d1=m;
   for k=1:m
      c1(1,k)=2*k-1;
      c1(2,k)=2*k-1;
   end   
   d21=m;
   for k=1:m
      kk1=2*k;
      c21(1,k)=kk1;
      c21(2,k)=kk1;
   end   
   d22=m*m-m;
   for k2=0:m-1
      kk2=1+2*k2;
      kk=k2*(m-1);
      for k1=0:k2-1
         kk1=1+2*k1;
         c22(1,k1+1+kk)=kk1;
         c22(2,k1+1+kk)=kk2;
      end
      for k1=k2+1:m-1
         kk1=1+2*k1;
         c22(1,k1+kk)=kk1;
         c22(2,k1+kk)=kk2;
      end   
   end   
   d23=m;
   for k=0:l-1
      k1=2+2*k;
      kk1=m+k1;
      c23(1,k+1)=k1;
      c23(2,k+1)=kk1;
      c23(1,l+k+1)=kk1;
      c23(2,l+k+1)=k1;
   end   
end
%
if (gp==13) % sdp ([-1 0;0 -1] x [1 1;0 -1])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   d21=2;
   c21(1,1)=1;
   c21(2,1)=1+m;
   c21(1,2)=1+m;
   c21(2,2)=1+m;
   d22=n-2;
   for k=2:m
      k2=2*k-3;
      c22(1,k-1)=k;
      c22(2,k-1)=n-2*k+3;
      c22(1,m+k-2)=k+m;
      c22(2,m+k-2)=n-2*k+3;
   end   
   d23=n-2;
   for k=2:m
      c23(1,k-1)=k;
      c23(2,k-1)=1;
      c23(1,k+m-2)=k+m;
      c23(2,k+m-2)=1;
   end   
end
%
if (gp==14) % sdp ([-1 0;0 -1] x [-1 0;-1 1])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1;
   c1(2,2)=1+m;
   d21=n-2;
   for k=1:m-1
      c21(1,k)=2*k+1;
      c21(2,k)=k+1;
      c21(1,k+m-1)=2*k+1;
      c21(2,k+m-1)=k+m+1;
   end   
   d22=2;
   c22(1,1)=1+m;
   c22(2,1)=1+m;
   c22(1,2)=1+m;
   c22(2,2)=1;
   d23=n-2;
   for k=1:m-1
      c23(1,k)=1;
      c23(2,k)=k+1;
      c23(1,m+k-1)=1;
      c23(2,m+k-1)=k+1+m;
   end   
end   
%
if (gp==15) % sdp ([0 -1;-1 0] x [0 n/2+1;n/2+1 0])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=m+1;
   c1(2,2)=m+1;
   d21=2;
   c21(1,1)=m+1;
   c21(2,1)=1;
   c21(1,2)=1;
   c21(2,2)=m+1;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=n-k+1;
      c22(1,k+m-1)=k+m+1;
      c22(2,k+m-1)=m-k+1;
   end   
   d23=n-2;
   for k=1:l-1
      c23(1,k)=2*k+1;
      c23(2,k)=2*k+1;
      c23(1,k+l-1)=2*k+m+1;
      c23(2,k+l-1)=2*k+m+1;
   end   
   for k=0:l-1
      c23(1,k+m-1)=2*k+2;
      c23(2,k+m-1)=m+2*k+2;
      c23(1,k+m-1+l)=2*k+m+2;
      c23(2,k+m-1+l)=2*k+2;
   end   
end
%
if (gp==18) % sdp ([n/2+1 0;0 n/2+1] x [-1 1;0 1])
   d1=m;
   for k=0:l-1
      c1(1,k+1)=2*k+1;
      c1(2,k+1)=4*k+1;
      c1(1,k+1+l)=2*k+m+1;
      c1(2,k+1+l)=4*k+1;
   end   
   d21=m*m-m;
   knt=0;
   for k2=0:l-1
      for k1=0:m-1
         if (k1~=k2 & k1~=k2+l)
            knt=knt+1;
            c21(1,knt)=2*k1+1;
            c21(2,knt)=4*k2+1;
         end   
         knt=knt+1;
         c21(1,knt)=2*k1+1;
         c21(2,knt)=4*k2+3;
      end   
   end   
   d22=m;
   for k=0:l-1
      c22(1,k+1)=2*k+2;
      c22(2,k+1)=4*k+3;
      c22(1,k+1+l)=2*k+m+2;
      c22(2,k+1+l)=4*k+3;
   end   
   d23=m;
   for k=0:m-1
      c23(1,k+1)=2*k+2;
      c23(2,k+1)=4*k+2+m;
   end
   c23(2,:)=mod(c23(2,:),n)+1;
end
%
if (gp==19) % sdp ([n/2-1 0;0 n/2-1] x [-1 1;0 1])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   d21=2;
   c21(1,1)=1;
   c21(2,1)=1+m;
   c21(1,2)=1+m;
   c21(2,2)=1+m;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=2*k+1;
      c22(1,m-1+k)=k+m+1;
      c22(2,m-1+k)=2*k+1;
   end   
   d23=n-2;
   for k=1:l-1
      c23(1,k)=2*k+1;
      c23(2,k)=1;
      c23(1,k+l-1)=2*k+m+1;
      c23(2,k+l-1)=1;
   end
   for k=0:m-1
      c23(1,k+m-1)=2*k+2;
      c23(2,k+m-1)=m+1;
   end
end
%
if (gp==23) % sdp ([-1 0;0 -1] x [-1 1;0 1])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1;
   d21=2;
   c21(1,1)=1;
   c21(2,1)=1+m;
   c21(1,2)=1+m;
   c21(2,2)=1+m;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=2*k+1;
      c22(1,k+m-1)=k+m+1;
      c22(2,k+m-1)=2*k+1;
   end   
   d23=n-2;
   for k=1:m-1
      c23(1,k)=k+1;
      c23(2,k)=1;
      c23(1,m+k-1)=k+m+1;
      c23(2,m+k-1)=1;
   end   
end   
%
if (gp==29) % sdp ([-1 0;0 -1] x [0 n/2+1;n/2+1 0])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=m+1;
   c1(2,2)=m+1;
   d21=2;
   c21(1,1)=m+1;
   c21(2,1)=1;
   c21(1,2)=1;
   c21(2,2)=m+1;
   d22=n-2;
   for k=1:l-1
      c22(1,k)=2*k+1;
      c22(2,k)=2*k+1;
      c22(1,k+l-1)=2*(k+l)+1;
      c22(2,k+l-1)=2*(k+l)+1;
   end   
   for k=0:l-1
      c22(1,k+m-1)=2*k+2;
      c22(2,k+m-1)=m+2*k+2;
      c22(1,k+m+l-1)=2*k+m+2;
      c22(2,k+m+l-1)=2*k+2;
   end   
   d23=n-2;
   for k=1:l-1
      c23(1,k)=2*k+1;
      c23(2,k)=n-2*k+1;
      c23(1,k+l-1)=2*(k+l)+1;
      c23(2,k+l-1)=n-2*(k+l)+1;
   end   
   for k=0:l-1
      c23(1,k+m-1)=2*k+2;
      c23(2,k+m-1)=m-2*k;
      c23(1,k+m+l-1)=2*k+m+2;
      c23(2,k+m+l-1)=n-2*k;
   end   
end   
%
if (gp==31) % sdp ([-1 0;0 -1](n/2,n/2) x [0 1; 1 0])
   d1=2;
   c1(1,1)=1+l;
   c1(2,1)=1+l;
   c1(1,2)=1+m+l;
   c1(2,2)=1+m+l;
   d21=2;
   c21(1,1)=1+l;
   c21(2,1)=1+m+l;
   c21(1,2)=1+m+l;
   c21(2,2)=1+l;
   d22=n-2;
   for k=1:l
      c22(1,k)=k;
      c22(2,k)=k;
      c22(1,k+l+m-2)=k+l+m;
      c22(2,k+l+m-2)=k+l+m;
   end   
   for k=l+2:l+m
      c22(1,k-1)=k;
      c22(2,k-1)=k;
   end   
   d23=n-2;
   for k=1:l
      c23(1,k)=k;
      c23(2,k)=m-k+2;
      c23(1,k+l+m-2)=k+l+m;
      c23(2,k+l+m-2)=n-k-l+2;
   end   
   for k=l+2:m
      c23(1,k-1)=k;
      c23(2,k-1)=m-k+2;
   end
   c23(1,m)=m+1;
   c23(2,m)=1;
   for k=m+2:m+l
      c23(1,k-1)=k;
      c23(2,k-1)=m-k+2+n;
   end   
end   
%
if (gp==103) % sdp ([0 1;1 0] x [0 n/2-1;n/2-1 0])
   d1=2;
   c1(1,1)=1;
   c1(2,1)=1;
   c1(1,2)=1+m;
   c1(2,2)=1+m;
   d21=2;
   c21(1,1)=1+m;
   c21(2,1)=1;
   c21(1,2)=1;
   c21(2,2)=1+m;
   d22=n-2;
   for k=1:m-1
      c22(1,k)=k+1;
      c22(2,k)=k+1;
      c22(1,k+m-1)=m+k+1;
      c22(2,k+m-1)=m+k+1;
   end   
   d23=n-2;
   for k=1:l-1
      c23(1,k)=2*k+1;
      c23(2,k)=n-2*k+1;
      c23(1,k+l-1)=2*k+m+1;
      c23(2,k+l-1)=m-2*k+1;
   end
   for k=0:l-1
      c23(1,m-2+k+1)=2*k+2;
      c23(2,m-2+k+1)=m-2*k;
      c23(1,m-2+l+k+1)=2*k+m+2;
      c23(2,m-2+l+k+1)=n-2*k;
   end   
end
%
if (gp==104) % sdp ([0 -1;-1 0] x [0 n/2-1;n/2-1 0])
   d1=m;
   c1(1,1)=1;
   c1(2,1)=1;
   for k=2:m
      c1(1,k)=2*k-1;
      c1(2,k)=n-2*k+3;
   end   
   d21=m*m-m;
   for k2=1:m-1
      c21(1,k2)=1;
      c21(2,k2)=2*k2+1;
   end   
   knt=m-1;
   for k1=1:m-1
      for k2=0:m-1
         if (k2~=m-k1)
            knt=knt+1;
            c21(1,knt)=2*k1+1;
            c21(2,knt)=2*k2+1;
         end   
      end   
   end  
   d22=m;
   for k=0:m-1
      c22(1,k+1)=2*k+2;
      c22(2,k+1)=n-2*k;
   end   
   d23=m;
   c23(1,1)=2;
   c23(2,1)=m;
   c23(1,l+1)=m+2;
   c23(2,l+1)=n;
   for k=1:l-1
      c23(1,k+1)=2*k+2;
      c23(2,k+1)=m-2*k;
      c23(1,l+k+1)=2*k+m+2;
      c23(2,l+k+1)=n-2*k;
   end   
end
%
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
      c23(2,k)=l+1;
      c23(1,m+k)=2*k;
      c23(2,m+k)=m+l+1;
   end   
end   
%
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
      c21(2,k)=l+1;
      c21(1,k+m)=2*k;
      c21(2,k+m)=m+l+1;
   end   
   d22=m*(m-2);
   mm=m*(l-1);
   for k2=2:l
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
%
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
      for k1=1:l-1
         c22(1,k1+kk)=2*k1+1;
         c22(2,k1+kk)=2*k2-1;
         c22(1,k1+l-1+kk)=2*k1+1+m;
         c22(2,k1+l-1+kk)=2*k2-1;
      end
   end   
   d23=n;
   for k=1:m
      c23(1,k)=l+1;
      c23(2,k)=2*k;
      c23(1,m+k)=l+m+1;
      c23(2,m+k)=2*k;
   end   
end   
%
%
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(3,k)=bf(c1(1,k),c1(2,k)+n);
   t1(2,k)=bf(c1(1,k)+n,c1(2,k));
   t1(4,k)=bf(c1(1,k)+n,c1(2,k)+n);
end      
t1=f22(t1,d1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k),c1(2,k)+n)=t1(3,k);
   bf(c1(1,k)+n,c1(2,k))=t1(2,k);
   bf(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k),c1(2,k)+n)=t1(3,k);
   y1(c1(1,k)+n,c1(2,k))=t1(2,k);
   y1(c1(1,k)+n,c1(2,k)+n)=t1(4,k);
end
for k=1:d21
   t21(1,k)=bf(c21(1,k),c21(2,k));
   t21(2,k)=bf(c21(1,k)+n,c21(2,k));
   s21(1,k)=bf(c21(1,k),c21(2,k)+n);
   s21(2,k)=bf(c21(1,k)+n,c21(2,k)+n);
end   
t21=rt2*ifft(t21);
s21=rt2*ifft(s21);
for k=1:d21
   k1=c21(1,k);
   k2=c21(2,k);
   bf(k1,k2)=t21(1,k);
   bf(k1+n,k2)=t21(2,k);
   bf(k1,k2+n)=s21(1,k);
   bf(k1+n,k2+n)=s21(2,k);
   y21(k1,k2)=bf(k1,k2);
   y21(k1+n,k2)=bf(k1+n,k2);
   y21(k1,k2+n)=bf(k1,k2+n);
   y21(k1+n,k2+n)=bf(k1+n,k2+n);
end
for k=1:d22
   t22(1,k)=bf(c22(1,k),c22(2,k));
   t22(2,k)=bf(c22(1,k),c22(2,k)+n);
   s22(1,k)=bf(c22(1,k)+n,c22(2,k));
   s22(2,k)=bf(c22(1,k)+n,c22(2,k)+n);
end   
t22=rt2*ifft(t22);
s22=rt2*ifft(s22);
for k=1:d22
   k1=c22(1,k);
   k2=c22(2,k);
   bf(k1,k2)=t22(1,k);
   bf(k1,k2+n)=t22(2,k);
   bf(k1+n,k2)=s22(1,k);
   bf(k1+n,k2+n)=s22(2,k);
   y22(k1,k2)=bf(k1,k2);
   y22(k1+n,k2)=bf(k1+n,k2);
   y22(k1,k2+n)=bf(k1,k2+n);
   y22(k1+n,k2+n)=bf(k1+n,k2+n);
end
for k=1:d23
   t23(1,k)=bf(c23(1,k),c23(2,k));
   t23(2,k)=bf(c23(1,k)+n,c23(2,k)+n);
   s23(1,k)=bf(c23(1,k)+n,c23(2,k));
   s23(2,k)=bf(c23(1,k),c23(2,k)+n);
end   
t23=rt2*ifft(t23);
s23=rt2*ifft(s23);
for k=1:d23
   k1=c23(1,k);
   k2=c23(2,k);
   bf(k1,k2)=t23(1,k);
   bf(k1+n,k2+n)=t23(2,k);
   bf(k1+n,k2)=s23(1,k);
   bf(k1,k2+n)=s23(2,k);
   y23(k1,k2)=bf(k1,k2);
   y23(k1+n,k2)=bf(k1+n,k2);
   y23(k1,k2+n)=bf(k1,k2+n);
   y23(k1+n,k2+n)=bf(k1+n,k2+n);
end
y4=bf-y1-y21-y22-y23;
