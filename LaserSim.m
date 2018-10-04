clear all
close all
f=10; %Focal Length of lense
D=25; %initial distance from lense to target
R0=.2; %Radius of beam at lense;
LR=1; %Learning Rate
StepSize=.1;
Epochs=20000;
zoomx=10; %to zoom in and out on graph in x
zoomy=3;

Rf=LaserSimple(f,D,R0);
[W1,W2,W3]=InitializeWeights(Rf,20,20,1);





for i=1:Epochs
    RfOld=Rf;
    [z1,a1,z2,a2,z3,a3]=NeuralNet1(Rf,W1,W2,W3);
    DOld=D;
    if rand()<a3
    D=D+StepSize;
    else
    D=D-StepSize;
    end
    
    Rf=LaserSimple(f,D,R0);
    if abs(RfOld)<abs(Rf)
        Error=a3;
        [W1,W2,W3]=GradientDecent(D,z1,a1,z2,a2,z3,a3,W1,W2,W3,Error,LR);
    elseif abs(RfOld)>abs(Rf) 
        Error=-a3;
        [W1,W2,W3]=GradientDecent(D,z1,a1,z2,a2,z3,a3,W1,W2,W3,Error,LR);
    end


M(i,1)=D;
M(i,2)=Rf;
M(i,3)=a3;
end

for i=1:100:Epochs
    drawnow
plot([-M(i,1),0],[R0,M(i,2)],'r')
hold on
plot([-M(i,1),0],[-R0,-M(i,2)],'r')
plot([-M(i,1),-M(i,1)],[-R0,R0],'k','LineWidth',2)
plot([0,0],[-M(i,2),M(i,2)],'k','LineWidth',2)
plot([-M(i,1)-zoomx,1],[0,0],'k--')
plot([-f,-f],[-zoomy-max([abs(R0),abs(Rf)]),zoomy+max([abs(R0),abs(M(i,2))])],'g--')
hold off
xlim([-M(i,1)-zoomx,1])
ylim([-zoomy-max([abs(R0),abs(Rf)]),zoomy+max([abs(R0),abs(M(i,2))])])

end