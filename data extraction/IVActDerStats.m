function [parameterValuesAct,Ichange,stdIchange] = IVActDerStats(cellsUndrugged,cellsDrugged)
parameterValuesAct=NaN(2,5);    %Create "results" vector
%initiate constants
TotalC=13;              %total nr of cells
vLevels=23;             %voltage levels
vRev=67.8;              %reversal potential, Na

meantempI=NaN(2,1);     %mean of peak current change factor
stdtempI=NaN(2,1);      %sd of ...

ymeanIV=NaN(vLevels,2); %mean of peak current at each Vstep over all cells
ySDIV=NaN(vLevels,2);   %sd of ...

ymeanM=NaN(vLevels,2);  %stores mean M-points for comparison pre/post drug
ySDM=NaN(vLevels,2);    %stores sd ...

lsPts=1000;             %resolution for m-curve
meanCurveM=NaN(lsPts,2);%stores m-curves based on Vhalf and k of all cells

IV = {};                %imports data

%New data
% IV(1)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'IV','B4:AA26')};
% IV(2)={importfile('C:\Users\Alexander\Desktop\IV_recov.xlsx', 'IV','B28:AA50')};

%Old data
IV(1)={importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27')};
IV(2)={importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B32:AY54')};

for z=1:2               %loops over both conditions (pre/post drug)
    %% Plots I(V)
    if z==1                     %choose which cells to include
        incl=cellsUndrugged;    %typically 1,2,3,4,9,12
    end
    if z==2
        incl=cellsDrugged;      %typically 1,2
    end
    incl=incl-1;                %adjusting indices
    
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
        Idens=IV{z}(:,2+4*i);           %selects "leftover" Idens
        tempI(:,i+1)=Idens;             %adjusts indices
        V=IV{z}(:,1+4*i);               %selects voltages
        hold on
        plot(V,Idens)                   %plots peakIdensity(V), all cells
    end
    hold off
    
    xIV=linspace(-120,100,vLevels);     %creates Vstep vec for plot below
    yvaluesIV=NaN(vLevels,TotalC);      %stores all cells' Idens per Vstep
    
    for i=1:vLevels
        for j=0:(TotalC-1)
            yvaluesIV(i,j+1)=IV{z}(i,2+4*j);    %imports pId(V) values
        end                                     %per voltage level
        ymeanIV(i,z)=nanmean(yvaluesIV(i,:));   %mean pId for all cells
        ySDIV(i,z)=nanstd(yvaluesIV(i,:));      %sd pId for all cells
    end
    
    figure                                      %plots mean+-sd for pId
    errorbar(xIV,ymeanIV(:,z),2*ySDIV(:,z),'k')
    axis([-140 120 -900 200])
    xlabel('U/mV')
    ylabel('J/(V/s)')
    
    %% Plots g(V)
    figure
    axis([-140 120 -1 10])
    xlabel('U/mV')
    ylabel('G/s^-1')
    
    gdens=NaN(size(IV{z},1),size(IV{z},2));%creates matrix for storage of g
    for i=0:(TotalC-1)
        V=10^(-3).*IV{z}(:,1+4*i);
        gdens(:,1+i)=IV{z}(:,2+4*i)./(V-vRev); %calcs g(V) per Vstep,cell
        hold on
        plot(V*10^3,gdens(:,i+1))       %plots g(V) for all cells
    end
    hold off
    
    %% Plots normalized g(V) per cell
    figure
    axis([-140 0 -0.2 1.2])
    for i=0:(TotalC-1)
        V=10^(-3).*IV{z}(:,1+4*i);  %retrieves Vsteps per cell
        [gdensMax,MaxIndex]=max(gdens(:,i+1));  %calcs max for norm
        for j=MaxIndex+2:length(gdens(:,i+1))
            gdens(j,i+1)=NaN;   %excludes G(V) values too far past max G
            V(j)=NaN;           %removes associated V
        end
        gdensMin=min(gdens(:,i+1)); %calcs min for norm
        gdens(:,i+1)=(gdens(:,i+1)-gdensMin)./(gdensMax-gdensMin);
        % performs normalization
        hold on
        plot(V*10^3,gdens(:,i+1))   %plots norm-g(V) per cell
    end
    hold off
    
    yvaluesM=NaN(vLevels,TotalC);   %matrix storing norm-g values per V
    
    for i=1:vLevels         %calculates mean,sd of norm-g(V) for each V
        for j=0:(TotalC-1)
            yvaluesM(i,j+1)=gdens(i,j+1);
        end
        ymeanM(i,z)=nanmean(yvaluesM(i,:));
        ySDM(i,z)=nanstd(yvaluesM(i,:));
    end
    
    %% Performs Boltzmann fits to each cell, extracts k and Vhalf per cell
    ActK=NaN(TotalC,1); %creates vectors for storing k of fits
    ActV=NaN(TotalC,1); %v
    ActR2=NaN(TotalC,1);%r2
    
    for i=0:(TotalC-1)
        if ismember(i,incl)==1
            V=10^(-3).*IV{z}(:,1+4*i); %scales V to mV
            %perform fit, extract gof values
            [sigmoid, gof] = ActSigmoidfitOWN(V*10^3, gdens(1:length(V),i+1));
            ActR2(i+1)=gof.rsquare; %gof per fit stored
            ActK(i+1)=sigmoid.k;    %k
            ActV(i+1)=sigmoid.vhalf;%vhalf
        end
    end
    hold off
    
    Act=[ActK,ActV,ActR2]; %summarizing fit data in a matrix
    
    
    %% Plots all Boltzmann fits together
    figure
    cla reset
    hold on
    axis([-140 40 -0.2 1.2])
    xlabel('U/mV')
    ylabel('m/unity')
    
    x=linspace(-120,20,1000);
    for i=0:(TotalC-1)  %retrieves fits, plots the sigmoids per cell
        y=1./(1+exp((x-ActV(i+1))*(-1/ActK(i+1))));
        hold on
        plot(x,y)
    end
    
    %% Plots the mean fitted curve based on cells' k and Vhalf
    hM=linspace(-120,20,lsPts);
    
    ActMeank=nanmean(Act(:,1)); %calcs mean k of all cells
    ActMeanv=nanmean(Act(:,2)); %Vhalf
    
    ActSDk=nanstd(Act(:,1));    %calcs sd of k of all cells
    ActSDv=nanstd(Act(:,2));    %Vhalf
    n=sum(~isnan(Act(:,1)));    %calcs nr of cells used (for stats)
    
    %creates mean curve based on all cells' k and Vhalf
    meanCurveM(:,z)=1./(1+exp((hM-ActMeanv)*(-1/ActMeank)));
    
    %     leave commented if average curve and fitted
    %     curves should appear in the same plot
    %figure
    %cla reset
    
    hold on
    axis([-140 40 -0.2 1.2])
    xlabel('U/mV')
    ylabel('m/unity')
    
    %plots mean+-sd for norm-g(V) for each Vstep
    errorbar(V*10^3,ymeanM(:,z),2*ySDM(:,z),'sk')
    %plots mean fitted sigmoid based on all cells' k and Vhalf
    plot(hM,meanCurveM(1,z),'k','LineWidth',2)
    
    %Stores useful values in a vector for use in modeling
    parameterValuesAct(z,:)=[ActMeanv,ActSDv,ActMeank,ActSDk,n];
    
    meantempI(z,1)=nanmean(tempI(11,:));    %stores peakI
    stdtempI(z,1)=nanstd(tempI(11,:));      %stores sd 
    
end
%% Compares pre/post-drug results
%calcs mean+-sd change in peakI pre/post drug
Ichange=meantempI(2,1)/meantempI(1,1);      
stdIchange=stdtempI(2,1)/meantempI(1,1);

figure
cla reset
hold on
axis([-150 150 -800 200])

% Plots the mean+-sd of the i(V) for all Vsteps for all cells
errorbar(xIV,ymeanIV(:,1),2*ySDIV(:,1),'k')
errorbar(xIV,ymeanIV(:,2),2*ySDIV(:,2),'r')


xlabel('U/mV')
ylabel('J/(V/s)')

figure
cla reset
hold on
axis([-140 40 -0.2 1.2])
xlabel('U/mV')
ylabel('m/unity')

%Plots the mean+-sd of the norm-g(V) for all Vsteps for all cells
%with the mean fitted curves
errorbar(V*10^3,ymeanM(:,1),2*ySDM(:,1),'sk')
plot(hM,meanCurveM(:,1),'k','LineWidth',2)

errorbar(V*10^3,ymeanM(:,2),2*ySDM(:,2),'dr')
plot(hM,meanCurveM(:,2),'r','LineWidth',2)

end

