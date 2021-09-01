clear;clc

a=0;
b=0.2;
n=10;
deltax=(b-a)/n;
rectizq=0;
rectder=0;
trapecios=0;
simpson=0;
simpson1=0;
simpson2=0;
%xf=0;
t=[0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2];
f=[5 20 75 125 152 141 130 95 72 15 0];
%n1=11;

%rectángulos

for i=1:1:n
   %primero intenté usar las fórmulas pero luego vi que con tener los
   %valores de F(N) y como a es 0, se podía omitir ese paso, y simplemente
   %revisar la posición de la matriz para obtener los resultados.
   %xf=a+(i-1)*deltax;
   %if xf==t(i)
       rectizq=(f(i)*deltax)+rectizq;
   %end
end

disp("El área aporximada usando rectángulos del lado izquierdo es: " + rectizq + " J")

for i=1:1:n
    f(i+1);
    rectder=f(i+1)*deltax+rectder;
end

disp("El área aporximada usando rectángulos del lado derecho es: " + rectder + " J")

%trapecio

for i=2:1:n
    trapecios=2*f(i)+trapecios;
end

trapecios=(deltax/2)*(f(1)+trapecios+f(11));

disp("El área aporximada usando trapecios es: " + trapecios + " J")

%simpson

for i=2:2:n
    simpson1=4*f(i)+simpson1;
end

for i=3:2:n
    simpson2=2*f(i)+simpson2;
end

simpson=(deltax/3)*(f(1)+simpson1+simpson2+f(11));

disp("El área aporximada usando simpson es: " + simpson + " J")

plot(t,f)

title("Fuerza vs. Tiempo")
ylabel("Fuerza (N)")
xlabel("Tiempo (s)")

pp=spline(t,f);

int=integral(@(xx)ppval(pp,xx),0,0.2);

disp("El área calculando la integral es: " + int + " J")

%el resultado es mucho más preciso porque se calcula directamente el área
%bajo la curva, por lo que no es una aproximación ni estimación.

