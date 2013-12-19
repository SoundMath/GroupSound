% Examples of section 10.7 (page 245) of [1] (fig. 10.7.6--10.7.7)
%
% HISTORY
%   2004.04.23 & William DeMeo & initial file
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
%   [1] An and Tolimieri, "Group Filters and Image Processing"
%
% REMARKS/BUGS/OPEN ISSUES
%   This is a new implementation of EX_10_7.
%
% SEE ALSO
%   fig_1077, rt1.m, ee_22.m

clear;
K=5;            % signal length e.g. K =  5,   6,   7
N=pow2(K+1);    %                 => N = 64, 128, 256
n=N/2;          %                 => n = 32,  64, 128
m2=n/2;         %                 => m2=  16,  32  64
m=n/4;          %                 => m =  8,  16,  32   

gg=zeros(N,N);
g1=zeros(n);g2=zeros(n);g3=zeros(n);g4=zeros(n);

k=m:n-m,    %  e.g.  k= 8:24 ... 
g1(k,n/2)=1;
g1(n-m,n/2-2:n/2+2)
for k=m:n-m,    %  e.g.  k= 8:24 ... 
   g1(k,n/2)=1;
   gg(k,6)=1;
   gg(n+n/2, N-k)=1; gg(k,6)=1;
end   
for k=n+1:N
end   

mm=0;                     % translation in verticle dimension
nn=0;                     % translation in horizontal dimension
gg1=abel_tr(gg,mm,nn);

gg11 = zeros(n); gg12 = zeros(n);
gg21 = zeros(n); gg22 = zeros(n);
gg11 = gg(1:n, 1:n);  gg12 = gg(1:n, n+1:N);
gg21 = gg(n+1:N, 1:n);  gg22 = gg(n+1:N, n+1:N);

rk = mod(n-(1:n)+1,n)+1; % [1  n  n-1  n-2 ... 3  2]

                                                       %      1  0  0  0
P = [ 1 zeros(1,n-1); zeros(n-1,1) fliplr(eye(n-1))];  % P =  0  0  0  1
                                                       %      0  0  1  0
                                                       %      0  1  0  0

hh1 = [P*gg21*P P*gg22*P; P*gg11*P P*gg12*P];
hh2 = [gg12.' gg11.'; gg22.' gg21.'];     
hh3= [(P*gg22*P).' (P*gg21*P).'; (P*gg12*P).' (P*gg11*P).'];

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
