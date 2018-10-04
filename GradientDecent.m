function [W1,W2,W3]=GradientDecent(a0,z1,a1,z2,a2,z3,a3,W1,W2,W3,Error,LR)
d3=Error.*Sigmoid(z3).*(1-Sigmoid(z3));
d2=W3*d3.*Sigmoid(z2).*(1-Sigmoid(z2));
d1=W2*d2.*Sigmoid(z1).*(1-Sigmoid(z1));

W1=W1-LR*a0*d1';
W2=W2-LR*a1*d2';
W3=W3-LR*a2*d3';
end