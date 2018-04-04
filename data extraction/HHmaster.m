UndruggedC=[1,2,5,6,7];     %Cells chosen for fitting
DruggedC=[1,2,5,6,7];       %3,4 is an outlier?
IV_GV_m=IVActDerStatsNEW(UndruggedC,DruggedC);   %fits to data

%Inactivation fits
h=InactStats(UndruggedC,DruggedC);

%reovery time constant
tau_recov=FRecovNewest(UndruggedC,DruggedC);

%tau_m and tau_h fits



%modeling ion channels

%modeling neurons