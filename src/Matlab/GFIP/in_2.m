function f=in_2(y,gp)
% Inverse semidirect product transform.
%
% INPUT
%   y & expansion coefficients of a signal wrt semidirect product group
%       $C_N \sdp C_2$.
%   gp & (int) indicates action group to use for $C_2$.
%
% OUTPUT
%   f & signal for which y holds expansion coefficients wrt $C_N \sdp C_2$.
%
% REMARKS
%   o  Computes the inverse transform coefficients of a 1D signal 
%      with respect to the semidirect product group $C_N \sdp C_2$.
%      In other words, output f is the signal for which input y is 
%      the set of expansion coefficients wrt the sdp group.
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
% See also: n_2
%
%
% HISTORY
%   2001.04.02 & Myoung An     & original program
%   2004.03.23 & William DeMeo & comments, minor mods/additions
n2 = length(y);        % $2N$ : signal length
n=n2/2;                % $N$ : signal half-length
m=n/2;                 % $N/2$ : signal quarter-length
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
rt2=1/sqrt(2);
if (gp==1)                % x --> x^{-1}
   d1 = 2;
   c1 = [1 m+1];
end   
if (gp==2)                % x^k --> x^{(m+1)k}
   d1 = m;
   c1 = 2*(1:m)-1;
end
if (gp==3)                % x^k --> x^{(m-1)k}
   d1 = 2;
   c1 = [1 m-1];
end
for k=1:d1
   t1=y(c1(k))+y(c1(k)+n);
   t2=y(c1(k))-y(c1(k)+n);
   y(c1(k))=rt2*t1;
   y(c1(k)+n)=rt2*t2;
end
f(1:n)=(1/sqrt(n))*fft(y(1:n));
f(1+n:n2)=(1/sqrt(n))*fft(y(1+n:n2));
