function y=cnv2mt(x);
[nx,ny]=size(x);
fd=fft2(x);
ffd=reshape(fd,nx*ny,1);
for k=1:nx*ny
   tt(k,k)=ffd(k,1);
end
for k=1:nx*ny
   tt1=reshape(tt(:,k),nx,ny,1);
   tt1=ifft2(tt1);
   tt2(:,k)=reshape(tt1,nx*ny,1);
end   
tt3=tt2.';
for k=1:nx*ny
   tt4=reshape(tt3(:,k),nx,ny,1);
   tt4=fft2(tt4);
   y(:,k)=reshape(tt4,nx*ny,1);
end
y=y.';
