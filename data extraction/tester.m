taum=5;
tauh=45;
x=linspace(0,250,1000);
Istart=-7;
Iinf=5;

y=(1-exp(-x/taum)).^3.*exp(-x/tauh)*Iinf;
y1=(1-exp(-x/taum)).^3;
y2=5*exp(-x/tauh);
diffs=abs(diff(y));
weights=[0 diffs];
figure
plot(x,y)
% figure
% plot(x,weights)
figure
plot(x,y1)
hold on
plot(x,y2)
plot(x,y)
