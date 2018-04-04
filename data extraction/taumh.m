% function [tausfuncUndr,tausfuncDr] = taumh(cellsUndrugged,cellsDrugged)
%initiate constants
% TotalC=7;              %total nr of cells
% lsPts=90000;


% if exist('taudata','var') == 0
%     taudata = {};                %imports data
    
    %New data
    %On PC
    % frecov(1)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B4:AA31')};
    % frecov(2)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B36:AA49')};
    
    %On Server
%     taudata(1)={importfile('/srv/data/Analysis/LundbeckModelling/It.xlsx', 'Predrug','A2:LK6251')};
%     taudata(2)={importfile('/srv/data/Analysis/LundbeckModelling/It.xlsx', 'Postdrug','A2:LK6251')};
% end
if exist('taudata','var')==0
load('taudata.mat')

end
start=1200;
finish=1400;
for z=1:2
    t=taudata{z}(:,1);
    for i=1:length(t)
        if t(i,1)>1
            t(i,1)=t(i,1)*10^-3;
        end
    end
    
    nTraces=(size(taudata{z},2)-1)/2;
    AOIt=t(start:finish);
    
    
%     figure
    AOII=NaN(length(AOIt),nTraces);
    AOIV=NaN(length(AOIt),nTraces);
    stepV=NaN(1,nTraces);
    for i=1:nTraces %normally nTraces
         AOII(:,i)=taudata{z}(start:finish,1+2*i);
         AOIV(:,i)=taudata{z}(start:finish,2+2*(i-1));
         stepV(1,i)=max(AOIV(:,i));
         if -0.001<stepV(1,i)<0.001
             stepV(1,i)=0;
         end
        hold on
%         plot(AOIt,AOII(:,i))
    end
    
    %Plot per cell
    vSteps=23;
    nCells=7;
    
%     for i=1:nCells
%         figure(i)
%         for j=1:vSteps
%         plot(AOIt,AOII(:,23*(i-1)+j))
%         hold on
%         end
%         hold off
%     end
    
    %per voltage
    for i=1:vSteps
        figure(100+i)
        for j=1:nCells
            plot(AOIt,AOII(:,23*(j-1)+i))
            hold on
        end
        hold off
    end
        
        
    
    
%     yTestNorm=-1*yTest/max(yTest);
%     tTest=AOIt(1:500);
  
    tauMstore=NaN(nTraces,2);
    tauHstore=NaN(nTraces,2);
    for j=1:nTraces
        
            tauMstore(j,2)=max(AOIV(:,j));
            tauHstore(j,2)=max(AOIV(:,j));
            
    end
        
%     
    for i=1:nTraces %normally nTraces
       
        x=(AOIt-AOIt(1))*10^3;
        y=-1*abs(AOII(:,i))/max(abs(AOII(:,i)));
        temp=diff(y);
        weights=abs([temp;temp(end)]);
        [tauh, gof]=tauHlatest(x,y,weights); %changes made here
        tauHstore(i,1)=tauh.tauh;
    
    end
figure

plot(tauHstore(:,2),tauHstore(:,1),'*');
ylabel('tauH/ms')
end
% code for comparisons