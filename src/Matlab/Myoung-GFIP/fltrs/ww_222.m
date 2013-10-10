function y=ww_222(x,gp,prj)
% Use this for even n:
[n4,tem]=size(x);
n=n4/4;
n2=n+n;
n3=n2+n;
m=n/2;
l=n/4;
rt2=sqrt(2);
y=zeros(n4,n2);
%
bf(1:n,1:n)=ifft2(x(1:n,1:n));
bf(1+n:n2,1:n)=ifft2(x(1+n:n2,1:n));
bf(1+n2:n3,1:n)=ifft2(x(1+n2:n3,1:n));
bf(1+n3:n4,1:n)=ifft2(x(1+n3:n4,1:n));
bf(1:n,1+n:n2)=ifft2(x(1:n,1+n:n2));
bf(1+n:n2,1+n:n2)=ifft2(x(1+n:n2,1+n:n2));
bf(1+n2:n3,1+n:n2)=ifft2(x(1+n2:n3,1+n:n2));
bf(1+n3:n4,1+n:n2)=ifft2(x(1+n3:n4,1+n:n2));
%
% ([-1 0;0 -1]x[1 1;0 -1]x[m+1 1;0 m-1])
if (gp==1) 
   if (prj==1)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1;
      cc(1,2)=1+m;
      cc(2,2)=1;
   end   
   if (prj==21)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1+m;
      cc(1,2)=1+m;
      cc(2,2)=1+m;
   end   
   if (prj==22)
      dd=m-2;
      for k=1:m/2-1
         cc(1,k)=2*k+1;
         cc(2,k)=1;
         cc(1,k+m/2-1)=2*k+m+1;
         cc(2,k+m/2-1)=1;
      end   
   end   
   if (prj==23)
      dd=m-2;
      for k=1:m/2-1
         cc(1,k)=2*k+1;
         cc(2,k)=mod(n-4*k,n)+1;
         cc(1,k+m/2-1)=2*k+m+1;
         cc(2,k+m/2-1)=cc(2,k);
      end   
   end   
   if (prj==41)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=1;
      end   
   end   
   if (prj==42)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=mod(n-4*k+2,n)+1;
      end   
   end   
   if (prj==43)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=m+1;
      end   
   end   
   if (prj==44)
      dd=m;
      for k=1:m
         cc(1,k)=2*k;
         cc(2,k)=mod(m-4*k+2,n)+1;
      end   
   end   
   if (prj==45)
      dd=m*m-n;
      for k2=0:m/2-1
         for k1=0:m-1
            cc(1,k1+1+m*k2)=2*k1;
            cc(2,k1+1+m*k2)=4*k2+2;
         end   
      end   
      df=m*m/2;
      for k2=1:m/4-1
         for k1=0:m/2-1-k2
            cc(1,k1+1+(m-2)*(k2-1)+df)=2*k1;
            cc(2,k1+1+(m-2)*(k2-1)+df)=4*k2;
            cc(1,k1+m/2+(m-2)*(k2-1)+df)=2*k1+m;
            cc(2,k1+m/2+(m-2)*(k2-1)+df)=4*k2;
         end   
         for k1=m/2-k2+1:m/2-1
            cc(1,k1+(m-2)*(k2-1)+df)=2*k1;
            cc(2,k1+(m-2)*(k2-1)+df)=4*k2;
            cc(1,k1-1+m/2+(m-2)*(k2-1)+df)=2*k1+m;
            cc(2,k1-1+m/2+(m-2)*(k2-1)+df)=4*k2;
         end   
      end   
      for k2=m/4+1:m/2-1
         for k1=0:m/2-1-k2
            cc(1,k1+1+(m-2)*(k2-2)+df)=2*k1;
            cc(2,k1+1+(m-2)*(k2-2)+df)=4*k2;
            cc(1,k1+m/2+(m-2)*(k2-2)+df)=2*k1+m;
            cc(2,k1+m/2+(m-2)*(k2-2)+df)=4*k2;
         end   
         for k1=m/2-k2+1:m/2-1
            cc(1,k1+(m-2)*(k2-2)+df)=2*k1;
            cc(2,k1+(m-2)*(k2-2)+df)=4*k2;
            cc(1,k1-1+m/2+(m-2)*(k2-2)+df)=2*k1+m;
            cc(2,k1-1+m/2+(m-2)*(k2-2)+df)=4*k2;
         end   
      end   
      df=df+2*(m/2-1)*(m/2-2);
      for k1=1:m/4-1
         cc(1,df+k1)=2*k1;
         cc(2,df+k1)=m;
         cc(1,df+k1+m/4-1)=2*k1+m/2;
         cc(2,df+k1+m/4-1)=m;
         cc(1,df+k1+m/2-2)=2*k1+m;
         cc(2,df+k1+m/2-2)=m;
         cc(1,df+k1+m/2+m/4-3)=2*k1+m+m/2;
         cc(2,df+k1+m/2+m/4-3)=m;
      end
      cc=cc+1;
   end   
