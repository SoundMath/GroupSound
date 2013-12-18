% Atoms2Sig.m
%    function sig = Atoms2Sig(K,P,C)
%    % Matlab code for constructing a signal out of Gabor atoms having the
%    % given parameters.

% beats.m, beats2.m, beats3.m 
%    function x = beats2(K, EX, DISP)
%    % Matlab code for the demonstration of relation between interference
%    % energy and beat frequency.

% DisplayParams.m
%    function DisplayParams(string,P,n)
%    % Matlab code for displaying parameter values in MZMP.m program
%    % for debugging purposes.

% DMeasures.m
%    % DMeasures.m
%    % Matlab code for computing dissonance based on Wigner interferences.

% example.m
%    function x = example(K, EX, DISP)
%    % Matlab code for the demonstration of relation between interference
%    % energy and beat frequency.

% frequencies.m
%    function f = frequencies(nsteps,noct,f0)
%    % Matlab code to generate pitch scale frequencies

% harmonics.m
%    function h = harmonics(K, f0, w)
%    % Matlab code for generating a harmonic tone of length N = pow2(K+1)

% Interpol2.m
%    function g = Interpol2(f);
%    % Interpolates signal f (length N ) to a signal g (length 2N)
%    % such that g(2*n) = f(n)

% IP.m
%    function [C, P] = IP(K,s0,a1,a2,DEBUG)
%    % IP.m
%    % Matlab code for computing the inner products of a 
%    % specified function with all atoms in a dictionary comprised of:
%    %    1. N Diracs, 
%    %    2. K Weyl-Heisenberg systems, 
%    %    3. N complex exponentials (Fourier basis elements)

% ScaledWindow.m
%    function g = ScaledWindow(N,s)
%    % Returns a window function properly scaled by S=pow2(s) and normalized to have unit norm.

% shift.m
%    function gp = shift(g, p)
%    % Translate input vector by p samples, with wrap around (ie circular)

% test1.m, test2.m
%    % Matlab workspace for testing WHopera programs

% TEST1.m, TEST2.m
%    % Matlab code for the demonstration of relation between interference
%    % energy and beat frequency.

% WHatom.m
%    function g = WHatom(K,s,a1,a2,DISP)
%    %
%    % Matlab code for constructing a Gabor atom from the given parameters.

% WHip.m
%    function G = WHip(f,s,L1,M2)
%    %
%    % Matlab code for computing inner product of a function with all atoms in a
%    % Weyl-Heisenberg (WH) system (ie a subgroup of atoms)

% WHMP.m
%    function [MaxC,MaxP]=WHMP(x,MAXITERS,TOLERANCE,OPT,DEBUG,DISP)
%    %
%    % Matlab function for Weyl-Heisenberg Matching Pursuit (WHMP) algorithm.

% WignerDist.m
%    function afwig = WignerDist(sig1,sig2)
%    % WignerDist -- Alias-Free Wigner-Ville Distribution

% WVEnergy.m
%    function [WVE, WVI] = WVEnergy(x, C, P, WVT, DEBUG, DISP)
%    % Matlab code for the demonstration of relation between interference
%    % energy and beat frequency.

% WVTrans_AFC.m
%    function afwig = WVTrans_AFC(sig1,sig2,DISP)
%    % WVTrans_AFC -- Alias-Free Cross Wigner Transform

% WVTrans_AF.m
%    function afwig = WVTrans_AF(sig,DISP)
%    % WVDist_AF -- Alias-Free Wigner-Ville Distribution


%% Undocumented files %%


% disp2.m
%    
%    for n=1:N-1
%    xaxs(n+1) = xaxs(n) + n;
%    end;
%    figure(2); clf;
%    plot(xaxs,saWVI);
%    title('Instantaneous Interference (sum of |I|)');
%
% displaying.m
%    
%    DISP = 3;
%    
%    figure(DISP);clf;
%    yindxs = (N/32:N/8);     xindxs = (1:N); 
%    yaxs = yindxs.*(1/N); xaxs = linspace(0,1,N);
%    
%
% figures.m
%    function figures(WVE, WVI, a, b, c)
%    
%    figure(a);clf;
%      absE = real(WVE);
%      tfmax = max(max(absE));
%      tfmin = min(min(absE));
%      colormap(1-gray(256));
%
% SamplingGroups.m
%    function [L1, M2, M1, L2] = SamplingGroups(K,s)
%    L1 = pow2(s-1);   % translation sampling rate
%    M2 = pow2(K-s);   % modulation sampling rate
%    M1 = 4*M2;        % dual of L1;  == pow2(K-s+2);
%    L2 = 4*L1;        % dual of M2;  == pow2(s+1);
%    %    %
% tests.m
%    K=8;
%    x = beats(K);          
%    [C,P]=IP(x,1);
%    N = pow2(K+1); 
%    NAtoms = 2*N + K*pow2(K+3);
%    k = N; 
%    WHatom(K,P(k,1),P(k,2),P(k,3));   
%
% WVfigures.m
%    function WVfigures(K,WVE, WVI, a, b, c)
%    N = pow2(K+1);
%    figure(a);clf;
%      absE = real(WVE);
%      tfmax = max(max(absE));
%      tfmin = min(min(absE));
%      colormap(1-gray(256));
%
