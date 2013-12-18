function y=cnn_22(u,v,gp);
[n2,tem]=size(u);
n=n2/2;
m=n/2;
%
nn=linspace(0,n-1,n);
rnn=mod(n-nn,n);
ur(1:n,1:n)=u(1:n,1:n);
if (gp==11) % sdp (-x,-y) x (y,x)
   for k2=0:n-1
      for k1=0:n-1
         ur(k1+1+n,k2+1)=u(rnn(k1+1)+1+n,rnn(k2+1)+1);
         ur(k1+1,k2+1+n)=u(k2+1,k1+1+n);
         ur(k1+1+n,k2+1+n)=u(rnn(k2+1)+1+n,rnn(k1+1)+1+n);
      end
   end   
end
%
%
%
[d1,d21,d22,d23,d4]=nn_22(ur,gp);
[v1,v21,v22,v23,v4]=nn_22(v,gp);
%
c=zeros(n2,n2);
dd1=d1(1:n,1:n);
ddtwo=d1(1+n:n2,1:n);
dd3=d1(1:n,1+n:n2);
ddfour=d1(1+n:n2,1+n:n2);
vv1=v1(1:n,1:n);
vv2=v1(1+n:n2,1:n);
vv3=v1(1:n,1+n:n2);
vv4=v1(1+n:n2,1+n:n2);
c=c+2*d1.*v1;
%
dd1=d21(1:n,1:n);
ddtwo=d21(1+n:n2,1:n);
dd3=d21(1:n,1+n:n2);
ddfour=d21(1+n:n2,1+n:n2);
vv1=v21(1:n,1:n);
vv2=v21(1+n:n2,1:n);
vv3=v21(1:n,1+n:n2);
vv4=v21(1+n:n2,1+n:n2);
c(1:n,1:n)=c(1:n,1:n)+sqrt(2)*(dd1*vv1+ddtwo*vv2+dd3*vv3+ddfour*vv4);
%y=n*inn_22(c,gp);
%
y=n*c;
