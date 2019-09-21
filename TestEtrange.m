% Programme de test des systèmes de Lorenz et Rossler
clear all
close all
global a b c % parametres des systèmes d'EDO

% Système de Lorenz

y0=[1;1;1]; % condition initiale
a=3;  % les tois coefficients
b=26.5;
c=1;

npas=1000;  % nombre de pas
Tspan=[0,npas]; 
hEuler=1.e-2;
[x1,y1]=ode45(@deriveLorenz,Tspan, y0); %utilisation de la toolbox Matlab
% vous pourrez ensuite tester avec votre solveur (Euler modifié au moins)
figure(1)
for i=2:npas 
% ici on dessine segment par segment pour pouvoir ralentir la visualisation
% sinon ça va trop vite à notre gout, on ne voit pas l'attracteur se
% construire... mais bon, ça n'est pas obligatoire...
    int=[i-1,i];
    if(mod(i,10)==1)
        pause(0.01); 
    end% petit arret pour visualisation fluide
plot3(y1(int,1),y1(int,2),y1(int,3),'linewidth',2)% dessin en 3D
view(40,20)
grid
hold on
end

hold off


% -------------------------------------------------------
% Même chose pour Rossler

y0=[1;1;1]; % condition initiale
a=0.2;
b=0.2;
c=5.7;

npas=1000;  % nombre de pas
Tspan=[0,npas]; 
hEuler=1.e-2;

[x1,y1]=ode45(@deriveRossler,Tspan, y0);

figure(2)
for i=2:npas
    int=[i-1,i];
    if(mod(i,10)==1)
        pause(0.01); 
    end
plot3(y1(int,1),y1(int,2),y1(int,3),'linewidth',2, 'color','r')
view(40,20)
grid
hold on
end

