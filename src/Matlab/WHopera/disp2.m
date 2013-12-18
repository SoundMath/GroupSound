
for n=1:N-1
xaxs(n+1) = xaxs(n) + n;
end;
figure(2); clf;
plot(xaxs,saWVI);
title('Instantaneous Interference (sum of |I|)');
