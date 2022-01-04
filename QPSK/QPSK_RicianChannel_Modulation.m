clear;
SNR_db = 10;
x=round(rand(1,10000));
for i=1:2:length(x)
    if (x(i)==0) && (x(i+1) ==0)
        S((i+1)/2)=exp(1i*pi/4);
    elseif (x(i)==0) && (x(i+1) ==1)
        S((i+1)/2)=exp(1i*3*pi/4);
    elseif (x(i)==1) && (x(i+1) ==1)
        S((i+1)/2)=exp(1i*5*pi/4);
    elseif (x(i)==1) && (x(i+1) ==0)
        S((i+1)/2)=exp(1i*7*pi/4);
    end;
end;

k1=10; %Rician factor
mean=sqrt(k1/(k1+1));% mean
sigma=sqrt(1/(2*(k1+1)));%variance
Nr2=randn(1,length(S))*sigma+mean;
Ni2=randn(1,length(S))*sigma;
%To generate the Rician Random Variable
No3=sqrt(Nr2.^2+Ni2.^2); %Rician fading coefficient

Es = var(S); 
Eb = Es/2;
N_0 = Eb/10^(SNR_db/10);
N0 = sqrt(N_0/2)*(randn(size(S))+1i*randn(size(S)));

NS = No3.*S + N0;
plot(NS,'r.');
hold on;
plot(S,'b*');
hold on;
legend('Simulation','Theory');
t = 0:0.01:2*pi;
plot(exp(1i*t),'k--');
title('QPSK modulation over Rician channel');
xlabel('I');
ylabel('Q');
hold off;
