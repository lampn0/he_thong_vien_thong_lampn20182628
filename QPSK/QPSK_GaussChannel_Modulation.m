clear;
SNR_db = 10;
x=round(rand(1,10000)); %sinh ra m?t chu?i bit ng?u nhiên có 10000 ph?n t?
for i=1:2:length(x)
    if (x(i)==0) && (x(i+1) ==0)
        S((i+1)/2)=exp(1i*pi/4);
    elseif (x(i)==0) && (x(i+1) ==1)
        S((i+1)/2)=exp(1i*3*pi/4);
    elseif (x(i)==1) && (x(i+1) ==1)
        S((i+1)/2)=exp(1i*5*pi/4);
    elseif (x(i)==1) && (x(i+1) ==0)
        S((i+1)/2)=exp(1i*7*pi/4);
    end
end
Es = var(S);%variance 
Eb = Es/2;
N_0 = Eb/10^(SNR_db/10);
N0 = sqrt(N_0/2)*(randn(size(S))+1i*randn(size(S)));
NS = S + N0;
plot(NS,'r.');
hold on;
plot(S,'b*');
hold on;
legend('Simulation','Theory');
t = 0:0.01:2*pi;
plot(exp(1i*t),'k--');
title('QPSK modulation over Gauss channel');
xlabel('I');
ylabel('Q');
hold off;