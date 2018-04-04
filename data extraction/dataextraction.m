fastact = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'Activation','B5:AZ16');
TotalC=13;
k=zeros(TotalC,1);
v=zeros(TotalC,1);
r2=zeros(TotalC,1);


for i=0:(TotalC-1)
        x=fastact(:,1+4*i);
        y=fastact(:,2+4*i);
        [sigmoid, gof] = sigmoidfit(x, y);
        r2(i+1)=gof.rsquare;
        k(i+1)=sigmoid.k;
        v(i+1)=sigmoid.v;
end

M=[k,v,r2]; %summarizing data
M(8,:)=[];  % ignoring "bad" curves
M(9,:)=[];

meank=mean(M(:,1));
meanv=mean(M(:,2));
meanr2=mean(M(:,3));
