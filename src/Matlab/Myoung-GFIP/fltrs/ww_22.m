function y=ww_22(x,gp,prj)
% Use this for even n:
[n2,tem]=size(x);
y=zeros(n2,n2);
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
bf(1:n,1:n)=ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=ifft2(x(1+n:n2,1:n));
bf(1:n,1+n:n2)=ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=ifft2(x(1+n:n2,1+n:n2));
%
if (gp==11) % sdp (-x,-y) x (y,x)
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end  
   if (prj==21)
      dd=2;
      c(1,1)=1;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1;
   end 
   if (prj==22)
      dd=n-2;
      for k=2:m
         c(1,k-1)=k;
         c(2,k-1)=k;
         c(1,k+m-2)=k+m;
         c(2,k+m-2)=k+m;
      end 
   end
   if (prj==23)
      dd=n-2;
      for k=2:m
         c(1,k-1)=k;
         c(2,k-1)=n-k+2;
         c(1,m+k-2)=k+m;
         c(2,m+k-2)=n-m-k+2;
      end   
   end   
end   
%
% [0 1;1 0], [0 n/2+1;n/2+1 0],[n/2+1 0;0 n/2+1]
if (gp==12) 
   if (prj==1)
      dd=m;
      for k=1:m
         c(1,k)=2*k-1;
         c(2,k)=2*k-1;
      end   
   end   
   if (prj==21)
      dd=m;
      for k=1:m
         kk1=2*k;
         c(1,k)=kk1;
         c(2,k)=kk1;
      end   
   end   
   if (prj==22)
      dd=m*m-m;
      for k2=0:m-1
         kk2=1+2*k2;
         kk=k2*(m-1);
         for k1=0:k2-1
            kk1=1+2*k1;
            c(1,k1+1+kk)=kk1;
            c(2,k1+1+kk)=kk2;
         end
         for k1=k2+1:m-1
            kk1=1+2*k1;
            c(1,k1+kk)=kk1;
            c(2,k1+kk)=kk2;
         end   
      end
   end
   if (prj==23)
      dd=m;
      for k=0:l-1
         k1=2+2*k;
         kk1=m+k1;
         c(1,k+1)=k1;
         c(2,k+1)=kk1;
         c(1,l+k+1)=kk1;
         c(2,l+k+1)=k1;
      end   
   end
end
%
if (gp==13) % sdp ([-1 0;0 -1] x [1 1;0 -1])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1;
   end
   if (prj==21)
      dd=2;
      c(1,1)=1;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end
   if (prj==22)
      dd=n-2;
      for k=2:m
         k2=2*k-3;
         c(1,k-1)=k;
         c(2,k-1)=n-2*k+3;
         c(1,m+k-2)=k+m;
         c(2,m+k-2)=n-2*k+3;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=2:m
         c(1,k-1)=k;
         c(2,k-1)=1;
         c(1,k+m-2)=k+m;
         c(2,k+m-2)=1;
      end   
   end
end
%
if (gp==14) % sdp ([-1 0;0 -1] x [-1 0;-1 1])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1;
      c(2,2)=1+m;
   end
   if (prj==21)
      dd=n-2;
      for k=1:m-1
         c(1,k)=2*k+1;
         c(2,k)=k+1;
         c(1,k+m-1)=2*k+1;
         c(2,k+m-1)=k+m+1;
      end   
   end
   if (prj==22)
      dd=2;
      c(1,1)=1+m;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1;
   end
   if (prj==23)
      dd=n-2;
      for k=1:m-1
         c(1,k)=1;
         c(2,k)=k+1;
         c(1,m+k-1)=1;
         c(2,m+k-1)=k+1+m;
      end   
   end
