function G = coding_gain(C)
% The function generates the normalised coding gain for a give set of
% codewords C. C can be viewed as a code matrix loke up table which carries
% each codeword as a matrix where each row can be viewed as the code matrix
% expressed in the form of a vector.
% if say C=[1,2,1,-2} then Code= [1, 1; 
%                                 2,-2]

[L, M]=size(C); % determining parameters L and Mt from the size of the code matrix lookup table
Mt=sqrt(M);
Gmin=1; % assuming the maximum coding gain is 1
for i=1:L
    for j=(i+1):L
       D=C(i,:)-C(j,:); % determining the difference matrix for any two distinct codewords
       diff=reshape(D, Mt, Mt); % converting the vector into a MtxMt matrix
       gain= (2*sqrt(Mt))^(-1)*(abs(det(diff)))^(1/Mt); % computing the function to be minimised to achieve minimum coding gain  
       Gmin=min(Gmin,gain); % computing the normalised coding gain by minimizing
    end
end
G=Gmin; % Normalised Coding Gain.


