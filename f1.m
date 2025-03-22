%Simulacion de carrera de Formula 1

syms n

%Declaracion de ecuacion y coeficientes de la pista

a = 1;
b = 0; 
c = 0.5;
d = 0;
x = linspace(-80,100,100);
y = a*x.^3 + b*x.^2 + c*x + d;

%Definicion de limites de la pista

xlim([-0.8 1.5])
ylim([-5 3])
limite1 = a*x.^3 + b*x.^2 + c*x + d+30000;
limite2 = a*x.^3 + b*x.^2 + c*x + d-30000;
plot(x,y,'--y')
hold on
title("Pista");
plot(x,limite1,'-k')
plot(x,limite2,'-k')
diff(y)

%Definicion de valores y variables para la formula de Resistencia Aerodinamica

Sf = 1.5; %(m^2) de Superficie Frontal del automovil
densidadA = 0.96; %(kg/m^3) de Densidad del Aire
Cx = 1.1;%Coeficiente de resistencia aerodinamica
u=1.2;%coeficiente de friccion
masa=795;

%Definicion de variables para movimiento del auto

tiempo = linspace(-80,80,30)
posicion = a*tiempo.^3+b*tiempo.^2+c*tiempo+d;
carro = animatedline('Color','#ED5565','LineStyle','--','LineWidth',2);

%Movimiento del automovil

linspace(-100,100);
for k = 1:length(tiempo)
    title("Simulador");
    f = a*n.^3 + b*n.^2 + c*n + d;
    x1 = tiempo(k);
    f_x = diff(f,n);
    slope = subs(f_x, n, x1);
    y1 = subs(f,n,x1);
    tang = y1+slope*(n-x1);
    fplot(tang, [x1, x1+50], 'HandleVisibility', 'off')
    addpoints(carro, tiempo(k),posicion(k));
        if k < 10
            v=71;
            pause(29/v);
        elseif k < 20  
            v=200;
            pause(20/v);
        else
            v=71;
            pause(29/v);
        end
    grid on
    Resistencia = .5 * Sf * densidadA * Cx * (v/3.6)^2;
    Potencia = v/3.6 * Resistencia;
    Potencia1=string(round(Potencia));
    Velocidad=string(round(v));
    Resistencia1=string(round(Resistencia));
    str1=strcat('Potencia=',Potencia1);
    str2=strcat('Velocidad=',Velocidad);
    str3=strcat('Resistencia=',Resistencia1); 
    legend(str1, str2, str3, 'FontSize', 10);
end