end   
%
if (gp==15) % sdp ([0 -1;-1 0] x [0 n/2+1;n/2+1 0])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=m+1;
      c(2,2)=m+1;
   end
   if (prj==21)
      dd=2;
      c(1,1)=m+1;
      c(2,1)=1;
      c(1,2)=1;
      c(2,2)=m+1;
   end
   if (prj==22)
      dd=n-2;
      for k=1:m-1
         c(1,k)=k+1;
         c(2,k)=n-k+1;
         c(1,k+m-1)=k+m+1;
         c(2,k+m-1)=m-k+1;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:l-1
         c(1,k)=2*k+1;
         c(2,k)=2*k+1;
         c(1,k+l-1)=2*k+m+1;
         c(2,k+l-1)=2*k+m+1;
      end   
      for k=0:l-1
         c(1,k+m-1)=2*k+2;
         c(2,k+m-1)=m+2*k+2;
         c(1,k+m-1+l)=2*k+m+2;
         c(2,k+m-1+l)=2*k+2;
      end   
   end
end
%
if (gp==18) % sdp ([n/2+1 0;0 n/2+1] x [-1 1;0 1])
   if (prj==1)
      dd=m;
      for k=0:l-1
         c(1,k+1)=2*k+1;
         c(2,k+1)=4*k+1;
         c(1,k+1+l)=2*k+m+1;
         c(2,k+1+l)=4*k+1;
      end  
   end
   if (prj==21)
      dd=m*m-m;
      knt=0;
      for k2=0:l-1
         for k1=0:m-1
            if (k1~=k2 & k1~=k2+l)
               knt=knt+1;
               c(1,knt)=2*k1+1;
               c(2,knt)=4*k2+1;
            end   
            knt=knt+1;
            c(1,knt)=2*k1+1;
            c(2,knt)=4*k2+3;
         end   
      end   
   end
   if (prj==22)
      dd=m;
      for k=0:l-1
         c(1,k+1)=2*k+2;
         c(2,k+1)=4*k+3;
         c(1,k+1+l)=2*k+m+2;
         c(2,k+1+l)=4*k+3;
      end   
   end
   if (prj==23)
      dd=m;
      for k=0:m-1
         c(1,k+1)=2*k+2;
         c(2,k+1)=4*k+2+m;
      end
      c(2,:)=mod(c(2,:),n)+1;
   end
end
%
if (gp==19) % sdp ([n/2-1 0;0 n/2-1] x [-1 1;0 1])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1;
   end
   if (prj==21)
      dd=2;
      c(1,1)=1;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end
   if (prj==22)
      dd=n-2;
      for k=1:m-1
         c(1,k)=k+1;
         c(2,k)=2*k+1;
         c(1,m-1+k)=k+m+1;
         c(2,m-1+k)=2*k+1;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:l-1
         c(1,k)=2*k+1;
         c(2,k)=1;
         c(1,k+l-1)=2*k+m+1;
         c(2,k+l-1)=1;
      end
      for k=0:m-1
         c(1,k+m-1)=2*k+2;
         c(2,k+m-1)=m+1;
      end
   end
end
%
if (gp==23) % sdp ([-1 0;0 -1] x [-1 1;0 1])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1;
   end
   if (prj==21)
      dd=2;
      c(1,1)=1;
      c(2,1)=1+m;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end
   if (prj==22)
      dd=n-2;
      for k=1:m-1
         c(1,k)=k+1;
         c(2,k)=2*k+1;
         c(1,k+m-1)=k+m+1;
         c(2,k+m-1)=2*k+1;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:m-1
         c(1,k)=k+1;
         c(2,k)=1;
         c(1,m+k-1)=k+m+1;
         c(2,m+k-1)=1;
      end   
   end
end   
%
if (gp==29) % sdp ([-1 0;0 -1] x [0 n/2+1;n/2+1 0])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=m+1;
      c(2,2)=m+1;
   end
   if (prj==21)
      dd=2;
      c(1,1)=m+1;
      c(2,1)=1;
      c(1,2)=1;
      c(2,2)=m+1;
   end
   if (prj==22)
      dd=n-2;
      for k=1:l-1
         c(1,k)=2*k+1;
         c(2,k)=2*k+1;
         c(1,k+l-1)=2*(k+l)+1;
         c(2,k+l-1)=2*(k+l)+1;
      end   
      for k=0:l-1
         c(1,k+m-1)=2*k+2;
         c(2,k+m-1)=m+2*k+2;
         c(1,k+m+l-1)=2*k+m+2;
         c(2,k+m+l-1)=2*k+2;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:l-1
         c(1,k)=2*k+1;
         c(2,k)=n-2*k+1;
         c(1,k+l-1)=2*(k+l)+1;
         c(2,k+l-1)=n-2*(k+l)+1;
      end   
      for k=0:l-1
         c(1,k+m-1)=2*k+2;
         c(2,k+m-1)=m-2*k;
         c(1,k+m+l-1)=2*k+m+2;
         c(2,k+m+l-1)=n-2*k;
      end
   end
