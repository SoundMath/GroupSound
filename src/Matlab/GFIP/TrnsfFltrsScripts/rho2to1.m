function y=rho2to1(x,n)
nn=n*n;
n2=n+n;
y=reshape(x(1:n,1:n),nn,1);
y=[y; reshape(x(1+n:n2,1:n),nn,1)];
y=[y; reshape(x(1:n,1+n:n2),nn,1)];
y=[y; reshape(x(1+n:n2,1+n:n2),nn,1)];