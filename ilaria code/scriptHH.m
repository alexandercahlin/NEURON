%%% Time - Voltage
t=0:0.0001:16 ;
figure
plot(t,Volt(t),'x')
xlabel('time t')
ylabel('Voltage (mV)')
title('Time - Voltage')
%%%%%%%%%%%%%%%%%%%%%%%

%%% Voltage - minf
figure
plot(Volt(t),minf(Volt(t)),'x',Volt(t),minf(Volt(t)),'r')
xlabel('Voltage (mV)')
title('Voltage - minf')
%%%%%%%%%%%%%%%%%%%%%%%

%%% Voltage - hinf
figure
plot(Volt(t),hinf(Volt(t)),'x',Volt(t),hinf(Volt(t)),'g')
xlabel('Voltage (mV)')
title('Voltage - hinf')
%%%%%%%%%%%%%%%%%%%%%%%

%%% Voltage - mtau
figure
plot(Volt(t),mtau(Volt(t)),'x',Volt(t),mtau(Volt(t)),'r')
xlabel('Voltage (mV)')
title('Voltage - mtau')
%%%%%%%%%%%%%%%%%%%%%%%

%%% Voltage - htau
figure
plot(Volt(t),htau(Volt(t)),'x',Volt(t),htau(Volt(t)),'g')
xlabel('Voltage (mV)')
title('Voltage - htau')
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Solving the differential equations %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u0=[minf(Volt(0));hinf(Volt(0))];

F=@(t,u) [(minf(Volt(t))-u(1))/mtau(Volt(t));...
    (hinf(Volt(t))-u(2))/htau(Volt(t))];

opts=odeset('RelTol',1e-9,'AbsTol',1e-9);
[T1,U1]=ode45(F,[0,16],u0);
[T2,U2]=ode23s(F,[0,16],u0);
[T3,U3]=ode15s(F,[0,16],u0);

gbar=1;
g1=gbar*(U1(:,1).^3).*U1(:,2);
g2=gbar*(U2(:,1).^3).*U2(:,2);
g3=gbar*(U3(:,1).^3).*U3(:,2);
%gbar1=4.1752e-04;
%gbar2=4.1309e-04;
%gbar3=4.1795e-04;



ena=65;
I1=g1.*(Volt(T1)-ena);
I2=g2.*(Volt(T2)-ena);
I3=g3.*(Volt(T3)-ena);

figure
subplot(2,2,1), plot(T1,g1,'o'); legend('ode45');
xlabel('time t')
ylabel('conductance')
subplot(2,2,2),plot(T2,g2,'s'); legend('ode23s');
xlabel('time t')
ylabel('conductance')
subplot(2,2,3), plot(T3,g3,'x'); legend('ode15s');
xlabel('time t')
ylabel('conductance')
subplot(2,2,4), plot(T1,g1,'o',T2,g2,'s',T3,g3,'x');
legend('ode45','ode23s','ode15s')
xlabel('time t')
ylabel('conductance')

figure
subplot(2,2,1), plot(Volt(T1),g1/4.1752e-04,'o'); legend('ode45');
xlabel('voltage')
ylabel('norm conductance')
subplot(2,2,2),plot(Volt(T2),g2/4.1309e-04,'s'); legend('ode23s');
xlabel('voltage')
ylabel('norm conductance')
subplot(2,2,3), plot(Volt(T3),g3/4.1795e-04,'x'); legend('ode15s');
xlabel('voltage')
ylabel('norm conductance')
subplot(2,2,4), plot(Volt(T1),g1/4.1752e-04,'o',Volt(T2),g2/4.1309e-04,'s',Volt(T3),g3/4.1795e-04,'x');
legend('ode45','ode23s','ode15s')
xlabel('voltage')
ylabel('norm conductance')


figure
subplot(2,2,1), plot(T1,I1,'o'); legend('ode45');
xlabel('time t')
ylabel('current')
subplot(2,2,2),plot(T2,I2,'s'); legend('ode23s');
xlabel('time t')
ylabel('current')
subplot(2,2,3), plot(T3,I3,'x'); legend('ode15s');
xlabel('time t')
ylabel('current')
subplot(2,2,4), plot(T1,I1,'o',T2,I2,'s',T3,I3,'x');
legend('ode45','ode23s','ode15s')
xlabel('time t')
ylabel('conductance')