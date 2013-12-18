function yy=bkgd(s,m,n)
n2=2*n;
nn=ceil(n/m);
nn2=2*m*ceil(n/m);
chk=zeros(nn2,nn2);
dhk=zeros(nn2,nn2);
%
if (s==0)
   for m1=1:m
      for m2=1:m
         blck(m1,m2)=m1+m2;
      end
   end   
   for k1=0:nn-1
      kk1=2*k1*m;
      for k2=0:nn-1
         kk2=2*k2*m;
         chk(1+kk1:m+kk1,1+kk2:m+kk2)=blck;
         chk(1+kk1+m:2*m+kk1,1+kk2+m:2*m+kk2)=blck;
      end
   end
end
%
if (s==1) 
   fm=floor(m/2);
   for mm=1:fm
      strp(mm,1)=mm;
      strp(m-mm+1,1)=mm;
   end   
   if (fm*2 < m)
      strp(fm+1,1)=fm+1;
   end   
   %
   for l1=0:nn-1
      ll1=2*l1*m;
      for k1=1:n2-ll1
         chk(ll1+k1:ll1+m+k1-1,k1)=strp;
      end   
   end
   for l2=1:nn
      ll2=2*l2*m;
      for k1=1:n2-ll2+1
         chk(k1:m+k1-1,ll2+k1)=strp;
      end   
      for k=1:m-1
         chk(1:m-k,ll2-k+1)=strp(1+k:m);
      end   
   end   
end   
%
if (s==2)
   fm=floor(m/2);
   for mm=1:fm
      strp(mm,1)=mm;
      strp(m-mm+1,1)=mm;
   end   
   if (fm*2 < m)
      strp(fm+1,1)=fm+1;
   end   
   for l1=0:nn-1
      ll1=2*l1*m;
      for k1=1:n2-ll1
         chk(ll1+k1:ll1+m+k1-1,n2-k1+1)=strp;
      end   
   end
   for ll=1:nn-1
      ll2=2*m*ll;
      for k1=1:n2-ll2
         chk(n2-ll2-k1+1:n2-ll2+m-k1,k1)=strp;
      end 
      for k=1:m-1
         chk(1:m-k,n2-ll2+k)=strp(k+1:m,1);
      end   
   end   
   if (nn == n/m)
      ll=nn;
      ll2=2*m*nn;
      for k1=1:n2-ll2
         chk(n2-ll2-k1+1:n2-ll2+m-k1,k1)=strp;
      end 
      for k=1:m-1
         chk(1:m-k,n2-ll2+k)=strp(k+1:m,1);
      end   
   end   
end   
%
if (s==3)
   nn=ceil(n2/m);
   for k=0:nn-1
      for mm=1:m
         chk(mm+k*m,1:n2)=m-mm+1;
      end   
   end   
end   
%
if (s==4) %uniform vertical strips
   nn=ceil(n2/m);
   for k=0:nn-1
      for mm=1:m
         chk(1:n2,mm+k*m)=mm;
      end   
   end   
end   
%
if (s==5) %growing horizontal strips
   ll=0;
   k=1;
   while (ll <= n2)
      st(k)=ll;
      ll=ll+k;
      k=k+1;
   end
   for kk=1:k-1
      for mm=1:kk
         chk(st(kk)+mm,1:n2)=mm;
      end   
   end   
end   
%
if (s==6) % growing vertical strips
   ll=0;
   k=1;
   while (ll <= n2)
      st(k)=ll;
      ll=ll+k;
      k=k+1;
   end
   for kk=1:k-1
      for mm=1:kk
         chk(1:n2,st(kk)+mm)=mm;
      end   
   end   
end   
%      
if (s==7) %lines of slope -2
   for mm=1:m 
      for k=1:n
         chk(n-k+1+mm,2*k)=mm;
      end   
   end   
end   
%      
if (s==8) %lines of slope -2
   for mm=1:m 
      for k=1:n
         chk(2*k,n-k+1+mm)=mm;
      end   
   end   
end   
%
%
mm=max(max(chk));
yy(1:n2,1:n2)=chk(1:n2,1:n2)/mm;
%
