fastinact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'InactivationFast','B5:AY19');
TotalC=13;
FInactK=zeros(TotalC,1);
FInactV=zeros(TotalC,1);
FInactR2=zeros(TotalC,1);

for i=0:(TotalC-1)
        x=fastinact(:,1+4*i);
        y=fastinact(:,2+4*i);
        [sigmoid, gof] = FInactSigmoidfit(x, y);
        
        FInactR2(i+1)=gof.rsquare;
        FInactK(i+1)=sigmoid.k;
        FInactV(i+1)=sigmoid.vhalf;
end

FInact=[FInactK,FInactV,FInactR2];
FInactMeank=mean(FInact(:,1));
FInactMeanv=mean(FInact(:,2));
FInactMeanr2=mean(FInact(:,3));


