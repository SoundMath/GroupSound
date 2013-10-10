function y=in_2n_2(x)
%
% n_2 X n_2 (D_n x D_n )
% Use this for even n
%
[n2,tem]=size(x);
n=n2/2;
m=n/2;
rt2=1/sqrt(2);
%
for k=1:n2
   t1=x(1,k);
   t2=x(1+n,k);
   x(1,k)=rt2*(t1+t2);
   x(1+n,k)=rt2*(t1-t2);
   t1=x(1+m,k);
   t2=x(1+m+n,k);
   x(1+m,k)=rt2*(t1+t2);
   x(1+m+n,k)=rt2*(t1-t2);
end   
x(1:n,:)=fft(x(1:n,:));
x(1+n:n2,:)=fft(x(1+n:n2,:));
x=x.';
for k=1:n2
   t1=x(1,k);
   t2=x(1+n,k);
   x(1,k)=rt2*(t1+t2);
   x(1+n,k)=rt2*(t1-t2);
   t1=x(1+m,k);
   t2=x(1+m+n,k);
   x(1+m,k)=rt2*(t1+t2);
   x(1+m+n,k)=rt2*(t1-t2);
end   
x(1:n,:)=fft(x(1:n,:));
x(1+n:n2,:)=fft(x(1+n:n2,:));
y=(1/n)*x.';
%
