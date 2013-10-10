function yyy=scene(m,n,orgn)
n2=n*2;
ln=zeros(n2,n2);
crc=zeros(n2,n2);
chk=zeros(n2,n2);
n8=floor(n/8);
%
if (m == 1)
   ln=zeros(n2,n2);
   rd=rand(n2,n2);
   for k=n/8:n2
      ln(k-n/8+1,k)=.5;
      ln(n/4+n/8,k)=.5;
   end 
   ln1=1.5*rrtt(ln,n2,30);
   dt=60*(p4(n2,ln)+ln1);
   yy=dt+60*rd;
end   
%
if (m==2)
   for k1=1:n
      kk1=2*k1;
      for k2=1:n
         kk2=2*k2;
         kk=k1*k2;
         chk(kk1-1,kk2-1)=kk+chk(kk1-1,kk2-1);
         chk(kk1,kk2-1)=2*(kk+chk(kk1,kk2-1));
         chk(kk1-1,kk2)=3*(kk+chk(kk1-1,kk2));
         chk(kk1,kk2)=4*(kk+chk(kk1,kk2));
      end
   end
   sm=zeros(n2,n2);
   sm(n-n/4:n,n-n/16:n+n8)=chk(n-n/4:n,n-n/16:n+n8);
   yy=chk+sm+rrtt(sm,n2,30)+rrtt(sm,n2,115);
end
%
if (m==3)
   for k1=1:n
      kk1=2*k1;
      for k2=1:n
         kk2=2*k2;
         kk=20;
         chk(kk1-1,kk2-1)=1*(kk+chk(kk1-1,kk2-1));
         chk(kk1,kk2-1)=2*(kk+chk(kk1,kk2-1));
         chk(kk1-1,kk2)=3*(kk+chk(kk1-1,kk2));
         chk(kk1,kk2)=4*(kk+chk(kk1,kk2));
      end
   end
   yy=chk;
end   
if (m==4)
   for k=n8:n2
      ln(k-n8+1,k)=30;
      ln(n-n8,k)=30;
      ln(k,n+n8)=30;
   end
   for k=1:n
      ln(2*k,n2-k+1-n/4)=30;
   end   
   for k=1:n2
      ln(n2-k+1,k)=30;
   end
   crc=zeros(n2,n2);
   crc(n-n/4,n-n8)=25;
   crc(n-n/4,n-n8+1)=25;
   crc(n-n/4,n-n8+2)=25;
   for k=1:7
      crc=crc+rrtt(crc,n2,2^k);
   end   
   crc=p4(n2,crc);
   crc=crc+trsl(crc,n2,n8,n/4);
   yy=.5*crc+ln;
end   
%
if (m==5)
   ln=zeros(n2,n2);
   for k1=1:n
      kk1=2*k1;
      for k2=1:n
         kk2=2*k2;
         kk=.04*k1*k2;
         kk=20;
         chk(kk1-1,kk2-1)=.1*(kk+chk(kk1-1,kk2-1));
         chk(kk1,kk2-1)=.2*(kk+chk(kk1,kk2-1));
         chk(kk1-1,kk2)=.3*(kk+chk(kk1-1,kk2));
         chk(kk1,kk2)=.4*(kk+chk(kk1,kk2));
         chk(kk1-1,kk2-1)=.1*(kk);
         chk(kk1,kk2-1)=.2*(kk);
         chk(kk1-1,kk2)=.3*(kk);
         chk(kk1,kk2)=.4*(kk);
      end
   end
   ln(n-n8,1:n+n/2)=10;
   ln(n+n/4,n/4:n2)=10;
   for k=1:n2
      ln(n2-k+1,k)=10;
      ln(k,k)=10;
      ln(k,n/2)=10;
   end
   for k=1:n
      ln(n2-k+1-n+n/4,2*k)=10;
      ln(2*k,n2-k+1-n+n/2-3)=10;
      ln(2*k,n2-k+1-n)=10;
      ln(2*k,k+n/4)=10;
      ln(2*k,n2-k+1-n+n/2-3)=10;
      ln(k+n/2-3,2*k)=10;
      ln(k+n/4,n2-(2*k)+1)=10;
      ln(n2-k-n/2,2*k)=10;
   end   
   yy=ln;
end   
%
if (m==6)
   yy=zeros(n2,n2);
   ln=zeros(n2,n2);
   nm=n/4-1;
   np=n/4+1;
   x=linspace(0,n-1,n);
   xp=mod(np*x,n);
   xm=mod(nm*x,n);
   for k=0:n-1
      ln1(k+1,xp(k+1)+1)=15;
      ln2(k+1,xm(k+1)+1)=15;
   end
   yy(1:n,1:n)=ln1(1:n,1:n);
   yy(1+n:n2,7:n+6)=ln2(1:n,1:n);
end   
%
if (m==7)
   for k1=1:n
      kk1=2*k1;
      for k2=1:n
         kk2=2*k2;
         kk=.02*k1*k2;
         chk(kk1-1,kk2-1)=1*(kk+chk(kk1-1,kk2-1));
         chk(kk1,kk2-1)=2*(kk+chk(kk1,kk2-1));
         chk(kk1-1,kk2)=3*(kk+chk(kk1-1,kk2));
         chk(kk1,kk2)=4*(kk+chk(kk1,kk2));
         chk(kk1-1,kk2-1)=1*(kk);
         chk(kk1,kk2-1)=2*(kk);
         chk(kk1-1,kk2)=3*(kk);
         chk(kk1,kk2)=4*(kk);
      end
   end
   yy=chk;
end   
%
if (m==8) 
   for k1=0:n-1
      for k2=0:n-1
         chk(2*k1+1,2*k2+1)=1;
         chk(2*k1+2,2*k2+2)=1;
      end   
   end   
   yy=chk;
end   
%
if (orgn==0)
   yyy(1:n,1:n)=yy(1+n:n2,1+n:n2);
   yyy(1+n:n2,1:n)=yy(1:n,1+n:n2);
   yyy(1:n,1+n:n2)=yy(1+n:n2,1:n);
   yyy(1+n:n2,1+n:n2)=yy(1:n,1:n);
else
    yyy=yy;
end   
