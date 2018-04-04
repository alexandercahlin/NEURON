fastrecov = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'RecoveryFast','B5:BH18');
TotalC=15;
tau1=zeros(TotalC,1);
tau2=zeros(TotalC,1);
FRecovR2=zeros(TotalC,1);

for i=0:(TotalC-1)
        x=fastrecov(:,1+4*i);
        y=fastrecov(:,2+4*i);
        [biexp, gof] = FastTauFitMonoExp(x, y);
        tau1(i+1)=biexp.tau1;
        FRecovR2(i+1)=gof.rsquare;
end

Taus=[tau1,FRecovR2];

FRecovMeanTau1MonoExp=mean(Taus(:,1));
FRecovMeanR2MonoExp=mean(Taus(:,2));