ydiff=diff(y);
% ydiffMins=findpeaks(-ydiff);
% ydiffnew=[0;ydiff];
secMin=min(ydiff(ydiff>min(ydiff)));
figure
plot(x,ydiffnew,x(ydiffMins.loc),ydiffnew(ydiffMins.loc+1),'or')
hold on
plot(x,y)
secMin