%% Fitting I/C=Gbar/C*m^3*h*(V-VrevNa)
%can be used in the curve fitting app. see if this can be done
%programmatically
function [G] = extractIt(t,Vstep,tauM,tauH,offsetY,offsetX)
sigm = @(V,V_half,slope) 1./(1 + exp(-(V - V_half)/slope));

V=Vstep;
Vstart=-120;

ActMeanv=-28.8056;
ActMeank=1.7212;
FInactMeanv=-45.3092;
FInactMeank=-4.9401;

MInf=sigm(V,ActMeanv,ActMeank);
Mstart=sigm(Vstart,ActMeanv,ActMeank);
HInf=sigm(V,FInactMeanv,FInactMeank);
Hstart=sigm(Vstart,FInactMeanv,FInactMeank);

[m]=MInf-(MInf-Mstart)*exp((-t+offsetX)/tauM);
[h]=HInf-(HInf-Hstart)*exp((-t+offsetX)/tauH);

[G]=m.^3.*h+offsetY;

end