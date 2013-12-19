function rn = indexset(n,gp)
% return a vector of indices ordered with respect to action group gp.  
%
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
m=n/2;                 % $N/2$ : signal quarter-length
if (gp==1)                % $x \mapsto x^{-1}$
   rn=mod(n-nn,n)+1;   
end
if (gp==2)                % $x^k \mapsto x^{(m+1)k}$
   rn=mod((m+1)*nn,n)+1;
end
if (gp==3)                % x^k \mapsto x^{(m-1)k}
   rn=mod((m-1)*nn,n)+1;
end