end   
%
if (gp==31) % sdp ([-1 0;0 -1](n/2,n/2) x [0 1; 1 0])
   if (prj==1)
      dd=2;
      c(1,1)=1+l;
      c(2,1)=1+l;
      c(1,2)=1+m+l;
      c(2,2)=1+m+l;
   end
   if (prj==21)
      dd=2;
      c(1,1)=1+l;
      c(2,1)=1+m+l;
      c(1,2)=1+m+l;
      c(2,2)=1+l;
   end
   if (prj==22)
      dd=n-2;
      for k=1:l
         c(1,k)=k;
         c(2,k)=k;
         c(1,k+l+m-2)=k+l+m;
         c(2,k+l+m-2)=k+l+m;
      end   
      for k=l+2:l+m
         c(1,k-1)=k;
         c(2,k-1)=k;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:l
         c(1,k)=k;
         c(2,k)=m-k+2;
         c(1,k+l+m-2)=k+l+m;
         c(2,k+l+m-2)=n-k-l+2;
      end   
      for k=l+2:m
         c(1,k-1)=k;
         c(2,k-1)=m-k+2;
      end
      c(1,m)=m+1;
      c(2,m)=1;
      for k=m+2:m+l
         c(1,k-1)=k;
         c(2,k-1)=m-k+2+n;
      end   
   end
end   
%
if (gp==103) % sdp ([0 1;1 0] x [0 n/2-1;n/2-1 0])
   if (prj==1)
      dd=2;
      c(1,1)=1;
      c(2,1)=1;
      c(1,2)=1+m;
      c(2,2)=1+m;
   end
   if (prj==21)
      dd=2;
      c(1,1)=1+m;
      c(2,1)=1; 
      c(1,2)=1;
      c(2,2)=1+m;
   end
   if (prj==22)
      dd=n-2;
      for k=1:m-1
         c(1,k)=k+1;
         c(2,k)=k+1;
         c(1,k+m-1)=m+k+1;
         c(2,k+m-1)=m+k+1;
      end   
   end
   if (prj==23)
      dd=n-2;
      for k=1:l-1
         c(1,k)=2*k+1;
         c(2,k)=n-2*k+1;
         c(1,k+l-1)=2*k+m+1;
         c(2,k+l-1)=m-2*k+1;
      end
      for k=0:l-1
         c(1,m-2+k+1)=2*k+2;
         c(2,m-2+k+1)=m-2*k;
         c(1,m-2+l+k+1)=2*k+m+2;
         c(2,m-2+l+k+1)=n-2*k;
      end   
   end
end
%
if (gp==104) % sdp ([0 -1;-1 0] x [0 n/2-1;n/2-1 0])
   if (prj==1)
      dd=m;
      c(1,1)=1;
      c(2,1)=1;
      for k=2:m
         c(1,k)=2*k-1;
         c(2,k)=n-2*k+3;
      end  
   end
   if (prj==21)
      dd=m*m-m;
      for k2=1:m-1
         c(1,k2)=1;
         c(2,k2)=2*k2+1;
      end   
      knt=m-1;
      for k1=1:m-1
         for k2=0:m-1
            if (k2~=m-k1)
               knt=knt+1;
               c(1,knt)=2*k1+1;
               c(2,knt)=2*k2+1;
            end   
         end   
      end  
   end
   if (prj==22)
      dd=m;
      for k=0:m-1
         c(1,k+1)=2*k+2;
         c(2,k+1)=n-2*k;
      end   
   end
   if (prj==23)
      dd=m;
      c(1,1)=2;
      c(2,1)=m;
      c(1,l+1)=m+2;
      c(2,l+1)=n;
      for k=1:l-1
         c(1,k+1)=2*k+2;
         c(2,k+1)=m-2*k;
         c(1,l+k+1)=2*k+m+2;
         c(2,l+k+1)=n-2*k;
      end   
   end
