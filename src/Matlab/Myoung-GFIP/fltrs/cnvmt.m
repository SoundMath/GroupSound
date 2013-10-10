function y=cnvmt(x);
[n,tem]=size(x);
fd=fft(x(1:n,1));
for k=1:n
   tt(k,k)=fd(k,1);
end
tt=ifft(tt).';
y=fft(tt).';
