function plotcourbes

clear all 
close all

global a b c d nlits

sains_ini=50;
infect_ini=0.2;
nlits=2;
a=0.0004;
b=0.0001;
c=0.01;
d=0.001;
Y0(1)=50;
Y0(2)=0.2;
Y0(3)=0;
Y0(4)=0;
Tspan=[0,5*365];
h=1;
[x1,y1]=ode45(@Deriv,Tspan,Y0);
[x2,y2]=Solveur(@Deriv,Tspan,Y0,h,2)
[x3,y3]=Solveur(@Deriv,Tspan,Y0,h,3)
figure(1)
plot(x2,y2(:,1),x2,y2(:,2),x2,y2(:,3),x2,y2(:,4))
legend({'Sains','infectes','gueris','Décedes'},'Location','NorthWest',...
      'FontSize',10,'FontWeight','bold')
xlabel('Temps','FontSize',10,...              %Nom de l'axe des abscisses du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
ylabel('f(t)','FontSize',10,...      %Nom de l'axe des ordonnées du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
grid on
hold on
end