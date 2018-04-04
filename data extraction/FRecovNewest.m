function [FRecovMeanTau1,FRecovSDTau1] = FRecovNewest(cellsUndrugged,cellsDrugged)
%initiate constants
TotalC=7;              %total nr of cells
lsPts=90000;
meanCurveTauH=NaN(lsPts,2);%stores m-curves based on Vhalf and k of all cells
FRecovMeanTau1=NaN(2,1);
FRecovSDTau1=NaN(2,1);

tLevels=14;                         %nr of dt levels
ymeanTau=NaN(tLevels,2);             %stores the mean I2/I2max values at each dt-level
ySDTau=NaN(tLevels,2);               %stores the SD of the I2/I2max values at each dt-level

frecov = {};                %imports data
%New data
%On PC
% frecov(1)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B4:AA31')};
% frecov(2)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'FRecov','B36:AA49')};

%On Server
frecov(1)={importfile('/srv/data/Analysis/LundbeckModelling/IV_recov.xlsx', 'FRecov','B4:AA31')};
frecov(2)={importfile('/srv/data/Analysis/LundbeckModelling/IV_recov.xlsx', 'FRecov','B36:AA49')};

%%
for z=1:2               %loops over both conditions (pre/post drug)
    
    if z==1                     %choose which cells to include
        incl=cellsUndrugged;
    end
    if z==2
        incl=cellsDrugged;
    end
    incl=incl-1;                %adjusting indices
    
    for i=0:(TotalC-1)
        if(ismember(i,incl)==0)         %excludes cells to be excluded
            frecov{z}(:,2+4*i)=NaN;
            frecov{z}(:,1+4*i)=NaN;
        end                             %normalizes curves so max=1
        frecov{z}(:,1+4*i)=frecov{z}(:,1+4*i)./max(frecov{z}(:,1+4*i));
    end
    
    tau1=NaN(TotalC,1);
    AStore=NaN(TotalC,1);
    
    FRecovR2=NaN(TotalC,1);
    
    % Produces a fit to the recovery/dt curves for each cell. Stores the time
    % constants and gof measure in vectors
    for i=0:(TotalC-1)
        if ismember(i,incl)==1
            x=frecov{z}(:,2+4*i);
            y=frecov{z}(:,1+4*i);
            [monoexp, gof] = FastTauFitMonoExpNewest(x, y);
            tau1(i+1)=monoexp.tau1;
            AStore(i+1)=monoexp.A1;
            
            FRecovR2(i+1)=gof.rsquare;
        end
    end
    
    Taus=[tau1,tau1,AStore,FRecovR2];          %Stores all vectors in a matrix
    
    FRecovMeanTau1(z,1)=nanmean(Taus(:,1));  %Calculates the mean of Tau1
    FRecovSDTau1(z,1)=nanstd(Taus(:,1));     %Calculates the SD of Tau1
    AStoremean=nanmean(Taus(:,3));      %Calculates the mean of A
    yvaluesTau=NaN(tLevels,TotalC);        %Stores all the I/I2max values
    
    for i=1:tLevels
        for j=0:(TotalC-1)
            yvaluesTau(i,j+1)=frecov{z}(i,1+4*j);
        end
        ymeanTau(i,z)=nanmean(yvaluesTau(i,:));
        ySDTau(i,z)=nanstd(yvaluesTau(i,:));
    end
    
    hTau=linspace(0.9,9000,lsPts);     %Generates a vector to plot the fitted curve against
    ATau=AStoremean;                   %Retrieves the means of the constants retrieved from each cell
    tau1=FRecovMeanTau1(z,1);
    
    meanCurveTauH(:,z)=ATau*(1-exp(-log(hTau)./tau1))+(1-ATau);
    
    figure
    hAx=axes;                       %Plots I2/I2max on a logscale
    hAx.XScale='log';
    hold all
    plot(hTau,meanCurveTauH(:,z))
    
    
    errorbar(frecov{1}(1:14,2),ymeanTau(:,z),2*ySDTau(:,z),'.k')
    axis([0.1 100000 0 1.2])
    xlabel('dt/ms')
    ylabel('P_2/P_{2, Max} (/unity)')
end

%% The final plot


figure
hAx=axes;                       %Plots I2/I2max on a logscale
hAx.XScale='log';
hold all
errorbar(frecov{1}(1:14,2),ymeanTau(:,1),2*ySDTau(:,1),'sk')
errorbar(frecov{2}(1:14,2),ymeanTau(:,2),2*ySDTau(:,2),'dr')
plot(hTau,meanCurveTauH(:,1),'r')
plot(hTau,meanCurveTauH(:,2),'k')

axis([0.1 100000 0 1.2])
xlabel('dt/ms')
ylabel('P_2/P_{2, Max} (/unity)')

end
