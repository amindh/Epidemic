function fp=deriveRossler(t,x)

a=0.2;
b=0.2;
c=5.7;

% système de Rossler
% dx1/dt = -x2 - x3
% dx2/dt= x1 + ax2
% dx3/dt= b + x3(x1-c)

fp(1)=-x(2)-x(3);
fp(2)=x(1)+a*x(2);
fp(3)= b+x(3)*(x(1)-c);

fp=fp'; % vecteur colonne renvoyé
end