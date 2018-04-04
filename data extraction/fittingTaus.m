% It = importfile('C:\Users\Alexander\Desktop\It no ds.xlsx', 'Sheet1','A2:ATA6251');
%
% Cols=size(It,2);
% nrcells=(Cols-1)/2;
% t=It(:,1);
% Taus=NaN(nrcells,3);

Vstore=NaN(nrcells,1);

for i=1:nrcells
    tempT=It(:,1);
    V=It(:,2*i);
    I=It(:,1+2*i);
    
    StepStart=0;
    for j=1:length(V)
        if V(j)>-0.12
            StepStart=j;
            Vstore(i)=V(j);
            break
        end
    end
end


% for i=1:nrcells
%     tempT=It(:,1);
%     V=It(:,2*i);
%     I=It(:,1+2*i);
%
%     StepStart=0;
%     for j=1:length(V)
%         if V(j)>-0.12
%             StepStart=j;
%             Vstore(i)=V(j);
%             break
%         end
%     end
%
%     InfluxDone=StepStart+100;
%     AOIt=t(StepStart:InfluxDone)-t(StepStart);
%     AOIt=AOIt*1000;
%     AOII=I(StepStart:InfluxDone)*10^9;
%     weightI=abs(AOII);
%     [TauFit,gof]=TauFitter(AOIt,AOII,abs(AOII));
%     Taus(i,1)=TauFit.t1;
%     Taus(i,2)=TauFit.t2;
%     Taus(i,3)=gof.rsquare;
% end
%
% for i=1:nrcells
%     if Taus(i,3)<0.9
%         Taus(i,:)=NaN;
%     end
% end

tauM=Taus(:,1);
tauH=Taus(:,2);

[tauMcurve,tauMcurveGOF]=tauMFit(Vstore,tauM);
[tauHcurve,tauHcurveGOF]=tauHFit(Vstore,tauH);

x=linspace(-0.12,0.12,1000);
a1 =       4.692;
b1 =   -0.006477;
c1 =     0.06459;
tauMcurveseparate=a1*exp(-((x-b1)/c1).^2);

b =0.009767;
f =0.5714;
xshift= -0.01748;
tauHcurveseparate=f*exp((-x+xshift)/b);

figure

plot(x,tauMcurveseparate)
axis([-0.15 0.15 0 10])
hold on
plot(x,tauHcurveseparate)






