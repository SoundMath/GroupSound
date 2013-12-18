% DMeasures.m
% Matlab code for computing dissonance based on Wigner interferences.
%
% First measure:








DISP = 6;



sWVI = sum(WVI);  % column sum of WV interferences
msWVI = max(abs(sWVI));

%% Equal
figure(DISP); clf;
subplot(2,1,1); plot(fratios,iflaw); hold on; plot(f1*ones(1,N));
equal = 2.^((0:12)/12);
grid; set(gca,'XTick',equal);
set(gca,'XTickLabel',{'';'m2'; 'M2';'m3'; 'M3'; 'P4';'Tri';  'P5';'m6'; 'M6'; 'm7';'M7';'octave'});
axis([1,2,-1,1]);
axis([1,2,f1-5/N,f2]); title('Normalized Frequencies');
ylabel('normalized frequencies');

subplot(2,1,2); plot(fratios,sWVI/msWVI);
equal = 2.^((0:12)/12);
grid; set(gca,'XTick',equal);
set(gca,'XTickLabel',{'';'m2'; 'M2';'m3'; 'M3'; 'P4';'Tri';  'P5';'m6'; 'M6'; 'm7';'M7';'octave'});
axis([1,2,-1,1]);
title('Instantaneous Interference (sum of I)');
ylabel('normalized interference');
xlabel('Frequency Intervals (equal temperament)');

figure(DISP+1); clf;
%% just
subplot(2,1,1); plot(fratios,sWVI/msWVI);
just = [1 16/15 9/8 6/5 5/4 4/3 64/45 3/2 8/5 5/3 7/4 15/8 2];
%just = [1 10/9 5/4 4/3 3/2 5/3 15/8 2];
grid; set(gca,'XTick',just);
%set(gca,'XTickLabel',{'';'M2';'M3';'P4';'P5';'M6';'M7';'octave'});
set(gca,'XTickLabel',{'';'m2';'M2';'m3';'M3';'P4';'Tri';'P5';'m6';'M6';'m7';'M7';'octave'});
axis([1,2,-1,1]);
title('Instantaneous Interference (sum of I)');
ylabel('normalized interference');
xlabel('Frequency Intervals (just temperament)');

%% Pythagorean
subplot(2,1,2); plot(fratios,sWVI/msWVI); 
pyth               = [1 256/243 9/8 32/27 81/64 4/3 729/512 3/2 128/81 27/16 16/9 243/128 2];
grid; set(gca,'XTick',pyth);
set(gca,'XTickLabel',{'';'m2'; 'M2';'m3'; 'M3'; 'P4';'Tri';  'P5';'m6'; 'M6'; 'm7';'M7';'octave'});
axis([1,2,-1,1]);
ylabel('normalized interference');
xlabel('Frequency Intervals (Pythagorean temperament)');

saWVI = sum(abs(WVI));
msaWVI = max(saWVI);
figure(7); clf;
plot(saWVI/msaWVI); axis([0,N,0,1])
title('Instantaneous Interference (sum of |I|)');
ylabel('normalized interference');

M1 = max(sWVI(1:50))

