function TestSolveur
clear all
close all


Y0=1;
Tspan=[0,1];
h=0.1;


[x1,y1]=ode45(@derivtest1,Tspan,Y0)
[x2,y2]=Solveur(@derivtest1,Tspan,Y0,h,1); %Euler explicite
[x3,y3]=Solveur(@derivtest1,Tspan,Y0,h,2); %Euler modifié
[x4,y4]=Solveur(@derivtest1,Tspan,Y0,h,3); %Runge Kutta ordre 4

" ***************calcul d'erreur***************"
%{
 t=Tspan(1):h:Tspan(2);
 f=zeros(length(t),1);

 errexp=zeros(length(t),1);
 errmod=zeros(length(t),1);
 errrung=zeros(length(t),1);
 for i =1:length(t)
     f(i)=exp(t(i)^2); %tracé analytique
     plot(t,f)

     errexp(i)=abs(y1(i)-(i)); %calcul des erreurs 
     errmod(i)=abs(y2(i)-f(i));
     errrung(i)=abs(y3(i)-f(i));
 end
%}

" ***************tracé de la courbe***************"

figure(1)
plot(x1,y1(:,1),'r',x2,y2(:,1),'b')
legend({'ode45','Eulerexplicite'},'Location','NorthWest',...
      'FontSize',10,'FontWeight','bold')
xlabel('Temps','FontSize',10,...              %Nom de l'axe des abscisses du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
ylabel('f(t)','FontSize',10,...      %Nom de l'axe des ordonnées du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
grid on
hold on

%{
figure(1)
 plot(t,errexp,'b')
 hold on
 plot(t,errmod,'r')
 plot(t,errrung,'k')
 hold off
 legend('Erreur Eulerexp','Erreur Eulermod','Erreur RangeKutta4')
%}


end