end
%
if (gp==201) %[1 0;0 -1],[1 0;N/2 1]
   if (prj==1)
      dd=n;
      for k=1:m 
         c(1,k)=2*k-1;
         c(2,k)=1;
         c(1,m+k)=2*k-1;
         c(2,m+k)=1+m;
      end  
   end
   if (prj==21)
      dd=n;
      for k=1:m
         c(1,k)=2*k;
         c(2,k)=1;
         c(1,k+m)=2*k;
         c(2,k+m)=m+1;
      end   
   end
   if (prj==22)
      dd=m*(n-2);
      mm=m*(m-1);
      for k2=2:m
         for k1=1:m
            c(1,k1+m*(k2-2))=2*k1-1;
            c(2,k1+m*(k2-2))=k2;
            c(1,k1+m*(k2-2)+mm)=2*k1-1;
            c(2,k1+m*(k2-2)+mm)=k2+m;
         end
      end   
   end
   if (prj==23)
      dd=n;
      for k=1:m
         c(1,k)=2*k;
         c(2,k)=l+1;
         c(1,m+k)=2*k;
         c(2,m+k)=m+l+1;
      end   
   end
end   
%
if (gp==202) %[1 0;N/2 N/2-1],[1 N/2;N/2 1]
   if (prj==1)
      dd=n;
      for k=1:m
         c(1,k)=2*k-1;
         c(2,k)=1; 
         c(1,m+k)=2*k-1;
         c(2,m+k)=1+m;
      end  
   end
   if (prj==21)
      dd=n;
      for k=1:m
         c(1,k)=2*k;
         c(2,k)=l+1;
         c(1,k+m)=2*k;
         c(2,k+m)=m+l+1;
      end   
   end
   if (prj==22)
      dd=m*(m-2);
      mm=m*(l-1);
      for k2=2:l
         for k1=1:m
            c(1,k1+m*(k2-2))=2*k1-1;
            c(2,k1+m*(k2-2))=2*k2-1;
            c(1,k1+m*(k2-2)+mm)=2*k1-1;
            c(2,k1+m*(k2-2)+mm)=2*k2-1+m;
         end
      end   
   end
   if (prj==23)
      dd=n;
      for k=1:m
         c(1,k)=2*k;
         c(2,k)=1;
         c(1,m+k)=2*k;
         c(2,m+k)=m+1;
      end   
   end
end   
%
if (gp==203) %[-1 0;0 1],[N/2+1 N/2;N/2 1]
   if (prj==1)
      dd=n;
      for k=1:m
         c(1,k)=1;
         c(2,k)=2*k-1;
         c(1,m+k)=1+m;
         c(2,m+k)=2*k-1;
      end  
   end
   if (prj==21)
      dd=n;
      for k=1:m
         c(1,k)=1;
         c(2,k)=2*k;
         c(1,k+m)=m+1;
         c(2,k+m)=2*k;
      end   
   end
   if (prj==22)
      dd=m*(m-2);
      for k2=1:m
         kk=(k2-1)*(m-2);
         for k1=1:l-1
            c(1,k1+kk)=2*k1+1;
            c(2,k1+kk)=2*k2-1;
            c(1,k1+l-1+kk)=2*k1+1+m;
            c(2,k1+l-1+kk)=2*k2-1;
         end
      end   
   end
   if (prj==23)
      dd=n;
      for k=1:m
         c(1,k)=l+1;
         c(2,k)=2*k;
         c(1,m+k)=l+m+1;
         c(2,m+k)=2*k;
      end   
   end
end   
%
%
for k=1:dd
   k1=c(1,k);
   k2=c(2,k);
   y(k1,k2)=bf(k1,k2);
   y(k1+n,k2)=bf(k1+n,k2);
   y(k1,k2+n)=bf(k1,k2+n);
   y(k1+n,k2+n)=bf(k1+n,k2+n);
end   
%
y(1:n,1:n)=fft2(y(1:n,1:n));
y(1+n:n2,1:n)=fft2(y(1+n:n2,1:n));
y(1:n,1+n:n2)=fft2(y(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=fft2(y(1+n:n2,1+n:n2));
