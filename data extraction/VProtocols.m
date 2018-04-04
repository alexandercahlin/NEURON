Tmax=500;
Tmin=0;
t=linspace(Tmin,Tmax,5000);
V=zeros(length(t),1);

Vmax=100;
Vmin=-120;
Vincr=10;
Vsteps=(Vmax-Vmin)/Vincr;
V(:,1)=Vmin;

figure
axis ([0 Tmax/2 Vmin-20 Vmax+20])
V(1500:2000,1)=-10;
for j=1:Vsteps
    for i=500:1500
        V(i,1)=Vmin+j*Vincr;
    end
    hold on
    txt1 = '-120 mV';
    txt2 = 'dU=10 mV';
    txt3 = '+100 mV';
    txt4 = '$\leftarrow$ 100 ms $\rightarrow$';
    txt5 = '-10 mV';
    txt6 = '$\leftarrow$ 50 ms $\rightarrow$';
    
    
    plot(t,V(:,1),'k')
    xlabel('t/ms')
    ylabel('U/mV')
end
text(2.5,-110,txt1)
    text(2.5,-10,txt2)
    text(2.5,110,txt3)
    text(80,110,txt4,'Interpreter','Latex')
    text(155,0,txt6,'Interpreter','Latex')
    text(210,0,txt5)


figure
    axis ([0 Tmax Vmin-20 Vmax-80])
    V(:,1)=-120;
    V(1000:2000)=-10;
    V(3000:4000)=-10;
    hold on
    plot(t,V(:,1),'k')
    txt1 = '-120 mV';
    txt2 = '-10 mV';
    txt4 = '$\leftarrow$ dt $\rightarrow$';
    txt5 = '$\leftarrow$ 100 ms $\rightarrow$';
    text(30,-110,txt1)
    text(30,0,txt2)
    text(220,-50,txt4,'Interpreter','Latex')
    text(305,-50,txt5,'Interpreter','Latex')
    text(105,-50,txt5,'Interpreter','Latex')
    xlabel('t/ms')
    ylabel('U/mV')
hold off
