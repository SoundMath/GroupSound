function f=rrtt(f1,n2,rr)
f=zeros(n2,n2);
n=n2/2;
%
th=pi*rr/180;
cc=cos(th);
ss=sin(th);
[u,v]=find(f1);
[nk,nl]=size(u);
for kk=1:nk
   k1=u(kk);
   k2=v(kk);
   nu=(k1-n-1)*cc-(k2-n-1)*ss+n+1;
   du=nu-floor(nu);
   nu=floor(nu);
   if (nu == n2)
      nu1=nu;
   else
      nu1=1+nu;
   end   
   nv=(k1-n-1)*ss+(k2-n-1)*cc+n+1;
   dv=nv-floor(nv);
   nv=floor(nv);
   if (nv==n2)
      nv1=nv;
   else
      nv1=1+nv;
   end
   du1=1-du;
   dv1=1-dv;
   if (nu > 0 & nv > 0 )
      if (nu < n2+1 & nv < n2+1)
         f(nu,nv)=f(nu,nv)+du1*dv1*f1(k1,k2);
         f(nu1,nv)=f(nu1,nv)+du*dv1*f1(k1,k2);
         f(nu,nv1)=f(nu,nv1)+du1*dv*f1(k1,k2);
         f(nu1,nv1)=f(nu1,nv1)+du*dv*f1(k1,k2);
      end
   end
end   
