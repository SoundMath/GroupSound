function yy=scene(m,nx,ny)
ln=zeros(nx,ny);
crc=zeros(nx,ny);
chk=rand(nx,ny);
%
if (m == 1)
%   for k1=1:nx/2
%      kk1=2*k1;
%      for k2=1:ny/2
%         kk2=2*k2;
%         kk=k1*k2;
%         chk(kk1-1,kk2-1)=kk+chk(kk1-1,kk2-1);
%         chk(kk1,kk2-1)=2*(kk+chk(kk1,kk2-1));
%         chk(kk1-1,kk2)=3*(kk+chk(kk1-1,kk2));
%         chk(kk1,kk2)=4*(kk+chk(kk1,kk2));
%      end
%   end
   mm=max(max(chk));
   ln=zeros(nx,ny);
   yy=zeros(nx,ny);
%   nn=max(nx,ny);
%   for k=1:floor(nn/7)-1
%      ln(k,nn-7*k+1)=max(max(chk));
%   end 
%   yy=ln+chk;
   n=36;
   x=linspace(0,n-1,n);
   x7=mod(7*x,nx)+1;
   for k=1:n
      yy(x7(k),n-x(k)+1)=.8*mm;
   end  
   for k=1:n
      yy(k,k)=.5*mm;
   end   
%   yy=yy+chk;
%   yy(1:n,1+n:2*n)=yy(1:n,1:n);
%   yy(1:n,1+2*n:3*n)=yy(1:n,1:n);
%   yy(1+n:2*n,1:n)=yy(1:n,1:n);
%   yy(1+n:2*n,1+n:2*n)=yy(1:n,1:n);
%   yy(1+n:2*n,1+2*n:3*n)=yy(1:n,1:n);
end   
%
%if (m==2)
%   d=[512,512];
%   fid=fopen('grass.tiff', 'r' , 'ieee-be');
%   if fid == -1
%      error('Help')
%   end
%   h = fread(fid, 42, 'uchar');
%   grs= fread(fid, prod(d), 'uint8');
%   grs=reshape(grs, d)';
%   gg(1:n2,1:n2)=grs(1:n2,1:n2);
%
%   ln=zeros(n2,n2);
%   rd=rand(n2,n2);
%   for k=n/8:n2
%      ln(k-n/8+1,k)=50;
%      ln(n-n/8,k)=35;
%      ln(k,n+n/8)=35;
%   end
%   yy=gg+ln;
%end
%
if (m==3)
   for k1=1:nx/2
      kk1=2*k1;
      for k2=1:ny/2
         kk2=2*k2;
         kk=k1*k2;
         chk(kk1-1,kk2-1)=kk+chk(kk1-1,kk2-1);
         chk(kk1,kk2-1)=2*(kk+chk(kk1,kk2-1));
         chk(kk1-1,kk2)=3*(kk+chk(kk1-1,kk2));
         chk(kk1,kk2)=4*(kk+chk(kk1,kk2));
      end
   end
end
%
if (m==4)
   ln=zeros(n2,n2);
   for k=1:n2
      ln(k,k)=2*abs(n-.5*k);
   end   
   ns=n*rand(n2,n2);
   spk=zeros(n2,n2);
   for k1=1:n
      kk1=2*k1;
      for k2=1:n
         kk2=2*k2;
         chk(kk1-1,kk2)=.5*kk1;
         chk(kk1,kk2-1)=.5*kk2;
      end
   end
   for k=0:45
      spk=spk+rrtt(ln,n2,8*k);
   end
   yy=chk+spk+ns;
end
%
if (m==5)
   for k=n/8:n2
      ln(k-n/8+1,k)=30;
      ln(n-n/8,k)=30;
      ln(k,n+n/8)=30;
   end
   for k=1:n
      ln(2*k,n2-k+1-n/4)=30;
   end   
   for k=1:n2
      ln(n2-k+1,k)=30;
   end
   crc=zeros(n2,n2);
   crc(n-n/4,n-n/8)=25;
   crc(n-n/4,n-n/8+1)=25;
   crc(n-n/4,n-n/8+2)=25;
   for k=1:7
      crc=crc+rrtt(crc,n2,2^k);
   end   
   crc=p4(n2,crc);
%   ns=100*rand(n2,n2);
   crc=crc+trsl(crc,n2,n/8,n/4);
%   yy=crc+ns+ln;
   yy=crc+ln;
end   
%
if (m==6)
   ln=zeros(n2,n2);
%   for k1=1:n
%      kk1=2*k1;
%      for k2=1:n
%         kk2=2*k2;
%         kk=.04*k1*k2;
%         kk=20;
%         chk(kk1-1,kk2-1)=.1*(kk+chk(kk1-1,kk2-1));
%         chk(kk1,kk2-1)=.2*(kk+chk(kk1,kk2-1));
%         chk(kk1-1,kk2)=.3*(kk+chk(kk1-1,kk2));
%         chk(kk1,kk2)=.4*(kk+chk(kk1,kk2));
%         chk(kk1-1,kk2-1)=.1*(kk);
%         chk(kk1,kk2-1)=.2*(kk);
%         chk(kk1-1,kk2)=.3*(kk);
%         chk(kk1,kk2)=.4*(kk);
%      end
%   end
%   ln(n-n/8,1:n+n/2)=5;
%   ln(n+n/4,n/4:n2)=5;
%   for k=1:n
%      ln(2*k,n2-k+1-n/2)=5;
%   end   
%   for k=1:n2
%      ln(n2-k+1,k)=5;
%      ln(k,k)=5;
%      ln(k,n/2)=5;
%   end
%   for k=1:n
%      ln(n2-k+1-n+n/4,2*k)=5;
%      ln(2*k,n2-k+1-n+n/2-3)=5;
%      ln(n2-k+1-n,2*k)=5;
%      ln(2*k,n2-k+1-n)=5;
%      ln(2*k,k+n/4)=5;
%      ln(k+n/2-3,2*k)=5;
%   end   
   for k=1:n2
      ln(k,k)=5;
      ln(n2-k+1,k)=5;
%      ln(k,k)=5;
%      ln(k,n2-k+1)=5;
   end   
%   for k1=1:n2
%      for k2=1:n2
%         if (ln(k1,k2) > 5)
%            ln(k1,k2)=5;
%         end
%      end
%   end   
%   for k=1:n+n/2
%      ln(k+n/2,k)=5;
%      ln(k+n/4+3,n2-k)=5;
%   end   
%   for k=1:n2-7
%      ln(k+7,k)=5;
%      ln(n2-k-6,k)=5;
%   end   
%   for k=1:n
%      ln(k+n,k)=5;
%   end   
%   ns=70*rand(n2,n2);
   yy=ln;
end   
%