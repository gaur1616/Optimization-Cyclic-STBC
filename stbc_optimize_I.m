function [u_1, u_2, max_gain]=stbc_optimize_I(L, Mt)
%The function generates L code matrix for Mt number of transitters and
%T=Mt. It gives the maximum normalised gain for the cyclic code generated
%and the corresponding values for u1 and u2(where u1 and u2 are integers)
%obtained by exhaustive computer search.
gain=zeros(L-1,L-1);
theta=2*pi/L;
for u1=1:L-1
   for u2=1:L-1
        V=[(exp(1j*u1*theta)) 0; 0 (exp(1j*u2*theta))]; %Base code matrix to generate other code matrix 
        for i=1:L
            code=sqrt(Mt).*(V^(i-1));   %Lth code matrix using the base code matrix.
            C(i,:)=reshape(code, 1, Mt*Mt); %Updating in the Code-matrix Look up Table
        end
        gain(u1,u2)=coding_gain(C); %Normalised Coding gain for each u1 and u2
    end
end

max_gain=max(gain(:)); %determining the maximum gain
[u_1, u_2]=find((max_gain-gain)<=0.5e-4); %determining optimal INTEGER values for u1 and u2


