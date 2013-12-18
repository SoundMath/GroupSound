clear;
n=32;
m=n/2;
g=zeros(n,n);
for k=1:n
   g(k,k)=1;
end 
fg=fft(g);
subplot(2,2,1),imagesc(real(fg))
ifg=ifft(real(fg));
crc=zeros(n,n);
for k1=1:n
   for k2=1:n
      kk=sqrt((k1-1-m)*(k1-1-m)+(k2-1-m)*(k2-1-m));
      if ( (kk>m-3) & (kk<m-1) )
         crc(k1,k2)=1;
      end   
   end
end   
subplot(2,2,2),imagesc(real(crc))
tcr(1:m,1:n)=crc(1+m:n,1:n);
tcr(1+m:n,1:n)=crc(1:m,1:n);
subplot(2,2,3),imagesc(real(tcr))
%
ic=ifft(crc);
%subplot(2,2,3),imagesc(real(ifg))
%subplot(2,2,4),imagesc(imag(ifg))
