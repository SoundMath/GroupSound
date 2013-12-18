% Example of nonabelian translates of lines
%
% REMARKS/BUGS/OPEN ISSUES
%   This is a modified version of Myoung's rt1.m program.
%
% REFERENCES
% [1] Myoung An and Richard Tolimieri, "Group Filters and
% Image Processing." Psypher Press, 2003.
%
% History
% 2001.04.03 & Myoung An & wrote original version (named tn_2.m)
% 2004.03.29 & William DeMeo & docs/comments, minor mods/adds
clear;
K=5;
N=pow2(K+1);  % signal length (e.g. K=6 => N=128,  K=7 => N=256)
n=N/2;
gg=zeros(N,N);
for k=1:n
   gg(k,k)=1; gg(k,6)=1;
end   
mm=0;                                     % translation in verticle dimension
nn=0;                                     % translation in horizontal dimension
gg1=abeltr(gg,mm,nn);
gg2=[abeltr(gg(1:n,1:n),mm,nn)...
      abeltr(gg(1:n,1+n:N),mm,nn);...
      abeltr(gg(1+n:N,1:n),mm,nn)...
      abeltr(gg(1+n:N,1+n:N),mm,nn)];

for k1=1:n
   rk1=mod(n-k1+1,n)+1;
   for k2=1:n
      rk2=mod(n-k2+1,n)+1;
      hh1(rk1,rk2)=gg(k1+n,k2);
      hh1(rk1+n,rk2)=gg(k1,k2);
      hh1(rk1,rk2+n)=gg(k1+n,k2+n);
      hh1(rk1+n,rk2+n)=gg(k1,k2+n);
      hh2(k2,k1)=gg(k1,k2+n);
      hh2(k2+n,k1)=gg(k1+n,k2+n);
      hh2(k2,k1+n)=gg(k1,k2);
      hh2(k2+n,k1+n)=gg(k1+n,k2);
      hh3(rk2,rk1)=gg(k1+n,k2+n);
      hh3(rk2+n,rk1)=gg(k1,k2+n);
      hh3(rk2,rk1+n)=gg(k1+n,k2);
      hh3(rk2+n,rk1+n)=gg(k1,k2);
   end
end   
%
gp1=11;

[x1,x21,x22,x23,x4]=nn_22(gg,gp1);  % NB (x23, x4) are only two ret values used below

y4=zeros(N,N);                      % stores 1st and (n+1)st row and column of x4
y4(1,:) = x4(1,:);                  % same first row       ----------
y4(:,1) = x4(:,1);                  % same first column    |    |
y4(n+1,:) = x4(n+1,:);              % same (n+1)st row     ----------
y4(:,n+1) = x4(:,n+1);              % same (n+1)st column  |    |

yy4=inn_22(y4,gp1);
xx23=(inn_22(x23,gp1));

nabel1=real(yy4+xx23);

[x1,x21,x22,x23,x4]=nn_22(hh1,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(N,N);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel2=real(yy4+xx23);
%
[x1,x21,x22,x23,x4]=nn_22(hh2,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(N,N);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel3=real(yy4+xx23);
%
[x1,x21,x22,x23,x4]=nn_22(hh3,gp1);
xx23=(inn_22(x23,gp1));
y4=zeros(N,N);
for k=1:n
   y4(k,1)=x4(k,1);
   y4(k+n,1)=x4(k+n,1);
   y4(1,k+n)=x4(1,k+n);
   y4(1+n,k+n)=x4(1+n,k+n);
   %
   y4(1,k)=x4(1,k);
   y4(1+n,k)=x4(1+n,k);
   y4(k,1+n)=x4(k,1+n);
   y4(k+n,1+n)=x4(k+n,1+n);
end   
yy4=inn_22(y4,gp1);
nabel4=real(yy4+xx23);
%
ff=fft2(gg1);
for k=2:N
   kk=mod(N-(k-1),N)+1;
   if (k~=kk)
      bb(k,kk)=ff(k,kk);
      bb(1,k)=ff(1,k);
   end   
end   
fbb=ifft2(bb);
nabel=real(yy4+xx23);

% verticle strip:
vs = .8*max(max(yy4+xx23))*ones(N,2); 

big=[real(gg) vs real(fbb) vs real(nabel)];

big1=[real(gg) vs real(hh1) vs real(hh2) vs real(hh3)];

big2 = [real(nabel1) vs real(nabel2) vs real(nabel3) vs real(nabel4)];

figure(1); colormap(gray); clf; 
imagesc(real(big1)); title('Translates of an image in G_1');
axis image
axis off

figure(2); colormap(gray); clf; 
imagesc(real(big2)); title('Results of filtering translates');
axis image
axis off

figure(3); colormap(gray); clf
subplot(3,2,1),imagesc(gg); xlabel('gg');
axis image
subplot(3,2,2),imagesc(real(xx23)); xlabel('xx23');
axis image
subplot(3,2,3),imagesc(real(yy4)); xlabel('yy4');
axis image
subplot(3,2,4),imagesc(real(gg1)); xlabel('gg1');
axis image
subplot(3,2,5),imagesc(real(bb)); xlabel('bb');
axis image
subplot(3,2,6),imagesc(imag(fbb)); xlabel('fbb');
axis image
