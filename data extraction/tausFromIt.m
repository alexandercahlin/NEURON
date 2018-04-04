

It = importfile('C:\Users\Alexander\Desktop\It no ds.xlsx', 'Sheet1','A2:ATA6251');

t=It(:,1);

nTraces=(size(It,2)-1)/2;

figure
for i=1:nTraces
    hold on
    plot(t(1253:5003),It(1253:5003,1+2*i))
end

figure
for i=1:nTraces
    hold on
    plot(t(1253:5003),It(1253:5003,1+i))
end

figure
plot(t,It(:,35))

figure
plot(t,It(:,34))

oneIt=It(:,35);
oneV=It(:,34);
VrevNa=67.77;
cSlow=7.76891*10^-12;

oneIDensT=oneIt./cSlow;

oneGDensT=oneIDensT./(oneV-VrevNa);


StepStart=0;
for i=1:length(oneV)
    if oneV(i)>-0.12
        StepStart=i;
        break
    end
end
Vstep=oneV(StepStart)*10^3;
StepStart=StepStart-10;
InfluxDone=StepStart+500;
AOIt=t(StepStart:InfluxDone)-t(StepStart);
AOIoneGDensT=oneGDensT(StepStart:InfluxDone);
AOIV=oneV(StepStart:InfluxDone);
figure
plot(AOIt,AOIoneGDensT)

AOIoneGDensTMax=max(AOIoneGDensT);
AOIoneGDensTMin=min(AOIoneGDensT);
AOIoneGDensTNorm=(AOIoneGDensT-AOIoneGDensTMin)/(AOIoneGDensTMax-AOIoneGDensTMin);

figure
plot(AOIt,AOIoneGDensTNorm)


% g=extractIt(AOIt,40,0.001,0.0001);
% figure
% plot(AOIt,g)

% figure
% subplot(2,1,1)
% plot(t*10^3,It(:,19)*10^9)
% xlabel('t/ms')
% ylabel('I_{density}/(nV/s)')
% 
% subplot(2,1,2)
% plot(t*10^3,It(:,18)*10^3)
% xlabel('t/ms')
% ylabel('V_{step}/mV')

figure
subplot(2,1,1)
xlabel('t/ms')
ylabel('I_{density}/(nV/s)')
plot(t*10^3,It(:,157)*10^9)


subplot(2,1,2)
xlabel('t/ms')
ylabel('V_{step}/mV')
plot(t*10^3,It(:,156)*10^3)





