%% Equations and values are taken from:
% Golomb et al. 
% “Mechanisms of firing patterns in fast-spiking cortical interneurons”
% PLoS Computational Biology, Vol. 3, e156, 2007.

clear

%% Define a functionhandle for a sigmoid function 
sigm = @(V_half,slope,V) 1./(1 + exp(-(V - V_half)/slope));

%% Potassium current
% Function handle for asymptotic value of n (Eq. 13)
theta_n = -12.4; % mV
sigma_n = 6.8; % mV
n_inf = @(V) sigm(theta_n,sigma_n,V);
% Function handle for time constant of n (Eq. 14)
theta_tau_n1 = -14.6;
sigma_tau_n1 = -8.6;
theta_tau_n2 = 1.3;
sigma_tau_n2 = 18.7;
tau_n = @(V) (0.087 + 11.4*sigm(theta_tau_n1,sigma_tau_n1,V)) .* ...
             (0.087 + 11.4*sigm(theta_tau_n2,sigma_tau_n2,V));
% Maximum conductance and equilibrium voltage
g_Kdr = 225; % mS/cm^2
V_K = -90; % mV
% Function handle for conductance (used only for plotting)
g_Kdr_func = @(n)   g_Kdr*n.^2;
% Function handle for current (Eq. 11)
I_Kdr_func = @(n,V) g_Kdr*n.^2.*(V - V_K);

%% Sodium current
% Function handle for asymptotic value of m (Eq. 8)
theta_m = -26; % mV
sigma_m = 11.5; % mV
m_inf = @(V) sigm(theta_m,sigma_m,V);
% Function handle for asymptotic value of h (Eq. 9)
theta_h = -58.3; % mV
sigma_h = -6.7; % mV
h_inf = @(V) sigm(theta_h,sigma_h,V);
% Function handle for time constant of h (Eq. 10)
theta_tau_h = -60; % mV
sigma_tau_h = -12; % mV
tau_h = @(V) 0.5 + 14*sigm(theta_tau_h,sigma_tau_h,V);
% Maximum conductance and equilibrium voltage
g_Na = 112.5; % mS/cm^2
V_Na = 50; % mV
% Function handle for conductance (used only for plotting)
g_Na_func = @(h,V) g_Na*m_inf(V).^3.*h;
% Function handle for current (Eq. 6)
I_Na_func = @(h,V) g_Na*m_inf(V).^3.*h.*(V - V_Na);

%% Current injection protocol
% Settings for the passive membrane: capacitance and leak current parameters
%  (stated below Eq. 5)
C = 1; % uF/cm^2
g_L = 0.25; % mS/cm^2
V_L = -70; % mV

% Time step delta [ms] with which the differential equation for V is going
% to be evaluated
delta = .01; % ms
% Inject current I1 uA for T1 ms, followed by current I2 uA for T2 ms
I1 = 0; % uA
T1 = 100; % ms
I2 = 3.35; % uA
T2 = 900; % ms
I = [I1*ones(T1/delta,1);I2*ones(T2/delta,1)];
% Allocate vectors for the membrane potential and gating variables n and h
V = nan((T1+T2)/delta,1);
n = nan((T1+T2)/delta,1);
h = nan((T1+T2)/delta,1);
% Define initial values
V(1) = V_L;
n(1) = n_inf(V(1));
h(1) = h_inf(V(1));
% Allocate vectors for the sodium, potassium and leak current
I_Na = nan(numel(V),1);
I_Kdr = nan(numel(V),1);
I_L = nan(numel(V),1);

% Euler method for solving Eqs. 5, 7 and 12
for i = 1:numel(I)-1
    % Compute currents at time step i
    I_Na(i) = I_Na_func(h(i),V(i));
    I_Kdr(i) = I_Kdr_func(n(i),V(i));
    I_L(i) = g_L*(V(i) - V_L);
    % Right-hand side (RHS) of Eq. 5
    RHS = -I_Na(i) -I_Kdr(i) -I_L(i) +I(i);
    % Euler method for solving Eqs. 5, 7 and 12
    V(i+1) = V(i) + delta*RHS/C;
    h(i+1) = h(i) + delta*(h_inf(V(i)) - h(i))/tau_h(V(i));
    n(i+1) = n(i) + delta*(n_inf(V(i)) - n(i))/tau_n(V(i));
end

% Define time axis for plotting
t = (0:delta:(numel(V)-1)*delta)';
figure;
subplot(411);
plot(t,I,'k');
xlabel('Time (ms)');
ylabel('Injected current (\uA)');
title('Current injection protocol');
subplot(412);
H = plot(t,[m_inf(V) h n]);
H(1).Color = 'k';
H(2).Color = 'k';
H(2).LineStyle = ':';
H(3).Color = [0 0.4470 0.7410];
xlabel('Time (ms)');
ylabel('Gating variables');
ylim([0 1.1]);
legend({'m_\infty' 'h' 'n'});
subplot(413);
plot(t,[I_Na I_Kdr I_L]);
xlabel('Time (ms)');
ylabel('Current (\muA)');
legend({'I_{Na}' 'I_{Kdr}' 'I_L'});
subplot(414);
plot(t,V);
xlabel('Time (ms)');
ylabel('Voltage (mV)');
