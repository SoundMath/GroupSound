function [y1,y2]=n_2(f,gp)
% Semidirect product transform.
%
% INPUT
%   f & signal for which to compute expansion coefs wrt $C_N \sdp C_2$.
%   gp & (int) indicates action group to use for $C_2$.
%
% OUTPUT
%   y1 & expansion coefs of signal wrt semidirect product group
%       $C_N \sdp C_2$.
%   y2 & ???
%
% REMARKS
%   o  For input signal f, n_2(f,gp) computes expansion coefficients 
%      wrt semidirect product group $C_N \sdp C_2$ where input argument 
%      gp specifies the action group $C_2$.
%   o  Use this for abelian by abelian semidirect product groups 
%      of the form $C_N \sdp C_2$, where N is even and $C_2 = \{1, k\}$.
%   o  Signals are indexed by the elements of $C_N \sdp C_2$,
%      ordered as follows:
%      \[ 
%        C_N \sdp C_2 = \{1,x,\ldots,x^{N-1}, k,xk,\ldots,x^{N-1}k\} 
%      \]
%   o  The argument gp specifies the "action" group to which 
%      $C_2 = \{1, k\}$ corresponds. Possible group actions are: 
%                gp=1:  x --> x^{-1}
%                gp=2:  x^k --> x^{(m+1)k}
%                gp=3:  x^k --> x^{(m-1)k}
%
%
% See also: in_2.m
%
n2 = length(f);        % $2N$ : signal length
n=n2/2;                % $N$ : signal half-length
m=n/2;                 % $N/2$ : signal quarter-length
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
rt2=1/sqrt(2);

y1=zeros(n,1); y2=zeros(n,1);
bf(1:n)=sqrt(n)*ifft(f(1:n,1));
bf(1+n:n2)=sqrt(n)*ifft(f(1+n:n2,1));

if (gp==1) % $x \mapsto x^{-1}$
   d1 = 2;
   c1 = [1 m+1];
end   
if (gp==2) % $x^k \mapsto x^{(m+1)k}$
   d1 = m;
   c1 = 2*(1:m)-1;
end
if (gp==3) % $x^k \mapsto x^{(m-1)k}$
   d1 = 2;
   c1 = [1 m-1];
end

for k=1:d1
   t1=rt2*(bf(c1(k))+bf(c1(k)+n));
   t2=rt2*(bf(c1(k))-bf(c1(k)+n));
   bf(c1(k))=t1;
   bf(c1(k)+n)=t2;
   y1(c1(k))=t1;
   y1(c1(k)+n)=t2;
end
y2=bf-y1;
