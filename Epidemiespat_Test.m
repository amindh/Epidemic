clear all 
close all

%Tracé de l'évolution et animation avec plusieurs villages
global a b c d nlits fac n

    a=4e-4;
    b=1e-4;
    c=1e-2;
    d=1e-3;
    
    fac=0.5;
    nlits=10;
    n=100; %nombre de villages
 
Y0=zeros((n)*4,1); %nombre de personnes saines par village
Y0([1:4:n*4])=50 %population de sains uniforme

Y0(4*floor(n/2)+2)=0.2; %foyer d'infection
Tspan=[0,3*365]; %temps durant lequel est effectué la simulation
h=0.1;

[t,y]=Solveur(@Derivspat,Tspan,Y0,h,1);

nbtemps = length(y(:,1));

for k=1:100:nbtemps %tracé dynamique
%     subplot(4,1,1)
    plot(y(k,1:4:(n-1)*4+1),'b');
    hold on
    plot(y(k,2:4:(n-1)*4+1),'r');
    plot(y(k,3:4:(n-1)*4+1),'g');
    plot(y(k,4:4:(n-1)*4+1),'k');
    hold off
    xlim([-1,n+1])
    ylim([-1,51]);
    legend('Sains','Infectés','Rétablis','Décédés')
     xlabel('villages','FontSize',10,...              %Nom de l'axe des abscisses du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
    ylabel('classes','FontSize',10,...      %Nom de l'axe des ordonnées du tracé
       'FontWeight','bold','FontName',...
       'Times New Roman','Color','b')
    
    disp(k/nbtemps);  %permet de voir si le programme tourne correctement et à quelle vitesse il le fait  
    
    pause(2/10000); %pause pour avoir le temps de visualiser le tracé
end
