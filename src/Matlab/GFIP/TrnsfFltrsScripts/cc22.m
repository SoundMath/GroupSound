function g=cc22(x,y,gp,prj)
% Use this for even n:
[n2,tem]=size(x);
g=zeros(n2,n2);
n=n2/2;
m=n/2;
%
%
[a,b]=find(y(1:n,1:n));
[K,tem]=size(a);
if (gp==11) % (-x,-y), (y,x)
   for k=1:K
      tr(1,k)=a(k);
      tr(2,k)=b(k);
      tr(3,k)=mod(n-a(k)+1,n)+1;
      tr(4,k)=mod(n-b(k)+1,n)+1;
      tr(5,k)=b(k);
      tr(6,k)=a(k);
      tr(7,k)=tr(4,k);
      tr(8,k)=tr(3,k);
      %hr(1,k)=tr(3,k);
      %hr(2,k)=tr(4,k);
      %hr(3,k)=tr(1,k);
      %hr(4,k)=tr(2,k);
      %hr(5,k)=tr(7,k);
      %hr(6,k)=tr(8,k);
      %hr(7,k)=tr(5,k);
      %hr(8,k)=tr(6,k);
      hr(1:8,k)=mod(n-tr(1:8,k)+1,n)+1;
   end   
end   
%
if (gp==12) % [0 1;1 0], [0 m+1;m+1 0],[m+1 0;0 m+1]
   for k=1:K
      tr(1,k)=a(k);
      tr(2,k)=b(k);
      tr(3,k)=b(k);
      tr(4,k)=a(k);
      tr(5,k)=mod(n/2+b(k)-1,n)+1;
      tr(6,k)=mod(n/2+a(k)-1,n)+1;
      tr(7,k)=tr(6,k);
      tr(8,k)=tr(5,k);
      hr(1:8,k)=mod(n-tr(1:8,k)+1,n)+1;
   end   
end   
if (prj==4)
   for k=1:K
      g(tr(1,k),tr(2,k))    =x(tr(1,k),tr(2,k));
      g(tr(3,k),tr(4,k)+n)  =x(tr(3,k),tr(4,k)+n);
      g(tr(5,k)+n,tr(6,k))  =x(tr(5,k)+n,tr(6,k));
      g(tr(7,k)+n,tr(8,k)+n)=x(tr(7,k)+n,tr(8,k)+n);
      g(hr(1,k),hr(2,k))    =x(hr(1,k),hr(2,k));
      g(hr(3,k),hr(4,k)+n)  =x(hr(3,k),hr(4,k)+n);
      g(hr(5,k)+n,hr(6,k))  =x(hr(5,k)+n,hr(6,k));
      g(hr(7,k)+n,hr(8,k)+n)=x(hr(7,k)+n,hr(8,k)+n);
      %
      g(tr(1,k),tr(2,k)+n)  =x(tr(1,k),tr(2,k)+n);
      g(tr(3,k),tr(4,k))    =x(tr(3,k),tr(4,k));
      g(tr(5,k)+n,tr(6,k)+n)=x(tr(5,k)+n,tr(6,k)+n);
      g(tr(7,k)+n,tr(8,k))  =x(tr(7,k)+n,tr(8,k));
      g(hr(1,k),hr(2,k)+n)  =x(hr(1,k),hr(2,k)+n);
      g(hr(3,k),hr(4,k))    =x(hr(3,k),hr(4,k));
      g(hr(5,k)+n,hr(6,k)+n)=x(hr(5,k)+n,hr(6,k)+n);
      g(hr(7,k)+n,hr(8,k))  =x(hr(7,k)+n,hr(8,k));
      %
      g(tr(1,k)+n,tr(2,k))  =x(tr(1,k)+n,tr(2,k));
      g(tr(3,k)+n,tr(4,k)+n)=x(tr(3,k)+n,tr(4,k)+n);
      g(tr(5,k),tr(6,k))    =x(tr(5,k),tr(6,k));
      g(tr(7,k),tr(8,k)+n)  =x(tr(7,k),tr(8,k)+n);
      g(hr(1,k)+n,hr(2,k))  =x(hr(1,k)+n,hr(2,k));
      g(hr(3,k)+n,hr(4,k)+n)=x(hr(3,k)+n,hr(4,k)+n);
      g(hr(5,k),hr(6,k))    =x(hr(5,k),hr(6,k));
      g(hr(7,k),hr(8,k)+n)  =x(hr(7,k),hr(8,k)+n);
      %
      g(tr(1,k)+n,tr(2,k)+n)=x(tr(1,k)+n,tr(2,k)+n);
      g(tr(3,k)+n,tr(4,k))  =x(tr(3,k)+n,tr(4,k));
      g(tr(5,k),tr(6,k)+n)  =x(tr(5,k),tr(6,k)+n);
      g(tr(7,k),tr(8,k))    =x(tr(7,k),tr(8,k));
      g(hr(1,k)+n,hr(2,k)+n)=x(hr(1,k)+n,hr(2,k)+n);
      g(hr(3,k)+n,hr(4,k))  =x(hr(3,k)+n,hr(4,k));
      g(hr(5,k),hr(6,k)+n)  =x(hr(5,k),hr(6,k)+n);
      g(hr(7,k),hr(8,k))    =x(hr(7,k),hr(8,k));
   end   
end
%
