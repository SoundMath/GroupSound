clear;
n=16;
gg=randn(n,n);
ff=zeros(n,n);
%ff(1+n/4,1+n/4)=1;
%ff(1+n/4+n/2,1+n/4)=1;
%ff(1+n/4,1+n/4+n/2)=1;
%ff(1+n/4+n/2,1+n/4+n/2)=1;
%ff(1+n/2,1)=1;
%ff(1+n/2,1+n/2)=1;
%ff(1,1)=1;
%ff(1,1+n/2)=1;
for k=1:n/2
   ff(2*k-1,2*k-1)=1;
end   
igg=fft2(gg);
iff=fft2(ff);
ifg=iff.*igg;
fg=ifft2(ifg);
figure(1)
colormap(gray)
subplot(2,2,1),imagesc(gg)
subplot(2,2,2),imagesc(ff)
subplot(2,2,3),imagesc(real(fg))
subplot(2,2,4),imagesc(imag(fg))
