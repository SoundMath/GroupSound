function y=cnvmt(x)
% return convolution matrix for 1d input signal x
n=size(x,1);
fd=fft(x(1:n,1));

for k=1:n
  tt(k,k)=fd(k,1);    % essentially a pt-wise multiply
end;                  % of fft(x) with eye(n) 
                      %   tt = X .* I = fft(x) .* fft(F), 
                      % where F is the N x N Fourier matrix
                      %   F = ifft(eye(n))
                      % So, tt = convolution of x with exponentials 

% inverse fft and transpose
tt=ifft(tt).';        % ifft(tt) = ifft(fft(x) .* fft(F))

% forward fft and transpose
y=fft(tt).';

