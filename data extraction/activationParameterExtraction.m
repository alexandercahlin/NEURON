fastact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'Activation','B5:AZ16');
TotalC=13;
kAct=zeros(TotalC,1);
vAct=zeros(TotalC,1);
r2=zeros(TotalC,1);


for i=0:(TotalC-1)
        x=fastact(:,1+4*i);
        y=fastact(:,2+4*i);
        [sigmoid, gof] = sigmoidfit(x, y);
        r2(i+1)=gof.rsquare;
        kAct(i+1)=sigmoid.k;
        vAct(i+1)=sigmoid.v;
end

Act=[kAct,vAct,r2]; %summarizing data
Act(8,:)=[];  % ignoring "bad" curves
Act(9,:)=[];

meank=mean(Act(:,1));
meanv=mean(Act(:,2));
meanr2=mean(Act(:,3));
