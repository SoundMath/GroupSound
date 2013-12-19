clear;
n=8;
n2=n+n;
m=n/2;

y=zeros(n2,1);   % (for storing results)
yy=zeros(n2,1);   

% First Signal (an impulse)
u=zeros(n2,1);   
u(n+1)=1;              % impulse at n+1
uu=zeros(n2,1);   

% Second Signal (linear incr. seq. of pulses)
v = linspace(-1,1,n2); 
v'
v = v(:);  
vv=zeros(n2,1);   

figure(1); clf
subplot(3,1,1); stem(u); title('f \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n2-1)]);
subplot(3,1,2); stem(v); title('g \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',' ');

% Circular Convolution Theorem:
  ccuv = ifft(fft(u).*fft(v));     
  subplot(3,1,3);stem(real(ccuv));title('fg  when  G = C_{16}'); 
  axis([1,n2,-1,1]); set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n2-1)]);  
  % Matlab does non-circular convolution:
  %  cuv=conv(u,v);  %  length(cuv) == 31 
  % We could acheive the same as follows:
  % u0 = [u; zeros(N-1,1)]; v0=[v;zeros(N-1,1)];
  % ccuv = ifft(fft(u0).*fft(v0));

gp=1;

rn = indexset(n,gp);
uu(1:n,1)=u(1:n,1); vv(1:n,1)=v(1:n,1);
uu((1:n)+n,1)=u(rn(1:n)+n,1); vv((1:n)+n,1)=v(rn(1:n)+n,1);
d11=zeros(n2,1);  d21=zeros(n2,1);  % 4 coefs wrt 1-dim ideals
d12=zeros(n2,1);  d22=zeros(n2,1);  % 6 coefs wrt 2-dim ideals
[d11,d12]=n_2(u(:,1),gp);
[d21,d22]=n_2(vv(:,1),gp);
c(1:n,1)=d12(1:n,1).*d22(1:n,1)+d12(1+n:n2).*d22(1+n:n2);
c(1+n:n2,1)=d12(1+n:n2,1).*d22(1:n,1)+d12(1:n).*d22(1+n:n2);
c(1:n,1)=c(1:n,1)+sqrt(2)*d11(1:n,1).*d21(1:n,1);
c(1+n:n2,1)=c(1+n:n2)+sqrt(2)*d11(1+n:n2,1).*d21(1+n:n2,1);
y=sqrt(n)*in_2(c,gp);

yy(1:n) = y(1:n); yy((1:n)+n)=y(rn(1:n)+n);

figure(2); clf
subplot(3,1,1); stem(u); title('f \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n-1) (0:n-1)]);
subplot(3,1,2); stem(v); title('g \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',' ');
subplot(3,1,3); stem(yy); title('fg  when  G = C_8 \angle \{1,k_7\}'); 
axis([1,n2,-1,1]); set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n-1) (0:n-1)]);

gp=2;

rn = indexset(n,gp);
uu(1:n,1)=u(1:n,1); vv(1:n,1)=v(1:n,1);
uu((1:n)+n,1)=u(rn(1:n)+n,1); vv((1:n)+n,1)=v(rn(1:n)+n,1);
d11=zeros(n2,1);  d21=zeros(n2,1);  % 4 coefs wrt 1-dim ideals
d12=zeros(n2,1);  d22=zeros(n2,1);  % 6 coefs wrt 2-dim ideals
[d11,d12]=n_2(u(:,1),gp);
[d21,d22]=n_2(vv(:,1),gp);
c(1:n,1)=d12(1:n,1).*d22(1:n,1)+d12(1+n:n2).*d22(1+n:n2);
c(1+n:n2,1)=d12(1+n:n2,1).*d22(1:n,1)+d12(1:n).*d22(1+n:n2);
c(1:n,1)=c(1:n,1)+sqrt(2)*d11(1:n,1).*d21(1:n,1);
c(1+n:n2,1)=c(1+n:n2)+sqrt(2)*d11(1+n:n2,1).*d21(1+n:n2,1);
y=sqrt(n)*in_2(c,gp);

yy5(1:n) = y(1:n); yy5((1:n)+n)=y(rn(1:n)+n);

gp=3;

rn = indexset(n,gp);
uu(1:n,1)=u(1:n,1); vv(1:n,1)=v(1:n,1);
uu((1:n)+n,1)=u(rn(1:n)+n,1); vv((1:n)+n,1)=v(rn(1:n)+n,1);
d11=zeros(n2,1);  d21=zeros(n2,1);  % 4 coefs wrt 1-dim ideals
d12=zeros(n2,1);  d22=zeros(n2,1);  % 6 coefs wrt 2-dim ideals
[d11,d12]=n_2(u(:,1),gp);
[d21,d22]=n_2(vv(:,1),gp);
c(1:n,1)=d12(1:n,1).*d22(1:n,1)+d12(1+n:n2).*d22(1+n:n2);
c(1+n:n2,1)=d12(1+n:n2,1).*d22(1:n,1)+d12(1:n).*d22(1+n:n2);
c(1:n,1)=c(1:n,1)+sqrt(2)*d11(1:n,1).*d21(1:n,1);
c(1+n:n2,1)=c(1+n:n2)+sqrt(2)*d11(1+n:n2,1).*d21(1+n:n2,1);
y=sqrt(n)*in_2(c,gp);

yy(1:n) = y(1:n); yy((1:n)+n)=y(rn(1:n)+n);

figure(3); clf
subplot(4,1,1); stem(u); title('f \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n-1) (0:n-1)]);
subplot(4,1,2); stem(v); title('g \in CG'); 
axis([1,n2,-1,1]);set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',' ');
subplot(4,1,3); stem(yy5); title('fg  when  G = C_8 \angle \{1,k_5\}'); 
axis([1,n2,-1,1]); set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',' ');
subplot(4,1,4); stem(yy);  title('fg  when  G = C_8 \angle \{1,k_3\}'); 
axis([1,n2,-1,1]); set(gca,'XTick',(1:n2)); set(gca,'XTickLabel',[(0:n-1) (0:n-1)]);




%
% Simpler approach which I was hoping would work but it didn't:
%
%hatu=n_2_gp1(uu); hatv=n_2_gp1(v);
%invhatu=in_2_gp1(hatu);invhatv=in_2_gp1(hatv);
%subplot(3,1,3); stem(invhatv); title('f*g \in CG_2'); axis([0,n2,-1,1]);
%c=hatu.*hatv; %c=hatv.*hatu;
%c(1) = sqrt(2)*c(1);c(m+1) = sqrt(2)*c(m+1);c(n+1) = sqrt(2)*c(n+1);c(m+n+1) = sqrt(2)*c(m+n+1);
%yy=sqrt(n)*in_2_gp1(c);

%[u1,u2]=n_2(u,gp); [v1,v2]=n_2(vv,gp);
%c(1:n)=u2(1:n).*v2(1:n) + u2(1+n:n2).*v2(1+n:n2)+ sqrt(2)*u1(1:n).*v1(1:n);
%c(1+n:n2)=u2(1+n:n2).*v2(1:n) + u2(1:n).*v2(1+n:n2)+sqrt(2)*u1(1+n:n2).*v1(1+n:n2);
%y=sqrt(n)*in_2(c,gp);

