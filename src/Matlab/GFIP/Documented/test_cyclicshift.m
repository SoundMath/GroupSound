% Test CYCLICSHIFT function.
%

N = 8;
% delta fn on {0, 1, ..., N-1}
[x,kk] = impseq(1,0,N-1);  x = .8*x;
[y,kk2] = cyclicshift(x,kk,2);   % y(k) = x(k-2); (RIGHT translate by 2)
[y,kk9] = cyclicshift(x,kk,9);   % y(k) = x(k-9); (RIGHT translate by 9)
[y,kkN7] = cyclicshift(x,kk,-7);  % y(k) = x(k+7); (LEFT translate by 7)
% these are equiv to: impseq(2,0,N-1); impseq(7,0,N-1); impseq(9,0,N-1); resp.
figure(1);clf; 
subplot(2,2,1); stem(kk,x); ylabel('{\bf f}(m)'); title('f'); axis([0 8 0 1]); grid on;
subplot(2,2,2); stem(kk2,y); ylabel('{\bf f}(m-2)'); title('x^2 f');axis([0 8 0 1]); grid on;
subplot(2,2,3); stem(kk9,y); ylabel('{\bf f}(m-9)'); title('x^9 f');axis([0 8 0 1]); grid on;
subplot(2,2,4); stem(kkN7,y); ylabel('{\bf f}(m+7)'); title('x^{-7} f');axis([0 8 0 1]); grid on;