end   
%
% ([-1 0;0 -1]x[0 1;1 0]x[1 m;m 1])
if (gp==2) 
   if (prj==1)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1;
      cc(1,2)=1+m;
      cc(2,2)=1+m;
   end   
   if (prj==21)
      dd=2;
      cc(1,1)=1;
      cc(2,1)=1+m;
      cc(1,2)=1+m;
      cc(2,2)=1;
   end   
   if (prj==22)
      dd=n-2;
      for k=1:m-1
         cc(1,k)=k+1;
         cc(2,k)=k+1;
         cc(1,k+m-1)=k+m+1;
         cc(2,k+m-1)=k+m+1;
      end   
   end   
   if (prj==23)
      dd=n-2;
      for k=1:m-1
         cc(1,k)=k+1;
         cc(2,k)=n-k+1;
         cc(1,k+m-1)=k+m+1;
         cc(2,k+m-1)=m-k+1;
      end   
   end   
   if (prj==4)
      dd=2*(m*m-n+1);
      for k1=1:m-1
         cc(1,k1)=2*k1;
         cc(2,k1)=0;
      end   
      for k1=0:m/2-1
         cc(1,k1+m)=2*k1;
         cc(2,k1+m)=m;
      end   
      for k1=m/2+1:m-1
         cc(1,k1+m-1)=2*k1;
         cc(2,k1+m-1)=m;
      end   
      df=n-2;     
      for k2=1:m/2-1
         for k1=0:k2-1
            cc(1,df+k1+(m-2)*(k2-1)+1)=2*k1;
            cc(2,df+k1+(m-2)*(k2-1)+1)=2*k2;
         end   
         for k1=k2+1:m-1-k2
            cc(1,df+k1+(m-2)*(k2-1))=2*k1;
            cc(2,df+k1+(m-2)*(k2-1))=2*k2;
         end   
         for k1=m-k2+1:m-1
            cc(1,df+k1-1+(m-2)*(k2-1))=2*k1;
            cc(2,df+k1-1+(m-2)*(k2-1))=2*k2;
         end   
      end   
      df=df+(m-2)*(m/2-1);
      for k2=1:m/2-1
         for k1=0:m/2-1-k2
            cc(1,df+k1+(m-2)*(k2-1)+1)=2*k1;
            cc(2,df+k1+(m-2)*(k2-1)+1)=2*k2+m;
         end   
         for k1=m/2-1-k2+2:k2+m/2-1
            cc(1,df+k1+(m-2)*(k2-1))=2*k1;
            cc(2,df+k1+(m-2)*(k2-1))=2*k2+m;
         end   
         for k1=k2+m/2+1:m-1
            cc(1,df+k1-1+(m-2)*(k2-1))=2*k1;
            cc(2,df+k1-1+(m-2)*(k2-1))=2*k2+m;
         end   
      end   
      df=df+(m-2)*(m/2-1);
      for k2=0:m/2-1
         for k1=0:k2-1
            cc(1,df+k1+1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1+1+(m-2)*k2)=2*k2+1;
         end   
         for k1=k2+1:m-1-(k2+1)
            cc(1,df+k1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1+(m-2)*k2)=2*k2+1;
         end   
         for k1=m-1-(k2+1)+2:m-1
            cc(1,df+k1-1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1-1+(m-2)*k2)=2*k2+1;
         end   
      end  
      df=df+(m-2)*m/2;
      for k2=0:m/2-1
         for k1=0:m/2-k2-2
            cc(1,df+k1+1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1+1+(m-2)*k2)=2*k2+m+1;
         end   
         for k1=m/2-k2:k2+m/2-1
            cc(1,df+k1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1+(m-2)*k2)=2*k2+m+1;
         end   
         for k1=k2+m/2+1:m-1
            cc(1,df+k1-1+(m-2)*k2)=2*k1+1;
            cc(2,df+k1-1+(m-2)*k2)=2*k2+m+1;
         end   
      end   
      cc=cc+1;
   end   
end 
%
%
for k=1:dd
   k1=cc(1,k);
   k2=cc(2,k);
   y(k1,k2)=bf(k1,k2);
   y(k1+n,k2)=bf(k1+n,k2);
   y(k1+n2,k2)=bf(k1+n2,k2);
   y(k1+n3,k2)=bf(k1+n3,k2);
   y(k1,k2+n)=bf(k1,k2+n);
   y(k1+n,k2+n)=bf(k1+n,k2+n);
   y(k1+n2,k2+n)=bf(k1+n2,k2+n);
   y(k1+n3,k2+n)=bf(k1+n3,k2+n);
end   
%
y(1:n,1:n)=fft2(y(1:n,1:n));
y(1+n:n2,1:n)=fft2(y(1+n:n2,1:n));
y(1+n2:n3,1:n)=fft2(y(1+n2:n3,1:n));
y(1+n3:n4,1:n)=fft2(y(1+n3:n4,1:n));
y(1:n,1+n:n2)=fft2(y(1:n,1+n:n2));
y(1+n:n2,1+n:n2)=fft2(y(1+n:n2,1+n:n2));
y(1+n2:n3,1+n:n2)=fft2(y(1+n2:n3,1+n:n2));
y(1+n3:n4,1+n:n2)=fft2(y(1+n3:n4,1+n:n2));
