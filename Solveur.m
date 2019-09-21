
function [T Y] = Solveur(F, Range, Y0, h, imeth)

% Solveur mettant en oeuvre des méthodes EXPLICITES
% pour la résolution de systèmes dynamiques 
% Variables :
% 	F est la fonction de deux variables
%		qui donne la dérivée y'(t) en 
%		fonction de t et de y(t)
%	Range contient les bornes de l'intervalle de résolution
%	y0 est la condition initiale du problème
%	de Cauchy (colonne).
%	h est le pas, pris constant ici.
%   imeth est l'indice pour la méthode
%  1: Euler simple 
%  2: Euler modifié 
%  pour les plus courageux: 
%  3: Runge et Kutta ordre 4
%  4: Adams Moulton à trois pas initialisé par Euler modifié

% Attention: on travaille avec des colonnes (pour pouvoir ajouter naturellement Y+h*F par exemple)
% et on transpose à la fin T et Y pour s'aligner sur ODE45

T = Range(1):h:Range(2); % vecteur ligne
nbpas = length(T);
nbequa = length(Y0);

Y = zeros(nbequa,nbpas);
Y(:,1) = Y0;   % 1ere colonne de Y = Y0
for i = 2:nbpas
	
    if imeth==1   % Euler explicite simple
        Y(:,i)=Y(:,i-1)+h*F(T(i-1),Y(:,i-1));
    
    elseif imeth==2  % Euler modifié
        Y(:,i)=Y(:,i-1)+h*F(T(i-1),Y(:,i-1));
        Y(:,i)=Y(:,i-1)+h/2*(F(T(i-1),Y(:,i-1))+F(T(i),Y(:,i)));
    elseif imeth==3  % Runge Kutta ordre 4
        k1=F(T(i-1),Y(:,i-1));
        k2=F(T(i-1)+h/2,Y(:,i-1)+h/2*k1);
        k3=F(T(i-1)+h/2,Y(:,i-1)+h/2*k2);
        k4=F(T(i-1)+h/2,Y(:,i-1)+h*k3)
        Y(:,i)=Y(:,i-1)+h*(k1+2*k2+2*k3+k4)/6;
    elseif imeth==4  % Adams Bashforth ordre 3 (pour les accros)

    end
end

T=T';    % comme annoncé, on transpose
Y=Y';