function y=LaserSimple(f,D,R0)  %f=Focal Length  D=Distance from lense to Target, R0=Initial beam Radius
Theta=atan(R0/f);
y=-(D-f)*tan(Theta);
end
