function [parameterValuesInact] = InactStats(cellsUndrugged,cellsDrugged)
%initiate constants
parameterValuesInact=NaN(2,5);    %Create "results" vector
%initiate constants
TotalC=7;              %total nr of cells
vLevels=23;             %voltage levels

ymeanH=NaN(vLevels,2);  %stores mean M-points for comparison pre/post drug
ySDH=NaN(vLevels,2);    %stores sd ...

lsPts=1000;             %resolution for m-curve
meanCurveH=NaN(lsPts,2);%stores m-curves based on Vhalf and k of all cells

FInactK=NaN(TotalC,1);
FInactV=NaN(TotalC,1);
FInactR2=NaN(TotalC,1);

inact = {};                %imports data
%New data

%On PC
% inact(1)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'inact','B4:AA26')};
% inact(2)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'inact','B36:AA58')};

%On Server
inact(1)={importfile('/srv/data/Analysis/LundbeckModelling/IV_recov.xlsx', 'inact','B4:AA26')};
inact(2)={importfile('/srv/data/Analysis/LundbeckModelling/IV_recov.xlsx', 'inact','B36:AA58')};

V=inact{1}(1:23,14)*10^-3;

for z=1:2               %loops over both conditions (pre/post drug)
    %% Plots I(V)
    if z==1                     %choose which cells to include
        incl=cellsUndrugged;    
    end
    if z==2
        incl=cellsDrugged;      
    end
    incl=incl-1;                %adjusting indices


inactvalues=NaN(size(inact{z},1),size(inact{z},2));
for i=0:(TotalC-1)
    if(ismember(i,incl)==0)
        inact{z}(:,2+4*i)=NaN;
        inact{z}(:,1+4*i)=NaN;
    else
        x=inact{z}(:,2+4*i);
        inactvalues(:,i+1)=inact{z}(:,1+4*i);
        inactvaluesMax=max(inactvalues(:,i+1));
        inactvaluesMin=min(inactvalues(:,i+1));
        inactvalues(:,i+1)=(inactvalues(:,i+1)-inactvaluesMin)./(inactvaluesMax-inactvaluesMin);
        y=inactvalues(:,i+1);
        [sigmoid, gof] = FInactSigmoidfit(x, y);
        
        FInactR2(i+1)=gof.rsquare;
        FInactK(i+1)=sigmoid.k;
        FInactV(i+1)=sigmoid.vhalf;
    end
end
FInact=[FInactK,FInactV,FInactR2];

%% Plots all fitted curves together
figure
cla reset
axis([-140 40 -0.2 1.2])
xlabel('U/mV')
ylabel('h/unity')
for i=0:(TotalC-1)
    if ismember(i,incl)
    k=FInactK(i+1);
    vhalf=FInactV(i+1);
    x=linspace(-120,20,1000);
    y=1./(1+exp((x-vhalf)*(-1/k)));
    hold on
    plot(x,y)
    end
end
%%
vLevels=15;

yvaluesH=NaN(vLevels,TotalC);

for i=1:vLevels
    for j=0:(TotalC-1)
        yvaluesH(i,j+1)=inactvalues(i,j+1);
    end
    ymeanH(i,z)=nanmean(yvaluesH(i,:));
    ySDH(i,z)=nanstd(yvaluesH(i,:));
end



% errorbar(fastinact(:,37),ymeanH(:,1),2*ySDH,'.k')
% axis([-140 40 -0.2 1.2])
%  hold on
hH=linspace(-120,100,lsPts);

FInactMeank=nanmean(FInact(:,1));
FInactMeanv=nanmean(FInact(:,2));
FInactMeanr2=nanmean(FInact(:,3));

FInactSDk=nanstd(FInact(:,1));    %calcs sd of k of all cells
FInactSDv=nanstd(FInact(:,2));    %Vhalf
n=sum(~isnan(FInact(:,1)));    %calcs nr of cells used (for stats)

meanCurveH(:,z)=1./(1+exp((hH-FInactMeanv)*(-1/FInactMeank)));

figure
plot(hH,meanCurveH(:,z),'k','LineWidth',2)
xlabel('U/mV')
ylabel('h/unity')

parameterValuesInact(z,:)=[FInactMeanv,FInactSDv,FInactMeank,FInactSDk,n];


end
%% The final plot

figure
axis([-140 50 -0.2 1.2])
xlabel('U/mV')
ylabel('h/unity')
hold on
% x=linspace(-120,20,15);
% xDrug=linspace(-120,30,16);
% errorbar(x,ymeanH(:,1),2*y SDH,'sk')
% errorbar(xDrug,ymeanDrugH(:,1),2*ySDDrugH,'dr')
% plot(hH,meanCurveH,'k')
% plot(sH,meanCurveDrugH,'r')



errorbar(V*10^3,ymeanH(:,1),2*ySDH(:,1),'sk')
plot(hH,meanCurveH(:,1),'k','LineWidth',2)

errorbar(V*10^3,ymeanH(:,2),2*ySDH(:,2),'dr')
plot(hH,meanCurveH(:,2),'r','LineWidth',2)

end