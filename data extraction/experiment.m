function [timeLowerLimit] = low(x, y)

plot(x,y)
repeats=6;
ynew=ones(length(y),repeats);
for k=1:repeats
    ynew(:,k)=y;
end

for n=2:repeats+1
    for i=2:length(ynew)-1
        ynew(i,n)=(ynew(i-1,n-1)+ynew(i+1,n-1))/2;
    end
end
    
    
    pks=findpeaks(-ynew(:,repeats));
    plot(x,ynew(:,repeats),x(pks.loc),ynew(pks.loc,repeats),'or')
    peakVals=ynew(pks.loc,repeats);
    [secPeakVal,secPeakIndex]=min(peakVals(peakVals>min(peakVals)));
    secPeakIndex=secPeakIndex+1;
    timeLowerLimit=x(pks.loc(secPeakIndex));
end