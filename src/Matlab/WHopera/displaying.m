
DISP = 3;

figure(DISP);clf;
yindxs = (N/32:N/8);     xindxs = (1:N); 
yaxs = yindxs.*(1/N); xaxs = linspace(0,1,N);

absE = real(WVE(yindxs,xindxs));
absI = real(WVI(yindxs,xindxs));
abstf = real(WVE(yindxs,xindxs)+WVI(yindxs,xindxs));

tfmax = [max(max(absE)) max(max(absI)) max(max(abstf))]; 
tfmax = max(tfmax);

tfmin = [min(min(absE)) min(min(absI)) min(min(abstf))];
tfmin = min(tfmin);

colormap(1-gray(256));

image(xaxs,yaxs,256*(absE-tfmin)/(tfmax-tfmin));
axis('xy'); title('Wigner Energy'); xlabel('Time'); ylabel('Normalized Frequency')

figure(DISP+1);clf;
colormap(1-gray(256));
image(xaxs,yaxs,256*(absI-tfmin)/(tfmax-tfmin));
axis('xy'); title('Wigner Interference'); xlabel('time'); 
ylabel('normalized frequency');

figure(DISP+2);clf;  
colormap(1-gray(256));
image(xaxs,yaxs,256*(abstf-tfmin)/(tfmax-tfmin));
axis('xy'); title('Wigner Transform'); xlabel('Time'); 
ylabel('normalized frequency')

