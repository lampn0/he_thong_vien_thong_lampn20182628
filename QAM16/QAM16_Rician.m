function y = QAM16_Rician(SNR_db,S,x,RicianFading)
Es = var(S); 
Eb = Es/4;
N_0 = Eb/10^(SNR_db/10);
N0 = sqrt(N_0/2)*(randn(size(S))+1i*randn(size(S)));
NS = RicianFading.*S+N0;
S_m = [1+1i,1+3*1i,3+1i,3+3*1i,1-1i,1-3*1i,3-1i,3-3*1i,-1+1i,-1+3*1i,-3+1i,-3+3*1i,-1-1i,-1-3*1i,-3-1i,-3-3*1i];
for i = 1:length(S)
    d = abs(S_m - NS(i));
    md = min(abs(S_m - NS(i)));
    if md == d(1)
        R(4*i-3) = 0;
        R(4*i-2) = 0;
        R(4*i-1) = 0;
        R(4*i) = 0;
    elseif md == d(2)
        R(4*i-3) = 0;
        R(4*i-2) = 0;
        R(4*i-1) = 0;
        R(4*i) = 1;
    elseif md == d(3)
        R(4*i-3) = 0;
        R(4*i-2) = 0;
        R(4*i-1) = 1;
        R(4*i) = 0;
    elseif md == d(4)
        R(4*i-3) = 0;
        R(4*i-2) = 0;
        R(4*i-1) = 1;
        R(4*i) = 1;
    elseif md == d(5)
        R(4*i-3) = 0;
        R(4*i-2) = 1;
        R(4*i-1) = 0;
        R(4*i) = 0;
    elseif md == d(6)
        R(4*i-3) = 0;
        R(4*i-2) = 1;
        R(4*i-1) = 0;
        R(4*i) = 1;
    elseif md == d(7)
        R(4*i-3) = 0;
        R(4*i-2) = 1;
        R(4*i-1) = 1;
        R(4*i) = 0;
    elseif md == d(8)
        R(4*i-3) = 0;
        R(4*i-2) = 1;
        R(4*i-1) = 1;
        R(4*i) = 1;
    elseif md == d(9)
        R(4*i-3) = 1;
        R(4*i-2) = 0;
        R(4*i-1) = 0;
        R(4*i) = 0;
    elseif md == d(10)
        R(4*i-3) = 1;
        R(4*i-2) = 0;
        R(4*i-1) = 0;
        R(4*i) = 1;
    elseif md == d(11)
        R(4*i-3) = 1;
        R(4*i-2) = 0;
        R(4*i-1) = 1;
        R(4*i) = 0;
    elseif md == d(12)
        R(4*i-3) = 1;
        R(4*i-2) = 0;
        R(4*i-1) = 1;
        R(4*i) = 1;
    elseif md == d(13)
        R(4*i-3) = 1;
        R(4*i-2) = 1;
        R(4*i-1) = 0;
        R(4*i) = 0;
    elseif md == d(14)
        R(4*i-3) = 1;
        R(4*i-2) = 1;
        R(4*i-1) = 0;
        R(4*i) = 1;
    elseif md == d(15)
        R(4*i-3) = 1;
        R(4*i-2) = 1;
        R(4*i-1) = 1;
        R(4*i) = 0;
   elseif md == d(16)
        R(4*i-3) = 1;
        R(4*i-2) = 1;
        R(4*i-1) = 1;
        R(4*i) = 1;
    end
end
c = 0;
for i = 1:length(x)
    if R(i) ~= x(i)
        c = c+1;
    end
end
y = c;