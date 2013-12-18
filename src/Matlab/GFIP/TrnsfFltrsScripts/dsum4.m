clear;
ny=16;
nx=16;
n=64;
n2=n*2;
%gg=r_grass2(n2,n2); %n=90;
%gg=r_fence(180,180); %n=80;
%gg=r_fence(n2,n2); n=90;
gg=r_maze(n2,n2); %n=64;
%gg=255-gg;
ff(1:64,1:64)=gg(1:64,1:64);
%g=r_toad(n2,n2); 
%
figure(1)
clf
subplot(3,3,1),imagesc(ff)
axis image
pause
%
[f1,f12,f21,f22,f14,f41,f24,f42,f44]=drct3(ff,nx,ny);
%[f1,f21,f22,f41,f42,f8]=drct2(ff,nx,ny);
b1=idrct3(f1,nx,ny);
b12=idrct3(f12,nx,ny);
b21=idrct3(f21,nx,ny);
b22=idrct3(f22,nx,ny);
b14=idrct3(f14,nx,ny);
b41=idrct3(f41,nx,ny);
b24=idrct3(f24,nx,ny);
b42=idrct3(f42,nx,ny);
b44=idrct3(f44,nx,ny);
subplot(3,3,4),imagesc(real(b1+b12+b21+b41+b14+b24+b42))
axis image
axis off
subplot(3,3,7),imagesc(real(b44+b22))
axis image
axis off
pause
ff(1:32,1:32)=gg(1:32,1:32);
subplot(3,3,2),imagesc(ff(1:32,1:32))
axis image
pause
%
[f1,f2,f4]=n2x2_2d(ff,nx);
d1=in2x2_2d(f1,nx);
d2=in2x2_2d(f2,nx);
d4=in2x2_2d(f4,nx);
subplot(3,3,3),imagesc(ff(1:32,1:32))
axis image
subplot(3,3,5),imagesc(real(d1+d2))
axis image
axis off
subplot(3,3,8),imagesc(real(d4))
axis image
axis off
pause
%[f1,f21,f22,f41,f42,f8]=drct2(ff,nx,ny);
[f1,f12,f21,f22,f14,f41,f24,f42,f44]=drct3(ff,nx/2,ny/2);
b1=idrct3(f1,nx/2,ny/2);
b12=idrct3(f12,nx/2,ny/2);
b21=idrct3(f21,nx/2,ny/2);
b22=idrct3(f22,nx/2,ny/2);
b14=idrct3(f14,nx/2,ny/2);
b41=idrct3(f41,nx/2,ny/2);
b24=idrct3(f24,nx/2,ny/2);
b42=idrct3(f42,nx/2,ny/2);
b44=idrct3(f44,nx/2,ny/2);
subplot(3,3,6),imagesc(real(b1+b12+b21+b41+b14+b24+b42))
axis image
axis off
subplot(3,3,9),imagesc(real(b44+b22))
axis image
axis off
