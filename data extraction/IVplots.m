
IV = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27');
TotalC=13;
%
%Plots I(V)
for i=0:(TotalC-1)
 Idens=IV(:,2+4*i);
 V=10^(-3).*IV(:,1+4*i);
 hold all
 plot(V,Idens)
end


% vLevels=23;
% ymeanIV=zeros(vLevels,1);
% for i=1:vLevels
%     xIV=IV(:,1);
%     ysum=zeros(vLevels,1);
%     counter=0;
%     for j=0:(TotalC-1)
%         if ~isnan(IV(i,2+4*j))
%             ysum(i,1)=ysum(i,1)+IV(i,2+4*j);
%             counter=counter+1;
%         end
%     end
%     ymeanIV(i,1)=ysum(i,1)/counter;
% end

vLevels=23;                         
ymeanIV=zeros(vLevels,1);             
ySDIV=zeros(vLevels,1);               
yvaluesIV=NaN(vLevels,TotalC);        

for i=1:vLevels
    for j=0:(TotalC-1)
            yvaluesIV(i,j+1)=IV(i,2+4*j);
    end
    ymeanIV(i,1)=nanmean(yvaluesIV(i,:));
    ySDIV(i,1)=nanstd(yvaluesIV(i,:));
end

% errorbar(x,ymeanIV(:,1),2*ySDIV(:,1),'k')
% axis([-150 150 -800 200])
% xlabel('U/mV')
% ylabel('J/(V/s)')
% fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\IV plots';
% saveas(1, fullfile(fpath, 'meanIV.png'));
%%
IVDrug = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B32:AY54');
TotalC=13;
% Plots I(V)
% for i=0:(TotalC-1)
%  Idens=IV(:,2+4*i);
%  V=10^(-3).*IVDrug(:,1+4*i);
%  hold all
%  plot(V,Idens)
% end

%Plots average of all IV-curves with drug applied to cells

% vLevels=23;
% ymeanDrugIV=zeros(vLevels,1);
% for i=1:vLevels
%     xIVDrug=IVDrug(:,1);
%     ysumDrug=zeros(vLevels,1);
%     counter=0;
%     for j=0:(TotalC-1)
%         if ~isnan(IV(i,2+4*j))
%             ysumDrug(i,1)=ysumDrug(i,1)+IV(i,2+4*j);
%             counter=counter+1;
%         end
%     end
%     ymeanDrugIV(i,1)=ysumDrug(i,1)/counter;
% end

vLevels=23;                         
ymeanDrugIV=zeros(vLevels,1);             
ySDDrugIV=zeros(vLevels,1);               
yvaluesDrugIV=NaN(vLevels,TotalC);        

for i=1:vLevels
    for j=0:(TotalC-1)
            yvaluesDrugIV(i,j+1)=IVDrug(i,2+4*j);
    end
    ymeanDrugIV(i,1)=nanmean(yvaluesDrugIV(i,:));
    ySDDrugIV(i,1)=nanstd(yvaluesDrugIV(i,:));
end


% errorbar(x,ymeanDrugIV(:,1),2*ySDDrugIV(:,1),'r')
% axis([-150 150 -800 200])
% xlabel('U/mV')
% ylabel('J/(V/s)')
% fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\IV plots';
% saveas(2, fullfile(fpath, 'meanIVDrug.png'));
%% The final plot
 
% figure(1003)
% hold all
% errorbar(xIV,ymeanIV(:,1),2*ySDIV(:,1),'k')
% errorbar(xIVDrug,ymeanDrugIV(:,1),2*ySDDrugIV(:,1),'r')
% axis([-140 120 -900 200])
% xlabel('U/mV')
% ylabel('J/(V/s)')
% saveas(1003, fullfile(fpath, 'meanIVComparison.png'));