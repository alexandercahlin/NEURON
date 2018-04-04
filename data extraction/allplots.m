IVplots
activationParameterExtraction
inactivationParameterExtraction
tauExtraction

figure(2000)
subplot(2,2,1)


hold all
errorbar(xIV,ymeanIV(:,1),2*ySDIV(:,1),'k')
errorbar(xIVDrug,ymeanDrugIV(:,1),2*ySDDrugIV(:,1),'r')
axis([-140 120 -900 200])
xlabel('U/mV')
ylabel('J/(V/s)')



subplot(2,2,2)


hold all

errorbar(fastact(:,1),ymeanM(:,1),2*ySDM,'sk')
errorbar(fastactDrug(:,1),ymeanDrugM(:,1),2*ySDDrugM,'dr')
plot(hM,meanCurveM,'k')
plot(sM,meanCurveDrugM,'r')

axis([-140 40 -0.2 1.6])
xlabel('U/mV')
ylabel('m/unity')


subplot(2,2,3)
hold all
plot(hH,meanCurveH,'k')
plot(sH,meanCurveDrugH,'r')
errorbar(fastinact(:,1),ymeanH(:,1),2*ySDH,'sk')
errorbar(fastinactDrug(:,1),ymeanDrugH(:,1),2*ySDDrugH,'dr')

axis([-140 50 -0.2 1.2])
xlabel('U/mV')
ylabel('h/unity')


subplot(2,2,4)
hAx=subplot(2,2,4);                       %Plots I2/I2max on a logscale
hAx.XScale='log';
hold all
plot(sTau,meanCurveDrugTau,'r')
plot(hTau,meanCurveTau,'k')
errorbar(fastrecov(:,1),ymeanTau(:,1),2*ySDTau,'sk')
errorbar(fastrecovDrug(:,1),ymeanDrugTau(:,1),2*ySDDrugTau,'dr')
axis([0.1 100000 0 1.2])
xlabel('dt/ms')
ylabel('P_2/P_{2, Max} (/unity)')

fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\tauplots';
saveas(2000, fullfile(fpath, 'NoDrugvsDrugComparison.png'));