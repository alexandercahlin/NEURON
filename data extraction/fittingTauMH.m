V=-10;
Vstart=-120;
VrevNa=67.77;
Gbar=7.8973;
t=linspace(0,1);

MInf=sigm(V,ActMeanv,ActMeank);
Mstart=sigm(Vstart,ActMeanv,ActMeank);
HInf=sigm(V,FInactMeanv,FInactMeank);
Hstart=sigm(V,FInactMeanv,FInactMeank);


tauM=0.05;
tauH=0.5;

m=MInf-(MInf-Mstart)*exp(-t/tauM);

h=HInf-(HInf-Hstart)*exp(-t/tauH);


INa=Gbar*(m.^3).*h*(V-VrevNa);
figure
hold on
plot(t,m)
plot(t,h)
figure
plot(t,INa)


