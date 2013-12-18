function [y1,y2,y4,y8,y16]=scl2_16(x,n);
%
% (C_n x C_n) sdp C_16 
% n must be a power of 2, and at least 64.
% (a,b)^t = (sa,sb), s=n/16-1
%
n2=2*n;
n3=3*n;
n4=4*n;
m=n/2;
mm=n/16;
rt2=1/sqrt(2);
t4=zeros(4,1);
t8=zeros(8,1);
t16=zeros(16,1);
%x=rand(n4,n4);
%
y1=zeros(n4,n4);
y2=zeros(n4,n4);
y4=zeros(n4,n4);
y8=zeros(n4,n4);
y16=zeros(n4,n4);
%
for k2=0:3
   for k1=0:3
      bf(1+k1*n:(k1+1)*n,1+k2*n:(k2+1)*n)=n*ifft2(x(1+k1*n:(k1+1)*n,1+k2*n:(k2+1)*n));
   end
end 
for k2=0:n/4-1
   kk2=1+4*k2;
   for k1=0:n/4-1
      kk1=1+4*k1;
      t1=bf(2+kk1,kk2)+bf(2+kk1,kk2+n2);   
      t2=bf(2+kk1,kk2)-bf(2+kk1,kk2+n2);   
      bf(2+kk1,kk2)=rt2*t1;
      bf(2+kk1,kk2+n2)=rt2*(t2);
      t1=bf(kk1,2+kk2)+bf(kk1,2+kk2+n2);   
      t2=bf(kk1,2+kk2)-bf(kk1,2+kk2+n2);   
      bf(kk1,2+kk2)=rt2*t1;
      bf(kk1,2+kk2+n2)=rt2*(t2);
      t1=bf(2+kk1,2+kk2)+bf(2+kk1,2+kk2+n2);   
      t2=bf(2+kk1,2+kk2)-bf(2+kk1,2+kk2+n2);   
      bf(2+kk1,2+kk2)=rt2*t1;
      bf(2+kk1,2+kk2+n2)=rt2*(t2);
   end
end   
for k2=0:n/8-1
   kk2=1+8*k2;
   for k1=0:n/8-1
      kk1=1+8*k1;
      for l=0:3
         t(1+l)=bf(4+kk1,kk2+l*n);
      end
      t=2*ifft(t);
      for l=0:3
         bf(4+kk1,kk2+l*n)=t(1+l);
      end
      for l=0:3
         t(1+l)=bf(kk1,4+kk2+l*n);
      end
      t=2*ifft(t);
      for l=0:3
         bf(kk1,4+kk2+l*n)=t(1+l);
      end
      for l=0:3
         t(1+l)=bf(4+kk1,4+kk2+l*n);
      end
      t=2*ifft(t);
      for l=0:3
         bf(4+kk1,4+kk2+l*n)=t(1+l);
      end
   end
end   
for k2=0:n/8-1
   kk2=1+8*k2;
   for k1=0:n/8-1
      kk1=1+8*k1;
      t8(1)=bf(kk1,   kk2);
      t8(2)=bf(kk1+n2,kk2);
      t8(3)=bf(kk1,   kk2+n);
      t8(4)=bf(kk1+n2,kk2+n);
      t8(5)=bf(kk1,   kk2+n2);
      t8(6)=bf(kk1+n2,kk2+n2);
      t8(7)=bf(kk1,   kk2+n3);
      t8(8)=bf(kk1+n2,kk2+n3);
      t8=sqrt(8)*ifft(t8);
      bf(kk1,   kk2)=t8(1);
      bf(kk1+n2,kk2)=t8(2);
      bf(kk1,   kk2+n)=t8(3);
      bf(kk1+n2,kk2+n)=t8(4);
      bf(kk1,   kk2+n2)=t8(5);
      bf(kk1+n2,kk2+n2)=t8(6);
      bf(kk1,   kk2+n3)=t8(7);
      bf(kk1+n2,kk2+n3)=t8(8);
   end
end   
for k2=0:1
   kk2=m*k2;
   for k1=0:1
      kk1=m*k1;
      for l2=0:3
         ll2=kk2+n*l2;
         for l1=0:3
            ll1=kk1+n*l1;
            t(1+l1+4*l2)=bf(1+ll1,1+ll2);
         end   
      end   
      t=4*ifft(t);
      for l2=0:3
         ll2=kk2+n*l2;
         for l1=0:3
            ll1=kk1+n*l1;
            bf(1+ll1,1+ll2)=t(1+l1+4*l2);
         end   
      end   
   end   
end
for m2=0:3
   mm2=m2*n;
   for m1=0:3
      mm1=m1*n;
      for k2=0:n/2-1
         kk2=1+2*k2+mm2;
         for k1=0:n/2-1
            kk1=1+2*k1+mm1;
            y16(1+kk1,kk2)=bf(1+kk1,kk2);
            y16(kk1,1+kk2)=bf(kk1,1+kk2);
            y16(1+kk1,1+kk2)=bf(1+kk1,1+kk2);
         end
      end
      for k2=0:n/4-1
         kk2=1+4*k2+mm2;
         for k1=0:n/4-1
            kk1=1+4*k1+mm1;
            y8(2+kk1,kk2)=bf(2+kk1,kk2);
            y8(kk1,2+kk2)=bf(kk1,2+kk2);
            y8(2+kk1,2+kk2)=bf(2+kk1,2+kk2);
         end
      end   
      for k2=0:n/8-1
         kk2=1+8*k2+mm2;
         for k1=0:n/8-1
            kk1=1+8*k1+mm1;
            y4(4+kk1,kk2)=bf(4+kk1,kk2);
            y4(kk1,4+kk2)=bf(kk1,4+kk2);
            y4(4+kk1,4+kk2)=bf(4+kk1,4+kk2);
         end
      end
      for k2=0:n/8-1
         kk2=1+8*k2+mm2;
         for k1=0:n/8-1
            kk1=1+8*k1+mm1;
            y2(kk1,kk2)=bf(kk1,kk2);
         end
      end   
      y1(1+mm1,1+mm2)=bf(1+mm1,1+mm2);
      y1(1+m+mm1,1+mm2)=bf(1+m+mm1,1+mm2);
      y1(1+mm1,1+m+mm2)=bf(1+mm1,1+m+mm2);
      y1(1+m+mm1,1+m+mm2)=bf(1+m+mm1,1+m+mm2);
   end   
end
y2=y2-y1;
      
