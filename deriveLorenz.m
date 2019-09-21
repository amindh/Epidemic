function fp=derive(t,x)
% doit renvoyer un vecteur colonne
global a b c

% système de Lorenz
% dx1/dt = a(x2-x1);
% dx2/dt=bx1-x2-x1*x3;
% dx3/dt=x1*x2-c*x3;

fp(1)=a*(x(2)-x(1));
fp(2)=b*x(1)-x(2)-x(1)*x(3);
fp(3)= x(1)*x(2)-c*x(3);

fp=fp'; % vecteur colonne renvoyé
