%% Equations and values are taken from:
% Golomb et al. 
% “Mechanisms of firing patterns in fast-spiking cortical interneurons”
% PLoS Computational Biology, Vol. 3, e156, 2007.

clear

%% Define a functionhandle for a sigmoid function 
sigm = @(V_half,slope,V) 1./(1 + exp(-(V - V_half)/slope));

%% Sodium current
% Function handle for asymptotic value of m (Eq. 8)
theta_m = -26; % mV         %originally -26
sigma_m = 11.5; % mV        %originally 11.5
m_inf = @(V) sigm(theta_m,sigma_m,V);

% Function handle for asymptotic value of h (Eq. 9)
theta_h = -58.3; % mV       %originally -58.3
sigma_h = -6.7; % mV        %originally -6.7
h_inf = @(V) sigm(theta_h,sigma_h,V);

% Function handle for time constant of m (Eq. 10 adapted) Include this
%when building own model
theta_tau_m = -60; % mV     %originally -60
sigma_tau_m = -12; % mV     %originally -12
tau_m = @(V) 0.5 + 14*sigm(theta_tau_m,sigma_tau_m,V);

% Function handle for time constant of h (Eq. 10)
theta_tau_h = -60; % mV     %originally -60
sigma_tau_h = -12; % mV     %originally -12
tau_h = @(V) 0.5 + 14*sigm(theta_tau_h,sigma_tau_h,V);

% Maximum conductance and equilibrium voltage
g_Na = 112.5; % mS/cm^2     %originally 112.5
V_Na = 50; % mV             %originally 50

% Function handle for conductance (used only for plotting)
g_Na_func = @(h,V) g_Na*m_inf(V).^3.*h;
% Function handle for current (Eq. 6)
I_Na_func = @(h,V) g_Na*m_inf(V).^3.*h.*(V - V_Na);

% Plot m_inf, h_inf as well as tau_m and tau_h over voltage
V = -100:1:50;
% figure;

% subplot(211);
% [AX,H1,H2] = plotyy(V,tau_m(V),V,m_inf(V));
% H1.LineStyle = ':';
% H1.Color = 'k';
% H2.Color = 'k';
% AX(1).YColor = 'k';
% AX(2).YColor = 'k';
% AX(1).YLabel.String = 'Time constant \tau_m (ms)';
% AX(2).YLabel.String = 'm_\infty';
% xlabel('Voltage (mV)');
% legend({'\tau_m' 'm_\infty'});
% xlabel('Voltage (mV)');
% legend({'\tau_m' 'm_\infty'});

figure
[AX,H1,H2] = plotyy(V,tau_h(V),V,h_inf(V));
H1.LineStyle = ':';
H1.Color = 'k';
H2.Color = 'k';
AX(1).YColor = 'k';
AX(2).YColor = 'k';
AX(1).YLabel.String = 'Time constant \tau_h (ms)';
AX(2).YLabel.String = 'h_\infty';
xlabel('Voltage (mV)');
legend({'\tau_h' 'h_\infty'});

%% Voltage-clamp protocol for sodium channel
% Time step delta [ms] with which the differential equation for h is going
% to be evaluated
delta = .1; % ms
% Define how to clamp the membrane potential:
% 10 ms at -80 mV, 100 ms at 0 mV and again 10 ms at -80 mV
HoldingPotential = -80; % mV
VoltageStep = 0; % mV
T = [10 100 10]; % ms
V = [repmat(HoldingPotential,T(1)/delta,1);...
     repmat(VoltageStep,T(2)/delta,1);...
     repmat(HoldingPotential,T(3)/delta,1)];
% Allocate a vector for the gating variable h
h = nan(sum(T)/delta,1);
% Put inial value of h to the asymptotic value at V1
h(1) = h_inf(HoldingPotential);
% Euler method for solving Eq. 7
for i = 1:numel(h)-1
    h(i+1) = h(i) + delta*(h_inf(V(i)) - h(i))/tau_h(V(i));
end

%% Plotting
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
[AX,H1,H2] = plotyy(t,h,t,g_Na_func(h,V));
hold(AX(1),'on');
plot(t,m_inf(V),'k');
H1(1).Color = 'k';
H1(1).LineStyle = ':';
H2.Color = 'k';
H2.LineWidth = 1.5;
AX(1).YColor = 'k';
AX(2).YColor = 'k';
AX(1).YLabel.String = 'n';
AX(2).YLabel.String = 'g_{Na} (mS/cm^2)';
AX(1).YLim = [0 1.1];
xlabel('Time (ms)');
legend({'h' 'm_\infty' 'g_{Na}'});
subplot(313);
plot(t,I_Na_func(h,V),'k');
xlabel('Time (ms)');
ylabel('I_{Na} (\muA)');
