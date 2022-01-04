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
    end
end
SNR_db = 0:1:12;
for i=1:length(SNR_db)
   c(i) = QAM16_Gauss(SNR_db(i),S,x); 
end
BER = c/length(x);
semilogy(SNR_db,BER,'ro--');
hold on;
for i=1:length(SNR_db)
    SNR(i) = 10^(SNR_db(i)/10);
    gamma_b(i) = SNR(i);
    pb(i) = 3/8*erfc(sqrt(2/5*gamma_b(i)));
end
semilogy(SNR_db,pb,'x--');
hold off;
title('16-QAM BER');
xlabel('SNR in dB');
ylabel('BER');
legend('Simulation','Theory');
hold off;