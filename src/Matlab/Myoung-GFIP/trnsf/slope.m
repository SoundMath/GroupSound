function y=slope(n,m);
knt=0;
int=[0 -1 1 n/3 n/3-1 n/3+1 2*n/3 2*n/3-1 2*n/3+1];
[tem,nn]=size(int);
for k1=1:nn
   for k2=1:nn
      b=int(k1);
      d=int(k2);
      a=1-m*b;
      c=m-m*d;
      mt=[a b;c d];
      mt2=mod(mt*mt,n);
      dt=mod(det(mt),n);
      if (dt~=0 & norm(mt2)==1)
         knt=knt+1;
         u(1:2,1:2,knt)=mod(mt,n);
      end   
   end
end
cnt=0;
for k=1:knt
   [xx,yy]=isop(u(:,:,k),n);
   [tem,sz]=size(xx);
   if (sz==n)
      cnt=cnt+1;
      y(:,:,cnt)=u(:,:,k);
   end
end   
