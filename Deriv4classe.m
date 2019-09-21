function F=Deriv(t,x)
% doit renvoyer un vecteur colonne
global a b c d nlits

% système epidemie
% dx1/dt = -ax1(t)x2(t);
% dx2/dt=ax1(t)x2(t)+bx3(t)x2(t)-dx2(t)-cmin(x2(t),nlits);
% dx3/dt=cmin(x2(t),nlits)-bx3(t)x2(t);
% dx4/dt=dx2(t);

F(1)=-a*(1.2+cos(2*pi*t/365))*x(1)*x(2);
F(2)=a*(1.2+cos(2*pi*t/365))*x(1)*x(2)+b*x(3)*x(2)-d*x(2)-c*min(x(2),nlits);
F(3)=c*min(x(2),nlits)-b*x(3)*x(2);
F(4)=d*x(2);
F=F';