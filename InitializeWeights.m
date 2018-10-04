function [W1,W2,W3]=InitializeWeights(Input,H1,H2,OutputSize)
[n0,m0]=size(Input);
W1=rand([n0,H1])./H1;
W2=rand([H1,H2])./H2;
W3=rand([H2,OutputSize])./OutputSize;
end