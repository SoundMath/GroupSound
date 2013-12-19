clear;
n=8;
n2=n+n;
m=n/2;
u = linspace(-1,1,n2); u = u(:);  % linearly incr. seq. of pulses
v=zeros(n2,1);   v(n+1,1)=1;      % impulse at n+1
%u=rand(n2,1);v=rand(n2,1);

N=n2;
subplot(4,1,1);stem(u); title('f \in CG_2, N=8'); 
%axis([0,N,-1,1]); set(gca,'XTick',1:N); set(gca,'XTickLabel',' ');set(gca,'YTick',[]); 
%subplot(4,1,2);stem(v); title('g = k_{7}'); 
%axis([0,N,-1,1]); set(gca,'XTick',1:N); set(gca,'XTickLabel',' ');set(gca,'YTick',[]); 

%
gp=3;
uu=gn_2(u,gp);
y=uu*v;  %  size(y) == 32  1
subplot(4,1,2);stem(y); title('gn\_2'); 
%
yy=cn_2(u,v,gp);  % size(yy) == 32  1
subplot(4,1,3);stem(yy);title('cn\_2'); 
%
% convolution theorem
for k=1:n2
   [f1,f2]=n_2(uu(:,k),gp);
   fu(:,k)=f1+f2;
end   
fut=fu';
for k=1:n2
   [f1,f2]=n_2(fut(:,k),gp);
   ffu(:,k)=f1+f2;
end
fuf=ffu';
[fv1,fv2]=n_2(v,gp);
fv=fv1+fv2;
dd=fuf*fv;
c2=in_2(dd,gp);  % size(c2) == 32  1
subplot(4,1,4);stem(c2);title('conv thm'); 
%
%
