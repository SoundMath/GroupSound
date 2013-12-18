function ip = IPwrapper(K,s0,a1,a2,DEBUG)
% IPwrapper.m
%
% Matlab code for computing the inner products of a
% specified Gabor atom with all atoms in a dictionary comprised of:
%    1. N Diracs, 
%    2. K Weyl-Heisenberg systems, 
%    3. N complex exponentials (Fourier basis elements)
%
% Inputs 
%   K   length of signal is pow2(K+1)
%   s   scale of input atom is pow2(s)
%   a1  translation of input atom; an integer in {0,1,...,N-1}
%   b2  modulation of input window; an integer in {0,1,...,N-1}
%
% Outputs
%   ip  the inner products between specified atom with all atoms in a dictionary
%   comprised of:
%     1. Diracs, (N atoms)
%     2. K Weyl-Heisenberg systems, (2^(K+3) atoms per system)
%     3. complex exponentials (N atoms)
%   in that order
%
% See also: WHAtomIP.m, IP.m, and WHip.m
% IP.m and WHip.m together compute inner prods for arbitrary input fn
% AtomIP.m and WHAtomIP.m together compute inner prods when input is a Gabor atom
%
%  As of 2002.02.27:  -->> WHAtomIP has been decomissioned <<--
%           
% Author: William DeMeo <williamdemeo@yahoo.com>
% Date: 2002.02.20
% (c) 2002, William DeMeo
% All rights reserved
%
error(nargchk(4, 5, nargin));

if nargin < 5, DEBUG = 0; end;

if(K<2), error('first argument, K, should be at least 2'); end;

if(s0<0 | s0>K+1), error('second argument, s0, is out of range (0,...,K+1)'); end;   

N = pow2(K+1);

if(a1<0 | a1> N-1), error('third argument, a1, is out of range (0,...,N-1)'); end;

if(a2<0 | a2> N-1), error('fourth argument, a2, is out of range (0,...,N-1)'); end;

inAtom = WHatom(K,s0,a1,a2);

ip = IP(inAtom,DEBUG);
