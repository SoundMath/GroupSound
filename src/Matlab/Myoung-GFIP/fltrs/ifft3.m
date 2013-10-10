function y=fft3(x);
[nx,ny,nz]=size(x);
for k3=1:nz
   f(:,:,k3)=ifft2(x(:,:,k3));
end
ff=reshape(f,nx*ny,nz).';
fff=(ifft(ff)).';
y=reshape(fff,nx,ny,nz);



