function WVfigures(K,WVE, WVI, a, b, c)
N = pow2(K+1);
figure(a);clf;
  absE = real(WVE);
  tfmax = max(max(absE));
  tfmin = min(min(absE));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(absE-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Energy'); xlabel('Time'); ylabel('Frequency')

  figure(b);clf;
  absI = real(WVI);
  tfmax = max(max(absI)); tfmin = min(min(absI));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(absI-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Interference'); xlabel('Time'); ylabel('Frequency');

  figure(c);clf;  
  abstf = real(WVE+WVI);
  tfmax = max(max(abstf)); tfmin = min(min(abstf));
  colormap(1-gray(256));
  image(linspace(0,1,N),linspace(0,1,N),256*(abstf-tfmin)/(tfmax-tfmin));
  axis('xy'); title('Wigner Transform'); xlabel('Time'); ylabel('Frequency')


