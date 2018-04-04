function [FRecovMeanTau1,FRecovSDTau1] = FRecovNewest(cellsUndrugged,cellsDrugged)
%initiate constants
TotalC=7;              %total nr of cells
lsPts=90000;
meanCurveTauH=NaN(lsPts,2);%stores m-curves based on Vhalf and k of all cells
FRecovMeanTau1=NaN(2,1);
FRecovSDTau1=NaN(2,1);

tLevels=14;                         %nr of dt levels
ymeanTau=NaN(tLevels,2);             %stores the mean I2/I2max values at each dt-level
ySDTau=NaN(tLevels,2);               %stores the SD of the I2/I2max values at each dt-level

frecov = {};                %imports data
%New data
frecov(1)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B4:AA31')};
frecov(2)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B36:AA49')};


fastinact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'InactivationFast','B5:AY19');
TotalC=13;
incl=[1,2,3,4,12]; %include all. 5 and 7 has low R2, 8 and 9 are only buffer "after drug"
incl=incl-1;

FInactK=NaN(TotalC,1);
FInactV=NaN(TotalC,1);
FInactR2=NaN(TotalC,1);
inactvalues=NaN(size(fastinact,1),size(fastinact,2));
for i=0:(TotalC-1)
    if(ismember(i,incl)==0)
        fastinact(:,2+4*i)=NaN;
        fastinact(:,1+4*i)=NaN;
    else
        x=fastinact(:,1+4*i);
        inactvalues(:,i+1)=fastinact(:,2+4*i);
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
FInactMeank=nanmean(FInact(:,1));
FInactMeanv=nanmean(FInact(:,2));
FInactMeanr2=nanmean(FInact(:,3));
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
ymeanH=NaN(vLevels,1);
ySDH=NaN(vLevels,1);
yvaluesH=NaN(vLevels,TotalC);

for i=1:vLevels
    for j=0:(TotalC-1)
        yvaluesH(i,j+1)=inactvalues(i,j+1);
    end
    ymeanH(i,1)=nanmean(yvaluesH(i,:));
    ySDH(i,1)=nanstd(yvaluesH(i,:));
end


% errorbar(fastinact(:,37),ymeanH(:,1),2*ySDH,'.k')
% axis([-140 40 -0.2 1.2])
%  hold on
hH=linspace(-120,30,1000);
meanCurveH=1./(1+exp((hH-FInactMeanv)*(-1/FInactMeank)));
% plot(hH,meanCurveH,'k')
% xlabel('U/mV')
% ylabel('h/unity')

% fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
% saveas(1, fullfile(fpath, 'hSigmoid.png'));

%%
fastinactDrug = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'InactivationFast','B32:AY47');
TotalC=13;
FInactKDrug=NaN(TotalC,1);
FInactVDrug=NaN(TotalC,1);
FInactR2Drug=NaN(TotalC,1);

inactvaluesDrug=NaN(size(fastinactDrug,1),size(fastinactDrug,2));
for i=0:(TotalC-1)
    if(ismember(i,incl)==0)
        fastinactDrug(:,2+4*i)=NaN;
        fastinactDrug(:,1+4*i)=NaN;
    else
        x=fastinactDrug(:,1+4*i);
        inactvaluesDrug(:,i+1)=fastinactDrug(:,2+4*i);
        inactvaluesDrugMax=max(inactvaluesDrug(:,i+1));
        inactvaluesDrugMin=min(inactvaluesDrug(:,i+1));
        inactvaluesDrug(:,i+1)=(inactvaluesDrug(:,i+1)-inactvaluesDrugMin)./(inactvaluesDrugMax-inactvaluesDrugMin);
        y=inactvaluesDrug(:,i+1);
        
        [sigmoid, gof] = FInactSigmoidfit(x, y);
        
        FInactR2Drug(i+1)=gof.rsquare;
        FInactKDrug(i+1)=sigmoid.k;
        FInactVDrug(i+1)=sigmoid.vhalf;
    end
end

FInactDrug=[FInactKDrug,FInactVDrug,FInactR2Drug];
FInactMeankDrug=nanmean(FInactDrug(:,1));
FInactMeanvDrug=nanmean(FInactDrug(:,2));
FInactMeanr2Drug=nanmean(FInactDrug(:,3));

%% Plots all fitted curves together
figure
cla reset
axis([-140 40 -0.2 1.2])
xlabel('U/mV')
ylabel('h/unity')
for i=0:(TotalC-1)
    if ismember(i,incl)
    k=FInactKDrug(i+1);
    vhalf=FInactVDrug(i+1);
    x=linspace(-120,20,1000);
    y=1./(1+exp((x-vhalf)*(-1/k)));
    hold on
    plot(x,y)
    end
end
%%

vLevels=16;
ymeanDrugH=NaN(vLevels,1);
ySDDrugH=NaN(vLevels,1);
yvaluesDrugH=NaN(vLevels,TotalC);

for i=1:vLevels
    for j=0:(TotalC-1)
        yvaluesDrugH(i,j+1)=inactvaluesDrug(i,j+1);
    end
    ymeanDrugH(i,1)=nanmean(yvaluesDrugH(i,:));
    ySDDrugH(i,1)=nanstd(yvaluesDrugH(i,:));
end


% errorbar(fastinactDrug(:,5),ymeanDrugH(:,1),2*ySDDrugH,'.k')
% axis([-140 50 -0.2 1.2])
%  hold on
sH=linspace(-120,40,1000);
meanCurveDrugH=1./(1+exp((sH-FInactMeanvDrug)*(-1/FInactMeankDrug)));
% plot(sH,meanCurveDrugH,'k')
% xlabel('U/mV')
% ylabel('h/unity')


%% The final plot

figure
axis([-140 50 -0.2 1.2])
xlabel('U/mV')
ylabel('h/unity')
hold on
x=linspace(-120,20,15);
xDrug=linspace(-120,30,16);
errorbar(x,ymeanH(:,1),2*ySDH,'sk')
errorbar(xDrug,ymeanDrugH(:,1),2*ySDDrugH,'dr')
plot(hH,meanCurveH,'k')
plot(sH,meanCurveDrugH,'r')



fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
% saveas(2, fullfile(fpath, 'mSigmoidDrug.png'));
% saveas(1002, fullfile(fpath, 'hSigmoidComparisonOWN.png'));



