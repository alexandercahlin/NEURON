fastrecov = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'RecoveryFast','B5:BH18');
TotalC=15;
sigma=zeros(TotalC,1);
theta=zeros(TotalC,1);
FRecovR2=zeros(TotalC,1);

for i=0:(TotalC-1)
        x=fastrecov(:,1+4*i);
        y=fastrecov(:,2+4*i);
        [biexp, gof] = GolombFit(x, y);
        sigma(i+1)=biexp.sigma;
        theta(i+1)=biexp.theta;
        FRecovR2(i+1)=gof.rsquare;
end

Golombs=[sigma,theta,FRecovR2];

FRecovMeanSigma=mean(Golombs(:,1));
FRecovMeanTheta=mean(Golombs(:,2));
FRecovMeanR2=mean(Golombs(:,3));