% abel_tr.m
%    function y=abel_tr(x,t1,t2)
%    % Abelian (cyclic) translation
%    %
%    % INPUT
%    %   x   2-D array
%
% cn_2.m
%    function y=cn_2(u,v,gp)
%    % Semidirect product convolution of 1-dimensional signals.
%    %
%    % INPUT
%    %   u & 1D array (signal)
%
% cnvmt.m
%    function y=cnvmt(x)
%    % return convolution matrix for 1d input signal x
%    n=size(x,1);
%    fd=fft(x(1:n,1));
%    
%
% conv2sdp.m
%    function y=conv2sdp(f,g,gp)
%    % 2-D generalized convolution.
%    %
%    % INPUT
%    %   f & NxN2 array
%
% cyclicshift.m
%    function [y,kk] = cyclicshift(x, nn, n0)
%    % y(nn) = x(nn-n0) where nn-n0 is mod length(nn)
%    %
%    % INPUT
%    %   x = vector (signal) with length(m) elements
%
% cyclicshift2.m
%    function [y,jj,kk] = cyclicshift2(x,mm,nn,m0,n0)
%    % y(mm,nn) = x(mm-m0,nn-n0) where (mm-m0,nn-n0) is modulo
%    % (length(mm),length(nn))
%    %
%    % INPUT
%
% ex_6_8.m
%    % Example 6.8 (page 125) of [1] (figs 6.1--6.10)
%    % 
%    % Example similar in spirit to Example 6.8 (page 125) of [1]
%    % (corresponding to figures 6.1--6.10)
%    %
%
% gn_2.m
%    function y=gn_2(u,gp)
%    %
%    %
%    % INPUT
%    %   u   the signal for which to 
%
% in_2.m
%    function f=in_2(y,gp)
%    % Inverse semidirect product transform.
%    %
%    % INPUT
%    %   y & expansion coefficients of a signal wrt semidirect product group
%
% indexset.m
%    function rn = indexset(n,gp)
%    % return a vector of indices ordered with respect to action group gp.  
%    %
%    nn=(0:n-1);            % $\{0,1,\ldots,N-1\}$
%    if (gp==1)                % $x \mapsto x^{-1}$
%
% n_2.m
%    function [y1,y2]=n_2(f,gp)
%    % Semidirect product transform.
%    %
%    % INPUT
%    %   f & signal for which to compute expansion coefs wrt $C_N \sdp C_2$.
%
