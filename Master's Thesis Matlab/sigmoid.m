Vhalf=-30;
k=-2;
x=linspace(-70,30);
y=1./(1+exp((1/k)*(x-Vhalf)));
plot(x,y)
x=x';
y=y';
M=[x,y];