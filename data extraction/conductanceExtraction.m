IV = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27');
TotalC=13;

G=zeros(22,1);
Gbar=zeros(13,1);

for i=0:(TotalC-1)
        x=10^-3.*IV(:,1+4*i);
        y=IV(:,2+4*i);
        for j=1:size(y)
            G(j)=y(j)/x(j);
        end
        Gbar(i+1)=max(G);
end

meanGbar=mean(Gbar); %%conductance normalized by capacitance