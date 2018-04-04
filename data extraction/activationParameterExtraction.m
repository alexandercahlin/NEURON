%%
fastact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'Activation','B5:AZ16');
TotalC=13;
ActK=zeros(TotalC,1);
ActV=zeros(TotalC,1);
ActR2=zeros(TotalC,1);


for i=0:(TotalC-1)
        x=fastact(:,1+4*i);
        y=fastact(:,2+4*i);
        [sigmoid, gof] = ActSigmoidfit(x, y);
        ActR2(i+1)=gof.rsquare;
        ActK(i+1)=sigmoid.k;
        ActV(i+1)=sigmoid.vhalf;
end

Act=[ActK,ActV,ActR2]; %summarizing data

ActMeank=nanmean(Act(:,1));
ActMeanv=nanmean(Act(:,2));
ActMeanr2=nanmean(Act(:,3));

% for i=0:(TotalC-1)
%     x=fastact(:,1+4*i);
%     y=fastact(:,2+4*i);
%     plot(x,y,'.')
%     
% end
vLevels=12;
ymeanM=zeros(vLevels,1);
ySDM=zeros(vLevels,1);
yvaluesM=NaN(vLevels,TotalC);

for i=1:vLevels
    for j=0:(TotalC-1)
            yvaluesM(i,j+1)=fastact(i,2+4*j);
    end
    ymeanM(i,1)=nanmean(yvaluesM(i,:));
    ySDM(i,1)=nanstd(yvaluesM(i,:));
end

% figure(1)
% errorbar(fastact(:,1),ymeanM(:,1),2*ySD,'sk')
% axis([-140 40 -0.2 1.6])
% hold on
hM=linspace(-120,10,1000);
meanCurveM=1./(1+exp((hM-ActMeanv)*(-1/ActMeank)));
% plot(h,meanCurveM,'k')
% xlabel('U/mV')
% ylabel('m/unity')

fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
saveas(1, fullfile(fpath, 'mSigmoid.png'));
%%
fastactDrug = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'Activation','B32:AZ43');

TotalC=13;
ActKDrug=zeros(TotalC,1);
ActVDrug=zeros(TotalC,1);
ActR2Drug=zeros(TotalC,1);


for i=0:(TotalC-1)
        x=fastactDrug(:,1+4*i);
        y=fastactDrug(:,2+4*i);
        [sigmoid, gof] = ActSigmoidfit(x, y);
        ActR2Drug(i+1)=gof.rsquare;
        ActKDrug(i+1)=sigmoid.k;
        ActVDrug(i+1)=sigmoid.vhalf;
end

ActDrug=[ActKDrug,ActVDrug,ActR2Drug]; %summarizing data

ActMeankDrug=nanmean(ActDrug(:,1));
ActMeanvDrug=nanmean(ActDrug(:,2));
ActMeanr2Drug=nanmean(ActDrug(:,3));

% for i=0:(TotalC-1)
%     x=fastactDrug(:,1+4*i);
%     y=fastactDrug(:,2+4*i);
%     plot(x,y,'.')
%     
% end
vLevels=12;
ymeanDrugM=zeros(vLevels,1);
ySDDrugM=zeros(vLevels,1);
yvaluesDrugM=NaN(vLevels,TotalC);

for i=1:vLevels
    for j=0:(TotalC-1)
            yvaluesDrugM(i,j+1)=fastactDrug(i,2+4*j);
    end
    ymeanDrugM(i,1)=nanmean(yvaluesDrugM(i,:));
    ySDDrugM(i,1)=nanstd(yvaluesDrugM(i,:));
end


% errorbar(fastactDrug(:,1),ymeanDrugM(:,1),2*ySDDrugM,'dr')
% axis([-140 40 -0.2 1.6])
sM=linspace(-120,10,1000);
meanCurveDrugM=1./(1+exp((sM-ActMeanvDrug)*(-1/ActMeankDrug)));
% plot(sM,meanCurveDrugM,'r')
% xlabel('U/mV')
% ylabel('m/unity')

%% The final plot

figure(1001)
hold all
errorbar(fastact(:,1),ymeanM(:,1),2*ySDM,'sk')
errorbar(fastactDrug(:,1),ymeanDrugM(:,1),2*ySDDrugM,'dr')
plot(hM,meanCurveM,'k')
plot(sM,meanCurveDrugM,'r')

axis([-140 40 -0.2 1.6])
xlabel('U/mV')
ylabel('m/unity')

fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
% saveas(2, fullfile(fpath, 'mSigmoidDrug.png'));
saveas(1001, fullfile(fpath, 'mSigmoidComparison.png'));


