clear;
N = 2*10^5;
SNR_db = 10;
x=round(rand(1,N));
for i=1:4:length(x)
    if (x(i)==0) && (x(i+1) ==0)&& (x(i+2)==0) && (x(i+3) ==0)
        S((i+3)/4)=1+1i;
    elseif (x(i)==0) && (x(i+1) ==0)&& (x(i+2)==0) && (x(i+3) ==1)
        S((i+3)/4)=1+3*1i;
    elseif (x(i)==0) && (x(i+1) ==0)&& (x(i+2)==1) && (x(i+3) ==0)
        S((i+3)/4)=3+1i;
    elseif (x(i)==0) && (x(i+1) ==0)&& (x(i+2)==1) && (x(i+3) ==1)
        S((i+3)/4)=3+3*1i;
    elseif (x(i)==0) && (x(i+1) ==1)&& (x(i+2)==0) && (x(i+3) ==0)
        S((i+3)/4)=1-1i;
    elseif (x(i)==0) && (x(i+1) ==1)&& (x(i+2)==0) && (x(i+3) ==1)
        S((i+3)/4)=1-3*1i;
    elseif (x(i)==0) && (x(i+1) ==1)&& (x(i+2)==1) && (x(i+3) ==0)
        S((i+3)/4)=3-1i;
    elseif (x(i)==0) && (x(i+1) ==1)&& (x(i+2)==1) && (x(i+3) ==1)
        S((i+3)/4)=3-3*1i;
    elseif (x(i)==1) && (x(i+1) ==0)&& (x(i+2)==0) && (x(i+3) ==0)
        S((i+3)/4)=-1+1i;
    elseif (x(i)==1) && (x(i+1) ==0)&& (x(i+2)==0) && (x(i+3) ==1)
        S((i+3)/4)=-1+3*1i;
    elseif (x(i)==1) && (x(i+1) ==0)&& (x(i+2)==1) && (x(i+3) ==0)
        S((i+3)/4)=-3+1i;
    elseif (x(i)==1) && (x(i+1) ==0)&& (x(i+2)==1) && (x(i+3) ==1)
        S((i+3)/4)=-3+3*1i;
    elseif (x(i)==1) && (x(i+1) ==1)&& (x(i+2)==0) && (x(i+3) ==0)
        S((i+3)/4)=-1-1i;
    elseif (x(i)==1) && (x(i+1) ==1)&& (x(i+2)==0) && (x(i+3) ==1)
        S((i+3)/4)=-1-3*1i;
    elseif (x(i)==1) && (x(i+1) ==1)&& (x(i+2)==1) && (x(i+3) ==0)
        S((i+3)/4)=-3-1i;
    elseif (x(i)==1) && (x(i+1) ==1)&& (x(i+2)==1) && (x(i+3) ==1)
        S((i+3)/4)=-3-3*1i;
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
Eb = Es/4;
N_0 = Eb/10^(SNR_db/10);
N0 = sqrt(N_0/2)*(randn(size(S))+1i*randn(size(S)));
NS = No3.*S + N0;
plot(NS,'r.');
hold on;
plot(S,'b*');
hold on;
grid on;
legend('with noise','without noise');
title('16-QAM modulation over Rician channel');
xlabel('I');
ylabel('Q');
hold off;
