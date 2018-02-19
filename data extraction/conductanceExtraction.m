IV = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27');
TotalC=13;

G=zeros(22,1);
Gbar=zeros(13,1);
indexvec=zeros(TotalC,1);


for i=0:(TotalC-1)
    x=10^(-3)*IV(:,1+4*i);
    y=7.4*10^(-12)*IV(:,2+4*i); %temporary assumption that a cell has C = 7.4 pF (calculated using given current trace)
    for j=1:size(y)
        G(j)=y(j)./x(j);
    end
    hold all
    
    for k=1:size(y)
        indexvec(k,1)=k;
    end
    
    plot (indexvec,G(:,1))
    Gbar(i+1)=max(G);
end



meanGbar=mean(Gbar); %%conductance normalized by capacitance

meanGbar=meanGbar*10^(-6); %conductance "unnormalized" by a typical cell w C=1 uF