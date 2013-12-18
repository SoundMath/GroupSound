function [L1, M2, M1, L2] = SamplingGroups(K,s)
L1 = pow2(s-1);   % translation sampling rate
M2 = pow2(K-s);   % modulation sampling rate
M1 = 4*M2;        % dual of L1;  == pow2(K-s+2);
L2 = 4*L1;        % dual of M2;  == pow2(s+1);
