function [u_1, u_2, max_gain]=stbc_optimize_D(L, Mt)
%The function generates L code matrix for Mt number of transitters and
%T=Mt. It gives the maximum normalised gain for the cyclic code generated
%and the corresponding values for u1 and u2(where u1 and u2 are real numbers)
%obtained by exhaustive computer search.
theta=2*pi/L;
gain=zeros((L-1)*10,(L-1)*10);
for u1=0.1:0.1:L-1
   j=uint16(u1*10); %index for gain matrix
   for u2=0.1:0.1:L-1
       k=uint16(u2*10); %index for gain matrix
       V=[(exp(1j*u1*theta)) 0; 0 (exp(1j*u2*theta))];  %Base code matrix to generate other code matrix 
        for i=1:L
            code=sqrt(Mt).*(V^(i-1)); %Lth code matrix using the base code matrix.
            C(i,:)=reshape(code, 1, Mt*Mt); %Updating in the Code-matrix Look up Table
        end
        gain(j,k)=coding_gain(C); %Normalised Coding gain for each u1 and u2
    end
end
max_gain=max(gain(:)); %determining the maximum gain
[u_i, u_j]=find(max_gain-gain<=0.5e-4);
u_1=u_i./10; %determining optimal REAL NUMBER values for u1
u_2=u_j./10; %determining optimal REAL NUMBER values for u2