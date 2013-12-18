clear;
n=7;
n2=n*2;
g=eye(n2);
a=(1/n)*fft(eye(n));
e(1:n,1)=.5*a(1:n,1);
e(n+1:n2,1)=.5*a(1:n,1);
e(1:n,2)=.5*a(1:n,1);
e(n+1:n2,2)=-.5*a(1:n,1);
e(1:n,3:n+1)=a(1:n,2:n);
e(n+1:n2,3:n+1)=zeros(n,n-1);
for k=1:n2
   for m=1:n+1
      filt(1:n2,m,k)=dihed_cnv(e(:,m),n)*g(1:n2,k); 
   end   
end   

