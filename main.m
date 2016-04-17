clc;
clear all;
close all;

%% Transmitter Parameter Initializations:
Mt=2;       %No. of transmitting antennas

%% Question 3.i and 3.ii: Optimal values for u1 and u2 for L=8:

L=8;        %No. of code matrix
[u18, u28, mg8]=stbc_optimize_I(L, Mt);
%the function returns all possible INTEGERS for u1 and u2 for which we
%achieve maximum gain(mg) for L=8.
disp(sprintf('The maximum gain achieved is %f for the following values of u1 and u2 for L=8',mg8));
u8=[u18';u28'];
disp(sprintf('(%d,%d) ',u8));

[u1d8, u2d8, mgd8]=stbc_optimize_D(L, Mt); 
%the function returns possible REAL NUMBERS for u1 and u2 for which we
%achieve maximum gain(mg) for L=8.
disp(sprintf('The maximum gain achieved is %f for the following values of u1 and u2 for L=8',mgd8));
ud8=[u1d8';u2d8'];
disp(sprintf('(%0.1f,%0.1f) ',ud8));

%% Question 3.iii: Optimal values for u1 and u2 for L=32:

L=32;        %No. of code matrix
[u132, u232, mg32]=stbc_optimize_I(L, Mt); 
%the function returns all possible INTEGERS for u1 and u2 for which we
%achieve maximum gain(mg) for L=32.
disp(sprintf('The maximum gain achieved is %f for the following values of u1 and u2 for L=32',mg32));
u32=[u132';u232'];
disp(sprintf('(%d,%d) ',u32));

[u1d32, u2d32, mgd32]=stbc_optimize_D(L, Mt); 
%the function returns possible REAL NUMBERS for u1 and u2 for which we
%achieve maximum gain(mg) for L=32.
disp(sprintf('The maximum gain achieved is %f for the following values of u1 and u2 for L=32',mgd32));
ud32=[u1d32';u2d32'];
disp(sprintf('(%0.1f,%0.1f) ',ud32));
