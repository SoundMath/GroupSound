function y=fft3(x);
[nx,ny,nz]=size(x);
for k3=1:nz
   f(:,:,k3)=fft2(x(:,:,k3));
end
ff=reshape(f,nx*ny,nz).';
fff=(fft(ff)).';
y=reshape(fff,nx,ny,nz);



