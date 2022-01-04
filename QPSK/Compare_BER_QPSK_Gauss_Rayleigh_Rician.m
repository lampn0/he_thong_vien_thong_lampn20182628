clear;
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

a=randn(1,length(S));%generates samples of size 1xn which are gaussian distributed
b=randn(1,length(S));%generates samples of size 1xn which are gaussian distributed
rc=1/sqrt(2)*(sqrt(a.^2+b.^2));%rayleigh channel

SNR_db = 0:1:8;
for i=1:length(SNR_db)
   c(i) = cha_Rician(SNR_db(i),S,x,No3);
   d(i) = cha_Gauss(SNR_db(i),S,x);
   e(i) = cha_Rayleigh(SNR_db(i),S,x,rc);
end
BER_Rician = c/length(x);
BER_Gauss = d/length(x);
BER_Rayleigh = e/length(x);
semilogy(SNR_db,BER_Rician,'b--')
hold on
semilogy(SNR_db,BER_Gauss,'r--')
hold on
semilogy(SNR_db,BER_Rayleigh,'g--')
hold on
grid on

semilogy(SNR_db,BER_Rician,'b*')
hold on
semilogy(SNR_db,BER_Gauss,'r*')
hold on
semilogy(SNR_db,BER_Rayleigh,'g*')
legend('Rician','Gauss','Rayleigh')
title('BER QPSK over channels')
xlabel('SNR (dB)')
ylabel('BER')
hold off

