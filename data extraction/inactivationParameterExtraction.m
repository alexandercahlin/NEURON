fastinact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'InactivationFast','B5:AY19');
TotalC=13;
kInact=zeros(TotalC,1);
vInact=zeros(TotalC,1);
r2=zeros(TotalC,1);

for i=0:(TotalC-1)
        x=fastinact(:,1+4*i);
        y=fastinact(:,2+4*i);
        [sigmoid, gof] = sigmoidfit(x, y);
        
        r2(i+1)=gof.rsquare;
        kInact(i+1)=sigmoid.k;
        vInact(i+1)=sigmoid.v;
end

meank=mean(Inact(:,1));
meanv=mean(Inact(:,2));
meanr2=mean(Inact(:,3));
