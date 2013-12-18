function y=isdpt2_G4(x)
% 2-D inverse semidirect product transform wrt group G4.
%
% INPUTS
%   x & expansion coefs of a signal wrt G4.
%
% OUTPUTS
%   y & signal for which x holds expansion coefs wrt G4.
%
% REMARKS/BUGS/OPEN ISSUES
%   \item[A] 
%   This program is based on the listing on page 201 of [1].  
%   It computes the inverse transform coefficients of a 2D signal 
%   with respect to semidirect product group 
%   \[
%          G4 = (C_N X C_N) \sdp [1 0; 1 -1].   
%   \]
%   In other words, output y is the signal for which input x is the 
%   set of expansion coefficients wrt semidirect product group G4.
%   \item[B] 
%   Use this program for even N.
%
% HISTORY
%   2001.04.02 & Myoung An & initial src code listing in [1]
%   2004.03.23 & William DeMeo & docs/comments, minor mods/adds
%   2004.04.29 & William DeMeo & minor mods
%
% REFERENCES
% [1] Myoung An and Richard Tolimieri, "Group Filters and Image
%     Processing." Psypher Press, 2003.
%
N=size(x,1);  %                            _________________
n2=length(x); %                           |        |        |
if n2~=N,     % In case x is shaped like  |        |        |
    x=x';     %                           |________|________|
end;          % 
n=n2/2;       % n  : abelian normal subgroup is C_n X C_n
sc=1/n;       % sc : scaling factor for inv FT of size n
t=zeros(2,n);
for k=1:n,
    t(1:2,k)=[x(k,1); x(k+n,1)];  % t : 1-dim ideal generators
end;
t=1/sqrt(2)*fft(t);
for k=1:n
    x(k,1)=t(1,k);
    x(k+n,1)=t(2,k);
end;
y=zeros(n2,n);
y=sc*[fft2(x(1:n,1:n)); fft2(x(1+n:n2,1:n))];
% end of file: i_coef_G4.m