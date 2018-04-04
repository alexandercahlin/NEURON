% Charging and discharging curves for a patch of passive membrane
% http://courses.cs.washington.edu/courses/cse590rr/03au/homework3.html
% R Rao Aug 1999

% Clean up workspace
clear

%% Section 1: Settings
% Time step delta [ms] with which the differential equation
%                    dV/dt = - (V-E_L)/RC + I/C
% is evaluated
delta = 0.2;
% Run calculations from t = 0 ms up to t = tstop [ms]
tstop = 150;
% Time axis
t = 0:delta:tstop;
% Number of time steps
Nt = numel(t);

% Capacitance [nF] (default: 0.5 nF) and 
% leak resistance [M ohms] (default: 10 M ohms)
C = 0.5;
R = 10;

% update values
R = R*10;
C = C/10;


% Reversal potential for leak current (i.e., equilibrium potential) [mV]
E_L = -60;

%% Section 2: Define the input current
% Input current [nA]
I_const = 10;
% Time after which the constant input current will be turned off [ms]
t_off = 90;
% Define input current
I = zeros(Nt,1);
I(t < t_off) = I_const;

%% Section 3: Compute changes in membrane potential due to input current
% Allocate a vector for the membrane potential (V = 0 mV at all times)
V = zeros(Nt,1);
% Put inial value of the membrane potential to E_L
% (Note that in MATLAB, all indexing is “1-based”. For instance the first
%  element of the time-vector, t(1), corresponds to 0 ms, and V(1) 
%  corresponds to the membrane voltage at time t(1) = 0 ms.)
V(1) = E_L;

% Evaluate dV/dt = - (V-E_L)/RC + I/C
for i = 2:Nt
    % Euler method: V(t+delta) = V(t) + delta*dV/dt
    V(i) = V(i-1) + delta*(-(V(i-1)-E_L)/(R*C) + I(i-1)/C);
end

%% Section 4: Plot results
figure('Name','The passive membrane');
% Plot input current over time
subplot(411);
plot(t,I);
ylabel('Input current (nA)');
axis([0 tstop 1.1*min(I) 1.1*max(I)])
% Plot membrane potential over time
subplot(4,1,2:4);
plot(t,V);
xlabel('Time (ms)');
ylabel('Membrane potential (mV)');
xlim([0 tstop])

  
