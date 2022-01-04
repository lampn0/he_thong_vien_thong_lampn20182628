clear;
N = 2*10^5;
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

a=randn(1,length(S));%generates samples of size 1xn which are gaussian distributed
b=randn(1,length(S));%generates samples of size 1xn which are gaussian distributed
rc=1/sqrt(2)*(sqrt(a.^2+b.^2));%rayleigh channel

SNR_db = 0:1:12;
for i=1:length(SNR_db)
   c(i) = QAM16_Rician(SNR_db(i),S,x,No3);
   d(i) = QAM16_Gauss(SNR_db(i),S,x);
   e(i) = QAM16_Rayleigh(SNR_db(i),S,x,rc);
end
BER_Rician = c/length(x);
BER_Gauss = d/length(x);
BER_Rayleigh = e/length(x);
semilogy(SNR_db,BER_Rician,'b--')
hold on
semilogy(SNR_db,BER_Gauss,'r--')
hold on
semilogy(SNR_db,BER_Rayleigh,'m--')
hold on
grid on

semilogy(SNR_db,BER_Rician,'b*')
hold on
semilogy(SNR_db,BER_Gauss,'r*')
hold on
semilogy(SNR_db,BER_Rayleigh,'m*')
legend('Rician','Gauss','Rayleigh')
title('BER 16-QAM over channels')
xlabel('SNR (dB)')
ylabel('BER')
hold off

