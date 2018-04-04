It = importfile('C:\Users\Alexander\Desktop\Lundbeck data.xlsx', 'one current trace','C3:E3752');
t=It(1252:1500,1);
V=It(1252:1500,2);
I=It(1252:1500,3);
plot(t,I)
