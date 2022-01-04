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
SNR_db = 0:1:8;
for i=1:length(SNR_db)
   c(i) = cha_Gauss(SNR_db(i),S,x); 
end
BER = c/length(x);
semilogy(SNR_db,BER,'ro--');
hold on;
for i=1:length(SNR_db)
    SNR(i) = 10^(SNR_db(i)/10);
    gamma_b(i) = SNR(i);
    pb(i) = erfc(sqrt(2*gamma_b(i))/sqrt(2))/2;
end
semilogy(SNR_db,pb,'x--');
hold off;
title('The Bit error probality');
xlabel('SNR in dB');
ylabel('BER');
legend('Simulation','Theory');
hold off;

