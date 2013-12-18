function [y1,y2,y6]=nn6(x,n,gp)
% Use this for even n:
n2=n+n;
n3=n2+n;
m=n/6;
rt2=1/sqrt(2);
y1=zeros(n2,n3);
y2=zeros(n2,n3);
y6=zeros(n2,n3);
%
bf(1:n,1:n)=n*ifft2(x(1:n,1:n));
bf(1:n,1+n:n2)=n*ifft2(x(1:n,1+n:n2));
bf(1:n,1+n2:n3)=n*ifft2(x(1:n,1+n2:n3));
bf(1+n:n2,1:n)=n*ifft2(x(1+n:n2,1:n));
bf(1+n:n2,1+n:n2)=n*ifft2(x(1+n:n2,1+n:n2));
bf(1+n:n2,1+n2:n3)=n*ifft2(x(1+n:n2,1+n2:n3));
%
mm=m*m;
mm2=2*mm;
gp3=mod(gp,3);
gp6=mod(gp,6);
%
d1=n;
d2=n*n/3-n;
mtpl=(gp-1)/6;
%
if (gp==1)
   knt=0;
   for k1=0:m-1
      for k2=0:k1-1
         for kk=1:6
            knt=knt+1;
            c2(1,knt)=6*k1+kk;
            c2(2,knt)=6*k2+kk;
         end
      end
      for k2=k1+1:m-1
         for kk=1:6
            knt=knt+1;
            c2(1,knt)=6*k1+kk;
            c2(2,knt)=6*k2+kk;
         end
      end
      for k2=0:m-1
         for kk=1:3
            knt=knt+1;
            c2(1,knt)=6*k1+kk;
            c2(2,knt)=6*k2+kk+3;
            knt=knt+1;
            c2(1,knt)=6*k1+kk+3;
            c2(2,knt)=6*k2+kk;
         end   
      end
      for kk=1:6
         c1(1,6*k1+kk)=6*k1+kk;
         c1(2,6*k1+kk)=6*k1+kk;
      end
   end   
end   
%
%
if (gp==7)
   knt=0;
   for kk=0:5
      for k1=0:m-1-kk
         for k2=0:m-1
            if (k2==k1+kk)
               c1(1,6*k1+kk+1)=6*k1+kk+1;
               c1(2,6*k1+kk+1)=6*k1+7*kk+1;
            else
               knt=knt+1;
               c2(1,knt)=6*k1+kk+1;
               c2(2,knt)=6*k2+kk+1;
            end   
         end   
      end
      for k1=m-kk:m-1
         for k2=0:m-1
            if (k2==k1+kk-m)
               c1(1,6*k1+kk+1)=6*k1+kk+1;
               c1(2,6*k1+kk+1)=6*k1+7*kk+1-n;
            else
               knt=knt+1;
               c2(1,knt)=6*k1+kk+1;
               c2(2,knt)=6*k2+kk+1;
            end   
         end      
      end   
   end
   for k1=0:m-1
      for k2=0:m-1
         for kk=1:3
            knt=knt+1;
            c2(1,knt)=6*k1+kk;
            c2(2,knt)=6*k2+kk+3;
            knt=knt+1;
            c2(1,knt)=6*k1+kk+3;
            c2(2,knt)=6*k2+kk;
         end
      end
   end   
end   
%
%yy=zeros(n,n);
%for kl=1:knt
%   yy(c2(1,kl),c2(2,kl))=1;
%end   
%
%
for k=1:d1
   t1(1,k)=bf(c1(1,k),c1(2,k));
   t1(2,k)=bf(c1(1,k),c1(2,k)+n);
   t1(3,k)=bf(c1(1,k),c1(2,k)+n2);
   t1(4,k)=bf(c1(1,k)+n,c1(2,k));
   t1(5,k)=bf(c1(1,k)+n,c1(2,k)+n);
   t1(6,k)=bf(c1(1,k)+n,c1(2,k)+n2);
end      
t1=sqrt(6)*ifft(t1);
for k=1:d1
   bf(c1(1,k),c1(2,k))=t1(1,k);
   bf(c1(1,k),c1(2,k)+n)=t1(2,k);
   bf(c1(1,k),c1(2,k)+n2)=t1(3,k);
   bf(c1(1,k)+n,c1(2,k))=t1(4,k);
   bf(c1(1,k)+n,c1(2,k)+n)=t1(5,k);
   bf(c1(1,k)+n,c1(2,k)+n2)=t1(6,k);
   y1(c1(1,k),c1(2,k))=t1(1,k);
   y1(c1(1,k),c1(2,k)+n)=t1(2,k);
   y1(c1(1,k),c1(2,k)+n2)=t1(3,k);
   y1(c1(1,k)+n,c1(2,k))=t1(4,k);
   y1(c1(1,k)+n,c1(2,k)+n)=t1(5,k);
   y1(c1(1,k)+n,c1(2,k)+n2)=t1(6,k);
end
for k=1:d2
   t2(1,k)=bf(c2(1,k),c2(2,k));
   t2(2,k)=bf(c2(1,k),c2(2,k)+n);
   t2(3,k)=bf(c2(1,k),c2(2,k)+n2);
end   
t2=sqrt(3)*ifft(t2);
for k=1:d2
   k1=c2(1,k);
   k2=c2(2,k);
   bf(k1,k2)=t2(1,k);
   bf(k1,k2+n)=t2(2,k);
   bf(k1,k2+n2)=t2(3,k);
   y2(k1,k2)=bf(k1,k2);
   y2(k1,k2+n)=bf(k1,k2+n);
   y2(k1,k2+n2)=bf(k1,k2+n2);
   y2(k1+n,k2)=bf(k1+n,k2);
   y2(k1+n,k2+n)=bf(k1+n,k2+n);
   y2(k1+n,k2+n2)=bf(k1+n,k2+n2);
end
y6=bf-y1-y2;
