%% Equations and values are taken from:
% Golomb et al. 
% “Mechanisms of firing patterns in fast-spiking cortical interneurons”
% PLoS Computational Biology, Vol. 3, e156, 2007.

clear

%% Define a functionhandle for a sigmoid function 
sigm = @(V_half,slope,V) 1./(1 + exp(-(V - V_half)/slope));

%% Potassium current
% Function handle for asymptotic value of n (Eq. 13)
theta_n = -12.4; % mV   (you may change this parameter)
sigma_n = 6.8;   % mV   (you may change this parameter)
n_inf = @(V) sigm(theta_n,sigma_n,V);
% Function handle for time constant of n (Eq. 14)
theta_tau_n1 = -14.6; % (you may change this parameter)
sigma_tau_n1 = -8.6;  % (you may change this parameter)
theta_tau_n2 = 1.3;   % (you may change this parameter)
sigma_tau_n2 = 18.7;  % (you may change this parameter)
tau_n = @(V) (0.087 + 11.4*sigm(theta_tau_n1,sigma_tau_n1,V)) .* ...
             (0.087 + 11.4*sigm(theta_tau_n2,sigma_tau_n2,V));
% Maximum conductance and equilibrium voltage (leave unchanged!)
g_Kdr = 225; % mS/cm^2
V_K = -90; % mV
% Function handle for conductance (used only for plotting)
g_Kdr_func = @(n)   g_Kdr*n.^2;
% Function handle for current (Eq. 11)
I_Kdr_func = @(n,V) g_Kdr*n.^2.*(V - V_K);

%% Plot n_inf and tau_n over voltage
V = -100:1:50;
figure;
[AX,H1,H2] = plotyy(V,tau_n(V),V,n_inf(V));
H1.LineStyle = ':';
H2.Color = H1.Color;
AX(1).YColor = 'k';
AX(2).YColor = 'k';
AX(1).YLabel.String = 'Time constant \tau_n (ms)';
AX(2).YLabel.String = 'n_\infty';
xlabel('Voltage (mV)');
legend({'\tau_n' 'n_\infty'});

%% Voltage-clamp protocol for the activation kinetics of the channel
%  (See Boddum et al. Fig. 3A to the left)
% Time step delta [ms] with which the differential equation for n is going
% to be evaluated
delta = .1; % ms
% Define how to clamp the membrane potential:
% 10 ms at -80 mV, 100 ms at 0 mV and 10 ms at -80 mV
HoldingPotential = -80; % mV
VoltageStep = 0; % mV
T = [10 100 10]; % ms
V = [repmat(HoldingPotential,T(1)/delta,1);...
     repmat(VoltageStep,T(2)/delta,1);...
     repmat(HoldingPotential,T(3)/delta,1)];
% Allocate a vector for the gating variable n
n = nan(sum(T)/delta,1);
% Put inial value of n to the asymptotic value at V1
n(1) = n_inf(HoldingPotential);
% Euler method for solving Eq. 12
for i = 1:numel(n)-1
    n(i+1) = n(i) + delta*(n_inf(V(i)) - n(i))/tau_n(V(i));
end

% Define time axis for plotting
t = (0:delta:(numel(V)-1)*delta)';
% Plot
figure;
subplot(311);
plot(t,V,'k');
xlabel('Time (ms)');
ylabel('Voltage (mV)');
title('Voltage clamp');
subplot(312);
[AX,H1,H2] = plotyy(t,n,t,g_Kdr_func(n));
H1.LineStyle = ':';
H2.Color = H1.Color;
H2.LineWidth = 1;
AX(1).YColor = 'k';
AX(2).YColor = 'k';
AX(1).YLabel.String = 'n';
AX(2).YLabel.String = 'g_{Kdr} (mS/cm^2)';
AX(1).YLim = [0 1.1];
xlabel('Time (ms)');
legend({'n' 'g_{Kdr}'});
subplot(313);
plot(t,I_Kdr_func(n,V));
xlabel('Time (ms)');
ylabel('I_{Kdr} (\muA)');

