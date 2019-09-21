function F=Derivspat(t,x)


% système epidemie
global a b c d nlits fac n

F=zeros((n)*4,1);

for k = 0:4:4*(n-1)
    if k==0 %premier village
        k1=k-4;%village d'avant (n'existe pas pour le village 0)
        k2=k+4;%village d'après   
            F(k+1)=-a*x(k+1)*x(k+2)-a*fac*x(k+1)*x(k2+2);
            F(k+2)=a*x(k+1)*x(k+2)+b*x(k+3)*x(k+2)-c*min(nlits,x(k+2))-d*x(k+2)+a*fac*x(k+1)*x(k2+2)+b*fac*x(k+3)*x(k2+2);
            F(k+3)=c*min(nlits,x(k+2))-b*x(k+2)*x(k+3)-b*fac*x(k+3)*x(k2+2);
            F(k+4)=d*x(k+2);
    elseif k==4*(n-1) %dernier village
        k1=k-4;%village d'avant
        k2=k+4;%village d'après (n'existe pas pour le village nvillage)
            F(k+1)=-a*x(k+1)*x(k+2)-a*fac*x(k+1)*x(k1+2);
            F(k+2)=a*x(k+1)*x(k+2)+b*x(k+3)*x(k+2)-c*min(nlits,x(k+2))-d*x(k+2)+a*fac*x(k+1)*x(k1+2)+b*fac*x(k+3)*x(k1+2);
            F(k+3)=c*min(nlits,x(k+2))-b*x(k+2)*x(k+3)-b*fac*x(k+3)*x(k1+2);
            F(k+4)=d*x(k+2);
    else
        k1=k-4;%village d'avant
        k2=k+4;%village d'après 
            F(k+1)=-a*x(k+1)*x(k+2)-a*fac*x(k+1)*(x(k1+2)+x(k2+2));
            F(k+2)=a*x(k+1)*x(k+2)+b*x(k+3)*x(k+2)-c*min(nlits,x(k+2))-d*x(k+2)+a*fac*x(k+1)*(x(k1+2)+x(k2+2))+b*fac*x(k+3)*(x(k1+2)+x(k2+2));
            F(k+3)=c*min(nlits,x(k+2))-b*x(k+2)*x(k+3)-b*fac*x(k+3)*(x(k1+2)+x(k2+2));
            F(k+4)=d*x(k+2);
        end
    end
end