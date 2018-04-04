function [parameterValuesAct] = IV_GV_normGV_fits_fitStats(cellsUndrugged,cellsDrugged)


choice=1;   %=1 : undrugged cells, =2 : drugged cells, =3 : all cells
TotalC=13;



   
IV = {};
IV(1) = {importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27')};
IV(2) = {importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B32:AY54')};
%%
parameterValuesAct=NaN(2,5);
for z=1:2
    %% Plots I(V)
    if z==1
        incl=cellsUndrugged; %typically 1,2,3,4,9,12
    end
    if z==2
        incl=cellsDrugged; %typically 1,2
    end
    
    incl=incl-1;                        %adjusting indices
    
    figure
    axis([-140 120 -900 200])
    xlabel('U/mV')
    ylabel('J/(V/s)')
    tempI=NaN(size(IV{z},1),size(IV{z},2));
    for i=0:(TotalC-1)
        if(ismember(i,incl)==0)         %excludes cells to be excluded
            IV{z}(:,2+4*i)=NaN;
            IV{z}(:,1+4*i)=NaN;
        end
        Idens=IV{z}(:,2+4*i);
        tempI(:,i+1)=Idens;
        V=IV{z}(:,1+4*i);
        hold on
        plot(V,Idens)                   %plots peakIdensity(V), all cells
    end
    meantempI=nanmean(tempI(11,:));
    stdtempI=nanstd(tempI(11,:));
    
    hold off
    
    vLevels=23;                         %voltage levels
    ymeanIV=NaN(vLevels,1);             %mean and sd of peakIVdensity/cell
    ySDIV=NaN(vLevels,1);
    yvaluesIV=NaN(vLevels,TotalC);
    xIV=linspace(-120,100,vLevels);
    
    for i=1:vLevels
        for j=0:(TotalC-1)
            yvaluesIV(i,j+1)=IV{z}(i,2+4*j);       %imports pId(V) values
        end                                     %per voltage level
        ymeanIV(i,1)=nanmean(yvaluesIV(i,:));   %mean pId for all cells
        ySDIV(i,1)=nanstd(yvaluesIV(i,:));      %sd pId for all cells
    end
    
    figure                                      %plots mean+-sd for pId
    errorbar(xIV,ymeanIV(:,1),2*ySDIV(:,1),'k')
    axis([-140 120 -900 200])
    xlabel('U/mV')
    ylabel('J/(V/s)')
    
    %% Plots g(V)
    figure
    axis([-140 120 -1 10])
    xlabel('U/mV')
    ylabel('G/s^-1')
    
    gdens=NaN(size(IV{z},1),size(IV{z},2));   %creates matrix for storage of G
    for i=0:(TotalC-1)
        V=10^(-3).*IV{z}(:,1+4*i);
        gdens(:,1+i)=IV{z}(:,2+4*i)./(V-67.77); %calcs G(V) per Vstep,cell
        hold on
        plot(V*10^3,gdens(:,i+1))       %plots G(V) for all cells
    end
    hold off
    
    %% Plots normalized g(V) and fits sigmoids to each curve
    figure
    axis([-140 0 -0.2 1.2])
    for i=0:(TotalC-1)
        V=10^(-3).*IV{z}(:,1+4*i);
        [gdensMax,MaxIndex]=max(gdens(:,i+1));
        for j=MaxIndex+2:length(gdens(:,i+1))
            gdens(j,i+1)=NaN;   %excludes G(V) values too far past max G
            V(j)=NaN;
        end
        gdensMin=min(gdens(:,i+1));
        gdens(:,i+1)=(gdens(:,i+1)-gdensMin)./(gdensMax-gdensMin);
        % ^normalization
        hold on
        plot(V*10^3,gdens(:,i+1))   %plots normalized G(V) per cell
    end
    hold off
    
    %% Performs fits
    ActK=NaN(TotalC,1); %creates vectors for storing k,v,r2 of fits
    ActV=NaN(TotalC,1); % per cell's sigmoid fit
    ActR2=NaN(TotalC,1);
    
    for i=0:(TotalC-1)
        if ismember(i,incl)==1
            V=10^(-3).*IV{z}(:,1+4*i); %scales V to mV
            [sigmoid, gof] = ActSigmoidfitOWN(V*10^3, gdens(1:length(V),i+1));
            ActR2(i+1)=gof.rsquare; %gof, k and v per fit stored
            ActK(i+1)=sigmoid.k;
            ActV(i+1)=sigmoid.vhalf;
        end
    end
    hold off
    
    Act=[ActK,ActV,ActR2]; %summarizing data
    
    
    %% Plots all fitted curves together
        figure
    cla reset
    hold on
    axis([-140 40 -0.2 1.2])
    xlabel('U/mV')
    ylabel('m/unity')
    for i=0:(TotalC-1)  %retrieves fits, plots the sigmoids per cell
        k=ActK(i+1);
        vhalf=ActV(i+1);
        x=linspace(-120,20,1000);
        y=1./(1+exp((x-vhalf)*(-1/k)));
        hold on
        plot(x,y)
    end
    
    vLevels=23;
    ymeanM=NaN(vLevels,1);
    ySDM=NaN(vLevels,1);
    yvaluesM=NaN(vLevels,TotalC);
    
    for i=1:vLevels         %calculates mean,sd of gnorm(V) for each V
        for j=0:(TotalC-1)  
            yvaluesM(i,j+1)=gdens(i,j+1);
        end
        ymeanM(i,1)=nanmean(yvaluesM(i,:));
        ySDM(i,1)=nanstd(yvaluesM(i,:));
    end
    
    %Plots mean values of the curves at each point with standard deviations
    hM=linspace(-120,20,1000);
    
    ActMeank=nanmean(Act(:,1)); %calcs and shows mean k,v and r2-all cells
    ActMeanv=nanmean(Act(:,2));
%     ActMeanr2=nanmean(Act(:,3));
    
    ActSDk=nanmean(Act(:,1));    %calcs and shows sd of k,v, and r2-all cs
    ActSDv=nanmean(Act(:,2));
    n=sum(~isnan(Act(:,1)));
    
    %plots the mean curve
    meanCurveM=1./(1+exp((hM-ActMeanv)*(-1/ActMeank)));
    
    %figure
    %     cla reset
    %     leave commented if average curve and fitted
    %     curves should appear in the same plot

    hold on
    axis([-140 40 -0.2 1.2])
    xlabel('U/mV')
    ylabel('m/unity')
    
    errorbar(V*10^3,ymeanM(:,1),2*ySDM,'sk')
    plot(hM,meanCurveM,'k','LineWidth',2)
    
%     fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
    %     saveas(1, fullfile(fpath, 'mSigmoidOWN.png'));
    
    parameterValuesAct(z,:)=[ActMeanv,ActSDv,ActMeank,ActSDk,n];
    
end




end


% %% Activation curves for drugged cells
% if choice==2 || choice==3
%     TotalC=13;
%     %% Plots I(V)
%     incl=[1,2]; %originally 2,9 % 9 is not durgged
% %     incl=[1:13];            %leave uncommented if you want to test all cells
%     incl=incl-1;
%     figure
%     axis([-140 120 -900 200])
%     xlabel('U/mV')
%     ylabel('J/(V/s)')
%     tempIDrug=NaN(size(IVDrug,1),size(IVDrug,2));
%     for i=0:(TotalC-1)
%         if(ismember(i,incl)==0)
%             IVDrug(:,2+4*i)=NaN;
%             IVDrug(:,1+4*i)=NaN;
%         end
%         IdensDrug=IVDrug(:,2+4*i);
%         tempIDrug(:,i+1)=IdensDrug;
%         V=IVDrug(:,1+4*i);
%         hold on
%         plot(V,IdensDrug)
%     end
%     meantempIDrug=nanmean(tempIDrug(10,:));
%     stdtempIDrug=nanstd(tempIDrug(10,:));
%     gdensDrug=NaN(size(IVDrug,1),size(IVDrug,2));
%     
%     vLevels=23;
%     ymeanIVDrug=NaN(vLevels,1);
%     ySDIVDrug=NaN(vLevels,1);
%     yvaluesIVDrug=NaN(vLevels,TotalC);
%     xIVDrug=linspace(-120,100,vLevels);
%     
%     for i=1:vLevels
%         for j=0:(TotalC-1)
%             yvaluesIVDrug(i,j+1)=IVDrug(i,2+4*j);
%         end
%         ymeanIVDrug(i,1)=nanmean(yvaluesIVDrug(i,:));
%         ySDIVDrug(i,1)=nanstd(yvaluesIVDrug(i,:));
%     end
%     figure
%     errorbar(xIVDrug,ymeanIVDrug(:,1),2*ySDIVDrug(:,1),'r')
%     axis([-150 150 -800 200])
%     xlabel('U/mV')
%     ylabel('J/(V/s)')
%     
%     %% Plots g(V)
%     figure
%     axis([-140 120 -1 10])
%     xlabel('U/mV')
%     ylabel('G/s^-1')
%     maxG=NaN(1,TotalC);
%     for i=0:(TotalC-1)
%         V=10^(-3).*IVDrug(:,1+4*i);
%         gdensDrug(:,1+i)=IVDrug(:,2+4*i)./(V-67.77);
%         hold on
%         plot(V*10^3,gdensDrug(:,i+1))
%         maxG(i+1)=max(gdensDrug(:,i+1));
%     end
%     Gbar=nanmean(maxG);
%     
%     hold off
%     ActKDrug=NaN(TotalC,1);
%     ActVDrug=NaN(TotalC,1);
%     ActR2Drug=NaN(TotalC,1);
%     
%     %plots normalized g(V) and fits sigmoids to each curve
%     figure
%     axis([-140 0 -0.2 1.2])
%     xlabel('U/mV')
%     ylabel('m/unity')
%     for i=0:(TotalC-1)
%         V=10^(-3).*IVDrug(:,1+4*i);
%         [gdensDrugMax,DrugMaxIndex]=max(gdensDrug(:,i+1));
%         for j=DrugMaxIndex+2:length(gdensDrug(:,i+1))
%             gdensDrug(j,i+1)=NaN;
%             V(j)=NaN;
%         end
%         gdensDrugMin=min(gdensDrug(:,i+1));
%         gdensDrug(:,i+1)=(gdensDrug(:,i+1)-gdensDrugMin)./(gdensDrugMax-gdensDrugMin);
%         
% %         for j=DrugMaxIndex+1:length(gdensDrug)
% %             gdensDrug(j,i+1)=NaN;
% %             V(j)=NaN;
% %         end
%         hold on
%         plot(V*10^3,gdensDrug(:,i+1))
%     end
%     hold off
%     
%     %% Performs fits
%     for i=0:(TotalC-1)
%         if ismember(i,incl)==1
%             V=10^(-3).*IVDrug(:,1+4*i);
%             [sigmoid, gof] = ActSigmoidfitOWN(V*10^3, gdensDrug(1:length(V),i+1));
%             ActR2Drug(i+1)=gof.rsquare;
%             ActKDrug(i+1)=sigmoid.k;
%             ActVDrug(i+1)=sigmoid.vhalf;
%         end
%     end
%     hold off
%     
%     ActDrug=[ActKDrug,ActVDrug,ActR2Drug]; %summarizing data
%     
%     
%     %% Plots all fitted curves together
%     figure
%     cla reset
%     hold on
%     axis([-140 40 -0.2 1.2])
%     xlabel('U/mV')
%     ylabel('m/unity')
%     for i=0:(TotalC-1)
%         k=ActKDrug(i+1);
%         vhalf=ActVDrug(i+1);
%         x=linspace(-120,20,1000);
%         y=1./(1+exp((x-vhalf)*(-1/k)));
%         hold on
%         plot(x,y)
%     end
%     
%     ActMeankDrug=nanmean(ActDrug(:,1));
%     ActMeanvDrug=nanmean(ActDrug(:,2));
%     ActMeanr2Drug=nanmean(ActDrug(:,3));
%     
%     vLevels=23;
%     ymeanMDrug=NaN(vLevels,1);
%     ySDMDrug=NaN(vLevels,1);
%     yvaluesMDrug=NaN(vLevels,TotalC);
%     
%     for i=1:vLevels
%         for j=0:(TotalC-1)
%             yvaluesMDrug(i,j+1)=gdensDrug(i,j+1);
%         end
%         ymeanMDrug(i,1)=nanmean(yvaluesMDrug(i,:));
%         ySDMDrug(i,1)=nanstd(yvaluesMDrug(i,:));
%     end
%     
%     %Plots mean values of the curves at each point with standard deviations
%     hM=linspace(-120,20,1000);
%     meanCurveMDrug=1./(1+exp((hM-ActMeanvDrug)*(-1/ActMeankDrug)));
% 
%     %figure
%     %cla reset
%     %     leave commented if average curve and fitted
%     %     curves should appear in the same plot
%     
%     hold on
%     axis([-140 40 -0.2 1.2])
%     xlabel('U/mV')
%     ylabel('m/unity')
%     
%     errorbar(V*10^3,ymeanMDrug(:,1),2*ySDMDrug,'dr')
%     plot(hM,meanCurveMDrug,'r','LineWidth',2)
%     
%     fpath = 'C:\Users\Alexander\Desktop\NEURONProjects\CompNeuroProject\CompNeuroProject\data extraction\gating variable plots';
%     %     saveas(1, fullfile(fpath, 'mSigmoidDrugOWN.png'));
% end
%% The final plot
% if choice==3
    
%     figure
%     cla reset
%     hold on
%     axis([-150 150 -800 200])
%     
%     errorbar(xIV,ymeanIV(:,1),2*ySDIV(:,1),'k')
%     errorbar(xIVDrug,ymeanIVDrug(:,1),2*ySDIVDrug(:,1),'r')
%     
%     xlabel('U/mV')
%     ylabel('J/(V/s)')
%     
%     figure
%     cla reset
%     hold on
%     axis([-140 40 -0.2 1.2])
%     xlabel('U/mV')
%     ylabel('m/unity')
%     
%     errorbar(V*10^3,ymeanM(:,1),2*ySDM,'sk')
%     plot(hM,meanCurveM,'k','LineWidth',2)
%     
%     errorbar(V*10^3,ymeanMDrug(:,1),2*ySDMDrug,'dr')
%     plot(hM,meanCurveMDrug,'r','LineWidth',2)
%     
%     
% end

