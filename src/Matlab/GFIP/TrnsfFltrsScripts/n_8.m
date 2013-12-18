function [y1,y2,y4,y8]=n_8(x,gp)
[n8,tem]=size(x);
n=n8/8;
%
% Use this routine for even n.
% C_n sdp C_2 
%
m=n/2;
rt2=1/sqrt(2);
y1=zeros(n8,1);
y2=zeros(n8,1);
y4=zeros(n8,1);
y8=zeros(n8,1);
%
xx=reshape(x,n,8);
fxx=sqrt(n)*ifft(xx);
bf=reshape(fxx,n8,1);
%
if (gp==1) % x --> x^(n/8+1)
   d1=n/8;
   d2=n/8;
   d4=n/4;
   for k=0:n/8-1
      kk=8*k;
      c1(k+1)=1+kk;
      c2(k+1)=5+kk;
      c4(2*k+1)=3+kk;
      c4(2*k+2)=7+kk;
   end   
end   
%
%
for k=1:d1
   for kk=1:8
      t1(kk,k)=bf(c1(k)+(kk-1)*n,1);
   end   
end
t1=sqrt(8)*ifft(t1);
for k=1:d1
   for kk=1:8
      bf(c1(k)+(kk-1)*n,1)=t1(kk,k);
   end   
end
y8=bf-y1-y2-y4;
   