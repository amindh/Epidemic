function f=derivetest2(t,y)
f(1)=y(2);
f(2)=-y(1)/sqrt(1+t)+1-sin(y(1));
f=f';