function f=trsl(f1,n2,t1,t2)
f=zeros(n2,n2);
[u v]=find(f1);
nn=size(u);
%
for k=1:nn
   nu=u(k)+t1;
   nv=v(k)+t2;
   if (nu > 0 & nv > 0 & nu < n2+1 & nv < n2+1)
      f(nu,nv)=f1(u(k),v(k));
   end   
end