
fastrecov = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'RecoveryFast','B5:BH18');
TotalC=15;
tau1=NaN(TotalC,1);

vStore=NaN(TotalC,1);
uStore=NaN(TotalC,1);

FRecovR2=NaN(TotalC,1);

% Produces a fit to the recovery/dt curves for each cell. Stores the time
% constants and gof measure in vectors
for i=0:(TotalC-1)
        x=fastrecov(:,1+4*i);
        y=fastrecov(:,2+4*i);
        [monoexp, gof] = FastTauFitMonoExp(x, y);
        tau1(i+1)=monoexp.tau1;
        
        vStore(i+1)=monoexp.v;
        uStore(i+1)=monoexp.u;
        FRecovR2(i+1)=gof.rsquare;
end

Taus=[tau1,tau1,vStore,uStore,FRecovR2];          %Stores all vectors in a matrix
Taus(7,:)=NaN;                      % Excludes the 7th cell (bad results)

FRecovMeanTau1=nanmean(Taus(:,1));  %Calculates the mean of Tau1
FRecovSDTau1=nanstd(Taus(:,1));     %Calculates the SD of Tau1


vStoremean=nanmean(Taus(:,3));      %Calculates the mean of v
uStoremean=nanmean(Taus(:,4));      %Calculates the mean of w

tLevels=14;                         %nr of dt levels
ymeanTau=NaN(tLevels,1);             %stores the mean I2/I2max values at each dt-level
ySDTau=NaN(tLevels,1);               %stores the SD of the I2/I2max values at each dt-level
yvaluesTau=NaN(tLevels,TotalC);        %Stores all the I/I2max values

for i=1:tLevels
    for j=0:(TotalC-1)
            yvaluesTau(i,j+1)=fastrecov(i,2+4*j);
    end
    ymeanTau(i,1)=nanmean(yvaluesTau(i,:));
    ySDTau(i,1)=nanstd(yvaluesTau(i,:));
end

hTau=linspace(0.9,9000,90000);     %Generates a vector to plot the fitted curve against
vTau=vStoremean;                   %Retrieves the means of the constants retrieved from each cell
uTau=uStoremean;
tau1=FRecovMeanTau1;

meanCurveTau=uTau+vTau.*exp(-hTau/tau1);

figure
hAx=axes;                       %Plots I2/I2max on a logscale
hAx.XScale='log';
hold all



plot(hTau,meanCurveTau)

% hAx=axes;                       %Plots I2/I2max on a logscale
% hAx.XScale='log';

% hold on
% plot(hTau,meanCurveTau,'k')

% errorbar(fastrecov(:,1),ymeanTau(:,1),2*ySDTau,'.k')
% axis([0.1 100000 0 1.2])
% xlabel('dt/ms')
% ylabel('P_2/P_{2, Max} (/unity)')
% 
% fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\tauplots';
% saveas(16, fullfile(fpath, 'RecovFInact.png'));

%%
fastrecovDrug = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'RecoveryFast','B32:BH45');
TotalC=15;
tau1Drug=NaN(TotalC,1);
tau2Drug=NaN(TotalC,1);
vStoreDrug=NaN(TotalC,1);
wStoreDrug=NaN(TotalC,1);

FRecovR2Drug=NaN(TotalC,1);

% Produces a fit to the recovery/dt curves for each cell. Stores the time
% constants and gof measure in vectors
for i=0:(TotalC-1)
        x=fastrecovDrug(:,1+4*i);
        y=fastrecovDrug(:,2+4*i);
        [monoexp, gof] = FastTauFit(x, y);
        tau1Drug(i+1)=monoexp.tau1;
        tau2Drug(i+1)=monoexp.tau2;
        vStoreDrug(i+1)=monoexp.v;
        wStoreDrug(i+1)=monoexp.w;
        FRecovR2Drug(i+1)=gof.rsquare;
end

TausDrug=[tau1Drug,tau2Drug,vStoreDrug,wStoreDrug,FRecovR2Drug];          %Stores all vectors in a matrix
TausDrug(7,:)=NaN;                      % Excludes the 7th cell (bad results)

FRecovMeanTau1Drug=nanmean(TausDrug(:,1));  %Calculates the mean of Tau1
FRecovSDTau1Drug=nanstd(TausDrug(:,1));     %Calculates the SD of Tau1

FRecovMeanTau2Drug=nanmean(TausDrug(:,2));  %Calculates the mean of Tau2
FRecovSDTau2Drug=nanstd(TausDrug(:,2));     %Calculates the SD of Tau2  

vStoremeanDrug=nanmean(TausDrug(:,3));      %Calculates the mean of v
wStoremeanDrug=nanmean(TausDrug(:,4));      %Calculates the mean of w

tLevels=14;                         %nr of dt levels
ymeanDrugTau=NaN(tLevels,1);             %stores the mean I2/I2max values at each dt-level
ySDDrugTau=NaN(tLevels,1);               %stores the SD of the I2/I2max values at each dt-level
yvaluesDrugTau=NaN(tLevels,TotalC);        %Stores all the I/I2max values

for i=1:tLevels
    for j=0:(TotalC-1)
            yvaluesDrugTau(i,j+1)=fastrecovDrug(i,2+4*j);
    end
    ymeanDrugTau(i,1)=nanmean(yvaluesDrugTau(i,:));
    ySDDrugTau(i,1)=nanstd(yvaluesDrugTau(i,:));
end

sTau=linspace(0.9,9000,90000);     %Generates a vector to plot the fitted curve against
vDrug=vStoremeanDrug;                   %Retrieves the means of the constants retrieved from each cell
wDrug=wStoremeanDrug;
tau1Drug=FRecovMeanTau1Drug;
tau2Drug=FRecovMeanTau2Drug;
meanCurveDrugTau=vDrug.*(1-exp(-sTau/tau1Drug))+wDrug.*(1-exp(-sTau/tau2Drug));

% hAx=axes;                       %Plots I2/I2max on a logscale
% hAx.XScale='log';
% 
% hold on
% 
% 
% errorbar(fastrecovDrug(:,1),ymeanDrugTau(:,1),2*ySDDrugTau,'.r')
% axis([0.1 100000 0 1.2])
% xlabel('dt/ms')
% ylabel('P_2/P_{2, Max} (/unity)')
% 
% fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\tauplots';
% saveas(35, fullfile(fpath, 'RecovFInactDrug.png'));
%% The final plot


figure(1004)
hAx=axes;                       %Plots I2/I2max on a logscale
hAx.XScale='log';
hold all
errorbar(fastrecov(:,1),ymeanTau(:,1),2*ySDTau,'sk')
errorbar(fastrecovDrug(:,1),ymeanDrugTau(:,1),2*ySDDrugTau,'dr')
plot(sTau,meanCurveDrugTau,'r')
plot(hTau,meanCurveTau,'k')

axis([0.1 100000 0 1.2])
xlabel('dt/ms')
ylabel('P_2/P_{2, Max} (/unity)')

% saveas(1004, fullfile(fpath, 'RecovFInactDrugComparison.png'));
