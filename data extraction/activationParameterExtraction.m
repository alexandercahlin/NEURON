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

ActMeank=mean(Act(:,1));
ActMeanv=mean(Act(:,2));
ActMeanr2=mean(Act(:,3));


