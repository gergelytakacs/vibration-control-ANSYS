clc
clear

startOFF=1312;
startA=1;

importfile('results.csv')
load exp

l=length(results);
t=-0.05:0.01:(length(results)-5-1)*0.01
plot(t,exp.OFF(startOFF:startOFF+l-1))
hold on
plot(t,results(:,2),'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Experiment','ANSYS')
grid on
axis([0,results(l-5,1),-10,10])

hold off