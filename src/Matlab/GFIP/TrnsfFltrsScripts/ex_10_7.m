% Examples of section 10.7 (page 245) of [1] (fig. 10.7.6--10.7.7)
%
% HISTORY
%   2004.04.23 & William DeMeo & initial file
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
%   [1] An and Tolimieri, "Group Filters and Image Processing"
%
% See also: rt1.m, ee_22.m

clear;
K=5;
N=pow2(K+1);  % signal length (e.g. K=6 => N=128,  K=7 => N=256)
n=N/2;
gg=zeros(N,N);
for k=1:n
   gg(k,k)=1; gg(k,6)=1;
end   

mm=0;                     % translation in verticle dimension
nn=0;                     % translation in horizontal dimension
gg1=abel_tr(gg,mm,nn);

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

gp1=11;
y4=zeros(N,N);         % stores 1st and (n+1)st row and column of x4
                       % NB of the nn_22 return vals, only (x23, x4) are used.
[x1,x21,x22,x23,x4]=nn_22(gg,gp1);  
xx23=inn_22(x23,gp1);
y4(1,:) = x4(1,:);     %               ---------- same 1st row
y4(:,1) = x4(:,1);     %               |    |
y4(n+1,:) = x4(n+1,:); %               ---------- same (n+1)st row 
y4(:,n+1) = x4(:,n+1); %               |    |
yy4=inn_22(y4,gp1);    %              same  same 
nabel1=real(yy4+xx23); %              1st   (n+1)st
                       %              col   col

[x1,x21,x22,x23,x4]=nn_22(hh1,gp1);
xx23=(inn_22(x23,gp1));
y4(1,:) = x4(1,:);     %               ---------- same 1st row
y4(:,1) = x4(:,1);     %               |    |
y4(n+1,:) = x4(n+1,:); %               ---------- same (n+1)st row 
y4(:,n+1) = x4(:,n+1); %               |    |
yy4=inn_22(y4,gp1);    %              same  same 
nabel2=real(yy4+xx23); %              1st   (n+1)st
                       %              col   col

[x1,x21,x22,x23,x4]=nn_22(hh2,gp1);
xx23=(inn_22(x23,gp1));
y4(1,:) = x4(1,:);     %               ---------- same 1st row
y4(:,1) = x4(:,1);     %               |    |
y4(n+1,:) = x4(n+1,:); %               ---------- same (n+1)st row 
y4(:,n+1) = x4(:,n+1); %               |    |
yy4=inn_22(y4,gp1);    %              same  same 
nabel3=real(yy4+xx23); %              1st   (n+1)st
                       %              col   col

[x1,x21,x22,x23,x4]=nn_22(hh3,gp1);
xx23=(inn_22(x23,gp1));
y4(1,:) = x4(1,:);     %               ---------- same 1st row
y4(:,1) = x4(:,1);     %               |    |
y4(n+1,:) = x4(n+1,:); %               ---------- same (n+1)st row 
y4(:,n+1) = x4(:,n+1); %               |    |
yy4=inn_22(y4,gp1);    %              same  same 
nabel4=real(yy4+xx23); %              1st   (n+1)st
                       %              col   col
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
