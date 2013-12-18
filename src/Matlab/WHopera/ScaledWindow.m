function g = ScaledWindow(N,s)
% Returns a window function properly scaled by S=pow2(s) and normalized to
% have unit norm
n = (-N/2+1:N/2);
S = pow2(s);
sc = (2^(.25)/sqrt(S));
g = sc.*exp(-pi*((n/S).^2));
Ks = (1/norm(g));
g = Ks.*g;

