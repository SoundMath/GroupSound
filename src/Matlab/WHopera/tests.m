K=8;
x = beats(K);          
[C,P]=IP(x,1);
N = pow2(K+1); 
NAtoms = 2*N + K*pow2(K+3);
k = N; 
WHatom(K,P(k,1),P(k,2),P(k,3));   
