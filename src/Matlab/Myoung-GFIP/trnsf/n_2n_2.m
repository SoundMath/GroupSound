function [y1,y2,y4]=n_2n_2(x)
%
% n_2 X n_2 (D_n x D_n)
% Use this for even n
%
[n2,tem]=size(x);
n=n2/2;
m=n/2;
rt2=1/sqrt(2);
%
bf(1:n,:)=   ifft(x(1:n,:));
bf(n+1:n2,:)=ifft(x(n+1:n2,:));
for k=1:n2
   t1=bf(1,k);
   t2=bf(1+n,k);
   bf(1,k)=rt2*(t1+t2);
   bf(1+n,k)=rt2*(t1-t2);
   t1=bf(1+m,k);
   t2=bf(1+m+n,k);
   bf(1+m,k)=rt2*(t1+t2);
   bf(1+m+n,k)=rt2*(t1-t2);
end   
bf=bf.';
tbf(1:n,:)=   ifft(bf(1:n,:));
tbf(n+1:n2,:)=ifft(bf(n+1:n2,:));
for k=1:n2
   t1=tbf(1,k);
   t2=tbf(1+n,k);
   tbf(1,k)=rt2*(t1+t2);
   tbf(1+n,k)=rt2*(t1-t2);
   t1=tbf(1+m,k);
   t2=tbf(1+m+n,k);
   tbf(1+m,k)=rt2*(t1+t2);
   tbf(1+m+n,k)=rt2*(t1-t2);
end   
bf=n*tbf.';
%
%filtering by dimensionality
%
y1=zeros(n2,n2);
y2=zeros(n2,n2);
y4=zeros(n2,n2);
%
for kk=0:3
   mk=m*kk;
   for ll=0:3
      ml=m*ll;
      y1(1+mk,1+ml)=bf(1+mk,1+ml);
      for k=1:m-1
         y2(k+mk+1,ml+1)=bf(k+mk+1,ml+1);
         y2(ml+1,k+mk+1)=bf(ml+1,k+mk+1);
      end   
   end   
end  
y4=bf-y1-y2;
