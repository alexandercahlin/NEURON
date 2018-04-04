IV = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'IV','B5:AY27');
TotalC=13;


Gbar=zeros(13,1);
indexvec=zeros(TotalC,1);
%%
%Plots G_Na(V)
% for i=0:(TotalC-1)
%     Vdrive=10^(-3).*IV(:,1+4*i)-0.06777; %calculates the driving force in V
%     I=IV(:,2+4*i);
%     %y=y*7.4*10^(-12);          %temporary assumption that a cell has C = 7.4 pF (calculated using given current trace)
%     Ginf=zeros(length(I(:,1)),2);  %vector for storing conductance for a voltage step for a cell
%     for j=1:length(I(:,1))
%         Ginf(j,2)=I(j)./Vdrive(j);      %calculating conductance=I/(V-Vrev) normalized per cell capacitance
%         Ginf(j,1)=Vdrive(j);            %storing given holding potential
%         %         if abs(x(j))<0.010      %removes the "false peak" at 0 V (Matlab uses float, the conductance becomes 10^10
%         %             Ginf(j,2)=0;
%         %         end
%     end
%
%     hold on
%     %axis([-0.15 0.15 0 1*10^11])
%     plot (Ginf(:,1),Ginf(:,2))
%     Gbar(i+1,1)=max(Ginf(:,2));    %stores the largest conductance for the given cell
% end

meanGbar=mean(Gbar);                %%mean of Gbar for all cells in S normalized by each cell's capacitance



