function y=gn_2(u,gp)
%
%
% INPUT
%   u   the signal for which to 
%   gp  integer specifying which action group to use.
%
% OUTPUT
%   y   
%
% REMARKS
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
%
% HISTORY
%   2001.04.02 & Myoung An       & original program
%   2004.03.23 & William DeMeo   & documentation, minor mods/additions
%
n2=size(u,1);
n=n2/2;                % $N$ : signal half-length
m=n/2;                 % $N/2$ : signal quarter-length
nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
rn = indexset(n,gp);
u1=cnvmt(u(1:n,1));
u2=cnvmt(u(1+n:n2,1));
for k2=1:n
  for k1=1:n
    ur2(k1,k2)=u2(rn(k1),rn(k2));
  end
end   
y=[u1 ur2;ur2 u1];
