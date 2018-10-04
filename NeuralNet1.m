function [z1,a1,z2,a2,z3,a3]=NeuralNet1(Input,W1,W2,W3)
z1=W1'*Input;
a1=Sigmoid(z1);
z2=W2'*a1;
a2=Sigmoid(z2);
z3=W3'*a2;
a3=Sigmoid(z3);  
end